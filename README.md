# TPI - Sistema de Gestión: Clínica

Aplicación web desarrollada en C# con ASP.NET y conexion a base de datos, orientada a la gestión de una clínica.

## Tabla de Contenidos
- [Tecnologías y conceptos utilizados](#tecnologías-y-conceptos-utilizados)
- [Funcionalidades](#funcionalidades)
- [Utilización](#utilización)
- [Estructura](#estructura)


## Teconologías y conceptos utilizados
- ASP.NET 
- C#
- SQL Server Express
- ADO.NET
- HTML / CSS
- Git y GitHub
- Arquitectura en tres capas
- Trabajo en equipo

## Funcionalidades
- Login de medicos y administradores
- Listados con multiples filtros
- Eliminaciones multiples
- Validaciones al dar de alta registros
### Funciones del usuario administrador
- ABML / CRUD de pacientes y medicos
- Alta de turnos
- Informes generales
### Funciones del usuario medico
- Listado y modificacion de turnos

## Utilización
1. Asegurarse de tener instalado Visual Studio y Microsoft SQL Server
2. Ejecutar el script 'ClinicaTPI_PROG3.sql' para crear la base de datos 
3. Clonar el repositorio o descargar el proyecto
4. Abrir el archivo '.sln' con Visual Studio
5. Ejecutar el proyecto (F5 o Ctrl + F5)
6. Entrar desde un navegador a la dirección 'https://localhost:44340/Login.aspx'
7. Loguearse como administrador. 
    Usuario: admin
    Contraseña: admin

## Estructura
```plaintext
/Vistas     --> Capa de presentación - Formularios ASPX
/Clinica    --> Capa de lógica de negocio 
/Datos      --> Capa de acceso a datos - Consultas SQL y conexión a la base de datos
/Entidades  --> Definicion de los modelos de datos
 
