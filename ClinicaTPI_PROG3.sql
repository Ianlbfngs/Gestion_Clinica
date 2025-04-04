USE [master]
GO
/****** Object:  Database [ClinicaTPI_PROG3]    Script Date: 25/3/2025 01:51:54 ******/
CREATE DATABASE [ClinicaTPI_PROG3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClinicaTPI_PROG3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ClinicaTPI_PROG3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClinicaTPI_PROG3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ClinicaTPI_PROG3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClinicaTPI_PROG3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET  MULTI_USER 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET QUERY_STORE = OFF
GO
USE [ClinicaTPI_PROG3]
GO
/****** Object:  Table [dbo].[ADMINISTRADORES]    Script Date: 25/3/2025 01:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMINISTRADORES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK__ADMINIST__3214EC274BA7B7B9] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiasDeAtencion]    Script Date: 25/3/2025 01:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiasDeAtencion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Legajo_Medico] [char](4) NOT NULL,
	[Lunes] [bit] NOT NULL,
	[Martes] [bit] NOT NULL,
	[Miercoles] [bit] NOT NULL,
	[Jueves] [bit] NOT NULL,
	[Viernes] [bit] NOT NULL,
	[Sabado] [bit] NOT NULL,
	[Domingo] [bit] NOT NULL,
 CONSTRAINT [PK_DiasDeAtencion_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Legajo_Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESPECIALIDADES]    Script Date: 25/3/2025 01:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESPECIALIDADES](
	[Codigo] [char](4) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ESPECIALIDADES] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCALIDADES]    Script Date: 25/3/2025 01:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCALIDADES](
	[Codigo] [char](4) NOT NULL,
	[Cod_Provincia] [char](2) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LOCALIDADES] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[Cod_Provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEDICOS]    Script Date: 25/3/2025 01:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDICOS](
	[Legajo] [char](4) NOT NULL,
	[DNI] [char](8) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[ID_Sexo] [int] NOT NULL,
	[Nacionalidad] [varchar](50) NULL,
	[FechaDeNacimiento] [date] NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Cod_Localidad] [char](4) NOT NULL,
	[Cod_Provincia] [char](2) NOT NULL,
	[CorreoElectronico] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Cod_Especialidad] [char](4) NOT NULL,
	[Horario_inicio] [time](0) NOT NULL,
	[Horario_Fin] [time](0) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_MEDICOS] PRIMARY KEY CLUSTERED 
(
	[Legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACIENTES]    Script Date: 25/3/2025 01:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACIENTES](
	[DNI] [char](8) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[ID_Sexo] [int] NOT NULL,
	[Nacionalidad] [varchar](50) NULL,
	[FechaDeNacimiento] [date] NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Cod_Localidad] [char](4) NOT NULL,
	[Cod_Provincia] [char](2) NOT NULL,
	[CorreoElectronico] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_PACIENTES] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIAS]    Script Date: 25/3/2025 01:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIAS](
	[Codigo] [char](2) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PROVINCIAS] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEXOS]    Script Date: 25/3/2025 01:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEXOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SEXOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TURNOS]    Script Date: 25/3/2025 01:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TURNOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Especialidad] [char](4) NOT NULL,
	[Legajo_Medico] [char](4) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Horario] [time](0) NOT NULL,
	[DNI_Paciente] [char](8) NOT NULL,
	[Presente] [bit] NOT NULL,
	[Observacion] [text] NULL,
 CONSTRAINT [PK__TURNOS__3214EC27F452A712] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMINISTRADORES] ON 

INSERT [dbo].[ADMINISTRADORES] ([ID], [Usuario], [Contraseña]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[ADMINISTRADORES] ([ID], [Usuario], [Contraseña]) VALUES (2, N'admin2', N'admin2')
INSERT [dbo].[ADMINISTRADORES] ([ID], [Usuario], [Contraseña]) VALUES (3, N'admin3', N'admin3')
INSERT [dbo].[ADMINISTRADORES] ([ID], [Usuario], [Contraseña]) VALUES (4, N'admin4', N'admin4')
SET IDENTITY_INSERT [dbo].[ADMINISTRADORES] OFF
GO
SET IDENTITY_INSERT [dbo].[DiasDeAtencion] ON 

INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (8, N'M001', 1, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (9, N'M002', 0, 1, 0, 0, 1, 0, 1)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (10, N'M003', 1, 1, 0, 1, 1, 0, 0)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (11, N'M004', 1, 0, 1, 0, 0, 1, 1)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (12, N'M005', 0, 0, 0, 0, 1, 1, 1)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (13, N'M006', 0, 1, 1, 0, 0, 0, 1)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (14, N'M007', 1, 0, 1, 1, 1, 0, 0)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (15, N'M008', 1, 0, 1, 0, 1, 0, 1)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (16, N'M009', 1, 0, 0, 1, 1, 1, 0)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (17, N'M010', 1, 0, 0, 1, 1, 1, 0)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (18, N'M011', 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (19, N'M012', 0, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (20, N'M013', 1, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (21, N'M014', 1, 1, 0, 0, 1, 0, 1)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (22, N'M015', 1, 1, 1, 0, 0, 1, 1)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (23, N'M016', 0, 0, 0, 0, 1, 1, 1)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (24, N'M017', 1, 1, 0, 1, 0, 0, 0)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (25, N'M018', 1, 0, 1, 0, 0, 1, 1)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (26, N'M019', 1, 0, 0, 0, 1, 1, 0)
INSERT [dbo].[DiasDeAtencion] ([ID], [Legajo_Medico], [Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado], [Domingo]) VALUES (27, N'M020', 1, 0, 0, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[DiasDeAtencion] OFF
GO
INSERT [dbo].[ESPECIALIDADES] ([Codigo], [Nombre]) VALUES (N'ALER', N'Alergología')
INSERT [dbo].[ESPECIALIDADES] ([Codigo], [Nombre]) VALUES (N'CARD', N'Cardiología')
INSERT [dbo].[ESPECIALIDADES] ([Codigo], [Nombre]) VALUES (N'HEPA', N'Hepatología')
INSERT [dbo].[ESPECIALIDADES] ([Codigo], [Nombre]) VALUES (N'INFE', N'Infectología')
INSERT [dbo].[ESPECIALIDADES] ([Codigo], [Nombre]) VALUES (N'INMU', N'Inmunología')
INSERT [dbo].[ESPECIALIDADES] ([Codigo], [Nombre]) VALUES (N'NEFR', N'Nefrología')
INSERT [dbo].[ESPECIALIDADES] ([Codigo], [Nombre]) VALUES (N'NEUM', N'Neumología')
INSERT [dbo].[ESPECIALIDADES] ([Codigo], [Nombre]) VALUES (N'NEUR', N'Neurología')
INSERT [dbo].[ESPECIALIDADES] ([Codigo], [Nombre]) VALUES (N'REUM', N'Reumatología')
INSERT [dbo].[ESPECIALIDADES] ([Codigo], [Nombre]) VALUES (N'TOXI', N'Toxicología')
GO
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ACHE', N'TU', N'Acheral')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ACHI', N'CB', N'Achiras')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ADOD', N'MZ', N'Alto del Olvido')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'AGUA', N'SA', N'Aguaray')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ALLE', N'RN', N'Allen')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ALPA', N'LR', N'Alpasinche')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ALVE', N'CR', N'Alvear')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'AMUS', N'LR', N'Amuschinas')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ANGA', N'CA', N'Andalgalá')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ANGU', N'LP', N'Anguil')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'AÑLO', N'NQ', N'Añelo')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'AOLO', N'SL', N'Alto Lindo')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'AOPO', N'SL', N'Alto Pelado')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ARIA', N'CB', N'Arias')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'AROC', N'SF', N'Arocena')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ARTA', N'LP', N'Arata')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ASTI', N'SJ', N'Astica')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'AVEL', N'SF', N'Avellaneda')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'BARR', N'SF', N'Barrancas')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'BCRC', N'BA', N'Balcarce')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'BELG', N'CF', N'Belgrano')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'BERN', N'LP', N'Bernasconi')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'BETB', N'ER', N'Betbeder')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'BLEN', N'CA', N'Belén')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'BOAO', N'TU', N'Barrio Araujo')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'BOWE', N'MZ', N'Bowen')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CACU', N'MI', N'Camión Cue')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CADA', N'SE', N'Colonia Dora')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CAYA', N'MI', N'Caá Yarí')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CEIB', N'ER', N'Ceibas')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CERV', N'RN', N'Cervantes')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CHAP', N'MZ', N'Chapanay')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CHBC', N'BA', N'Chacabuco')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CHCH', N'CA', N'Chumbicha')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CHIC', N'SA', N'Chicoana')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CHRA', N'CH', N'Charata')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CLOD', N'SE', N'Clodomira')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'COEA', N'ER', N'Colonia Elía')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CONC', N'CR', N'Concepción')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CORZ', N'CH', N'Corzuela')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'CUPA', N'LR', N'Cuipán')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'DOLA', N'CT', N'Dolavon')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'EBLN', N'RN', N'El Bolsón')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ECDR', N'RN', N'El Cóndor')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ECOL', N'FO', N'El Colorado')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'EMAI', N'CT', N'El Maitén')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'EPOR', N'FO', N'El Potrillo')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'EPRO', N'TU', N'El Potrerillo')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'EQBL', N'SA', N'El Quebrachal')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ETBO', N'SC', N'El Turbio')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'FEBR', N'ER', N'Febre')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'FRIS', N'SL', N'Frisia')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'GAPE', N'MI', N'Garuhapé')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'GBGS', N'SC', N'Gobernador Gregores')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'GNSJ', N'SJ', N'Gran San Juan')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'GORG', N'SL', N'Gorgonta')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'HEDA', N'SL', N'Huejeda')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'HUCA', N'JY', N'Humahuaca')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'IBAR', N'FO', N'Ibarreta')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'IGLE', N'SJ', N'Iglesia')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'INGJ', N'FO', N'Ingeniero Juárez')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'LAVA', N'CR', N'Lavalle')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'LCPE', N'NQ', N'Loncopué')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'LINI', N'CF', N'Liniers')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'LNDS', N'CA', N'Londes')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'LSAS', N'SC', N'Los Antiguos')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'LSAT', N'CA', N'Los Altos')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'LSPS', N'MZ', N'Los Penitentes')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'LUQE', N'CB', N'Luque')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'MAIN', N'RN', N'Mainqué')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'MALA', N'MZ', N'Malargüe')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'MATA', N'CF', N'Mataderos')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'MJNT', N'ER', N'Mojones Norte')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'NABA', N'TU', N'Nueva Baviera')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'NAIC', N'LP', N'Naicó')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'NAPE', N'CH', N'Napenay')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'NONO', N'LR', N'Nonogasta')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PALE', N'CF', N'Palermo')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PDLP', N'CR', N'Paso de la Patria')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PDTE', N'FO', N'Pozo del Tigre')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PICH', N'SA', N'Pichanal')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PILA', N'BA', N'Pilar')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PIND', N'MI', N'Pindapoy')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PLER', N'NQ', N'Plottier')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PLUN', N'CT', N'Playa Unión')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'POAO', N'TF', N'Puerto Argentino')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'POGO', N'SF', N'Puerto Gaboto')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PRCA', N'JY', N'Purmamarca')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PUEL', N'LP', N'Puelén')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PUGA', N'CR', N'Perugorría')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'PUVI', N'JY', N'Puesto Viejo')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'QYLS', N'TU', N'Quilmes y Los Sueldos')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'RIMA', N'CT', N'Río Mayo')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ROGE', N'TF', N'Río Grande')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'RPRO', N'CB', N'Río Primero')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'RTUR', N'SC', N'Río Turbio')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'SARA', N'SJ', N'Santa Rosa')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'SCHA', N'LR', N'Schaqui')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'SISA', N'NQ', N'Senillosa')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'SNBD', N'CH', N'San Bernardo')
GO
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'SNMG', N'BA', N'San Miguel')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'SNMT', N'CH', N'San Martin')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'SNSN', N'TF', N'San Sebastián')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'SOCL', N'SE', N'Suncho Corral')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'TAMA', N'MI', N'Tarumá')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'TIGR', N'BA', N'Tigre')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'TINT', N'SE', N'Tintina')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'TODO', N'CB', N'Toledo')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'TOIN', N'TF', N'Tolhuin')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'TOST', N'SF', N'Tostado')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'TREV', N'CT', N'Trevelin')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'TUMB', N'JY', N'Tumbaya')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'TUPE', N'SJ', N'Tupelí')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'UQUI', N'JY', N'Uquía')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'URUN', N'SA', N'Urundel')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'USHU', N'TF', N'Ushuaia')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'VAAI', N'SE', N'Villa Atamisqui')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'VILU', N'CF', N'Villa Lugano')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'VONE', N'SC', N'Veintiocho de Noviembre')
INSERT [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia], [Nombre]) VALUES (N'ZPLA', N'NQ', N'Zapala')
GO
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M001', N'14012345', N'Pere', N'Gil', 1, N'Argentino', CAST(N'1960-01-01' AS Date), N'Avenida del Sol 44', N'GAPE', N'MI', N'1@1.COM', N'1131608103', N'M001', N'Peregil', N'ALER', CAST(N'00:00:00' AS Time), CAST(N'23:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M002', N'15123456', N'Juan', N'Lopez', 1, N'Boliviano', CAST(N'1961-02-02' AS Date), N'Pasaje de las Flores', N'CHCH', N'CA', N'1@1.COM', N'1131608103', N'M002', N'Juanlopez', N'ALER', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M003', N'16234567', N'Raul', N'Gonzales', 1, N'Argentino', CAST(N'1966-03-03' AS Date), N'Camino del Lago', N'RIMA', N'CT', N'1@1.COM', N'1131608103', N'M003', N'Gonzales', N'CARD', CAST(N'16:00:00' AS Time), CAST(N'22:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M004', N'17345678', N'Sofia', N'Gomez', 2, N'Argentina', CAST(N'1968-04-04' AS Date), N'Maria 62', N'TIGR', N'BA', N'1@1.COM', N'1131608103', N'M004', N'Gomez', N'CARD', CAST(N'09:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M005', N'18456789', N'Pilar', N'Garcia', 2, N'Argentina', CAST(N'1970-05-05' AS Date), N'Mendoza 192', N'MALA', N'MZ', N'1@1.COM', N'1131608103', N'M005', N'Garcia', N'HEPA', CAST(N'23:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M006', N'24098765', N'Alberto', N'Ramirez', 1, N'Uruguayo', CAST(N'1960-06-06' AS Date), N'Luis de Tejeda 3905', N'RPRO', N'CB', N'1@1.COM', N'1131608103', N'M006', N'Ramirez', N'HEPA', CAST(N'19:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M007', N'26028316', N'Julieta', N'Caceres', 2, N'Brasilera', CAST(N'1968-07-07' AS Date), N'Elvira 91', N'SNMG', N'BA', N'1@1.COM', N'1131608103', N'M007', N'Caceres', N'INFE', CAST(N'19:00:00' AS Time), CAST(N'23:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M008', N'32618556', N'Martin', N'Vera', 1, N'Brasilero', CAST(N'1981-08-08' AS Date), N'Av Alegria 102', N'BCRC', N'BA', N'1@1.COM', N'1131608103', N'M008', N'Vera', N'INFE', CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M009', N'21479243', N'Martin', N'Sanchez', 1, N'Argentino', CAST(N'1970-09-09' AS Date), N'Arquimedes 203', N'PRCA', N'JY', N'1@1.COM', N'1131608103', N'M009', N'Sanchez', N'INMU', CAST(N'11:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M010', N'32742114', N'Carlos', N'Quispe', 1, N'Peruano', CAST(N'1970-09-09' AS Date), N'Arquimedes 203', N'PRCA', N'JY', N'1@1.COM', N'1131608103', N'M010', N'Quispe', N'INMU', CAST(N'11:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M011', N'27321098', N'Julio', N'Cesar', 1, N'Romano', CAST(N'1966-11-11' AS Date), N'Roma 1700', N'ANGA', N'CA', N'1@1.COM', N'1131608103', N'M011', N'Cesar', N'NEFR', CAST(N'19:00:00' AS Time), CAST(N'23:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M012', N'38476093', N'Lucía', N'Ayala', 2, N'Argentina', CAST(N'1988-12-12' AS Date), N'Renacimiento 902', N'COEA', N'ER', N'1@1.COM', N'1131608103', N'M012', N'Ayala', N'NEFR', CAST(N'19:00:00' AS Time), CAST(N'08:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M013', N'34095683', N'Valeria', N'Nuñez', 2, N'Venezolana', CAST(N'1980-01-13' AS Date), N'Amenabar', N'QYLS', N'TU', N'1@1.COM', N'1131608103', N'M013', N'Nuñez', N'NEUM', CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M014', N'31234672', N'Javier', N'Ortiz', 2, N'Venezolana', CAST(N'1994-02-14' AS Date), N'Suiza 203', N'PICH', N'SA', N'1@1.COM', N'1131608103', N'M014', N'Ortiz', N'NEUM', CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M015', N'29347658', N'Gonzalo', N'Sosa', 1, N'Argentino', CAST(N'1999-03-15' AS Date), N'Rosario', N'SNMG', N'BA', N'1@1.COM', N'1131608103', N'M015', N'Sosa', N'NEUR', CAST(N'19:00:00' AS Time), CAST(N'06:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M016', N'22128359', N'Carmen', N'Lopez', 2, N'Argentina', CAST(N'1988-04-16' AS Date), N'Cardenal', N'PDTE', N'FO', N'1@1.COM', N'1131608103', N'M016', N'Lopez', N'NEUR', CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M017', N'25012345', N'Daniel', N'Pereira', 1, N'Ecuatoriano', CAST(N'1989-05-17' AS Date), N'Salta 23', N'BELG', N'CF', N'1@1.COM', N'1131608103', N'M017', N'Pereira', N'REUM', CAST(N'19:00:00' AS Time), CAST(N'23:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M018', N'22890123', N'Rocio', N'Vacio', 2, N'Chilena', CAST(N'1999-07-18' AS Date), N'San Martin 245', N'TAMA', N'MI', N'1@1.COM', N'1131608103', N'M018', N'Vacio', N'REUM', CAST(N'19:00:00' AS Time), CAST(N'23:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M019', N'27345678', N'Lautaro', N'Gonzales', 1, N'Argentino', CAST(N'1987-02-19' AS Date), N'Arrecife 20', N'SOCL', N'SE', N'1@1.COM', N'1131608103', N'M019', N'Gonzales', N'TOXI', CAST(N'00:00:00' AS Time), CAST(N'23:00:00' AS Time), 1)
INSERT [dbo].[MEDICOS] ([Legajo], [DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Usuario], [Contraseña], [Cod_Especialidad], [Horario_inicio], [Horario_Fin], [Activo]) VALUES (N'M020', N'12345678', N'Fernando', N'Baroni', 1, N'Argentino', CAST(N'1982-12-20' AS Date), N'9 de julio', N'USHU', N'TF', N'1@1.COM', N'1131608103', N'M020', N'Baroni', N'TOXI', CAST(N'19:00:00' AS Time), CAST(N'23:00:00' AS Time), 1)
GO
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'00000000', N'A', N'A', 1, N'A', CAST(N'1999-11-11' AS Date), N'A', N'CHCH', N'CA', N'1@1.com', N'1131608103', 0)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'11111111', N'A', N'A', 2, N'A', CAST(N'2001-01-01' AS Date), N'Dardo Rocha', N'PUEL', N'LP', N'1@1.com', N'1234567890', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'12345678', N'Luciana', N'Silva', 2, N'Argentina', CAST(N'1912-12-12' AS Date), N'Pacifico 2005', N'PALE', N'CF', N'1@1.com', N'1234567890', 0)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'12345679', N'Carlos', N'Faustino', 1, N'Chileno', CAST(N'2004-03-20' AS Date), N'Juarez 102', N'TIGR', N'BA', N'1@1.com', N'1131608103', 0)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'12345680', N'Flor', N'Hernandez', 2, N'Mexicana', CAST(N'2008-01-06' AS Date), N'Eucaliptos 9040', N'SNMG', N'BA', N'1@1.com', N'1131608103', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'12345681', N'Joan', N'Alto', 1, N'Argentino', CAST(N'1995-05-01' AS Date), N'Cangallo 200', N'EMAI', N'CT', N'1@1.com', N'1131608103', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'12345682', N'Violeta', N'Arata', 2, N'Argentina', CAST(N'1991-10-05' AS Date), N'Arata 203', N'IBAR', N'FO', N'1@1.com', N'1131608103', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'12345683', N'Edgar', N'Ghibaudi', 1, N'Argentino', CAST(N'1960-01-09' AS Date), N'Alondra 16', N'SNMG', N'BA', N'1@1.com', N'1131608103', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'22222222', N'Sebastian', N'Ponse', 1, N'Argentino', CAST(N'1992-02-02' AS Date), N'Artiagas 12', N'MALA', N'MZ', N'1@1.com', N'1234567890', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'33333333', N'Juan', N'Perez', 1, N'Argentino', CAST(N'1993-03-03' AS Date), N'India 2001', N'PLER', N'NQ', N'1@1.com', N'1234567890', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'44444444', N'Mateo', N'Garcia', 1, N'Argentino', CAST(N'1994-04-04' AS Date), N'Nueva Delhi 20', N'ETBO', N'SC', N'1@1.com', N'1234567890', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'55555555', N'Thomas', N'Fernandez', 1, N'Argentino', CAST(N'1995-05-05' AS Date), N'Payro', N'VILU', N'CF', N'1@1.com', N'1234567890', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'66666666', N'Renata', N'Flores', 2, N'Argentina', CAST(N'1996-06-06' AS Date), N'Bacacay 72', N'BETB', N'ER', N'1@1.com', N'1234567890', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'77777777', N'Carolina', N'Diaz', 2, N'Argentina', CAST(N'1997-07-07' AS Date), N'Jose Colombres 92', N'NAIC', N'LP', N'1@1.com', N'1234567890', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'88888888', N'Valentina', N'Torrez', 2, N'Argentina', CAST(N'1998-08-08' AS Date), N'4 de marzo', N'CORZ', N'CH', N'1@1.com', N'1234567890', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'99998888', N'A', N'A', 1, N'A', CAST(N'2000-01-01' AS Date), N'A', N'BCRC', N'BA', N'1@1.COM', N'1234567890', 1)
INSERT [dbo].[PACIENTES] ([DNI], [Nombre], [Apellido], [ID_Sexo], [Nacionalidad], [FechaDeNacimiento], [Direccion], [Cod_Localidad], [Cod_Provincia], [CorreoElectronico], [Telefono], [Activo]) VALUES (N'99999999', N'Camila', N'Gerson', 2, N'Argentina', CAST(N'1999-09-09' AS Date), N'Maipu', N'AOPO', N'SL', N'1@1.com', N'1234567890', 1)
GO
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'BA', N'Buenos Aires')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'CA', N'Catamarca')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'CB', N'Cordoba')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'CF', N'Ciudad Autonoma de Buenos Aires')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'CH', N'Chaco')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'CR', N'Corrientes')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'CT', N'Chubut')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'ER', N'Entre Rios')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'FO', N'Formosa')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'JY', N'Jujuy')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'LP', N'La Pampa')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'LR', N'La Rioja')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'MI', N'Misiones')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'MZ', N'Mendoza')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'NQ', N'Neuquen')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'RN', N'Rio Negro')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'SA', N'Salta')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'SC', N'Santa Cruz')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'SE', N'Santiago del Estero')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'SF', N'Santa Fe')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'SJ', N'San Juan')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'SL', N'San Luis')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'TF', N'Tierra del Fuego')
INSERT [dbo].[PROVINCIAS] ([Codigo], [Nombre]) VALUES (N'TU', N'Tucuman')
GO
SET IDENTITY_INSERT [dbo].[SEXOS] ON 

INSERT [dbo].[SEXOS] ([ID], [Descripcion]) VALUES (1, N'Masculino')
INSERT [dbo].[SEXOS] ([ID], [Descripcion]) VALUES (2, N'Femenino')
INSERT [dbo].[SEXOS] ([ID], [Descripcion]) VALUES (3, N'Otro')
SET IDENTITY_INSERT [dbo].[SEXOS] OFF
GO
SET IDENTITY_INSERT [dbo].[TURNOS] ON 

INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (17, N'ALER', N'M001', CAST(N'2025-01-02' AS Date), CAST(N'00:00:00' AS Time), N'11111111', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (18, N'ALER', N'M002', CAST(N'2014-02-04' AS Date), CAST(N'10:00:00' AS Time), N'12345678', 1, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (19, N'CARD', N'M003', CAST(N'2003-08-02' AS Date), CAST(N'16:00:00' AS Time), N'22222222', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (20, N'CARD', N'M004', CAST(N'2000-07-13' AS Date), CAST(N'13:00:00' AS Time), N'33333333', 1, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (21, N'HEPA', N'M005', CAST(N'2020-07-28' AS Date), CAST(N'23:00:00' AS Time), N'44444444', 1, N'AAAA')
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (22, N'HEPA', N'M006', CAST(N'2016-07-23' AS Date), CAST(N'20:00:00' AS Time), N'44444444', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (23, N'INFE', N'M007', CAST(N'2008-07-22' AS Date), CAST(N'22:00:00' AS Time), N'55555555', 1, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (24, N'INFE', N'M008', CAST(N'2005-07-29' AS Date), CAST(N'13:00:00' AS Time), N'66666666', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (25, N'INMU', N'M009', CAST(N'2010-07-25' AS Date), CAST(N'11:00:00' AS Time), N'77777777', 1, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (26, N'INMU', N'M010', CAST(N'2024-07-12' AS Date), CAST(N'13:00:00' AS Time), N'99999999', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (27, N'NEFR', N'M011', CAST(N'2017-07-21' AS Date), CAST(N'23:00:00' AS Time), N'88888888', 1, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (28, N'NEFR', N'M012', CAST(N'2018-07-23' AS Date), CAST(N'01:00:00' AS Time), N'44444444', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (39, N'NEUM', N'M013', CAST(N'2024-07-12' AS Date), CAST(N'18:00:00' AS Time), N'44444444', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (40, N'NEUM', N'M014', CAST(N'2013-08-09' AS Date), CAST(N'16:00:00' AS Time), N'12345678', 1, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (41, N'NEUR', N'M016', CAST(N'2021-08-11' AS Date), CAST(N'14:00:00' AS Time), N'55555555', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (42, N'NEUR', N'M015', CAST(N'2024-09-17' AS Date), CAST(N'23:00:00' AS Time), N'33333333', 1, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (43, N'REUM', N'M017', CAST(N'2001-08-01' AS Date), CAST(N'21:00:00' AS Time), N'77777777', 1, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (44, N'REUM', N'M018', CAST(N'2022-10-07' AS Date), CAST(N'20:00:00' AS Time), N'99999999', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (45, N'TOXI', N'M019', CAST(N'2023-08-09' AS Date), CAST(N'18:00:00' AS Time), N'77777777', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (46, N'TOXI', N'M020', CAST(N'2025-01-12' AS Date), CAST(N'22:00:00' AS Time), N'66666666', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (47, N'HEPA', N'M005', CAST(N'2024-12-08' AS Date), CAST(N'07:00:00' AS Time), N'66666666', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (48, N'NEUM', N'M014', CAST(N'2022-08-12' AS Date), CAST(N'17:00:00' AS Time), N'44444444', 1, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (49, N'TOXI', N'M019', CAST(N'2012-08-10' AS Date), CAST(N'00:00:00' AS Time), N'22222222', 1, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (51, N'NEUM', N'M013', CAST(N'2024-07-29' AS Date), CAST(N'19:00:00' AS Time), N'88888888', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (52, N'CARD', N'M004', CAST(N'2024-07-08' AS Date), CAST(N'12:00:00' AS Time), N'12345680', 0, NULL)
INSERT [dbo].[TURNOS] ([ID], [Cod_Especialidad], [Legajo_Medico], [Fecha], [Horario], [DNI_Paciente], [Presente], [Observacion]) VALUES (53, N'HEPA', N'M006', CAST(N'2024-07-21' AS Date), CAST(N'20:00:00' AS Time), N'12345683', 0, NULL)
SET IDENTITY_INSERT [dbo].[TURNOS] OFF
GO
ALTER TABLE [dbo].[DiasDeAtencion]  WITH CHECK ADD  CONSTRAINT [FK_DiasDeAtencion_MEDICOS] FOREIGN KEY([Legajo_Medico])
REFERENCES [dbo].[MEDICOS] ([Legajo])
GO
ALTER TABLE [dbo].[DiasDeAtencion] CHECK CONSTRAINT [FK_DiasDeAtencion_MEDICOS]
GO
ALTER TABLE [dbo].[LOCALIDADES]  WITH CHECK ADD  CONSTRAINT [FK_LOCALIDADES_PROVINCIAS] FOREIGN KEY([Cod_Provincia])
REFERENCES [dbo].[PROVINCIAS] ([Codigo])
GO
ALTER TABLE [dbo].[LOCALIDADES] CHECK CONSTRAINT [FK_LOCALIDADES_PROVINCIAS]
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD  CONSTRAINT [FK_MEDICOS_ESPECIALIDADES] FOREIGN KEY([Cod_Especialidad])
REFERENCES [dbo].[ESPECIALIDADES] ([Codigo])
GO
ALTER TABLE [dbo].[MEDICOS] CHECK CONSTRAINT [FK_MEDICOS_ESPECIALIDADES]
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD  CONSTRAINT [FK_MEDICOS_LOCALIDADES] FOREIGN KEY([Cod_Localidad], [Cod_Provincia])
REFERENCES [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia])
GO
ALTER TABLE [dbo].[MEDICOS] CHECK CONSTRAINT [FK_MEDICOS_LOCALIDADES]
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD  CONSTRAINT [FK_MEDICOS_SEXOS] FOREIGN KEY([ID_Sexo])
REFERENCES [dbo].[SEXOS] ([ID])
GO
ALTER TABLE [dbo].[MEDICOS] CHECK CONSTRAINT [FK_MEDICOS_SEXOS]
GO
ALTER TABLE [dbo].[PACIENTES]  WITH CHECK ADD  CONSTRAINT [FK_PACIENTES_LOCALIDADES] FOREIGN KEY([Cod_Localidad], [Cod_Provincia])
REFERENCES [dbo].[LOCALIDADES] ([Codigo], [Cod_Provincia])
GO
ALTER TABLE [dbo].[PACIENTES] CHECK CONSTRAINT [FK_PACIENTES_LOCALIDADES]
GO
ALTER TABLE [dbo].[PACIENTES]  WITH CHECK ADD  CONSTRAINT [FK_PACIENTES_SEXOS] FOREIGN KEY([ID_Sexo])
REFERENCES [dbo].[SEXOS] ([ID])
GO
ALTER TABLE [dbo].[PACIENTES] CHECK CONSTRAINT [FK_PACIENTES_SEXOS]
GO
ALTER TABLE [dbo].[TURNOS]  WITH CHECK ADD  CONSTRAINT [FK_TURNOS_ESPECIALIDADES] FOREIGN KEY([Cod_Especialidad])
REFERENCES [dbo].[ESPECIALIDADES] ([Codigo])
GO
ALTER TABLE [dbo].[TURNOS] CHECK CONSTRAINT [FK_TURNOS_ESPECIALIDADES]
GO
ALTER TABLE [dbo].[TURNOS]  WITH CHECK ADD  CONSTRAINT [FK_TURNOS_MEDICOS] FOREIGN KEY([Legajo_Medico])
REFERENCES [dbo].[MEDICOS] ([Legajo])
GO
ALTER TABLE [dbo].[TURNOS] CHECK CONSTRAINT [FK_TURNOS_MEDICOS]
GO
ALTER TABLE [dbo].[TURNOS]  WITH CHECK ADD  CONSTRAINT [FK_TURNOS_PACIENTES] FOREIGN KEY([DNI_Paciente])
REFERENCES [dbo].[PACIENTES] ([DNI])
GO
ALTER TABLE [dbo].[TURNOS] CHECK CONSTRAINT [FK_TURNOS_PACIENTES]
GO
USE [master]
GO
ALTER DATABASE [ClinicaTPI_PROG3] SET  READ_WRITE 
GO
