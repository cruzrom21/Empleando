
using Datos;
using Datos.Models;
using Microsoft.EntityFrameworkCore;
using Negocio.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Negocio
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly DbEmpleandoContext _db;

        public Repository(DbEmpleandoContext db)
        {
            _db = db;
        }

        protected DbSet<T> EntitySet => _db.Set<T>();

        public T? ObtenerPorId(int id)
        {
            try
            {
                return EntitySet.Find(id);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<T>? ObtenerTodos()
        {
            try
            {
                return EntitySet.ToList();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public int Insertar(T entidad)
        {
            try
            {
                EntitySet.Add(entidad);
                return _db.SaveChanges();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public int Actualizar(T entidad)
        {
            try
            {
                _db.Entry(entidad).State = EntityState.Modified;
                return _db.SaveChanges();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public ModelResponse Eliminar(int id)
        {
            ModelResponse response;

            try
            {
                var entidad = EntitySet.Find(id);

                if (entidad != null)
                {
                    EntitySet.Remove(entidad);

                    response = new ModelResponse()
                    {
                        respuesta = _db.SaveChanges(),
                        estado = true
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        mensaje = "No se encontro dato para eliminar",
                        estado = false
                    };
                }

                return response;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
