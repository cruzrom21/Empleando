using Datos;
using Datos.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Negocio.Interfaces;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Security.Claims;

namespace Negocio.Negocio
{
    public class BMenu : IMenu
    {
        private DbEmpleandoContext _db;
        private readonly IRepository<User> _repository;


        public BMenu(DbEmpleandoContext dbContext, IRepository<User> repository)
        {
            _db = dbContext;
            _repository = repository;
        }

        public ModelResponse Menu(int id)
        {
            ModelResponse response;

            try
            {
                User user = _repository.ObtenerPorId(id);

                if (user != null)
                {
                    response = new ModelResponse()
                    {
                        respuesta = user,
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
                        mensaje = "No hay sesion"
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