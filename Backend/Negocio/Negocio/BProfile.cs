using Datos;
using Datos.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Negocio.Interfaces;
using System.Linq;
using System.Net.Http;
using System.Security.Claims;
using System.Xml.Linq;

namespace Negocio.Negocio
{
    public class BProfile : IProfile
    {
        private DbEmpleandoContext _db;
        private readonly ConfigJwt _jwt;
        private readonly IRepository<User> _repository;

        public BProfile(DbEmpleandoContext dbContext, IOptions<ConfigJwt> jwt, IRepository<User> repository)
        {
            _db = dbContext;
            _jwt = jwt.Value;
            _repository = repository;
        }

        public ModelResponse Informacion(int userId)
        {
            ModelResponse response;

            try
            {
                User? user = _repository.ObtenerPorId(userId);

                var userdata = (from u in _db.UsersData
                                join t in _db.TypeData on u.IdTypeData equals t.IdTypeData
                                where u.IdUser == userId && u.IdTypeData != 4 && u.IdTypeData != 5
                                select new
                                {
                                    Type = t.Type,
                                    Value = u.Value,
                                }).ToList();

                if (userdata.Count() > 0)
                {
                    userdata.Add(new
                    {
                        Type = "Correo electronico",
                        Value = user.Email,
                    });


                    var experiences = (from u in _db.UsersData
                                       join e in _db.Experiences on u.IdData equals e.IdData
                                       where u.IdUser == userId
                                       select new
                                       {
                                           Cargo = u.Value,
                                           Company = e.Company,
                                           InitDate = e.InitDate,
                                           FinalDate = e.FinalDate
                                       }).ToList();

                    var educations = (from u in _db.UsersData
                                      join e in _db.Educations on u.IdData equals e.IdData
                                      where u.IdUser == userId
                                      select new
                                      {
                                          Titulo = u.Value,
                                          Institute = e.Institute,
                                          InitDate = e.InitDate,
                                          FinalDate = e.FinalDate
                                      }).ToList();

                    var habilidades = (from u in _db.UserSkills
                                       join s in _db.Skills on u.IdSkills equals s.IdSkills
                                       where u.IdUser == userId
                                       select new
                                       {
                                           habilidad = s.Skill1
                                       }).ToList();

                    var result = new
                    {
                        data = userdata,
                        experiences = experiences,
                        educations = educations,
                        habilidades = habilidades
                    };

                    response = new ModelResponse()
                    {
                        respuesta = result,
                        estado = true,
                        mensaje = "Existoso"
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "No se encontro informacion de tu usario, por favor, completa tus datos."
                    };
                }

                return response;
            }
            catch (Exception ex)
            {
                response = new ModelResponse()
                {
                    respuesta = "Error",
                    estado = false,
                    mensaje = "Ocurrio un error al ejecutar el proceso " + ex.Message
                };

                return response;
            }
        }


        public ModelResponse EditarPerfil(int id, Profile profile)
        {
            ModelResponse response;

            try
            {
                List<UsersDatum> existe = _db.UsersData.Where(x => x.IdUser == id && x.IdTypeData != 4 && x.IdTypeData != 5).ToList();

                if (existe.Count() > 0)
                {
                    _db.UsersData.RemoveRange(existe);
                }

                List<UsersDatum> datos = new List<UsersDatum>();

                datos.Add(new UsersDatum
                {
                    IdTypeData = 1,
                    IdUser = id,
                    Value = profile.name,
                    CreateDate = DateTime.Now,
                    ModifyDate = DateTime.Now
                });

                datos.Add(new UsersDatum
                {
                    IdTypeData = 2,
                    IdUser = id,
                    Value = profile.birthdate.ToString("yyyy-MM-dd"),
                    CreateDate = DateTime.Now,
                    ModifyDate = DateTime.Now
                });

                datos.Add(new UsersDatum
                {
                    IdTypeData = 3,
                    IdUser = id,
                    Value = profile.location,
                    CreateDate = DateTime.Now,
                    ModifyDate = DateTime.Now
                });

                datos.Add(new UsersDatum
                {
                    IdTypeData = 6,
                    IdUser = id,
                    Value = profile.phone,
                    CreateDate = DateTime.Now,
                    ModifyDate = DateTime.Now
                });

                _db.UsersData.AddRange(datos);


                if (_db.SaveChanges() > 0)
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Success",
                        estado = true,
                        mensaje = "Datos guardados con exito."
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "Hubo error al guardar la informacion, por favor, intentalo de nuevo."
                    };
                }

