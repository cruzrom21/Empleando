USE [master]
GO
/****** Object:  Database [DbEmpleando]    Script Date: 28/05/2024 05:29:55 p. m. ******/
CREATE DATABASE [DbEmpleando]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbEmpleando', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DbEmpleando.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbEmpleando_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DbEmpleando_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DbEmpleando] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbEmpleando].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbEmpleando] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbEmpleando] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbEmpleando] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbEmpleando] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbEmpleando] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbEmpleando] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbEmpleando] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbEmpleando] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbEmpleando] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbEmpleando] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbEmpleando] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbEmpleando] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbEmpleando] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbEmpleando] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbEmpleando] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbEmpleando] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbEmpleando] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbEmpleando] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbEmpleando] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbEmpleando] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbEmpleando] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbEmpleando] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbEmpleando] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbEmpleando] SET  MULTI_USER 
GO
ALTER DATABASE [DbEmpleando] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbEmpleando] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbEmpleando] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbEmpleando] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbEmpleando] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbEmpleando] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DbEmpleando] SET QUERY_STORE = ON
GO
ALTER DATABASE [DbEmpleando] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DbEmpleando]
GO
/****** Object:  User [userEmpleando]    Script Date: 28/05/2024 05:29:56 p. m. ******/
CREATE USER [userEmpleando] FOR LOGIN [userEmpleando] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [userEmpleando]
GO
/****** Object:  Table [dbo].[Offer]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[IdOffer] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[Location] [varchar](50) NULL,
	[TypeContract] [varchar](50) NOT NULL,
	[Salary] [varchar](50) NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Offer] PRIMARY KEY CLUSTERED 
(
	[IdOffer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersData]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersData](
	[IdData] [int] IDENTITY(1,1) NOT NULL,
	[IdTypeData] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[Value] [varchar](150) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UsersData] PRIMARY KEY CLUSTERED 
(
	[IdData] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[IdTypeUser] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CompanyOffers]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CompanyOffers]
AS
SELECT        o.IdOffer, o.IdUser, o.Title, o.Description, o.Location, o.TypeContract, o.Salary, o.ExpirationDate, o.CreateDate, o.ModifyDate, ISNULL(ud.Value, 'SinNombre') AS Company
FROM            dbo.Offer AS o INNER JOIN
                         dbo.Users AS u ON o.IdUser = u.IdUser LEFT OUTER JOIN
                         dbo.UsersData AS ud ON u.IdUser = ud.IdUser AND ud.IdTypeData = 1
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[IdAplications] [int] IDENTITY(1,1) NOT NULL,
	[IdOffer] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[ApplicationDate] [datetime] NOT NULL,
	[State] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[IdAplications] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Education]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[IdEducation] [int] IDENTITY(1,1) NOT NULL,
	[IdData] [int] NOT NULL,
	[InitDate] [datetime] NOT NULL,
	[FinalDate] [datetime] NULL,
	[Institute] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Education] PRIMARY KEY CLUSTERED 
(
	[IdEducation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Experience]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experience](
	[IdExperience] [int] IDENTITY(1,1) NOT NULL,
	[IdData] [int] NOT NULL,
	[InitDate] [datetime] NOT NULL,
	[FinalDate] [datetime] NULL,
	[Company] [varchar](50) NOT NULL,
	[Description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Experience] PRIMARY KEY CLUSTERED 
(
	[IdExperience] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfferSkills]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfferSkills](
	[IdOfferSkills] [int] IDENTITY(1,1) NOT NULL,
	[IdOffer] [int] NULL,
	[IdSkills] [int] NULL,
 CONSTRAINT [PK_OfferSkills] PRIMARY KEY CLUSTERED 
(
	[IdOfferSkills] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[IdSkills] [int] IDENTITY(1,1) NOT NULL,
	[Skill] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[IdSkills] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeData]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeData](
	[IdTypeData] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TypeData] PRIMARY KEY CLUSTERED 
(
	[IdTypeData] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeUser]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeUser](
	[IdTypeUser] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TypeUser] PRIMARY KEY CLUSTERED 
(
	[IdTypeUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSkills]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSkills](
	[IdUserSkills] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdSkills] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdUserSkills] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (6, 21, 18, CAST(N'2024-05-28T17:08:36.853' AS DateTime), 1, CAST(N'2024-05-28T17:08:36.853' AS DateTime), CAST(N'2024-05-28T17:08:36.853' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (7, 25, 18, CAST(N'2024-05-28T17:08:40.600' AS DateTime), 1, CAST(N'2024-05-28T17:08:40.600' AS DateTime), CAST(N'2024-05-28T17:08:40.600' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (8, 33, 18, CAST(N'2024-05-28T17:08:43.177' AS DateTime), 1, CAST(N'2024-05-28T17:08:43.177' AS DateTime), CAST(N'2024-05-28T17:08:43.177' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (9, 25, 19, CAST(N'2024-05-28T17:09:00.360' AS DateTime), 1, CAST(N'2024-05-28T17:09:00.360' AS DateTime), CAST(N'2024-05-28T17:09:00.360' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (10, 33, 19, CAST(N'2024-05-28T17:09:04.063' AS DateTime), 1, CAST(N'2024-05-28T17:09:04.063' AS DateTime), CAST(N'2024-05-28T17:09:04.063' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (11, 28, 20, CAST(N'2024-05-28T17:09:21.200' AS DateTime), 1, CAST(N'2024-05-28T17:09:21.200' AS DateTime), CAST(N'2024-05-28T17:09:21.200' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (12, 52, 20, CAST(N'2024-05-28T17:09:43.787' AS DateTime), 1, CAST(N'2024-05-28T17:09:43.787' AS DateTime), CAST(N'2024-05-28T17:09:43.787' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (13, 47, 20, CAST(N'2024-05-28T17:09:50.107' AS DateTime), 1, CAST(N'2024-05-28T17:09:50.107' AS DateTime), CAST(N'2024-05-28T17:09:50.107' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (14, 22, 21, CAST(N'2024-05-28T17:10:04.047' AS DateTime), 1, CAST(N'2024-05-28T17:10:04.047' AS DateTime), CAST(N'2024-05-28T17:10:04.047' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (15, 27, 21, CAST(N'2024-05-28T17:10:09.817' AS DateTime), 1, CAST(N'2024-05-28T17:10:09.817' AS DateTime), CAST(N'2024-05-28T17:10:09.817' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (16, 29, 21, CAST(N'2024-05-28T17:10:13.173' AS DateTime), 1, CAST(N'2024-05-28T17:10:13.173' AS DateTime), CAST(N'2024-05-28T17:10:13.173' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (17, 30, 22, CAST(N'2024-05-28T17:10:29.433' AS DateTime), 1, CAST(N'2024-05-28T17:10:29.433' AS DateTime), CAST(N'2024-05-28T17:10:29.433' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (18, 27, 22, CAST(N'2024-05-28T17:10:40.243' AS DateTime), 1, CAST(N'2024-05-28T17:10:40.243' AS DateTime), CAST(N'2024-05-28T17:10:40.243' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (19, 36, 22, CAST(N'2024-05-28T17:10:45.473' AS DateTime), 1, CAST(N'2024-05-28T17:10:45.473' AS DateTime), CAST(N'2024-05-28T17:10:45.473' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (20, 27, 23, CAST(N'2024-05-28T17:11:04.877' AS DateTime), 1, CAST(N'2024-05-28T17:11:04.877' AS DateTime), CAST(N'2024-05-28T17:11:04.877' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (21, 36, 23, CAST(N'2024-05-28T17:11:11.673' AS DateTime), 1, CAST(N'2024-05-28T17:11:11.673' AS DateTime), CAST(N'2024-05-28T17:11:11.673' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (22, 44, 23, CAST(N'2024-05-28T17:11:17.457' AS DateTime), 1, CAST(N'2024-05-28T17:11:17.457' AS DateTime), CAST(N'2024-05-28T17:11:17.457' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (23, 21, 24, CAST(N'2024-05-28T17:11:33.433' AS DateTime), 1, CAST(N'2024-05-28T17:11:33.433' AS DateTime), CAST(N'2024-05-28T17:11:33.433' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (24, 33, 24, CAST(N'2024-05-28T17:11:40.057' AS DateTime), 1, CAST(N'2024-05-28T17:11:40.057' AS DateTime), CAST(N'2024-05-28T17:11:40.057' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (25, 39, 24, CAST(N'2024-05-28T17:11:45.577' AS DateTime), 1, CAST(N'2024-05-28T17:11:45.577' AS DateTime), CAST(N'2024-05-28T17:11:45.577' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (26, 26, 25, CAST(N'2024-05-28T17:11:59.980' AS DateTime), 1, CAST(N'2024-05-28T17:11:59.980' AS DateTime), CAST(N'2024-05-28T17:11:59.980' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (27, 37, 25, CAST(N'2024-05-28T17:12:06.913' AS DateTime), 1, CAST(N'2024-05-28T17:12:06.913' AS DateTime), CAST(N'2024-05-28T17:12:06.913' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (28, 44, 25, CAST(N'2024-05-28T17:12:13.927' AS DateTime), 1, CAST(N'2024-05-28T17:12:13.927' AS DateTime), CAST(N'2024-05-28T17:12:13.927' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (29, 25, 26, CAST(N'2024-05-28T17:12:28.550' AS DateTime), 1, CAST(N'2024-05-28T17:12:28.550' AS DateTime), CAST(N'2024-05-28T17:12:28.550' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (30, 45, 26, CAST(N'2024-05-28T17:12:33.673' AS DateTime), 1, CAST(N'2024-05-28T17:12:33.673' AS DateTime), CAST(N'2024-05-28T17:12:33.673' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (31, 49, 26, CAST(N'2024-05-28T17:12:38.710' AS DateTime), 1, CAST(N'2024-05-28T17:12:38.710' AS DateTime), CAST(N'2024-05-28T17:12:38.710' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (32, 52, 27, CAST(N'2024-05-28T17:13:06.500' AS DateTime), 1, CAST(N'2024-05-28T17:13:06.500' AS DateTime), CAST(N'2024-05-28T17:13:06.500' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (33, 21, 28, CAST(N'2024-05-28T17:13:29.550' AS DateTime), 1, CAST(N'2024-05-28T17:13:29.550' AS DateTime), CAST(N'2024-05-28T17:13:29.550' AS DateTime))
INSERT [dbo].[Applications] ([IdAplications], [IdOffer], [IdUser], [ApplicationDate], [State], [CreateDate], [ModifyDate]) VALUES (34, 30, 28, CAST(N'2024-05-28T17:13:40.027' AS DateTime), 1, CAST(N'2024-05-28T17:13:40.027' AS DateTime), CAST(N'2024-05-28T17:13:40.027' AS DateTime))
SET IDENTITY_INSERT [dbo].[Applications] OFF
GO
SET IDENTITY_INSERT [dbo].[Education] ON 

INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (7, 171, CAST(N'2005-01-01T00:00:00.000' AS DateTime), CAST(N'2010-12-01T00:00:00.000' AS DateTime), N'Universidad Nacional')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (8, 172, CAST(N'2011-01-01T00:00:00.000' AS DateTime), CAST(N'2013-12-01T00:00:00.000' AS DateTime), N'Universidad de Bogotá')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (9, 173, CAST(N'2014-01-01T00:00:00.000' AS DateTime), CAST(N'2015-12-01T00:00:00.000' AS DateTime), N'Universidad Virtual')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (10, 174, CAST(N'2008-01-01T00:00:00.000' AS DateTime), CAST(N'2012-12-01T00:00:00.000' AS DateTime), N'Universidad de Antioquia')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (11, 175, CAST(N'2013-01-01T00:00:00.000' AS DateTime), CAST(N'2015-12-01T00:00:00.000' AS DateTime), N'Universidad Nacional')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (12, 176, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2017-12-01T00:00:00.000' AS DateTime), N'Instituto Tecnológico')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (13, 177, CAST(N'2005-01-01T00:00:00.000' AS DateTime), CAST(N'2007-12-01T00:00:00.000' AS DateTime), N'Universidad del Valle')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (14, 178, CAST(N'2008-01-01T00:00:00.000' AS DateTime), CAST(N'2009-12-01T00:00:00.000' AS DateTime), N'Universidad de Cali')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (15, 179, CAST(N'2010-01-01T00:00:00.000' AS DateTime), CAST(N'2011-12-01T00:00:00.000' AS DateTime), N'Instituto de Negocios')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (16, 180, CAST(N'2010-01-01T00:00:00.000' AS DateTime), CAST(N'2015-12-01T00:00:00.000' AS DateTime), N'Universidad del Norte')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (17, 181, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2017-12-01T00:00:00.000' AS DateTime), N'Universidad Nacional')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (18, 182, CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Instituto de Tecnología')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (19, 183, CAST(N'2003-01-01T00:00:00.000' AS DateTime), CAST(N'2008-12-01T00:00:00.000' AS DateTime), N'Universidad de Cartagena')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (20, 184, CAST(N'2009-01-01T00:00:00.000' AS DateTime), CAST(N'2011-12-01T00:00:00.000' AS DateTime), N'Universidad Nacional')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (21, 185, CAST(N'2012-01-01T00:00:00.000' AS DateTime), CAST(N'2013-12-01T00:00:00.000' AS DateTime), N'Instituto de Tecnología')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (22, 186, CAST(N'2010-01-01T00:00:00.000' AS DateTime), CAST(N'2015-12-01T00:00:00.000' AS DateTime), N'Universidad Industrial de Santander')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (23, 187, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2017-12-01T00:00:00.000' AS DateTime), N'Universidad Nacional')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (24, 188, CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Instituto de Tecnología')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (25, 189, CAST(N'2007-01-01T00:00:00.000' AS DateTime), CAST(N'2009-12-01T00:00:00.000' AS DateTime), N'Universidad Tecnológica de Pereira')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (26, 190, CAST(N'2002-01-01T00:00:00.000' AS DateTime), CAST(N'2007-12-01T00:00:00.000' AS DateTime), N'Universidad de Pereira')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (27, 191, CAST(N'2010-01-01T00:00:00.000' AS DateTime), CAST(N'2011-12-01T00:00:00.000' AS DateTime), N'Instituto de Tecnología')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (28, 192, CAST(N'2008-01-01T00:00:00.000' AS DateTime), CAST(N'2013-12-01T00:00:00.000' AS DateTime), N'Universidad de Caldas')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (29, 193, CAST(N'2014-01-01T00:00:00.000' AS DateTime), CAST(N'2015-12-01T00:00:00.000' AS DateTime), N'Universidad Nacional')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (30, 194, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2017-12-01T00:00:00.000' AS DateTime), N'Instituto de Tecnología')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (31, 195, CAST(N'2010-01-01T00:00:00.000' AS DateTime), CAST(N'2015-12-01T00:00:00.000' AS DateTime), N'Universidad del Magdalena')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (32, 196, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2017-12-01T00:00:00.000' AS DateTime), N'Universidad Nacional')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (33, 197, CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'Instituto de Tecnología')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (34, 198, CAST(N'2007-01-01T00:00:00.000' AS DateTime), CAST(N'2012-12-01T00:00:00.000' AS DateTime), N'Universidad Francisco de Paula Santander')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (35, 199, CAST(N'2013-01-01T00:00:00.000' AS DateTime), CAST(N'2014-12-01T00:00:00.000' AS DateTime), N'Universidad Nacional')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (36, 200, CAST(N'2015-01-01T00:00:00.000' AS DateTime), CAST(N'2016-12-01T00:00:00.000' AS DateTime), N'Instituto de Tecnología')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (37, 201, CAST(N'2006-01-01T00:00:00.000' AS DateTime), CAST(N'2011-12-01T00:00:00.000' AS DateTime), N'Universidad de Ibagué')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (38, 202, CAST(N'2012-01-01T00:00:00.000' AS DateTime), CAST(N'2013-12-01T00:00:00.000' AS DateTime), N'Universidad Nacional')
INSERT [dbo].[Education] ([IdEducation], [IdData], [InitDate], [FinalDate], [Institute]) VALUES (39, 203, CAST(N'2014-01-01T00:00:00.000' AS DateTime), CAST(N'2015-12-01T00:00:00.000' AS DateTime), N'Instituto de Tecnología')
SET IDENTITY_INSERT [dbo].[Education] OFF
GO
SET IDENTITY_INSERT [dbo].[Experience] ON 

INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (7, 138, CAST(N'2010-01-10T00:00:00.000' AS DateTime), CAST(N'2015-01-10T00:00:00.000' AS DateTime), N'ABC Company', N'Encargado de desarrollar y mantener sistemas informáticos para optimizar procesos internos.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (8, 139, CAST(N'2015-09-10T00:00:00.000' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime), N' XYZ Corporation', N'Lidere un equipo de desarrollo en la creación de aplicaciones móviles para mejorar la interacción con los clientes.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (9, 140, CAST(N'2020-11-08T00:00:00.000' AS DateTime), NULL, N'QRS Solutions', N'lidero las asesorías en tecnologías de la información para mejorar la eficiencia y seguridad de los sistemas empresariales.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (10, 141, CAST(N'2012-08-20T00:00:00.000' AS DateTime), CAST(N'2015-06-04T00:00:00.000' AS DateTime), N'ABC Software Solutions', N'Participe en el diseño e implementación de sistemas de gestión para empresas del sector financiero.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (11, 142, CAST(N'2015-06-25T00:00:00.000' AS DateTime), CAST(N'2020-09-06T00:00:00.000' AS DateTime), N'DEF Tech', N'Responsable de analizar y optimizar el rendimiento de los sistemas informáticos de la empresa')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (13, 144, CAST(N'2020-12-10T00:00:00.000' AS DateTime), CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'UVW Corporation', N'Supervisó el departamento de TI, asegurando la implementación exitosa de proyectos tecnológicos en la empresa.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (14, 145, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2020-09-12T00:00:00.000' AS DateTime), N'XYZ Consultores', N'Supervisó el departamento de TI, asegurando la implementación exitosa de proyectos tecnológicos en la empresa.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (15, 146, CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL, N'ABC Innovations', N'Responsable de la dirección estratégica de la tecnología de la empresa, liderando proyectos de innovación y transformación digital')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (16, 147, CAST(N'2012-01-02T00:00:00.000' AS DateTime), CAST(N'2017-09-12T00:00:00.000' AS DateTime), N'UVW Solutions', N'Dirigi la implementación de sistemas de gestión empresarial, mejorando la eficiencia operativa de las organizaciones.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (17, 148, CAST(N'2017-10-19T00:00:00.000' AS DateTime), CAST(N'2019-02-07T00:00:00.000' AS DateTime), N'XYZ Tech', N'Participe en el desarrollo de aplicaciones web para mejorar la experiencia del usuario.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (18, 149, CAST(N'2019-03-09T00:00:00.000' AS DateTime), NULL, N'ABC Consultores', N'Responsable de consultorías en tecnologías de la información para optimizar los procesos empresariales.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (19, 150, CAST(N'2006-05-20T00:00:00.000' AS DateTime), CAST(N'2010-12-09T00:00:00.000' AS DateTime), N'UVW Solutions', N'Desarrolle y mantuve los sistemas informáticos para empresas del sector financiero.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (20, 151, CAST(N'2011-02-04T00:00:00.000' AS DateTime), CAST(N'2020-09-18T00:00:00.000' AS DateTime), N'XYZ Consultores', N'Brinde asesoría en tecnologías de la información para mejorar la eficiencia operativa de las empresas')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (21, 152, CAST(N'2021-02-13T00:00:00.000' AS DateTime), CAST(N'2024-02-13T00:00:00.000' AS DateTime), N'ABC Company', N'Ejecución de proyectos tecnológicos, asegurando su entrega dentro del presupuesto y plazo establecidos.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (22, 153, CAST(N'2005-12-09T00:00:00.000' AS DateTime), CAST(N'2007-03-09T00:00:00.000' AS DateTime), N'UVW Web Solutions', N'Diseñó y desarrolló sitios web interactivos para clientes en diversos sectores')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (23, 154, CAST(N'2007-04-23T00:00:00.000' AS DateTime), CAST(N'2012-05-26T00:00:00.000' AS DateTime), N'BGV Analytics', N'Analizó grandes volúmenes de datos para proporcionar información útil para la toma de decisiones.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (24, 155, CAST(N'2013-01-19T00:00:00.000' AS DateTime), NULL, N' ABC Consultoría', N'Brindo consultoría en inteligencia de negocios para optimizar procesos empresariales y mejorar la toma de decisiones.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (25, 156, CAST(N'2010-01-10T00:00:00.000' AS DateTime), CAST(N'2015-08-15T00:00:00.000' AS DateTime), N'ABC Data Solutions', N'Administró bases de datos para garantizar la disponibilidad y seguridad de la información.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (26, 157, CAST(N'2015-09-10T00:00:00.000' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime), N'XYZ Consultores', N'Implementó soluciones de inteligencia de negocios para mejorar la eficiencia operativa de las empresas')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (27, 158, CAST(N'2020-11-08T00:00:00.000' AS DateTime), NULL, N'UVW Solutions', N'Descripción: Dirige la ejecución de proyectos tecnológicos, asegurando su entrega dentro del presupuesto y plazo establecidos')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (28, 159, CAST(N'2010-09-09T00:00:00.000' AS DateTime), CAST(N'2014-03-08T00:00:00.000' AS DateTime), N'ABC Web Solutions', N'Diseñó y desarrolló aplicaciones web para clientes en diversos sectores.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (29, 160, CAST(N'2015-07-09T00:00:00.000' AS DateTime), CAST(N'2017-03-08T00:00:00.000' AS DateTime), N'XYZ Consultorí', N'Brindó asesoría en tecnologías de la información para mejorar la eficiencia operativa de las empresas')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (30, 161, CAST(N'2017-04-08T00:00:00.000' AS DateTime), NULL, N'UVW Solutions', N'Dirige la ejecución de proyectos tecnológicos, asegurando su entrega dentro del presupuesto y plazo establecidos')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (31, 162, CAST(N'2020-12-09T00:00:00.000' AS DateTime), CAST(N'2024-05-21T00:00:00.000' AS DateTime), N'ABC Security Solutions ', N' medidas de seguridad informática para proteger los sistemas de la empresa.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (32, 163, CAST(N'2016-02-01T00:00:00.000' AS DateTime), CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'XYZ Consultores', N' asesoría en seguridad informática para empresas del sector financiero')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (33, 164, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2020-09-12T00:00:00.000' AS DateTime), N'ABC Security Solutions ', N'Responsable de la estrategia de seguridad informática de la empresa, garantizando la protección de la información')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (34, 165, CAST(N'2019-02-13T00:00:00.000' AS DateTime), CAST(N'2022-02-20T00:00:00.000' AS DateTime), N'XYZ Consultores', N' consultoría en tecnologías de la información para mejorar los procesos internos de las empresas.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (35, 166, CAST(N'2022-04-08T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime), N'ABC Software', N'Desarrolló software a medida para clientes en diversos sectores')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (36, 167, CAST(N'2024-01-01T00:00:00.000' AS DateTime), NULL, N'UVW Tech', N'Participó en el diseño y desarrollo de aplicaciones empresariales para clientes internacionales.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (37, 168, CAST(N'2005-12-09T00:00:00.000' AS DateTime), CAST(N'2007-03-09T00:00:00.000' AS DateTime), N'UVW Consultoría', N'consultoría en inteligencia de negocios para optimizar procesos empresariales y mejorar la toma de decisiones')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (38, 169, CAST(N'2007-04-23T00:00:00.000' AS DateTime), CAST(N'2012-05-26T00:00:00.000' AS DateTime), N'Software TYU', N'desarrollo de aplicaciones móviles para mejorar la experiencia del usuario.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (39, 170, CAST(N'2013-01-19T00:00:00.000' AS DateTime), NULL, N'Projects  OIU', N'desarrollo de software, asegurando su entrega dentro del presupuesto y plazo establecidos.')
INSERT [dbo].[Experience] ([IdExperience], [IdData], [InitDate], [FinalDate], [Company], [Description]) VALUES (41, 143, CAST(N'2020-12-09T00:00:00.000' AS DateTime), CAST(N'2024-05-21T00:00:00.000' AS DateTime), N' GHI Consultores', N'Coordina la implementación de sistemas de información en diversas organizaciones, asegurando su correcto funcionamiento')
SET IDENTITY_INSERT [dbo].[Experience] OFF
GO
SET IDENTITY_INSERT [dbo].[Offer] ON 

INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (21, 33, N'Analista de sistemas', N'Responsable del análisis de sistemas y mejora de procesos tecnológicos.', N'México', N'Tiempo completo', N'20000-30000 MXN', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (22, 33, N'Ingeniero de software', N'Encargado de desarrollar y mantener aplicaciones de software.', N'Argentina', N'Medio tiempo', N'2500-3500 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (23, 29, N'Consultor de TI', N'Brinda asesoramiento y soporte técnico a empresas.', N'Colombia', N'Contrato por proyecto', N'3000-4000 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (24, 29, N'Desarrolladora de software', N'Desarrolla y mantiene aplicaciones de software.', N'Chile', N'Prácticas', N'1500-2000 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (25, 30, N'Analista de sistemas', N'Responsable del análisis de sistemas y mejora de procesos tecnológicos.', N'Perú', N'Tiempo completo', N'3500-4500 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (26, 30, N'Coordinadora de proyectos', N'Coordina y gestiona proyectos tecnológicos.', N'España', N'Medio tiempo', N'4000-5000 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (27, 31, N'Gerente de TI', N'Supervisa las operaciones de TI de la empresa.', N'Uruguay', N'Contrato por proyecto', N'20000-30000 MXN', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (28, 31, N'Consultor de sistemas', N'Asesora y brinda soluciones en sistemas informáticos.', N'Paraguay', N'Prácticas', N'2500-3500 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (29, 32, N'Director de tecnología', N'Dirige y supervisa el área de tecnología de la empresa.', N'Bolivia', N'Tiempo completo', N'3000-4000 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (30, 32, N'Coordinadora de proyectos', N'Coordina y gestiona proyectos tecnológicos.', N'Ecuador', N'Medio tiempo', N'1500-2000 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (31, 33, N'Desarrolladora de software', N'Desarrolla y mantiene aplicaciones de software.', N'México', N'Contrato por proyecto', N'3500-4500 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (32, 33, N'Consultora de TI', N'Brinda asesoramiento y soporte técnico a empresas.', N'Argentina', N'Prácticas', N'4000-5000 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (33, 29, N'Analista de sistemas', N'Responsable del análisis de sistemas y mejora de procesos tecnológicos.', N'Colombia', N'Tiempo completo', N'20000-30000 MXN', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (34, 29, N'Consultor de TI', N'Brinda asesoramiento y soporte técnico a empresas.', N'Chile', N'Medio tiempo', N'2500-3500 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (35, 30, N'Gerente de proyectos', N'Gestiona proyectos tecnológicos para asegurar su éxito.', N'Perú', N'Contrato por proyecto', N'3000-4000 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (36, 30, N'Desarrolladora web', N'Desarrolla y mantiene aplicaciones web.', N'España', N'Prácticas', N'1500-2000 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (37, 31, N'Analista de datos', N'Analiza datos para proporcionar información valiosa.', N'Uruguay', N'Tiempo completo', N'3500-4500 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (38, 31, N'Consultora de BI', N'Brinda asesoramiento en inteligencia de negocios.', N'Paraguay', N'Medio tiempo', N'4000-5000 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (39, 32, N'Administrador de bases de datos', N'Administra y mantiene bases de datos.', N'Bolivia', N'Contrato por proyecto', N'20000-30000 MXN', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (40, 32, N'Consultor de BI', N'Brinda asesoramiento en inteligencia de negocios.', N'Ecuador', N'Prácticas', N'2500-3500 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (41, 33, N'Gerente de proyectos', N'Gestiona proyectos tecnológicos para asegurar su éxito.', N'México', N'Tiempo completo', N'3000-4000 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (42, 33, N'Desarrolladora web', N'Desarrolla y mantiene aplicaciones web.', N'Argentina', N'Medio tiempo', N'1500-2000 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (43, 29, N'Consultora de TI', N'Brinda asesoramiento y soporte técnico a empresas.', N'Colombia', N'Contrato por proyecto', N'3500-4500 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (44, 29, N'Gerente de proyectos', N'Gestiona proyectos tecnológicos para asegurar su éxito.', N'Chile', N'Prácticas', N'4000-5000 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (45, 30, N'Especialista en seguridad informática', N'Protege los sistemas informáticos de la empresa.', N'Perú', N'Tiempo completo', N'20000-30000 MXN', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (46, 30, N'Consultor de seguridad', N'Asesora en la seguridad de los sistemas informáticos.', N'España', N'Medio tiempo', N'2500-3500 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (47, 31, N'Director de seguridad', N'Dirige el área de seguridad informática de la empresa.', N'Uruguay', N'Contrato por proyecto', N'3000-4000 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (48, 31, N'Consultora de sistemas', N'Asesora y brinda soluciones en sistemas informáticos.', N'Paraguay', N'Prácticas', N'1500-2000 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (49, 32, N'Programador', N'Desarrolla y mantiene programas de software.', N'Bolivia', N'Tiempo completo', N'3500-4500 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (50, 32, N'Desarrollador de software', N'Desarrolla y mantiene aplicaciones de software.', N'Ecuador', N'Medio tiempo', N'4000-5000 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (51, 33, N'Consultor de BI', N'Brinda asesoramiento en inteligencia de negocios.', N'México', N'Contrato por proyecto', N'20000-30000 MXN', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (52, 33, N'Desarrollador de software', N'Desarrolla y mantiene aplicaciones de software.', N'Argentina', N'Prácticas', N'2500-3500 USD', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Offer] ([IdOffer], [IdUser], [Title], [Description], [Location], [TypeContract], [Salary], [ExpirationDate], [CreateDate], [ModifyDate]) VALUES (53, 29, N'Desarrollador web', N'Desarrolla y mantiene aplicaciones web.', N'Colombia', N'Tiempo completo', N'3000-4000 EUR', CAST(N'2024-06-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Offer] OFF
GO
SET IDENTITY_INSERT [dbo].[OfferSkills] ON 

INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (39, 21, 49)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (40, 21, 50)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (41, 21, 51)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (42, 21, 52)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (43, 21, 53)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (44, 21, 54)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (45, 21, 55)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (46, 21, 56)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (47, 21, 57)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (48, 22, 58)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (49, 22, 59)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (50, 22, 60)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (51, 22, 61)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (52, 22, 62)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (53, 23, 63)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (54, 23, 64)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (55, 23, 65)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (56, 23, 66)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (57, 23, 67)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (58, 23, 68)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (59, 24, 69)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (60, 24, 70)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (61, 24, 71)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (62, 24, 72)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (63, 24, 73)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (64, 26, 74)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (65, 26, 75)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (66, 26, 76)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (67, 26, 78)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (68, 26, 79)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (69, 27, 80)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (70, 27, 81)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (71, 27, 82)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (72, 27, 83)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (73, 27, 84)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (74, 28, 85)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (75, 28, 86)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (76, 28, 87)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (77, 28, 88)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (78, 28, 89)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (79, 29, 90)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (80, 29, 91)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (81, 29, 92)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (82, 29, 93)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (83, 29, 94)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (84, 36, 95)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (85, 36, 96)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (86, 36, 97)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (87, 36, 98)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (88, 36, 99)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (89, 36, 100)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (90, 36, 101)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (91, 36, 102)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (92, 36, 103)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (93, 36, 104)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (94, 36, 105)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (95, 36, 106)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (96, 36, 107)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (97, 37, 108)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (98, 37, 109)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (99, 37, 110)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (100, 37, 111)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (101, 37, 112)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (102, 37, 113)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (103, 37, 114)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (104, 38, 115)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (105, 38, 116)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (106, 38, 117)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (107, 38, 118)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (108, 38, 119)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (109, 39, 120)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (110, 39, 121)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (111, 39, 122)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (112, 39, 123)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (113, 39, 124)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (114, 39, 125)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (115, 39, 126)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (116, 39, 127)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (117, 45, 128)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (118, 45, 129)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (119, 45, 130)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (120, 45, 131)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (121, 45, 132)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (122, 46, 133)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (123, 46, 134)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (124, 46, 135)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (125, 46, 136)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (126, 46, 137)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (127, 47, 138)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (128, 47, 139)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (129, 47, 140)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (130, 47, 141)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (131, 47, 142)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (132, 49, 143)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (133, 49, 144)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (134, 49, 145)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (135, 49, 146)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (136, 49, 147)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (137, 50, 148)
GO
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (138, 50, 149)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (139, 50, 150)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (140, 50, 151)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (141, 50, 152)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (142, 50, 153)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (143, 50, 154)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (144, 25, 49)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (145, 25, 50)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (146, 25, 51)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (147, 25, 52)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (148, 25, 53)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (149, 25, 54)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (150, 25, 55)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (151, 25, 56)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (152, 25, 57)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (153, 30, 74)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (154, 30, 75)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (155, 30, 76)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (156, 30, 78)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (157, 30, 79)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (158, 31, 69)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (159, 31, 70)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (160, 31, 71)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (161, 31, 72)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (162, 31, 73)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (163, 32, 63)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (164, 32, 64)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (165, 32, 65)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (166, 32, 66)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (167, 32, 67)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (168, 32, 68)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (169, 33, 49)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (170, 33, 50)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (171, 33, 51)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (172, 33, 52)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (173, 33, 53)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (174, 33, 54)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (175, 33, 55)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (176, 33, 56)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (177, 33, 57)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (178, 34, 63)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (179, 34, 64)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (180, 34, 65)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (181, 34, 66)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (182, 34, 67)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (183, 34, 68)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (184, 35, 80)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (185, 35, 81)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (186, 35, 82)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (187, 35, 83)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (188, 35, 84)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (189, 40, 115)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (190, 40, 116)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (191, 40, 117)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (192, 40, 118)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (193, 40, 119)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (194, 41, 80)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (195, 41, 81)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (196, 41, 82)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (197, 41, 83)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (198, 41, 84)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (199, 42, 148)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (200, 42, 149)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (201, 42, 150)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (202, 42, 151)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (203, 42, 152)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (204, 42, 153)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (205, 42, 154)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (206, 43, 63)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (207, 43, 64)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (208, 43, 65)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (209, 43, 66)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (210, 43, 67)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (211, 43, 68)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (212, 44, 80)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (213, 44, 81)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (214, 44, 82)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (215, 44, 83)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (216, 44, 84)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (217, 48, 63)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (218, 48, 64)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (219, 48, 65)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (220, 48, 66)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (221, 48, 67)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (222, 48, 68)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (223, 51, 115)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (224, 51, 116)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (225, 51, 117)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (226, 51, 118)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (227, 51, 119)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (228, 52, 69)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (229, 52, 70)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (230, 52, 71)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (231, 52, 72)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (232, 52, 73)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (233, 53, 148)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (234, 53, 149)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (235, 53, 150)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (236, 53, 151)
INSERT [dbo].[OfferSkills] ([IdOfferSkills], [IdOffer], [IdSkills]) VALUES (237, 53, 152)
GO
SET IDENTITY_INSERT [dbo].[OfferSkills] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (1, N'Java')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (2, N'.Net')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (3, N'Angular')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (4, N'HTML')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (49, N'Análisis y diseño de sistemas')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (50, N'Conocimientos de bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (51, N'Habilidades de resolución de problemas')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (52, N'Conocimientos en programación')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (53, N'Gestión de proyectos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (54, N'Programación en varios lenguajes')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (55, N'Java')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (56, N'C++')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (57, N'Python')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (58, N'Desarrollo de software')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (59, N'Pruebas de software')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (60, N'Gestión de versiones y control de código')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (61, N'Conocimientos de algoritmos y estructuras de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (62, N'Análisis de necesidades de negocio')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (63, N'Gestión de proyectos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (64, N'Conocimientos en infraestructura de TI')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (65, N'Habilidades de comunicación y presentación')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (66, N'Soporte técnico y solución de problemas')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (67, N'Programación en varios lenguajes')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (68, N'JavaScript')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (69, N'Desarrollo front-end y/o back-end')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (70, N'Conocimientos en frameworks y librerías')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (71, N'Pruebas y depuración de código')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (72, N'Conocimientos en bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (73, N'Gestión de proyectos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (74, N'Planificación y organización')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (75, N'Comunicación efectiva')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (76, N'Resolución de conflictos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (78, N'Trello, Jira')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (79, N'Gestión de equipos de TI')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (80, N'Planificación estratégica de TI')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (81, N'Presupuestación y control de costos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (82, N'Conocimientos en seguridad informática')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (83, N'Habilidades de liderazgo')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (84, N'Análisis de sistemas')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (85, N'Reingeniería de procesos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (86, N'Implementación de sistemas ERP')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (87, N'Conocimientos en bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (88, N'Habilidades de presentación y comunicación')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (89, N'Planificación estratégica de tecnología')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (90, N'Gestión de equipos de TI')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (91, N'Innovación tecnológica')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (92, N'Conocimientos en arquitectura de TI')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (93, N'Habilidades de liderazgo y toma de decisiones')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (94, N'Desarrollo front-end')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (95, N'HTML')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (96, N'CSS')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (97, N'Conocimientos en frameworks y librerías')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (98, N'React')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (99, N'Angular')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (100, N'Vue.js')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (101, N'Desarrollo back-end')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (102, N'Node.js')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (103, N'PHP')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (104, N'Ruby on Rails')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (105, N'Diseño responsive y accesibilidad')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (106, N'Conocimientos en bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (107, N'Análisis y visualización de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (108, N'Conocimientos en herramientas de BI')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (109, N'Power BI')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (110, N'Tableau')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (111, N'SQL y bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (112, N'Estadística y matemáticas')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (113, N'Programación en Python o R')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (114, N'Análisis de datos y business intelligence')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (115, N'Conocimientos en herramientas de BI')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (116, N'SQL y bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (117, N'Habilidades de presentación y comunicación')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (118, N'Conocimientos en modelos de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (119, N'Administración de bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (120, N'Oracle')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (121, N'SQL Server')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (122, N'MySQL')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (123, N'Optimización de bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (124, N'Seguridad de bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (125, N'Respaldo y recuperación de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (126, N'Conocimientos en SQL')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (127, N'Ciberseguridad y protección de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (128, N'Evaluación de vulnerabilidades')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (129, N'Implementación de políticas de seguridad')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (130, N'Monitoreo y respuesta a incidentes')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (131, N'Conocimientos en criptografía')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (132, N'Análisis de riesgos y seguridad')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (133, N'Implementación de soluciones de seguridad')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (134, N'Conocimientos en ciberseguridad')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (135, N'Auditorías de seguridad')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (136, N'Habilidades de presentación y comunicación')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (137, N'Planificación estratégica de seguridad')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (138, N'Gestión de equipos de seguridad')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (139, N'Conocimientos en ciberseguridad')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (140, N'Evaluación de riesgos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (141, N'Habilidades de liderazgo')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (142, N'Programación en varios lenguajes')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (143, N'Conocimientos en algoritmos y estructuras de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (144, N'Pruebas y depuración de código')
GO
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (145, N'Desarrollo de software')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (146, N'Conocimientos en bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (147, N'Desarrollo front-end')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (148, N'Conocimientos en frameworks y librerías')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (149, N'Desarrollo back-end')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (150, N'Node.js')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (151, N'PHP')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (152, N'.Net')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (153, N'Diseño responsive y accesibilidad')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (154, N'Conocimientos en bases de datos')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (155, N'C#')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (156, N'TypeScript')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (157, N'Swift')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (158, N'Kotlin')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (159, N'Go (Golang)')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (160, N'Rust')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (161, N'R')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (162, N'SQL')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (163, N'MATLAB')
INSERT [dbo].[Skills] ([IdSkills], [Skill]) VALUES (164, N'Shell Scripting (Bash, PowerShell)')
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeData] ON 

INSERT [dbo].[TypeData] ([IdTypeData], [Type]) VALUES (1, N'Nombre')
INSERT [dbo].[TypeData] ([IdTypeData], [Type]) VALUES (2, N'Fecha Nacimiento')
INSERT [dbo].[TypeData] ([IdTypeData], [Type]) VALUES (3, N'Ubicacion')
INSERT [dbo].[TypeData] ([IdTypeData], [Type]) VALUES (4, N'Experiencia')
INSERT [dbo].[TypeData] ([IdTypeData], [Type]) VALUES (5, N'Educacion')
INSERT [dbo].[TypeData] ([IdTypeData], [Type]) VALUES (6, N'Telefono')
SET IDENTITY_INSERT [dbo].[TypeData] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeUser] ON 

INSERT [dbo].[TypeUser] ([IdTypeUser], [Type]) VALUES (1, N'Empresa')
INSERT [dbo].[TypeUser] ([IdTypeUser], [Type]) VALUES (2, N'Candidato')
SET IDENTITY_INSERT [dbo].[TypeUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (17, 1, N'tamales@comertamal.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-28T14:43:23.790' AS DateTime), CAST(N'2024-05-28T14:43:23.790' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (18, 2, N'juan.perez@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (19, 2, N'ana.gomez@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (20, 2, N'carlos.lopez@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (21, 2, N'maria.rodriguez@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (22, 2, N'jose.martinez@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (23, 2, N'laura.fernandez@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (24, 2, N'miguel.torres@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (25, 2, N'lucia.sanchez@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (26, 2, N'david.ramirez@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (27, 2, N'elena.castillo@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (28, 2, N'pablo.morales@example.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (29, 1, N'contacto@deftech.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (30, 1, N'contacto@ghiconsultores.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (31, 1, N'contacto@uvwcorporation.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (32, 1, N'contacto@xyzconsultores.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[Users] ([IdUser], [IdTypeUser], [Email], [Password], [CreateDate], [ModifyDate]) VALUES (33, 1, N'contacto@abc.com', N'$2a$11$CMOzEtb5jKlj6z7RE8iUVuwh5XVtdJk1ZeBWbT5epsmJ6s7kclgne', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersData] ON 

INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (94, 1, 18, N'Juan Pérez', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (95, 2, 18, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (96, 3, 18, N'Bogotá, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (97, 6, 18, N'555-1234', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (98, 1, 19, N'Ana Gómez', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (99, 2, 19, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (100, 3, 19, N'Medellín, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (101, 6, 19, N'555-5678', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (102, 1, 20, N'Carlos López', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (103, 2, 20, N'42', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (104, 3, 20, N'Cali, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (105, 6, 20, N'555-9012', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (106, 1, 21, N'María Rodríguez', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (107, 2, 21, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (108, 3, 21, N'Barranquilla, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (109, 6, 21, N'555-3456', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (110, 1, 22, N'José Martínez', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (111, 2, 22, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (112, 3, 22, N'Cartagena, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (113, 6, 22, N'555-7890', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (114, 1, 23, N'Laura Fernández', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (115, 2, 23, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (116, 3, 23, N'Bucaramanga, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (117, 6, 23, N'555-1111', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (118, 1, 24, N'Miguel Torres', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (119, 2, 24, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (120, 3, 24, N'Pereira, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (121, 6, 24, N'555-2222', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (122, 1, 25, N'Lucía Sánchez', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (123, 2, 25, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (124, 3, 25, N'Manizales, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (125, 6, 25, N'555-3333', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (126, 1, 26, N'David Ramírez', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (127, 2, 26, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (128, 3, 26, N'Santa Marta, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (129, 6, 26, N'555-4444', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (130, 1, 27, N'Elena Castillo', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (131, 2, 27, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (132, 3, 27, N'Cúcuta, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (133, 6, 27, N'555-5555', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (134, 1, 28, N'Pablo Morales', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (135, 2, 28, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (136, 3, 28, N'Ibagué, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (137, 6, 28, N'555-6666', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (138, 4, 18, N'Analista de sistemas ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (139, 4, 18, N'Ingeniero de software', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (140, 4, 18, N'Consultor de TI ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (141, 4, 19, N'Desarrolladora de software', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (142, 4, 19, N'Analista de sistemas ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (143, 4, 19, N'Coordinadora de proyectos ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (144, 4, 19, N'Gerente de TI', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (145, 4, 20, N'Consultor de sistemas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (146, 4, 20, N'Director de tecnología', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (147, 4, 20, N'Coordinadora de proyectos ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (148, 4, 20, N'Desarrolladora de software', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (149, 4, 21, N'Consultora de TI', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (150, 4, 21, N'Analista de sistemas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (151, 4, 21, N'Consultor de TI ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (152, 4, 21, N'Gerente de proyectos', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (153, 4, 22, N'Desarrolladora web', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (154, 4, 22, N'Analista de datos ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (155, 4, 22, N'Consultora de BI', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (156, 4, 22, N'Administrador de bases de datos ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (157, 4, 23, N'Consultor de BI', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (158, 4, 23, N'Gerente de proyectos', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (159, 4, 23, N'Desarrolladora web', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (160, 4, 23, N'Consultora de TI', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (161, 4, 24, N'Gerente de proyectos', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (162, 4, 24, N'Especialista en seguridad informática', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (163, 4, 24, N'Consultor de seguridad', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (164, 4, 24, N'Director de seguridad', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (165, 4, 25, N'Consultora de sistemas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (166, 4, 25, N'Programador', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (167, 4, 25, N'Desarrollador de software', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (168, 4, 25, N'Consultor de BI', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (169, 4, 26, N'Desarrollador de software', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (170, 4, 26, N'Desarrollador web ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (171, 5, 18, N'Ingeniería en Sistemas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (172, 5, 18, N'Maestría en Administración de Empresas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (173, 5, 18, N'Diplomado en Gestión de Proyectos', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (174, 5, 19, N'Licenciatura en Informática', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (175, 5, 19, N'Maestría en Desarrollo de Software', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (176, 5, 19, N'Curso de Programación Avanzada', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (177, 5, 19, N'Maestría en Administración de Empresas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (178, 5, 20, N'Diplomado en Gerencia de Proyectos', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (179, 5, 20, N'Curso de Liderazgo Empresarial', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (180, 5, 20, N'Ingeniería de Sistemas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (181, 5, 20, N'Especialización en Gestión de Proyectos', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (182, 5, 21, N'Curso de Administración de Bases de Datos', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (183, 5, 21, N'Ingeniería Informática', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (184, 5, 21, N'Maestría en Sistemas de Información', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (185, 5, 21, N'Curso de Seguridad Informática', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (186, 5, 22, N'Ingeniería en Computación', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (187, 5, 22, N'Especialización en Big Data', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (188, 5, 22, N'Curso de Desarrollo Web Avanzado', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (189, 5, 22, N'Maestría en Ciencias de la Computación', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (190, 5, 23, N'Ingeniería en Sistemas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (191, 5, 23, N'Curso de Administración de Proyectos', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (192, 5, 23, N'Ingeniería de Sistemas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
GO
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (193, 5, 23, N'Especialización en Seguridad Informática', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (194, 5, 24, N'Curso de Desarrollo de Aplicaciones Móviles', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (195, 5, 24, N'Ingeniería en Informática', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (196, 5, 24, N'Especialización en Seguridad de la Información', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (197, 5, 24, N'Curso de Auditoría de Sistemas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (198, 5, 25, N'Ingeniería en Telecomunicaciones', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (199, 5, 25, N'Especialización en Redes de Computadores', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (200, 5, 25, N'Curso de Administración de Redes', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (201, 5, 25, N'Ingeniería en Sistemas', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (202, 5, 26, N'Especialización en Gerencia de Proyectos', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (203, 5, 26, N'Curso de Desarrollo de Software Empresarial', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (204, 1, 33, N'ABC Software Solutions', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (205, 6, 33, N'555-7897', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (206, 3, 33, N'Ibagué, Colombia', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (207, 2, 33, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (208, 1, 29, N'DEF Tech', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (209, 6, 29, N'567-8975', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (210, 3, 29, N'Cartagena, Colombia ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (211, 2, 29, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (212, 1, 30, N' GHI Consultores', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (213, 6, 30, N'624-7899', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (214, 3, 30, N'Pereira, Colombia ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (215, 2, 30, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (216, 1, 31, N'UVW Corporation', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (217, 6, 31, N'876-2354', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (218, 3, 31, N'Bogotá, Colombia ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (219, 2, 31, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (220, 1, 32, N'XYZ Consultores', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (221, 6, 32, N'465-7898', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (222, 3, 32, N'Ipiales, Colombia ', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
INSERT [dbo].[UsersData] ([IdData], [IdTypeData], [IdUser], [Value], [CreateDate], [ModifyDate]) VALUES (223, 2, 32, N'1990-08-20', CAST(N'2024-05-26T14:43:24.000' AS DateTime), CAST(N'2024-05-26T14:43:24.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsersData] OFF
GO
SET IDENTITY_INSERT [dbo].[UserSkills] ON 

INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (60, 18, 49)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (61, 18, 50)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (62, 18, 51)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (63, 18, 52)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (64, 18, 53)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (65, 18, 54)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (66, 18, 55)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (67, 18, 56)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (68, 18, 57)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (69, 18, 58)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (70, 18, 59)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (71, 18, 60)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (72, 18, 61)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (73, 18, 62)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (74, 18, 63)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (75, 18, 64)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (76, 18, 65)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (77, 18, 66)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (78, 18, 67)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (79, 18, 68)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (80, 19, 69)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (81, 19, 70)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (82, 19, 71)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (83, 19, 72)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (84, 19, 73)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (85, 19, 74)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (86, 19, 75)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (87, 19, 76)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (88, 19, 78)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (89, 19, 79)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (90, 19, 80)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (91, 19, 81)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (92, 19, 82)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (93, 19, 83)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (94, 19, 84)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (95, 20, 85)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (96, 20, 86)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (97, 20, 87)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (98, 20, 88)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (99, 20, 89)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (100, 20, 90)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (101, 20, 91)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (102, 20, 92)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (103, 20, 93)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (104, 20, 94)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (105, 20, 95)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (106, 20, 96)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (107, 20, 97)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (108, 20, 98)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (109, 20, 99)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (110, 20, 100)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (111, 20, 101)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (112, 20, 102)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (113, 20, 103)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (114, 20, 104)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (115, 20, 105)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (116, 20, 106)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (117, 20, 107)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (118, 22, 108)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (119, 22, 109)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (120, 22, 110)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (121, 22, 111)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (122, 22, 112)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (123, 22, 113)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (124, 22, 114)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (125, 22, 115)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (126, 22, 116)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (127, 22, 117)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (128, 22, 118)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (129, 22, 119)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (130, 22, 120)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (131, 22, 121)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (132, 22, 122)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (133, 22, 123)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (134, 22, 124)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (135, 22, 125)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (136, 22, 126)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (137, 22, 127)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (138, 24, 128)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (139, 24, 129)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (140, 24, 130)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (141, 24, 131)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (142, 24, 132)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (143, 24, 133)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (144, 24, 134)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (145, 24, 135)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (146, 24, 136)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (147, 24, 137)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (148, 24, 138)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (149, 24, 139)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (150, 24, 140)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (151, 24, 141)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (152, 24, 142)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (153, 25, 143)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (154, 25, 144)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (155, 25, 145)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (156, 25, 146)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (157, 25, 147)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (158, 25, 148)
GO
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (159, 25, 149)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (160, 25, 150)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (161, 25, 151)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (162, 25, 152)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (163, 25, 153)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (164, 25, 154)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (165, 19, 49)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (166, 19, 50)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (167, 19, 51)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (168, 19, 52)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (169, 19, 53)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (170, 19, 54)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (171, 19, 55)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (172, 19, 56)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (173, 19, 57)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (174, 20, 74)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (175, 20, 75)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (176, 20, 76)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (177, 20, 78)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (178, 20, 79)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (179, 21, 63)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (180, 21, 64)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (181, 21, 65)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (182, 21, 66)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (183, 21, 67)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (184, 21, 49)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (185, 21, 50)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (186, 21, 51)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (187, 21, 52)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (188, 21, 53)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (189, 21, 54)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (190, 21, 55)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (191, 21, 56)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (192, 21, 57)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (193, 21, 80)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (194, 21, 81)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (195, 21, 82)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (196, 21, 83)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (197, 21, 84)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (198, 22, 95)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (199, 22, 96)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (200, 22, 97)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (201, 22, 98)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (202, 22, 99)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (203, 22, 100)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (204, 22, 101)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (205, 22, 102)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (206, 22, 103)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (207, 22, 104)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (208, 22, 105)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (209, 22, 106)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (210, 22, 107)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (211, 23, 115)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (212, 23, 116)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (213, 23, 117)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (214, 23, 118)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (215, 23, 119)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (216, 23, 95)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (217, 23, 96)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (218, 23, 97)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (219, 23, 98)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (220, 23, 99)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (221, 23, 100)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (222, 23, 101)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (223, 23, 102)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (224, 23, 103)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (225, 23, 104)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (226, 23, 105)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (227, 23, 106)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (228, 23, 107)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (229, 23, 63)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (230, 23, 64)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (231, 23, 65)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (232, 23, 66)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (233, 23, 67)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (234, 23, 68)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (235, 24, 63)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (236, 24, 64)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (237, 24, 65)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (238, 24, 66)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (239, 24, 67)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (240, 24, 68)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (241, 25, 85)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (242, 25, 86)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (243, 25, 87)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (244, 25, 88)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (245, 25, 89)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (246, 25, 115)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (247, 25, 116)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (248, 25, 117)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (249, 25, 118)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (250, 25, 119)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (251, 26, 148)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (252, 26, 149)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (253, 26, 150)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (254, 26, 151)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (255, 26, 152)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (256, 26, 153)
INSERT [dbo].[UserSkills] ([IdUserSkills], [IdUser], [IdSkills]) VALUES (257, 26, 154)
SET IDENTITY_INSERT [dbo].[UserSkills] OFF
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_Offer] FOREIGN KEY([IdOffer])
REFERENCES [dbo].[Offer] ([IdOffer])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_Offer]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_Users]
GO
ALTER TABLE [dbo].[Education]  WITH CHECK ADD  CONSTRAINT [FK_Education_UsersData] FOREIGN KEY([IdData])
REFERENCES [dbo].[UsersData] ([IdData])
GO
ALTER TABLE [dbo].[Education] CHECK CONSTRAINT [FK_Education_UsersData]
GO
ALTER TABLE [dbo].[Experience]  WITH CHECK ADD  CONSTRAINT [FK_Experience_UsersData] FOREIGN KEY([IdData])
REFERENCES [dbo].[UsersData] ([IdData])
GO
ALTER TABLE [dbo].[Experience] CHECK CONSTRAINT [FK_Experience_UsersData]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Users]
GO
ALTER TABLE [dbo].[OfferSkills]  WITH CHECK ADD  CONSTRAINT [FK_OfferSkills_Offer] FOREIGN KEY([IdOffer])
REFERENCES [dbo].[Offer] ([IdOffer])
GO
ALTER TABLE [dbo].[OfferSkills] CHECK CONSTRAINT [FK_OfferSkills_Offer]
GO
ALTER TABLE [dbo].[OfferSkills]  WITH CHECK ADD  CONSTRAINT [FK_OfferSkills_Skills] FOREIGN KEY([IdSkills])
REFERENCES [dbo].[Skills] ([IdSkills])
GO
ALTER TABLE [dbo].[OfferSkills] CHECK CONSTRAINT [FK_OfferSkills_Skills]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_TypeUser] FOREIGN KEY([IdTypeUser])
REFERENCES [dbo].[TypeUser] ([IdTypeUser])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_TypeUser]
GO
ALTER TABLE [dbo].[UsersData]  WITH CHECK ADD  CONSTRAINT [FK_UsersData_TypeData] FOREIGN KEY([IdTypeData])
REFERENCES [dbo].[TypeData] ([IdTypeData])
GO
ALTER TABLE [dbo].[UsersData] CHECK CONSTRAINT [FK_UsersData_TypeData]
GO
ALTER TABLE [dbo].[UsersData]  WITH CHECK ADD  CONSTRAINT [FK_UsersData_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[UsersData] CHECK CONSTRAINT [FK_UsersData_Users]
GO
ALTER TABLE [dbo].[UserSkills]  WITH CHECK ADD  CONSTRAINT [FK_UserSkills_Skills] FOREIGN KEY([IdSkills])
REFERENCES [dbo].[Skills] ([IdSkills])
GO
ALTER TABLE [dbo].[UserSkills] CHECK CONSTRAINT [FK_UserSkills_Skills]
GO
ALTER TABLE [dbo].[UserSkills]  WITH CHECK ADD  CONSTRAINT [FK_UserSkills_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[UserSkills] CHECK CONSTRAINT [FK_UserSkills_Users]
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarCandidato]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscarCandidato]
    @Keyword NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

	SELECT d.*, t.Type
    FROM UsersData d
    INNER JOIN ( 
	    SELECT DISTINCT IdUser 
        FROM UsersData u
        WHERE (IdTypeData = 4 OR IdTypeData = 5) AND u.Value COLLATE Latin1_General_100_CI_AI LIKE '%' + @Keyword + '%' COLLATE Latin1_General_100_CI_AI
		UNION
	    SELECT o.IdUser
        FROM UserSkills o
        INNER JOIN Skills s ON o.IdSkills = s.IdSkills
        WHERE s.Skill COLLATE Latin1_General_100_CI_AI LIKE '%' + @Keyword + '%' COLLATE Latin1_General_100_CI_AI
    ) o ON d.IdUser = o.IdUser
	INNER JOIN TypeData t ON d.IdTypeData = t.IdTypeData
	WHERE d.IdTypeData != 4 AND d.IdTypeData != 5;
END




GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarOfertaPorClave]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscarOfertaPorClave]
    @Clave NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT c.*
    FROM CompanyOffers c
    INNER JOIN ( 
        SELECT IdOffer 
        FROM Offer
        WHERE Title COLLATE Latin1_General_100_CI_AI LIKE '%' + @Clave + '%' COLLATE Latin1_General_100_CI_AI
        OR Description COLLATE Latin1_General_100_CI_AI LIKE '%' + @Clave + '%' COLLATE Latin1_General_100_CI_AI
        UNION
        SELECT o.IdOffer
        FROM OfferSkills o
        INNER JOIN Skills s ON o.IdSkills = s.IdSkills
        WHERE s.Skill COLLATE Latin1_General_100_CI_AI LIKE '%' + @Clave + '%' COLLATE Latin1_General_100_CI_AI
    ) o ON c.IdOffer = o.IdOffer;
END




GO
/****** Object:  StoredProcedure [dbo].[SP_CandidatosPorOferta]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CandidatosPorOferta]
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

SELECT d.*, t.Type
    FROM UsersData d
    INNER JOIN ( 
		SELECT u.IdUser, COUNT(*) AS CandidateCount
		FROM OfferSkills os
		INNER JOIN Offer o ON o.IdOffer = os.IdOffer
		INNER JOIN UserSkills u ON os.IdSkills = u.IdSkills
		WHERE o.IdUser = @UserId
		GROUP BY u.IdUser
    ) o ON d.IdUser = o.IdUser
	INNER JOIN TypeData t ON d.IdTypeData = t.IdTypeData 
	WHERE d.IdTypeData != 4 AND d.IdTypeData != 5
	ORDER BY d.IdUser, CandidateCount DESC
END	


GO
/****** Object:  StoredProcedure [dbo].[SP_OfertasPorUsuario]    Script Date: 28/05/2024 05:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OfertasPorUsuario]
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

	SELECT c.*
	FROM CompanyOffers c
	INNER JOIN ( 
		SELECT IdOffer, COUNT(*) AS OfferCount
		FROM OfferSkills o
		INNER JOIN UserSkills u ON o.IdSkills = u.IdSkills
		WHERE u.IdUser = @UserId
		GROUP BY IdOffer
	) o ON c.IdOffer = o.IdOffer
	ORDER BY o.OfferCount DESC


END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 491
               Bottom = 136
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ud"
            Begin Extent = 
               Top = 2
               Left = 283
               Bottom = 132
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1710
         Table = 1170
         Output = 2790
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CompanyOffers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CompanyOffers'
GO
USE [master]
GO
ALTER DATABASE [DbEmpleando] SET  READ_WRITE 
GO
