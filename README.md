# Empleando

Una plataforma web para la gestión de ofertas de empleo y búsqueda de candidatos, diseñada para conectar empresas y candidatos.

## Tabla de Contenidos

- [Descripción](#descripción)
- [Características](#características)
- [Requisitos Previos](#requisitos-previos)
- [Instalación](#instalación)

## Descripción

Este proyecto es una aplicación web que permite a las empresas buscar candidatos, crear ofertas de empleo y gestionar su perfil. Los candidatos pueden buscar ofertas de empleo, aplicar a ellas y gestionar su hoja de vida. La aplicación utiliza Angular para el frontend y .NET C# para el backend.

## Características

### Rol Empresa
- Búsqueda de candidatos.
- Creación y gestión de ofertas de empleo.
- Gestión de la información del perfil de la empresa.

### Rol Candidato
- Búsqueda de ofertas de empleo.
- Aplicación a ofertas de empleo.
- Creación y gestión de la hoja de vida.

## Requisitos Previos

- [Node.js](https://nodejs.org/) (versión recomendada: 20.x o superior)
- [Angular CLI](https://angular.io/cli) (versión recomendada: 18.x o superior)
- [.NET SDK](https://dotnet.microsoft.com/download) (versión recomendada: 8.0 o superior)

## Instalación

1. Clona el repositorio:
    ```bash
    git clone https://github.com/cruzrom21/Empleando.git
    cd Empleando
    ```

### Base de Datos

1. Navega a la carpeta de la base de datos:
    ```bash
    cd DataBase
    ```

2. Ejecutar script ScriptEmpleando.sql


### Frontend

1. Navega a la carpeta del frontend:
    ```bash
    cd frontend
    ```

2. Instala las dependencias del proyecto:
    ```bash
    npm install
    ```
    ```

### Backend

Se recomienda abrir el proyecto en Visual Studio.

1. Navega a la carpeta del backend:
    ```bash
    cd backend
    ```

2. Restaura las dependencias del proyecto:
    ```bash
    dotnet restore
    ```

o en Visual Studio, click derecho en la solicion y "Restaurar paquetes de NuGet"

3. Configura la ruta de la base de datos:
    - Abre el archivo `appsettings.json`.
    - Busca la sección `ConnectionStrings`.
    - Cambia la ruta de la base de datos según sea necesario.