                return response;
            }
            catch (Exception ex)
            {
                response = new ModelResponse()
                {
                    respuesta = "Error",
                    estado = false,
                    mensaje = "Ocurrio un error al ejecutar el proceso " + ex.Message
                };

                return response;
            }
        }


        public ModelResponse CrearExperiencia(int id, Experiencia exp)
        {
            ModelResponse response;

            try
            {
                UsersDatum dato = new UsersDatum
                {
                    IdTypeData = 4,
                    IdUser = id,
                    Value = exp.Cargo,
                    CreateDate = DateTime.Now,
                    ModifyDate = DateTime.Now
                };

                _db.UsersData.Add(dato);

                if (_db.SaveChanges() > 0)
                {

                    Experience experience = new Experience
                    {
                        IdData = dato.IdData,
                        InitDate = exp.InitDate,
                        FinalDate = exp.FinalDate,
                        Company = exp.Company,
                        Description = exp.Description
                    };

                    _db.Experiences.Add(experience);

                    if (_db.SaveChanges() > 0)
                    {
                        response = new ModelResponse()
                        {
                            respuesta = "Success",
                            estado = true,
                            mensaje = "Datos guardados con exito."
                        };
                    }
                    else
                    {
                        response = new ModelResponse()
                        {
                            respuesta = "Error",
                            estado = false,
                            mensaje = "Hubo error al guardar la informacion, por favor, intentalo de nuevo."
                        };
                    }
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "Hubo error al guardar la informacion, por favor, intentalo de nuevo."
                    };
                }

                return response;
            }
            catch (Exception ex)
            {
                response = new ModelResponse()
                {
                    respuesta = "Error",
                    estado = false,
                    mensaje = "Ocurrio un error al ejecutar el proceso " + ex.Message
                };

                return response;
            }
        }


        public ModelResponse CrearEducacion(int id, Educacion edu)
        {
            ModelResponse response;

            try
            {
                UsersDatum dato = new UsersDatum
                {
                    IdTypeData = 5,
                    IdUser = id,
                    Value = edu.Titulo,
                    CreateDate = DateTime.Now,
                    ModifyDate = DateTime.Now
                };

                _db.UsersData.Add(dato);

                if (_db.SaveChanges() > 0)
                {

                    Education education = new Education
                    {
                        IdData = dato.IdData,
                        Institute = edu.Institute,
                        InitDate = edu.InitDate,
                        FinalDate = edu.FinalDate
                    };

                    _db.Educations.Add(education);

                    if (_db.SaveChanges() > 0)
                    {
                        response = new ModelResponse()
                        {
                            respuesta = "Success",
                            estado = true,
                            mensaje = "Datos guardados con exito."
                        };
                    }
                    else
                    {
                        response = new ModelResponse()
                        {
                            respuesta = "Error",
                            estado = false,
                            mensaje = "Hubo error al guardar la informacion, por favor, intentalo de nuevo."
                        };
                    }
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "Hubo error al guardar la informacion, por favor, intentalo de nuevo."
                    };
                }

                return response;
            }
            catch (Exception ex)
            {
                response = new ModelResponse()
                {
                    respuesta = "Error",
                    estado = false,
                    mensaje = "Ocurrio un error al ejecutar el proceso " + ex.Message
                };

                return response;
            }
        }


        public ModelResponse CrearHabilidad(int id, int idSkill)
        {
            ModelResponse response;

            try
            {
                UserSkill? existe = _db.UserSkills.Where(x => x.IdUser == id && x.IdSkills == idSkill).FirstOrDefault();

                if (existe == null)
                {
                    UserSkill skill = new UserSkill()
                    {
                        IdSkills = idSkill,
                        IdUser = id,
                    };

                    _db.UserSkills.Add(skill);

                    if (_db.SaveChanges() > 0)
                    {
                        response = new ModelResponse()
                        {
                            respuesta = "Success",
                            estado = true,
                            mensaje = "Datos guardados con exito."
                        };
                    }
                    else
                    {
                        response = new ModelResponse()
                        {
                            respuesta = "Error",
                            estado = false,
                            mensaje = "Hubo error al guardar la informacion, por favor, intentalo de nuevo."
                        };
                    }
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "Ya agregaste esta habilidad."
                    };
                }

                return response;
            }
            catch (Exception ex)
            {
                response = new ModelResponse()
                {
                    respuesta = "Error",
                    estado = false,
                    mensaje = "Ocurrio un error al ejecutar el proceso " + ex.Message
                };

                return response;
            }
        }


        public ModelResponse Habilidades()
        {
            ModelResponse response;

            try
            {
                List<Skill> skils = _db.Skills.ToList();

                if (skils.Count() > 0)
                {
                    response = new ModelResponse()
                    {
                        respuesta = skils,
                        estado = true,
                        mensaje = ""
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "No se encontraron habilidades"
                    };
                }

                return response;
            }
            catch (Exception ex)
            {
                response = new ModelResponse()
                {
                    respuesta = "Error",
                    estado = false,
                    mensaje = "Ocurrio un error al ejecutar el proceso " + ex.Message
                };

                return response;
            }
        }


    }
}