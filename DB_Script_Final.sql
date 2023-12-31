USE [master]
GO
/****** Object:  Database [SistemaMatricula]    Script Date: 5/4/2023 4:49:44 PM ******/
CREATE DATABASE [SistemaMatricula]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaMatricula', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SistemaMatricula.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaMatricula_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SistemaMatricula_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SistemaMatricula] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaMatricula].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaMatricula] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaMatricula] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaMatricula] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaMatricula] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaMatricula] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaMatricula] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SistemaMatricula] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaMatricula] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaMatricula] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaMatricula] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaMatricula] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaMatricula] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaMatricula] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaMatricula] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaMatricula] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SistemaMatricula] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaMatricula] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaMatricula] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaMatricula] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaMatricula] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaMatricula] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaMatricula] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaMatricula] SET RECOVERY FULL 
GO
ALTER DATABASE [SistemaMatricula] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaMatricula] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaMatricula] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaMatricula] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaMatricula] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaMatricula] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaMatricula] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SistemaMatricula', N'ON'
GO
ALTER DATABASE [SistemaMatricula] SET QUERY_STORE = ON
GO
ALTER DATABASE [SistemaMatricula] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SistemaMatricula]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[id_Alumno] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Ingreso] [date] NOT NULL,
	[Cedula] [varchar](15) NOT NULL,
	[Genero] [char](1) NOT NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido1] [varchar](20) NOT NULL,
	[Apellido2] [varchar](20) NOT NULL,
	[Direccion] [varchar](500) NOT NULL,
	[Telefono1] [varchar](20) NOT NULL,
	[Telefono2] [varchar](20) NOT NULL,
	[Correo] [varchar](30) NOT NULL,
	[id_Provincia] [int] NOT NULL,
	[id_Canton] [int] NOT NULL,
	[id_Distrito] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canton](
	[id_Canton] [int] IDENTITY(1,1) NOT NULL,
	[id_Provincia] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[usuarioCrea] [varchar](50) NULL,
	[fechaCrea] [datetime] NULL,
	[usuarioModifica] [varchar](50) NULL,
	[fechaModifica] [datetime] NULL,
	[vc_Estado] [varchar](3) NULL,
	[id_CantonInec] [int] NOT NULL,
 CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED 
(
	[id_Canton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carreras]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carreras](
	[id_Carrera] [int] IDENTITY(1,1) NOT NULL,
	[id_Grado] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[id_Distrito] [int] IDENTITY(1,1) NOT NULL,
	[id_Canton] [int] NULL,
	[nombre] [varchar](100) NOT NULL,
	[usuarioCrea] [varchar](50) NULL,
	[fechaCrea] [datetime] NULL,
	[usuarioModifica] [varchar](50) NULL,
	[fechaModifica] [datetime] NULL,
	[vc_Estado] [varchar](3) NULL,
	[id_DistritoInec] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnvioCorreos]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnvioCorreos](
	[id_Envio] [int] IDENTITY(1,1) NOT NULL,
	[Destinatario] [varchar](30) NOT NULL,
	[Asunto] [varchar](50) NOT NULL,
	[Cuerpo] [varchar](500) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Bitacora] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grados]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grados](
	[id_Grado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Grado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[id_Materia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Cant_Creditos] [int] NOT NULL,
	[Cant_Horas] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MateriasCarrera]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MateriasCarrera](
	[id_Carrera] [int] NOT NULL,
	[id_Materia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Carrera] ASC,
	[id_Materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[id_Matricula] [int] IDENTITY(1,1) NOT NULL,
	[id_Materia] [int] NOT NULL,
	[id_Alumno] [int] NOT NULL,
	[Nota] [int] NOT NULL,
	[id_Periodo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodos]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodos](
	[id_Periodo] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Fecha_Inicio] [date] NOT NULL,
	[Fecha_Fin] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Periodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[id_Provincia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[usuarioCrea] [varchar](50) NULL,
	[fechaCrea] [datetime] NULL,
	[usuarioModifica] [varchar](50) NULL,
	[fechaModifica] [datetime] NULL,
	[vc_Estado] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_Alumno] [int] NULL,
	[Usuario] [varchar](30) NOT NULL,
	[Contrasena] [binary](64) NOT NULL,
	[UltimaAccion] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
	[EsAlumno] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([id_Alumno], [Fecha_Ingreso], [Cedula], [Genero], [Fecha_Nacimiento], [Nombre], [Apellido1], [Apellido2], [Direccion], [Telefono1], [Telefono2], [Correo], [id_Provincia], [id_Canton], [id_Distrito]) VALUES (1, CAST(N'2023-03-01' AS Date), N'11111', N'M', CAST(N'2023-03-05' AS Date), N'Carlos', N'Fernandez', N'Vargas', N'AAA', N'8888', N'8888', N'carloslfv@gmail.com', 1, 1, 1)
INSERT [dbo].[Alumno] ([id_Alumno], [Fecha_Ingreso], [Cedula], [Genero], [Fecha_Nacimiento], [Nombre], [Apellido1], [Apellido2], [Direccion], [Telefono1], [Telefono2], [Correo], [id_Provincia], [id_Canton], [id_Distrito]) VALUES (19, CAST(N'2023-05-04' AS Date), N'115220336', N'M', CAST(N'1992-11-21' AS Date), N'Carlos Estudiante', N'Fernandez', N'Vargas', N'Moravia', N'22222222', N'88888888', N'carloslfv@outlook.com', 1, 14, 86)
INSERT [dbo].[Alumno] ([id_Alumno], [Fecha_Ingreso], [Cedula], [Genero], [Fecha_Nacimiento], [Nombre], [Apellido1], [Apellido2], [Direccion], [Telefono1], [Telefono2], [Correo], [id_Provincia], [id_Canton], [id_Distrito]) VALUES (20, CAST(N'2023-04-06' AS Date), N'111111123', N'M', CAST(N'2023-11-05' AS Date), N'Ivan', N'Ivan', N'Ivan', N'Ivan', N'1111111', N'1111111', N'ivanprogra1@gmail.com', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[Canton] ON 

INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (1, 1, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'A', 101)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (2, 1, N'ESCAZU', N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'A', 102)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (3, 1, N'DESAMPARADOS', N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'A', 103)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (4, 1, N'PURISCAL', N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'A', 104)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (5, 1, N'TARRAZU', N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'A', 105)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (6, 1, N'ASERRI', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 106)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (7, 1, N'MORA', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 107)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (8, 1, N'GOICOECHEA', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 108)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (9, 1, N'SANTA ANA', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 109)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (10, 1, N'ALAJUELITA', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 110)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (11, 1, N'VAZQUEZ DE CORONADO', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 111)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (12, 1, N'ACOSTA', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 112)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (13, 1, N'TIBAS', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 113)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (14, 1, N'MORAVIA', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 114)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (15, 1, N'MONTES DE OCA', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 115)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (16, 1, N'TURRUBARES', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 116)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (17, 1, N'DOTA', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 117)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (18, 1, N'CURRIDABAT', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 118)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (19, 1, N'PEREZ ZELEDON', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 119)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (20, 1, N'LEON CORTES', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 120)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (21, 2, N'ALAJUELA', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 201)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (22, 2, N'SAN RAMON', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 202)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (23, 2, N'GRECIA', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 203)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (24, 2, N'SAN MATEO', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 204)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (25, 2, N'ATENAS', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 205)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (26, 2, N'NARANJO', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 206)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (27, 2, N'PALMARES', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 207)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (28, 2, N'POAS', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 208)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (29, 2, N'OROTINA', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 209)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (30, 2, N'SAN CARLOS', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 210)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (31, 2, N'ALFARO RUIZ', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 211)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (32, 2, N'VALVERDE VEGA', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 212)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (33, 2, N'UPALA', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 213)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (34, 2, N'LOS CHILES', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 214)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (35, 2, N'GUATUSO', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 215)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (36, 3, N'CARTAGO', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 301)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (37, 3, N'PARAISO', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 302)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (38, 3, N'LA UNION', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 303)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (39, 3, N'JIMENEZ', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 304)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (40, 3, N'TURRIALBA', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 305)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (41, 3, N'ALVARADO', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 306)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (42, 3, N'OREAMUNO', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 307)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (43, 3, N'EL GUARCO', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 308)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (44, 4, N'HEREDIA', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 401)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (45, 4, N'BARVA', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 402)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (46, 4, N'SANTO DOMINGO', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 403)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (47, 4, N'SANTA BARBARA', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 404)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (48, 4, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 405)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (49, 4, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 406)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (50, 4, N'BELEN', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 407)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (51, 4, N'FLORES', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 408)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (52, 4, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 409)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (53, 4, N'SARAPIQUI', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 410)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (54, 5, N'LIBERIA', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 501)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (55, 5, N'NICOYA', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 502)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (56, 5, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 503)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (57, 5, N'BAGACES', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 504)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (58, 5, N'CARRILLO', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 505)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (59, 5, N'CA?AS', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 506)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (60, 5, N'ABANGARES', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 507)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (61, 5, N'TILARAN', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 508)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (62, 5, N'NANDAYURE', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 509)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (63, 5, N'LA CRUZ', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 510)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (64, 5, N'HOJANCHA', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 511)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (65, 6, N'PUNTARENAS', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 601)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (66, 6, N'ESPARZA', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 602)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (67, 6, N'BUENOS AIRES', N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'A', 603)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (68, 6, N'MONTES DE ORO', N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'A', 604)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (69, 6, N'OSA', N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'A', 605)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (70, 6, N'AGUIRRE', N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'A', 606)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (71, 6, N'GOLFITO', N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'A', 607)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (72, 6, N'COTO BRUS', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 608)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (73, 6, N'PARRITA', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 609)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (74, 6, N'CORREDORES', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 610)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (75, 6, N'GARABITO', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 611)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (76, 7, N'LIMON', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 701)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (77, 7, N'POCOCI', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 702)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (78, 7, N'SIQUIRRES', N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'A', 703)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (79, 7, N'TALAMANCA', N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'A', 704)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (80, 7, N'MATINA', N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'A', 705)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (81, 7, N'GUACIMO', N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'A', 706)
SET IDENTITY_INSERT [dbo].[Canton] OFF
GO
SET IDENTITY_INSERT [dbo].[Carreras] ON 

INSERT [dbo].[Carreras] ([id_Carrera], [id_Grado], [Nombre], [Descripcion]) VALUES (16, 7, N'Ingenieria En Sistemas', N'Ingenieria En Sistemas')
INSERT [dbo].[Carreras] ([id_Carrera], [id_Grado], [Nombre], [Descripcion]) VALUES (17, 8, N'Licenciatura En Sistemas', N'Licenciatura En Sistemas')
INSERT [dbo].[Carreras] ([id_Carrera], [id_Grado], [Nombre], [Descripcion]) VALUES (18, 13, N'Tecnico en redes', N'Tecnico en redes')
INSERT [dbo].[Carreras] ([id_Carrera], [id_Grado], [Nombre], [Descripcion]) VALUES (19, 12, N'Maestria en Administracion', N'Maestria en Administracion')
INSERT [dbo].[Carreras] ([id_Carrera], [id_Grado], [Nombre], [Descripcion]) VALUES (20, 13, N'Tecnico en Contabilidad', N'Tecnico en Contabilidad')
INSERT [dbo].[Carreras] ([id_Carrera], [id_Grado], [Nombre], [Descripcion]) VALUES (21, 14, N'Doctorado en Sistemas', N'Doctorado en Sistemas')
SET IDENTITY_INSERT [dbo].[Carreras] OFF
GO
SET IDENTITY_INSERT [dbo].[Distrito] ON 

INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (1, 1, N'EL CARMEN', N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'A', 10101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (2, 1, N'MERCED', N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'A', 10102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (3, 1, N'HOSPITAL', N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'A', 10103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (4, 1, N'CATEDRAL', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (5, 1, N'ZAPOTE', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (6, 1, N'SAN FRANCISCO DE DOS RIOS', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10106)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (7, 1, N'URUCA', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10107)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (8, 1, N'MATA REDONDA', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10108)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (9, 1, N'PAVAS', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10109)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (10, 1, N'HATILLO', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10110)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (11, 2, N'ESCAZU', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (12, 2, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (13, 2, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (14, 3, N'DESAMPARADOS', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (15, 3, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (16, 3, N'SAN JUAN DE DIOS', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (17, 3, N'SAN RAFAEL ARRIBA', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (18, 3, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (19, 3, N'FRAILES', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (20, 3, N'PATARRA', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (21, 3, N'SAN CRISTOBAL', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (22, 3, N'ROSARIO', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10309)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (23, 3, N'DAMAS', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10310)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (24, 3, N'SAN RAFAEL ABAJO', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10311)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (25, 3, N'GRAVILIAS', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10312)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (26, 3, N'LOS GUIDO', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10313)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (27, 4, N'SANTIAGO', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (28, 4, N'MERCEDES SUR', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (29, 4, N'BARBACOAS', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (30, 4, N'GRIFO ALTO', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10404)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (31, 4, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10405)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (32, 4, N'CANDELARITA', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10406)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (33, 4, N'DESAMPARADITOS', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10407)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (34, 4, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10408)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (35, 4, N'CHIRES', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10409)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (36, 5, N'SAN MARCOS', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (37, 5, N'SAN LORENZO', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (38, 5, N'SAN CARLOS', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (39, 6, N'ASERRI', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (40, 6, N'TARBACA', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (41, 6, N'VUELTA DE JORCO', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (42, 6, N'SAN GABRIEL', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (43, 6, N'LEGUA', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10605)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (44, 6, N'MONTERREY', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10606)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (45, 6, N'SALITRILLOS', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10607)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (46, 7, N'COLON', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (47, 7, N'GUAYABO', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (48, 7, N'TABARCIA', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (49, 7, N'PIEDRAS NEGRAS', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10704)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (50, 7, N'PICAGRES', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10705)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (51, 8, N'GUADALUPE', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (52, 8, N'SAN FRANCISCO', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (53, 8, N'CALLE BLANCOS', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (54, 8, N'MATA DE PLATANO', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (55, 8, N'IPIS', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10805)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (56, 8, N'RANCHO REDONDO', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10806)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (57, 8, N'PURRAL', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10807)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (58, 9, N'SANTA ANA', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (59, 9, N'SALITRAL', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 10902)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (60, 9, N'POZOS', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 10903)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (61, 9, N'URUCA', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 10904)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (62, 9, N'PIEDADES', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 10905)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (63, 9, N'BRASIL', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 10906)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (64, 10, N'ALAJUELITA', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 11001)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (65, 10, N'SAN JOSECITO', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 11002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (66, 10, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 11003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (67, 10, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (68, 10, N'SAN FELIPE', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11005)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (69, 11, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (70, 11, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (71, 11, N'DULCE NOMBRE DE JESUS', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (72, 11, N'PATALILLO', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (73, 11, N'CASCAJAL', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (74, 12, N'SAN IGNACIO', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (75, 12, N'GUAITIL', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (76, 12, N'PALMICHAL', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (77, 12, N'CANGREJAL', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (78, 12, N'SABANILLAS', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (79, 13, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (80, 13, N'CINCO ESQUINAS', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (81, 13, N'ANSELMO LLORENTE', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (82, 13, N'LEON XIII', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (83, 13, N'COLIMA', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (84, 14, N'SAN VICENTE', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (85, 14, N'SAN JERONIMO', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (86, 14, N'LA TRINIDAD', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (87, 15, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (88, 15, N'SABANILLA', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (89, 15, N'MERCEDES', N'sa', CAST(N'2014-06-17T11:39:58.417' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.417' AS DateTime), N'A', 11503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (90, 15, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (91, 16, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (92, 16, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (93, 16, N'SAN JUAN DE MATA', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (94, 16, N'SAN LUIS', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (95, 16, N'CARARA', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11605)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (96, 17, N'SANTA MARIA', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (97, 17, N'JARDIN', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (98, 17, N'COPEY', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (99, 18, N'CURRIDABAT', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11801)
GO
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (100, 18, N'GRANADILLA', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (101, 18, N'SANCHEZ', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (102, 18, N'TIRRASES', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (103, 19, N'SAN ISIDRO DEL GENERAL', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (104, 19, N'EL GENERAL', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11902)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (105, 19, N'DANIEL FLORES', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11903)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (106, 19, N'RIVAS', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11904)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (107, 19, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11905)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (108, 19, N'PLATANARES', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11906)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (109, 19, N'PEJIBAYE', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11907)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (110, 19, N'CAJON', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11908)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (111, 19, N'BARU', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11909)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (112, 19, N'RIO NUEVO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 11910)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (113, 19, N'PARAMO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 11911)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (114, 20, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12001)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (115, 20, N'SAN ANDRES', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (116, 20, N'LLANO BONITO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (117, 20, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (118, 20, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12005)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (119, 20, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12006)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (120, 21, N'ALAJUELA', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 20101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (121, 21, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 20102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (122, 21, N'CARRIZAL', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (123, 21, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (124, 21, N'GUACIMA', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (125, 21, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20106)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (126, 21, N'SABANILLA', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20107)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (127, 21, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20108)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (128, 21, N'RIO SEGUNDO', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20109)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (129, 21, N'DESAMPARADOS', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20110)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (130, 21, N'TURRUCARES', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20111)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (131, 21, N'TAMBOR', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20112)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (132, 21, N'GARITA', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20113)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (133, 21, N'SARAPIQUI', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20114)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (134, 22, N'SAN RAMON', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (135, 22, N'SANTIAGO', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (136, 22, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (137, 22, N'PIEDADES NORTE', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (138, 22, N'PIEDADES SUR', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (139, 22, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20206)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (140, 22, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20207)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (141, 22, N'ANGELES', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20208)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (142, 22, N'ALFARO', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20209)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (143, 22, N'VOLIO', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20210)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (144, 22, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20211)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (145, 22, N'ZAPOTAL', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20212)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (146, 22, N'PE?AS BLANCAS', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20213)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (147, 23, N'GRECIA', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (148, 23, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (149, 23, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (150, 23, N'SAN ROQUE', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (151, 23, N'TACARES', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (152, 23, N'RIO CUARTO', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (153, 23, N'PUENTE DE PIEDRA', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (154, 23, N'BOLIVAR', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (155, 24, N'SAN MATEO', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (156, 24, N'DESMONTE', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (157, 24, N'JESUS MARIA', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (158, 25, N'ATENAS', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (159, 25, N'JESUS', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (160, 25, N'MERCEDES', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (161, 25, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (162, 25, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20505)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (163, 25, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20506)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (164, 25, N'SANTA EULALIA', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20507)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (165, 25, N'ESCOBAL', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20508)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (166, 26, N'NARANJO', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (167, 26, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (168, 26, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (169, 26, N'CIRRI SUR', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (170, 26, N'SAN JERONIMO', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20605)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (171, 26, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20606)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (172, 26, N'EL ROSARIO', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20607)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (173, 26, N'PALMITOS', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20608)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (174, 27, N'PALMARES', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (175, 27, N'ZARAGOZA', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (176, 27, N'BUENOS AIRES', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (177, 27, N'SANTIAGO', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20704)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (178, 27, N'CANDELARIA', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20705)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (179, 27, N'ESQUIPULAS', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20706)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (180, 27, N'LA GRANJA', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20707)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (181, 28, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (182, 28, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (183, 28, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (184, 28, N'CARRILLOS', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (185, 28, N'SABANA REDONDA', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20805)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (186, 29, N'OROTINA', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (187, 29, N'EL MASTATE', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20902)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (188, 29, N'HACIENDA VIEJA', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20903)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (189, 29, N'COYOLAR', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20904)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (190, 29, N'LA CEIBA', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20905)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (191, 30, N'QUESADA', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 21001)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (192, 30, N'FLORENCIA', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (193, 30, N'BUENAVISTA', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (194, 30, N'AGUAS ZARCAS', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (195, 30, N'VENECIA', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21005)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (196, 30, N'PITAL', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21006)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (197, 30, N'LA FORTUNA', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21007)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (198, 30, N'LA TIGRA', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21008)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (199, 30, N'LA PALMERA', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21009)
GO
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (200, 30, N'VENADO', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21010)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (201, 30, N'CUTRIS', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21011)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (202, 30, N'MONTERREY', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21012)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (203, 30, N'POCOSOL', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21013)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (204, 31, N'ZARCERO', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (205, 31, N'LAGUNA', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (206, 31, N'TAPEZCO', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (207, 31, N'GUADALUPE', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (208, 31, N'PALMIRA', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (209, 31, N'ZAPOTE', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21106)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (210, 31, N'BRISAS', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21107)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (211, 32, N'SARCHI NORTE', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (212, 32, N'SARCHI SUR', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (213, 32, N'TORO AMARILLO', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (214, 32, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (215, 32, N'RODRIGUEZ', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (216, 33, N'UPALA', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (217, 33, N'AGUAS CLARAS', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (218, 33, N'SAN JOSE O PIZOTE', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (219, 33, N'BIJAGUA', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (220, 33, N'DELICIAS', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (221, 33, N'DOS RIOS', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (222, 33, N'YOLILLAL', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (223, 34, N'LOS CHILES', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (224, 34, N'CA?O NEGRO', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (225, 34, N'EL AMPARO', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (226, 34, N'SAN JORGE', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21404)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (227, 35, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (228, 35, N'BUENAVISTA', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (229, 35, N'COTE', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (230, 35, N'KATIRA', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 21504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (231, 36, N'ORIENTAL', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (232, 36, N'OCCIDENTAL', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (233, 36, N'CARMEN', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (234, 36, N'SAN NICOLAS', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (235, 36, N'AGUACALIENTE O SAN FRANCISCO', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (236, 36, N'GUADALUPE O ARENILLA', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30106)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (237, 36, N'CORRALILLO', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30107)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (238, 36, N'TIERRA BLANCA', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30108)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (239, 36, N'DULCE NOMBRE', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30109)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (240, 36, N'LLANO GRANDE', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30110)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (241, 36, N'QUEBRADILLAS', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30111)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (242, 37, N'PARAISO', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (243, 37, N'SANTIAGO', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (244, 37, N'OROSI', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (245, 37, N'CACHI', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (246, 37, N'LLANOS DE SANTA LUCIA', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (247, 38, N'TRES RIOS', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (248, 38, N'SAN DIEGO', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (249, 38, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (250, 38, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (251, 38, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (252, 38, N'DULCE NOMBRE', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (253, 38, N'SAN RAMON', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (254, 38, N'RIO AZUL', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (255, 39, N'JUAN VI?AS', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (256, 39, N'TUCURRIQUE', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (257, 39, N'PEJIBAYE', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (258, 40, N'TURRIALBA', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (259, 40, N'LA SUIZA', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (260, 40, N'PERALTA', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (261, 40, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (262, 40, N'SANTA TERESITA', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30505)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (263, 40, N'PAVONES', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30506)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (264, 40, N'TUIS', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30507)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (265, 40, N'TAYUTIC', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30508)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (266, 40, N'SANTA ROSA', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30509)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (267, 40, N'TRES EQUIS', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30510)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (268, 40, N'LA ISABEL', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30511)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (269, 40, N'CHIRRIPO', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30512)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (270, 41, N'PACAYAS', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (271, 41, N'CERVANTES', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (272, 41, N'CAPELLADES', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (273, 42, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (274, 42, N'COT', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (275, 42, N'POTRERO CERRADO', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (276, 42, N'CIPRESES', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30704)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (277, 42, N'SANTA ROSA', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 30705)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (278, 43, N'EL TEJAR', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 30801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (279, 43, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 30802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (280, 43, N'TOBOSI', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 30803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (281, 43, N'PATIO DE AGUA', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 30804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (282, 44, N'HEREDIA', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 40101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (283, 44, N'MERCEDES', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 40102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (284, 44, N'SAN FRANCISCO', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 40103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (285, 44, N'ULLOA', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 40104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (286, 44, N'VARABLANCA', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 40105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (287, 45, N'BARVA', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (288, 45, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (289, 45, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (290, 45, N'SAN ROQUE', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (291, 45, N'SANTA LUCIA', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (292, 45, N'SAN JOSE DE LA MONTA?A', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40206)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (293, 46, N'SANTO DOMINGO', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (294, 46, N'SAN VICENTE', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (295, 46, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (296, 46, N'PARACITO', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (297, 46, N'SANTO TOMAS', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (298, 46, N'SANTA ROSA', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (299, 46, N'TURES', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40307)
GO
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (300, 46, N'PARA', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (301, 47, N'SANTA BARBARA', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (302, 47, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (303, 47, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (304, 47, N'JESUS', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40404)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (305, 47, N'SANTO DOMINGO', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40405)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (306, 47, N'PURABA', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40406)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (307, 48, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (308, 48, N'SAN JOSECITO', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (309, 48, N'SANTIAGO', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (310, 48, N'ANGELES', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (311, 48, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 405005)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (312, 49, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 406010)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (313, 49, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 40602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (314, 49, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 40603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (315, 49, N'SAN FRANCISCO', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 40604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (316, 50, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 40701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (317, 50, N'LA RIBERA', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 40702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (318, 50, N'LA ASUNCION', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (319, 51, N'SAN JOAQUIN', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (320, 51, N'BARRANTES', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (321, 51, N'LLORENTE', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (322, 52, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (323, 52, N'RINCON DE SABANILLA', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40902)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (324, 53, N'PUERTO VIEJO', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 41001)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (325, 53, N'LA VIRGEN', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 41002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (326, 53, N'LAS HORQUETAS', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 41003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (327, 53, N'LLANURAS DEL GASPAR', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 41004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (328, 53, N'CURE?A', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 41005)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (329, 54, N'LIBERIA', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 50101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (330, 54, N'CA?AS DULCES', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 50102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (331, 54, N'MAYORGA', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 50103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (332, 54, N'NACASCOLO', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 50104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (333, 54, N'CURUBANDE', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 50105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (334, 55, N'NICOYA', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (335, 55, N'MANSION', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (336, 55, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (337, 55, N'QUEBRADA HONDA', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (338, 55, N'SAMARA', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (339, 55, N'NOSARA', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50206)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (340, 55, N'BELEN DE NOSARITA', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50207)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (341, 56, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (342, 56, N'BOLSON', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (343, 56, N'VEINTISIETE DE ABRIL', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (344, 56, N'TEMPATE', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (345, 56, N'CARTAGENA', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (346, 56, N'CUAJINIQUIL', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (347, 56, N'DIRIA', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (348, 56, N'CABO VELAS', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (349, 56, N'TAMARINDO', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50309)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (350, 57, N'BAGACES', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (351, 57, N'LA FORTUNA', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (352, 57, N'MOGOTE', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (353, 57, N'RIO NARANJO', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50404)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (354, 58, N'FILADELFIA', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (355, 58, N'PALMIRA', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (356, 58, N'SARDINAL', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (357, 58, N'BELEN', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (358, 59, N'CA?AS', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (359, 59, N'PALMIRA', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (360, 59, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (361, 59, N'BEBEDERO', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (362, 59, N'POROZAL', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50605)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (363, 60, N'LAS JUNTAS', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (364, 60, N'SIERRA', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (365, 60, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (366, 60, N'COLORADO', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50704)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (367, 61, N'TILARAN', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (368, 61, N'QUEBRADA GRANDE', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (369, 61, N'TRONADORA', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (370, 61, N'SANTA ROSA', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (371, 61, N'LIBANO', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50805)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (372, 61, N'TIERRAS MORENAS', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50806)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (373, 61, N'ARENAL', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50807)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (374, 62, N'CARMONA', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (375, 62, N'SANTA RITA', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50902)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (376, 62, N'ZAPOTAL', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50903)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (377, 62, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50904)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (378, 62, N'PORVENIR', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50905)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (379, 62, N'BEJUCO', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50906)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (380, 63, N'LA CRUZ', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 51001)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (381, 63, N'SANTA CECILIA', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 51002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (382, 63, N'LA GARITA', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (383, 63, N'SANTA ELENA', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (384, 64, N'HOJANCHA', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (385, 64, N'MONTE ROMO', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (386, 64, N'PUERTO CARRILLO', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (387, 64, N'HUACAS', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (388, 65, N'PUNTARENAS', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 60101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (389, 65, N'PITAHAYA', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (390, 65, N'CHOMES', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (391, 65, N'LEPANTO', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (392, 65, N'PAQUERA', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (393, 65, N'MANZANILLO', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60106)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (394, 65, N'GUACIMAL', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60107)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (395, 65, N'BARRANCA', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60108)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (396, 65, N'MONTE VERDE', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60109)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (397, 65, N'ISLA DEL COCO', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60110)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (398, 65, N'COBANO', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60111)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (399, 65, N'CHACARITA', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60112)
GO
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (400, 65, N'CHIRA', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60113)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (401, 65, N'ACAPULCO', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60114)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (402, 65, N'EL ROBLE', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60115)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (403, 65, N'ARANCIBIA', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60116)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (404, 66, N'ESPIRITU SANTO', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (476, 33, N'CANALETE', N'SA', CAST(N'2015-11-02T11:10:33.637' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.637' AS DateTime), N'A', 21308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (477, 66, N'CALDERA', N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'A', 60206)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (478, 69, N'BAHIA DRAKE', N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'A', 60606)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (479, 72, N'GUTIERREZ BROWN', N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'A', 60806)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (480, 77, N'LA COLONIA', N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'A', 70207)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (481, 7, N'QUITIRRIS?', N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'A', 10707)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (405, 66, N'SAN JUAN GRANDE', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (406, 66, N'MACACONA', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (407, 66, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (408, 66, N'SAN JERONIMO', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (409, 67, N'BUENOS AIRES', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (410, 67, N'VOLCAN', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (411, 67, N'POTRERO GRANDE', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (412, 67, N'BORUCA', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (413, 67, N'PILAS', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (414, 67, N'COLINAS', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (415, 67, N'CHANGUENA', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (416, 67, N'BIOLLEY', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (417, 67, N'BRUNKA', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60309)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (418, 68, N'MIRAMAR', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (419, 68, N'LA UNION', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (420, 68, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (421, 69, N'PUERTO CORTES', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (422, 69, N'PALMAR', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (423, 69, N'SIERPE', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (424, 69, N'BAHIA BALLENA', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (425, 69, N'PIEDRAS BLANCAS', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60505)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (426, 70, N'QUEPOS', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (427, 70, N'SAVEGRE', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (428, 70, N'NARANJITO', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (429, 71, N'GOLFITO', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (430, 71, N'PUERTO JIMENEZ', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (431, 71, N'GUAYCARA', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (432, 71, N'PAVON', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60704)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (433, 72, N'SAN VITO', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (434, 72, N'SABALITO', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (435, 72, N'AGUABUENA', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (436, 72, N'LIMONCITO', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (437, 72, N'PITTIER', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60805)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (438, 73, N'PARRITA', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 60901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (439, 74, N'CORREDOR', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61010)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (440, 74, N'LA CUESTA', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (441, 74, N'CANOAS', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (442, 74, N'LAUREL', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (443, 75, N'JAC?', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (444, 75, N'TARCOLES', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (445, 76, N'LIMON', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (446, 76, N'VALLE DE LA ESTRELLA', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (447, 76, N'RIO BLANCO', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (448, 76, N'MATAMA', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (449, 77, N'GUAPILES', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (450, 77, N'JIMENEZ', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (451, 77, N'RITA', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (452, 77, N'ROXANA', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (453, 77, N'CARIARI', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (454, 77, N'COLORADO', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70206)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (455, 78, N'SIQUIRRES', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (456, 78, N'PACUARITO', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (457, 78, N'FLORIDA', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (458, 78, N'GERMANIA', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (459, 78, N'EL CAIRO', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (460, 78, N'LA ALEGRIA', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (461, 79, N'BRATSI', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (462, 79, N'SIXAOLA', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (463, 79, N'CAHUITA', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (464, 79, N'TELIRE', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70404)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (465, 80, N'MATINA', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (466, 80, N'BATAN', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (467, 80, N'CARRANDI', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (468, 81, N'GUACIMO', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (469, 81, N'MERCEDES', N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'A', 70602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (470, 81, N'POCORA', N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'A', 70603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (471, 81, N'RIO JIMENEZ', N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'A', 70604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (472, 81, N'DUACARI', N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'A', 70605)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (473, 1, N'SAN SEBASTIAN', N'ARESEP\valverderf', CAST(N'2015-07-29T12:31:52.267' AS DateTime), N'ARESEP\valverderf', CAST(N'2015-07-29T12:31:52.267' AS DateTime), N'A', 10111)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (474, 7, N'JARIS', N'SA', CAST(N'2015-10-29T15:10:44.377' AS DateTime), N'SA', CAST(N'2015-10-29T15:10:44.377' AS DateTime), N'A', 10706)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (475, 24, N'LABRADOR', N'SA', CAST(N'2015-10-29T15:10:44.377' AS DateTime), N'SA', CAST(N'2015-10-29T15:10:44.377' AS DateTime), N'A', 20404)
SET IDENTITY_INSERT [dbo].[Distrito] OFF
GO
SET IDENTITY_INSERT [dbo].[EnvioCorreos] ON 

INSERT [dbo].[EnvioCorreos] ([id_Envio], [Destinatario], [Asunto], [Cuerpo], [Estado], [Bitacora]) VALUES (17, N'carloslfv@outlook.com', N'Su cuenta en Universidad Castro Carazo', N'Estimado alumno: (Fernandez Vargas Carlos (Estudiante)), gracias por confiar en Universidad Castro Carazo. Para nosotros es un placer servirle. A continuación,sus credenciales para ingresar a la aplicación: Sitio web: https://lospatitos.com usuario: (carloslfv@outlook.com) contraseña: (D9DEC912-C553-4601-96BD-0397A2)', N'S', N'Correo enviado sin errores')
INSERT [dbo].[EnvioCorreos] ([id_Envio], [Destinatario], [Asunto], [Cuerpo], [Estado], [Bitacora]) VALUES (18, N'carloslfv@outlook.com', N'Su cuenta en Universidad Castro Carazo', N'Estimado alumno: (Fernandez Vargas Carlos), gracias por confiar en Universidad Castro Carazo. Para nosotros es un placer servirle. A continuación,sus credenciales para ingresar a la aplicación: Sitio web: https://lospatitos.com usuario: (carloslfv@outlook.com) contraseña: (75ED10EC-FB8A-4BD9-A6AF-25A8CA)', N'S', N'Correo enviado sin errores')
INSERT [dbo].[EnvioCorreos] ([id_Envio], [Destinatario], [Asunto], [Cuerpo], [Estado], [Bitacora]) VALUES (19, N'carloslfv@outlook.com', N'Su cuenta en Universidad Castro Carazo', N'Estimado alumno: (Fernandez Vargas Carlos), gracias por confiar en Universidad Castro Carazo. Para nosotros es un placer servirle. A continuación,sus credenciales para ingresar a la aplicación: Sitio web: https://lospatitos.com usuario: (carloslfv@outlook.com) contraseña: (80B6DD55-C801-4A4E-9F9E-C8922E)', N'S', N'Correo enviado sin errores')
INSERT [dbo].[EnvioCorreos] ([id_Envio], [Destinatario], [Asunto], [Cuerpo], [Estado], [Bitacora]) VALUES (20, N'ivanprogra1@gmail.com', N'Su cuenta en Universidad Castro Carazo', N'Estimado alumno: (Ivan Ivan Ivan), gracias por confiar en Universidad Castro Carazo. Para nosotros es un placer servirle. A continuación,sus credenciales para ingresar a la aplicación: Sitio web: https://lospatitos.com usuario: (ivanprogra1@gmail.com) contraseña: (A1038DB9-6A6A-4240-ACCB-F37E5D)', N'S', N'Correo enviado sin errores')
SET IDENTITY_INSERT [dbo].[EnvioCorreos] OFF
GO
SET IDENTITY_INSERT [dbo].[Grados] ON 

INSERT [dbo].[Grados] ([id_Grado], [Nombre], [Descripcion]) VALUES (7, N'Bachillerato', N'Grado Bachillerato.')
INSERT [dbo].[Grados] ([id_Grado], [Nombre], [Descripcion]) VALUES (8, N'Licenciatura', N'Grado licenciatura')
INSERT [dbo].[Grados] ([id_Grado], [Nombre], [Descripcion]) VALUES (12, N'Maestria', N'Maestria')
INSERT [dbo].[Grados] ([id_Grado], [Nombre], [Descripcion]) VALUES (13, N'Tecnico', N'Tecnico')
INSERT [dbo].[Grados] ([id_Grado], [Nombre], [Descripcion]) VALUES (14, N'Doctorado', N'Grado de doctorado')
SET IDENTITY_INSERT [dbo].[Grados] OFF
GO
SET IDENTITY_INSERT [dbo].[Materias] ON 

INSERT [dbo].[Materias] ([id_Materia], [Nombre], [Codigo], [Cant_Creditos], [Cant_Horas]) VALUES (1, N'Historia 1', N'H101', 5, 5)
INSERT [dbo].[Materias] ([id_Materia], [Nombre], [Codigo], [Cant_Creditos], [Cant_Horas]) VALUES (2, N'Calculo Diferencial', N'CD01', 5, 2)
INSERT [dbo].[Materias] ([id_Materia], [Nombre], [Codigo], [Cant_Creditos], [Cant_Horas]) VALUES (3, N'Programacion 1', N'P101', 5, 2)
SET IDENTITY_INSERT [dbo].[Materias] OFF
GO
INSERT [dbo].[MateriasCarrera] ([id_Carrera], [id_Materia]) VALUES (16, 3)
INSERT [dbo].[MateriasCarrera] ([id_Carrera], [id_Materia]) VALUES (17, 1)
INSERT [dbo].[MateriasCarrera] ([id_Carrera], [id_Materia]) VALUES (18, 1)
INSERT [dbo].[MateriasCarrera] ([id_Carrera], [id_Materia]) VALUES (19, 2)
INSERT [dbo].[MateriasCarrera] ([id_Carrera], [id_Materia]) VALUES (20, 3)
GO
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([id_Matricula], [id_Materia], [id_Alumno], [Nota], [id_Periodo]) VALUES (3, 1, 1, 100, 1)
INSERT [dbo].[Matricula] ([id_Matricula], [id_Materia], [id_Alumno], [Nota], [id_Periodo]) VALUES (6, 1, 19, 69, 1)
SET IDENTITY_INSERT [dbo].[Matricula] OFF
GO
SET IDENTITY_INSERT [dbo].[Periodos] ON 

INSERT [dbo].[Periodos] ([id_Periodo], [Codigo], [Fecha_Inicio], [Fecha_Fin]) VALUES (1, N'Q12022', CAST(N'2022-01-01' AS Date), CAST(N'2022-05-01' AS Date))
INSERT [dbo].[Periodos] ([id_Periodo], [Codigo], [Fecha_Inicio], [Fecha_Fin]) VALUES (2, N'Q12023', CAST(N'2023-01-01' AS Date), CAST(N'2023-05-01' AS Date))
INSERT [dbo].[Periodos] ([id_Periodo], [Codigo], [Fecha_Inicio], [Fecha_Fin]) VALUES (3, N'Q22023', CAST(N'2023-05-02' AS Date), CAST(N'2023-09-01' AS Date))
SET IDENTITY_INSERT [dbo].[Periodos] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (1, N'SAN JOSE', N'sa', CAST(N'2014-05-23T14:35:40.990' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:40.990' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (2, N'ALAJUELA', N'sa', CAST(N'2014-05-23T14:35:44.320' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:44.320' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (3, N'CARTAGO', N'sa', CAST(N'2014-05-23T14:35:46.380' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:46.380' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (4, N'HEREDIA', N'sa', CAST(N'2014-05-23T14:35:49.277' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:49.277' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (5, N'GUANACASTE', N'sa', CAST(N'2014-05-23T14:35:53.840' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:53.840' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (6, N'PUNTARENAS', N'sa', CAST(N'2014-05-23T14:35:56.367' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:56.367' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (7, N'LIMON', N'sa', CAST(N'2014-05-23T14:35:59.307' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:59.307' AS DateTime), N'A')
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id_Usuario], [id_Alumno], [Usuario], [Contrasena], [UltimaAccion], [Activo], [EsAlumno]) VALUES (1, 1, N'carloslfv@gmail.com', 0x41B8E1732EA10DE80515D2C67F31A99C9E7CF230D154140C9F1117E8848F648788B4CE8F1A70BC64D89856C06932F4EC3ADB964CD4295F59023CE20372B27AEA, CAST(N'2023-04-16T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Usuarios] ([id_Usuario], [id_Alumno], [Usuario], [Contrasena], [UltimaAccion], [Activo], [EsAlumno]) VALUES (16, 19, N'carloslfv@outlook.com', 0x7DD2283ABC2BE6A47F39B24410FB94CF3762A84636C19397D162F73857419C8BF8E4B74C2F1A6F3CEC55F5504538AD42FADC8550221DC4C418B6B4C23EE4A242, CAST(N'2023-05-04T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Usuarios] ([id_Usuario], [id_Alumno], [Usuario], [Contrasena], [UltimaAccion], [Activo], [EsAlumno]) VALUES (17, 20, N'ivanprogra1@gmail.com', 0xC55AF51AE763B9787CA13666D47032A51FF9559DF6455409C5815D277CD697759471D848071581F3E170D02B038D5E97FE29A74DD79D7EDD582F5A551191DEE4, CAST(N'2023-05-04T00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Alumno__B4ADFE3874FEF54D]    Script Date: 5/4/2023 4:49:45 PM ******/
ALTER TABLE [dbo].[Alumno] ADD UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Carreras__75E3EFCF10BFBEE5]    Script Date: 5/4/2023 4:49:45 PM ******/
ALTER TABLE [dbo].[Carreras] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [id_Distrito_pk]    Script Date: 5/4/2023 4:49:45 PM ******/
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [id_Distrito_pk] PRIMARY KEY NONCLUSTERED 
(
	[id_Distrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Grados__75E3EFCF00DF9F47]    Script Date: 5/4/2023 4:49:45 PM ******/
ALTER TABLE [dbo].[Grados] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Materias__75E3EFCF7CFA618A]    Script Date: 5/4/2023 4:49:45 PM ******/
ALTER TABLE [dbo].[Materias] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Periodos__06370DAC3BDC7E3B]    Script Date: 5/4/2023 4:49:45 PM ******/
ALTER TABLE [dbo].[Periodos] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [id_Provincia_pk]    Script Date: 5/4/2023 4:49:45 PM ******/
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [id_Provincia_pk] PRIMARY KEY NONCLUSTERED 
(
	[id_Provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Canton] ADD  CONSTRAINT [DF__Canton__usuarioC__1B29CEB6]  DEFAULT (suser_name()) FOR [usuarioCrea]
GO
ALTER TABLE [dbo].[Canton] ADD  CONSTRAINT [DF__Canton__fechaCre__1C1DF2EF]  DEFAULT (getdate()) FOR [fechaCrea]
GO
ALTER TABLE [dbo].[Canton] ADD  CONSTRAINT [DF__Canton__usuarioM__1D121728]  DEFAULT (suser_name()) FOR [usuarioModifica]
GO
ALTER TABLE [dbo].[Canton] ADD  CONSTRAINT [DF__Canton__fechaMod__1E063B61]  DEFAULT (getdate()) FOR [fechaModifica]
GO
ALTER TABLE [dbo].[Canton] ADD  CONSTRAINT [DF__Canton__vc_Estad__1EFA5F9A]  DEFAULT ('A') FOR [vc_Estado]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [DF__Distrito__usuari__2B60367F]  DEFAULT (suser_name()) FOR [usuarioCrea]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [DF__Distrito__fechaC__2C545AB8]  DEFAULT (getdate()) FOR [fechaCrea]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [DF__Distrito__usuari__2D487EF1]  DEFAULT (suser_name()) FOR [usuarioModifica]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [DF__Distrito__fechaM__2E3CA32A]  DEFAULT (getdate()) FOR [fechaModifica]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [DF__Distrito__vc_Est__2F30C763]  DEFAULT ('A') FOR [vc_Estado]
GO
ALTER TABLE [dbo].[Matricula] ADD  DEFAULT ((0)) FOR [Nota]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF__Provincia__usuar__1388ACEE]  DEFAULT (suser_name()) FOR [usuarioCrea]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF__Provincia__fecha__147CD127]  DEFAULT (getdate()) FOR [fechaCrea]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF__Provincia__usuar__1570F560]  DEFAULT (suser_name()) FOR [usuarioModifica]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF__Provincia__fecha__16651999]  DEFAULT (getdate()) FOR [fechaModifica]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF__Provincia__vc_Es__17593DD2]  DEFAULT ('A') FOR [vc_Estado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [UltimaAccion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [EsAlumno]
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([id_Canton])
REFERENCES [dbo].[Canton] ([id_Canton])
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([id_Canton])
REFERENCES [dbo].[Canton] ([id_Canton])
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([id_Distrito])
REFERENCES [dbo].[Distrito] ([id_Distrito])
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([id_Distrito])
REFERENCES [dbo].[Distrito] ([id_Distrito])
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([id_Provincia])
REFERENCES [dbo].[Provincia] ([id_Provincia])
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([id_Provincia])
REFERENCES [dbo].[Provincia] ([id_Provincia])
GO
ALTER TABLE [dbo].[Canton]  WITH CHECK ADD  CONSTRAINT [Canton_ref_Provincia] FOREIGN KEY([id_Provincia])
REFERENCES [dbo].[Provincia] ([id_Provincia])
GO
ALTER TABLE [dbo].[Canton] CHECK CONSTRAINT [Canton_ref_Provincia]
GO
ALTER TABLE [dbo].[Carreras]  WITH CHECK ADD FOREIGN KEY([id_Grado])
REFERENCES [dbo].[Grados] ([id_Grado])
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [Distrito_ref_Canton] FOREIGN KEY([id_Canton])
REFERENCES [dbo].[Canton] ([id_Canton])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [Distrito_ref_Canton]
GO
ALTER TABLE [dbo].[MateriasCarrera]  WITH CHECK ADD FOREIGN KEY([id_Carrera])
REFERENCES [dbo].[Carreras] ([id_Carrera])
GO
ALTER TABLE [dbo].[MateriasCarrera]  WITH CHECK ADD FOREIGN KEY([id_Materia])
REFERENCES [dbo].[Materias] ([id_Materia])
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD FOREIGN KEY([id_Alumno])
REFERENCES [dbo].[Alumno] ([id_Alumno])
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD FOREIGN KEY([id_Materia])
REFERENCES [dbo].[Materias] ([id_Materia])
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD FOREIGN KEY([id_Periodo])
REFERENCES [dbo].[Periodos] ([id_Periodo])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([id_Alumno])
REFERENCES [dbo].[Alumno] ([id_Alumno])
GO
ALTER TABLE [dbo].[Canton]  WITH NOCHECK ADD  CONSTRAINT [Canton_Estado_CkC] CHECK  (([vc_Estado] IS NULL OR ([vc_Estado]='I' OR [vc_Estado]='A')))
GO
ALTER TABLE [dbo].[Canton] NOCHECK CONSTRAINT [Canton_Estado_CkC]
GO
ALTER TABLE [dbo].[Canton]  WITH NOCHECK ADD  CONSTRAINT [CKC_VC_ESTADO_CANTON] CHECK  (([vc_Estado] IS NULL OR ([vc_Estado]='I' OR [vc_Estado]='A')))
GO
ALTER TABLE [dbo].[Canton] NOCHECK CONSTRAINT [CKC_VC_ESTADO_CANTON]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [CKC_VC_ESTADO_DISTRITO] CHECK  (([vc_Estado] IS NULL OR ([vc_Estado]='I' OR [vc_Estado]='A')))
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [CKC_VC_ESTADO_DISTRITO]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [CKC_VC_ESTADO_PROVINCI] CHECK  (([vc_Estado] IS NULL OR ([vc_Estado]='I' OR [vc_Estado]='A')))
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [CKC_VC_ESTADO_PROVINCI]
GO
/****** Object:  StoredProcedure [dbo].[RetornaCantones]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de Cantones tomando en cuenta la columna nombre y id_Provincia>
-- =============================================
CREATE PROCEDURE [dbo].[RetornaCantones]
@nombre [varchar](50)= NULL,
@id_Provincia int= NULL
AS
	
SELECT  tCant.id_Canton,tCant.id_Provincia, tCant.nombre,tProv.nombre 'Provincia', tCant.usuarioCrea, tCant.fechaCrea, tCant.usuarioModifica, tCant.fechaModifica, tCant.vc_Estado,tCant.id_CantonInec
FROM Canton tCant inner join Provincia tProv on tCant.id_Provincia=tProv.id_Provincia
WHERE tCant.[id_Provincia] = (case when @id_Provincia is null then tCant.id_Provincia else @id_Provincia end)
and tCant.[nombre] like (case when @nombre is null then '%%' else '%'+@nombre+'%' end)

GO
/****** Object:  StoredProcedure [dbo].[RetornaCantonesID]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de Cantones tomando en cuenta la columna id_Canton>
-- =============================================
CREATE PROCEDURE [dbo].[RetornaCantonesID]
@id_Canton int
AS
	
SELECT  tCant.id_Canton,tCant.id_Provincia, tCant.nombre,tProv.nombre 'Provincia', tCant.usuarioCrea, tCant.fechaCrea, tCant.usuarioModifica, tCant.fechaModifica, tCant.vc_Estado,tCant.id_CantonInec
FROM Canton tCant inner join Provincia tProv on tCant.id_Provincia=tProv.id_Provincia
WHERE [id_Canton] = @id_Canton
GO
/****** Object:  StoredProcedure [dbo].[RetornaProvincias]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de provincias tomando en cuenta la columna nombre>
-- =============================================

CREATE PROCEDURE [dbo].[RetornaProvincias]
AS
	
SELECT  id_Provincia, nombre, usuarioCrea, fechaCrea, usuarioModifica, fechaModifica, vc_Estado
FROM Provincia

GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizaAlumno]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_ActualizaAlumno]
@id_Alumno int,
@Fecha_Ingreso date,
@Cedula varchar(15),
@Genero char,
@Fecha_Nacimiento date,
@Nombre varchar (20),
@Apellido1 varchar (20),
@Apellido2 varchar (20),
@Direccion varchar (500),
@Telefono1 varchar (20),
@Telefono2 varchar (20),
@Correo varchar (30),
@id_Provincia int,
@id_Canton int,
@id_Distrito int
as
Begin
	update Alumno set 
	Fecha_Ingreso = @Fecha_Ingreso,
	Cedula = @Cedula,
	Genero = @Genero,
	Fecha_Nacimiento = @Fecha_Nacimiento,
	Nombre = @Nombre,
	Apellido1 = @Apellido1,
	Apellido2 = Apellido2,
	Direccion = @Direccion,
	Telefono1 = @Telefono1,
	Telefono2 = @Telefono2,
	Correo = @Correo,
	id_Provincia = @id_Provincia,
	id_Canton = @id_Canton,
	id_Distrito = @id_Distrito
	where id_Alumno = @id_Alumno
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizaCarrera]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ActualizaCarrera]
@id_Carrera int,
@id_Grado int,
@Nombre varchar(50),
@Descripcion varchar (500)
as
Begin
	update Carreras set id_Grado = @id_Grado, Nombre = @Nombre, Descripcion = @Descripcion where id_Carrera = @id_Carrera
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizaCorreo]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_ActualizaCorreo]
@id_Envio int,
@Estado char,
@Bitacora varchar (max)
as
Begin
	update EnvioCorreos set Estado = @Estado,Bitacora = @Bitacora
	where id_Envio = @id_Envio
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizaGrados]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ActualizaGrados]
@id_Grado int,
@Nombre varchar(50),
@Descripcion varchar(500)
as
Begin
	update Grados set Nombre = @Nombre, Descripcion = @Descripcion where id_Grado = @id_Grado
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizaMateria]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ActualizaMateria]
@id_Materia int,
@Nombre varchar (50),
@Codigo varchar (10),
@Cant_Creditos int,
@Cant_Horas int
as
Begin
	update Materias set Nombre = @Nombre, Codigo = @Codigo, Cant_Creditos = @Cant_Creditos, Cant_Horas = @Cant_Horas
	where id_Materia = @id_Materia
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizaMateriaCarrera]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

CREATE procedure [dbo].[sp_ActualizaMateriaCarrera]
@id_CarreraOLD int,
@id_MateriaOLD int,
@id_CarreraNEW int,
@id_MateriaNEW int
as
Begin
    update MateriasCarrera set id_Materia = @id_MateriaNEW, id_Carrera = @id_CarreraNEW

    where id_Carrera = @id_CarreraOLD and id_Materia = @id_MateriaOLD
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizaMatricula]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_ActualizaMatricula]
@id_Matricula int,
@id_Materia int,
@id_Alumno int,
@Nota int,
@id_Periodo int
as
Begin
	update Matricula set id_Materia = @id_Materia,id_Alumno = @id_Alumno,Nota = @Nota,id_Periodo = id_Periodo
	where id_Matricula = @id_Matricula
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizaPeriodo]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_ActualizaPeriodo]
@id_Periodo int,
@Codigo varchar (10),
@Fecha_Inicio date,
@Fecha_Fin date
as
Begin
	update Periodos set Codigo = @Codigo, Fecha_Inicio = @Fecha_Inicio, Fecha_Fin = @Fecha_Fin
	where id_Periodo = @id_Periodo
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizaUsuario]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_ActualizaUsuario]
@id_Usuario int,
@id_Alumno int null,
@Usuario varchar (30),
@Contrasena varchar(max),
@UltimaAccion datetime,
@Activo bit,
@EsAlumno bit
as
Begin
	update Usuarios set 
	id_Alumno = @id_Alumno,
	Usuario = @Usuario,
	Contrasena = HASHBYTES('SHA2_512', @Contrasena),
	UltimaAccion = @UltimaAccion,
	Activo = @Activo,
	EsAlumno = @EsAlumno
	where id_Usuario = @id_Usuario
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaAlumno]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_EliminaAlumno]
@id_Alumno int
as
Begin
	delete from Usuarios where id_Alumno = @id_Alumno

	delete from Alumno where id_Alumno = @id_Alumno
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaCanton]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Elimina un registro en la tabla de cantones>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EliminaCanton]
	-- Add the parameters for the stored procedure here
		  @id_Canton int
AS
BEGIN
	DELETE FROM Canton
	WHERE [id_Canton]=@id_Canton
END

GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaCarrera]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_EliminaCarrera]
@id_Carrera int,
@id_Grado int
as
Begin
	delete from Carreras where id_Carrera = @id_Carrera and  id_Grado = @id_Grado
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaGrados]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_EliminaGrados]
@id_Grado int
as
Begin
	delete from Grados where id_Grado = @id_Grado
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaMateria]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_EliminaMateria]
@id_Materia int
as
Begin
	delete from Materias where id_Materia = @id_Materia
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaMateriaCarrera]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_EliminaMateriaCarrera]
@id_Carrera int,
@id_Materia int
as
Begin
	delete from MateriasCarrera where id_Carrera = @id_Carrera and id_Materia = @id_Materia
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaMatricula]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_EliminaMatricula]
@id_Matricula int
as
Begin
	delete from Matricula where id_Matricula = @id_Matricula
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaPeriodo]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_EliminaPeriodo]
@id_Periodo int
as
Begin
	delete from Periodos where id_Periodo = @id_Periodo
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaUsuario]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_EliminaUsuario]
@id_Usuario int
as
Begin
	delete from Usuarios where id_Usuario = @id_Usuario
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaAlumno]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---Alumnos
CREATE procedure [dbo].[sp_InsertaAlumno]
@Fecha_Ingreso date,
@Cedula varchar(15),
@Genero char,
@Fecha_Nacimiento date,
@Nombre varchar (20),
@Apellido1 varchar (20),
@Apellido2 varchar (20),
@Direccion varchar (500),
@Telefono1 varchar (20),
@Telefono2 varchar (20),
@Correo varchar (30),
@id_Provincia int,
@id_Canton int,
@id_Distrito int

as
Begin
	Insert into Alumno(Fecha_Ingreso,Cedula,Genero,Fecha_Nacimiento,Nombre,Apellido1,Apellido2,Direccion,Telefono1,Telefono2,Correo,id_Provincia,id_Canton,id_Distrito)
	values (@Fecha_Ingreso,@Cedula,@Genero,@Fecha_Nacimiento,@Nombre,@Apellido1,@Apellido2,@Direccion,@Telefono1,@Telefono2,@Correo,@id_Provincia,@id_Canton,@id_Distrito);

	declare @id int;
	set @id = (select IDENT_CURRENT('Alumno'));

	select @@IDENTITY

	declare @pass varchar(30);
	set @pass = CONVERT(varchar(255), NEWID());
	
	declare @cuerpocorreo varchar(500);
	set @cuerpocorreo = 'Estimado alumno: ('+@Apellido1+' '+@Apellido2+' '+@Nombre+'), gracias por confiar en Universidad Castro Carazo. Para nosotros es un placer servirle. A continuación,sus credenciales para ingresar a la aplicación: Sitio web: https://lospatitos.com usuario: ('+@Correo+') contraseña: ('+@pass+')'

	exec sp_InsertaUsuario @id,@Correo,@pass,@Fecha_Ingreso,1,1;
	exec sp_InsertaCorreo @Correo,'Su cuenta en Universidad Castro Carazo',@cuerpocorreo,'P','1';

End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaCanton]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************PROCEDIMIENTOS ALMACENADOS*****************************************/

-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Inserta un registro en la tabla de cantones>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaCanton]
	-- Add the parameters for the stored procedure here
		  @id_Provincia int,          
          @nombre varchar(100),          
          @id_CantonInec int          
AS
BEGIN
	INSERT INTO [dbo].Canton
           ([id_Provincia]           
           ,[nombre]
           ,[id_CantonInec])
     VALUES
           (@id_Provincia,		    
            @nombre,
            @id_CantonInec)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaCarrera]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carreras

CREATE procedure [dbo].[sp_InsertaCarrera]
@id_Grado int,
@Nombre varchar(50),
@Descripcion varchar (500)
as
Begin
	Insert into Carreras (id_Grado,Nombre,Descripcion) values (@id_Grado,@Nombre,@Descripcion)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaCorreo]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_InsertaCorreo]
@Destinatario varchar(30),
@Asunto varchar (50),
@Cuerpo varchar (500),
@Estado char,
@Bitacora varchar (max)

as
Begin
	Insert into EnvioCorreos(Destinatario,Asunto,Cuerpo,Estado,Bitacora)
	values (@Destinatario,@Asunto,@Cuerpo,@Estado,@Bitacora)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaGrados]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----StoredProcedures
--Grados

CREATE procedure [dbo].[sp_InsertaGrados]
@Nombre varchar(50),
@Descripcion varchar(500)
as
Begin
	Insert into Grados (Nombre,Descripcion) values (@Nombre,@Descripcion)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaMateria]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Materias
create procedure [dbo].[sp_InsertaMateria]
--@id_Materia int,
@Nombre varchar (50),
@Codigo varchar (10),
@Cant_Creditos int,
@Cant_Horas int
as
Begin
	Insert into Materias (Nombre,Codigo,Cant_Creditos,Cant_Horas) values (@Nombre,@Codigo,@Cant_Creditos,@Cant_Horas)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaMateriaCarrera]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--MateriasPorCarrera
create procedure [dbo].[sp_InsertaMateriaCarrera]
@id_Carrera int,
@id_Materia int

as
Begin
	Insert into MateriasCarrera (id_Carrera,id_Materia) values (@id_Carrera,@id_Materia)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaMatricula]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_InsertaMatricula]
@id_Materia int,
@id_Alumno int,
@Nota int,
@id_Periodo int

as
Begin
	Insert into Matricula(id_Materia,id_Alumno,Nota,id_Periodo)
	values (@id_Materia,@id_Alumno,@Nota,@id_Periodo)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaPeriodo]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Periodos
create procedure [dbo].[sp_InsertaPeriodo]
--@id_Periodo int,
@Codigo varchar (10),
@Fecha_Inicio date,
@Fecha_Fin date

as
Begin
	Insert into Periodos(Codigo,Fecha_Inicio,Fecha_Fin) values (@Codigo,@Fecha_Inicio,@Fecha_Fin)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaUsuario]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_InsertaUsuario]
@id_Alumno int null,
@Usuario varchar (30),
@Contrasena varchar(max),
@UltimaAccion datetime,
@Activo bit,
@EsAlumno bit

as
Begin
	Insert into Usuarios(id_Alumno,Usuario,Contrasena,UltimaAccion,Activo,EsAlumno)
	values (@id_Alumno,@Usuario,HASHBYTES('SHA2_512', @Contrasena),@UltimaAccion,@Activo,@EsAlumno)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificaCanton]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Modifica un registro en la tabla de cantones>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ModificaCanton]
	-- Add the parameters for the stored procedure here
		  @id_Canton int,
		  @id_Provincia int,          
          @nombre varchar(100),          
          @id_CantonInec int 
AS
BEGIN
	UPDATE Canton
	SET [id_Provincia]=@id_Provincia,
	[nombre]=@nombre,
	[id_CantonInec]=@id_CantonInec
	WHERE [id_Canton]=@id_Canton
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ReporteMatriculaGen]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ReporteMatriculaGen]
as
select M1.id_Matricula,M2.Nombre as Materia,M2.Codigo,A.Nombre + ' ' + A.Apellido1 + ' ' +A.Apellido2 as NombreEst, M1.Nota, 
case when M1.Nota > 70 then 'Aprobada'
else 'Reprobada'
end as Estado
from Matricula M1
inner join Materias M2 on M1.id_Materia = M2.id_Materia
inner join Alumno A on A.id_Alumno = M1.id_Alumno
inner join Periodos P on  P.id_Periodo = M1.id_Periodo
GO
/****** Object:  StoredProcedure [dbo].[sp_ReporteMatriculaPorEstudiante]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ReporteMatriculaPorEstudiante]
@pLogin varchar(50)
as
select M1.id_Matricula,M2.Nombre as Materia,M2.Codigo,A.Nombre + ' ' + A.Apellido1 + ' ' +A.Apellido2 as NombreEst, M1.Nota,
case when M1.Nota > 70 then 'Aprobada'
else 'Reprobada'
end as Estado
from Matricula M1
inner join Materias M2 on M1.id_Materia = M2.id_Materia
inner join Alumno A on A.id_Alumno = M1.id_Alumno
inner join Periodos P on  P.id_Periodo = M1.id_Periodo
inner join Usuarios U on U.id_Alumno = M1.id_Alumno
where U.Usuario = @pLogin
GO
/****** Object:  StoredProcedure [dbo].[sp_ReprocesaCorreosError]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_ReprocesaCorreosError]
as
Begin
update EnvioCorreos set Estado = 'P' where Estado = 'X' and left(Bitacora,1) = 1
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaAlumno]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaAlumno]
as
Begin
	select * from Alumno
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaAlumnoData]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaAlumnoData]
@pLogin varchar(50)
as
Begin
	select * from Alumno where Correo = @pLogin
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaAlumnoporID]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_RetornaAlumnoporID]
@id_Alumno int
as
Begin
	select * from Alumno where id_Alumno = @id_Alumno
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaCantonPorProvincia]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[sp_RetornaCantonPorProvincia]
  @id_Provincia int
  as 
  select * from Canton where id_Provincia = @id_Provincia
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaCarrera]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_RetornaCarrera]
as
Begin
	select * from Carreras 
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaCarreraPorID]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_RetornaCarreraPorID]
@id_Carrera int,
@id_Grado int
as
Begin
	select * from Carreras where id_Carrera = @id_Carrera and id_Grado = @id_Grado
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaCorreosPendientes]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaCorreosPendientes]
as
Begin
select * from EnvioCorreos where Estado = 'P'
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaDistritoPorCanton]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[sp_RetornaDistritoPorCanton]
  @id_Canton int
  as 
  select * from Distrito where id_Canton = @id_Canton
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaGrados]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaGrados]
as
Begin
	select * from Grados
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaGradosPorID]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaGradosPorID]
@id_Grado int
as
Begin
	select * from Grados where id_Grado = @id_Grado
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaInicioSesion]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_RetornaInicioSesion]
@Usuario varchar (30),
@Contrasena varchar(max)
as
Begin
	select Usuario,Activo,EsAlumno from Usuarios where Usuario = @Usuario and Contrasena =  HASHBYTES('SHA2_512',@Contrasena);
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaMateria]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaMateria]
as
Begin
	select * from Materias
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaMateriaPorID]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaMateriaPorID]
@id_Materia int
as
Begin
	select * from Materias where id_Materia = @id_Materia
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaMateriasAlumnoporID]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaMateriasAlumnoporID]
@id_Alumno int
as
Begin
	select * from Alumno where id_Alumno = @id_Alumno
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaMateriasCarrera]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaMateriasCarrera]
as
Begin
	select * from MateriasCarrera
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaMateriasCarreraPorCarrera]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaMateriasCarreraPorCarrera]
@id_Materia int
as
Begin
	select * from MateriasCarrera where id_Materia = @id_Materia
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaMateriasCarreraPorMateria]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaMateriasCarreraPorMateria]
@id_Carrera int
as
Begin
	select * from MateriasCarrera where id_Carrera = @id_Carrera
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaMateriasPeriodoporID]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaMateriasPeriodoporID]
@id_Periodo int
as
Begin
	select * from Periodos where id_Periodo = @id_Periodo
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaMatricula]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaMatricula]
as
Begin
	select * from Matricula
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaMatriculaporAlumno]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaMatriculaporAlumno]
@id_Alumno int
as
Begin
	select * from Matricula where id_Alumno = @id_Alumno
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaPeriodo]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaPeriodo]
as
Begin
	select * from Periodos
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaPeriodoporID]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

create procedure [dbo].[sp_RetornaPeriodoporID]
@id_Periodo int
as
Begin
    select * from Periodos where id_Periodo = @id_Periodo
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaUsuario]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaUsuario]
as
Begin
	select * from Usuarios
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaUsuarioporID]    Script Date: 5/4/2023 4:49:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_RetornaUsuarioporID]
@id_Usuario int
as
Begin
	select * from Usuarios where id_Usuario = @id_Usuario
End
GO
USE [master]
GO
ALTER DATABASE [SistemaMatricula] SET  READ_WRITE 
GO
