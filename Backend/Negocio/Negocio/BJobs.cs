using Datos;
using Datos.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Negocio.Interfaces;
using System.Collections.Generic;
using System.Net.Http;
using System.Security.Claims;

namespace Negocio.Negocio
{
    public class BJobs : IJobs
    {
        private DbEmpleandoContext _db;
        private readonly IRepository<Application> _repository;
        private readonly IRepository<Offer> _rOffer;

        public BJobs(DbEmpleandoContext dbContext, IRepository<Application> repository, IRepository<Offer> rOffer, IRepository<OfferSkill> rOfferSkill, IRepository<Application> rApplication)
        {
            _db = dbContext;
            _repository = repository;
            _rOffer = rOffer;
        }

        public ModelResponse EmpleoDetalle(int id)
        {
            ModelResponse response;

            try
            {
                CompanyOffer? offer = _db.CompanyOffers.Where(x => x.IdOffer == id).FirstOrDefault();


                var habilidades = (from u in _db.OfferSkills
                                   join s in _db.Skills on u.IdSkills equals s.IdSkills
                                   where u.IdOffer == id
                                   select new
                                   {
                                       habilidad = s.Skill1
                                   }).ToList();

                if (offer != null)
                {
                    var result = new
                    {
                        offer = offer,
                        habilidades = habilidades
                    };

                    response = new ModelResponse()
                    {
                        respuesta = result,
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
                        mensaje = "No se encontraron ofertas."
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

        public ModelResponse Buscar(string clave)

        {
            ModelResponse response;
            try
            {
                if (clave == "undefined")
                {
                    return new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = true,
                        mensaje = "Realiza una busqueda..."
                    };
                }

                List<CompanyOffer>? offers = new List<CompanyOffer>();

                // Primera busqueda con toda la frase
                var parameter = new SqlParameter("@Clave", clave);
                List<CompanyOffer>? primerBusqueda = _db.Database.SqlQueryRaw<CompanyOffer>("EXEC SP_BuscarOfertaPorClave @Clave", parameter).ToList();

                if (primerBusqueda != null)
                    offers.AddRange(primerBusqueda);

                // Segunda se busca como palabra separadas
                string[] similar = clave.Split(' ');

                foreach (var letter in similar)
                {
                    if (letter.Length > 3)
                    {
                        var parameterS = new SqlParameter("@Clave", letter);
                        List<CompanyOffer>? segundaBusqueda = _db.Database.SqlQueryRaw<CompanyOffer>("EXEC SP_BuscarOfertaPorClave @Clave", parameterS).ToList();

                        if (segundaBusqueda != null)
                            offers.AddRange(segundaBusqueda);
                    }
                }

                if (offers.Count > 0)
                {
                    response = new ModelResponse()
                    {
                        respuesta = offers.DistinctBy(x => x.IdOffer).ToList(),
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
                        mensaje = "No se encontraron ofertas."
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

        public ModelResponse Aplicar(int idOffer, int idUser)
        {
            ModelResponse response;

            try
            {
                Application? existe = _db.Applications.Where(x => x.IdUser == idUser && x.IdOffer == idOffer).FirstOrDefault();

                if (existe == null)
                {
                    Application application = new Application
                    {
                        IdOffer = idOffer,
                        IdUser = idUser,
                        ApplicationDate = DateTime.Now,
                        State = 1,
                        CreateDate = DateTime.Now,
                        ModifyDate = DateTime.Now
                    };

                    if (_repository.Insertar(application) > 0)
                    {
                        response = new ModelResponse()
                        {
                            respuesta = "Success",
                            estado = true,
                            mensaje = "Aplicaste a esta vacante."
                        };
                    }
                    else
                    {
                        response = new ModelResponse()
                        {
                            respuesta = "Error",
                            estado = false,
                            mensaje = "Hubo error al aplicar a la vacante, por favor, intentalo de nuevo."
                        };
                    }
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "Ya aplicaste a esta vacante."
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


        public ModelResponse MisOfertas(int idUser)
        {
            ModelResponse response;

            try
            {
                List<CompanyOffer>? offer = _db.CompanyOffers.Where(x => x.IdUser == idUser).ToList();

                if (offer.Count() > 0)
                {
                    response = new ModelResponse()
                    {
                        respuesta = offer,
                        estado = true,
                        mensaje = ""
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "SinOfertas",
                        estado = false,
                        mensaje = "No se encontraron ofertas. Crea tu primera oferta."
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


        public ModelResponse CrearOferta(int id, CrearOferta Coffer)
        {
            ModelResponse response;

            try
            {
                Offer offer = new Offer()
                {
                    IdUser = id,
                    Title = Coffer.Title,
                    Description = Coffer.Description,
                    Location = Coffer.Location,
                    TypeContract = Coffer.TypeContract,
                    Salary = Coffer.Salary,
                    ExpirationDate = Coffer.ExpirationDate,
                    CreateDate = DateTime.Now,
                    ModifyDate = DateTime.Now
                };

                _db.Offers.Add(offer);

                if (_db.SaveChanges() > 0)
                {
                    List<OfferSkill> skills = Coffer.habilidad.Select(x => new OfferSkill
                    {
                        IdOffer = offer.IdOffer,
                        IdSkills = int.Parse(x)
                    }).ToList();
                    _db.OfferSkills.AddRange(skills);

                    _db.SaveChanges();

                    response = new ModelResponse()
                    {
                        respuesta = "Success",
                        estado = true,
                        mensaje = "Oferta creada con exito."
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

        public ModelResponse ListarCandidatos(int idOferta)
        {
            ModelResponse response;

            try
            {
                var userdata = (from a in _db.Applications
                                join u in _db.UsersData on a.IdUser equals u.IdUser
                                join t in _db.TypeData on u.IdTypeData equals t.IdTypeData
                                where a.IdOffer == idOferta
                                select new
                                {
                                    IdUser = a.IdUser,
                                    Type = t.Type.Replace(" ", ""),
                                    Value = u.Value,
                                }).ToList();

                if (userdata.Count() > 0)
                {
                    response = new ModelResponse()
                    {
                        respuesta = userdata,
                        estado = true,
                        mensaje = ""
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "SinCanditatos",
                        estado = false,
                        mensaje = "No se encontraron ofertas."
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


        public ModelResponse EliminarOferta(int idOferta)
        {
            ModelResponse response;

            try
            {
                List<Application> applications = _db.Applications.Where(x => x.IdOffer == idOferta).ToList();
                _db.Applications.RemoveRange(applications);
                int eliminados = _db.SaveChanges();

                if (applications.Count() == eliminados)
                {
                    List<OfferSkill> offerSkills = _db.OfferSkills.Where(x => x.IdOffer == idOferta).ToList();
                    _db.OfferSkills.RemoveRange(offerSkills);
                    int eliminadosS = _db.SaveChanges();

                    if (offerSkills.Count() == eliminadosS)
                    {
                        return _rOffer.Eliminar(idOferta);
                    }
                    else
                    {
                        response = new ModelResponse()
                        {
                            respuesta = "Error",
                            estado = false,
                            mensaje = "Hubo error al eliminar la informacion, por favor, intentalo de nuevo."
                        };
                    }
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "Hubo error al eliminar la informacion, por favor, intentalo de nuevo."
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


        public ModelResponse BuscarCandidato(string clave)
        {
            ModelResponse response;
            try
            {
                if (clave == "undefined")
                {
                    return new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = true,
                        mensaje = "Realiza una busqueda..."
                    };
                }

                List<dynamic>? candidate = new List<dynamic>();

                // Primera busqueda con toda la frase
                var parameter = new SqlParameter("@Clave", clave);
                var primerBusqueda = _db.Database.SqlQueryRaw<CandidatosPorOferta>("EXEC SP_BuscarCandidato @Clave", parameter).AsEnumerable().Select(x => new
                {
                    IdUser = x.IdUser,
                    Type = x.Type.Replace(" ", ""),
                    Value = x.Value,
                }).ToList();

                if (primerBusqueda != null)
                    candidate.AddRange(primerBusqueda);

                // Segunda se busca como palabra separadas
                string[] similar = clave.Split(' ');

                foreach (var letter in similar)
                {
                    if (letter.Length > 3)
                    {
                        var parameterS = new SqlParameter("@Clave", letter);
                        var segundaBusqueda = _db.Database.SqlQueryRaw<CandidatosPorOferta>("EXEC SP_BuscarCandidato @Clave", parameterS).AsEnumerable().Select(x => new
                        {
                            IdUser = x.IdUser,
                            Type = x.Type.Replace(" ", ""),
                            Value = x.Value,
                        }).ToList();

                        if (segundaBusqueda != null)
                            candidate.AddRange(segundaBusqueda);
                    }
                }

                if (candidate.Count > 0)
                {
                    response = new ModelResponse()
                    {
                        respuesta = candidate.Distinct().ToList(),
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
                        mensaje = "No se encontraron candidatos para la busqueda que realizaste."
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