
using Datos;
using Datos.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Negocio.Interfaces;
using Negocio.Negocio;
using System.Text;

namespace ApiEmpleando
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            builder.Services.AddScoped<ConfigJwt>();
            builder.Services.Configure<ConfigJwt>(builder.Configuration.GetSection("Jwt"));

            builder.Services.AddCors();

            // Conexion a la base de datos
            string conn = builder.Configuration.GetConnectionString("Connection");
            builder.Services.AddDbContext<DbEmpleandoContext>(options => options.UseSqlServer(conn));

            // Jwt
            var keyBytes = Encoding.UTF8.GetBytes(builder.Configuration["Jwt:secretkey"]);

            builder.Services.AddAuthentication(config => {
                config.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                config.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(config => {
                config.RequireHttpsMetadata = false;
                config.SaveToken = true;
                config.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(keyBytes),
                    ClockSkew = TimeSpan.Zero
                };
            });

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();


            builder.Services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            builder.Services.AddScoped<IAutenticacion, BAutenticacion>();
            builder.Services.AddScoped<IHome, BHome>();
            builder.Services.AddScoped<IJobs, BJobs>();
            builder.Services.AddScoped<IProfile, BProfile>();
            builder.Services.AddScoped<IMenu, BMenu>();


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            //if (app.Environment.IsDevelopment())
            //{
                app.UseSwagger();
                app.UseSwaggerUI();
            //}

            app.UseCors(builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
            
            app.UseHttpsRedirection();

            app.UseAuthentication();

            app.UseAuthorization();

            app.MapControllers();

            app.Run();
        }
    }
}
