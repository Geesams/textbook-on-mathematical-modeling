USE [master]
GO
/****** Object:  Database [usersDB]    Script Date: 16.06.2020 9:11:03 ******/
CREATE DATABASE [usersDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'usersDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\usersDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'usersDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\usersDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [usersDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [usersDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [usersDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [usersDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [usersDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [usersDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [usersDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [usersDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [usersDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [usersDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [usersDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [usersDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [usersDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [usersDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [usersDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [usersDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [usersDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [usersDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [usersDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [usersDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [usersDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [usersDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [usersDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [usersDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [usersDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [usersDB] SET  MULTI_USER 
GO
ALTER DATABASE [usersDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [usersDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [usersDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [usersDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [usersDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [usersDB]
GO
/****** Object:  User [illumate]    Script Date: 16.06.2020 9:11:03 ******/
CREATE USER [illumate] FOR LOGIN [illumate] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 16.06.2020 9:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[idRole] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[testing]    Script Date: 16.06.2020 9:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[testing](
	[idTesting] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[nameOfTest] [varchar](200) NOT NULL,
	[scoreOfTest] [smallint] NOT NULL,
	[dateOfTest] [date] NOT NULL,
 CONSTRAINT [PK_testing] PRIMARY KEY CLUSTERED 
(
	[idTesting] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 16.06.2020 9:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[surname] [varchar](200) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[middlename] [varchar](100) NULL,
	[email] [varchar](200) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[idRole] [int] NOT NULL,
	[phone] [varchar](20) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([idRole], [name]) VALUES (1, N'Оператор')
INSERT [dbo].[roles] ([idRole], [name]) VALUES (2, N'Пользователь')
SET IDENTITY_INSERT [dbo].[roles] OFF
SET IDENTITY_INSERT [dbo].[testing] ON 

INSERT [dbo].[testing] ([idTesting], [idUser], [nameOfTest], [scoreOfTest], [dateOfTest]) VALUES (26, 1, N'Введение в моделирование', 2, CAST(N'2020-05-31' AS Date))
INSERT [dbo].[testing] ([idTesting], [idUser], [nameOfTest], [scoreOfTest], [dateOfTest]) VALUES (1026, 1, N'Введение в моделирование', 4, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[testing] ([idTesting], [idUser], [nameOfTest], [scoreOfTest], [dateOfTest]) VALUES (1027, 1, N'Вычислительный эксперимент', 3, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[testing] ([idTesting], [idUser], [nameOfTest], [scoreOfTest], [dateOfTest]) VALUES (1028, 1, N'Классификация моделей', 2, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[testing] ([idTesting], [idUser], [nameOfTest], [scoreOfTest], [dateOfTest]) VALUES (1029, 1, N'Вычислительный эксперимент', 4, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[testing] ([idTesting], [idUser], [nameOfTest], [scoreOfTest], [dateOfTest]) VALUES (1030, 1, N'Введение в моделирование', 2, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[testing] ([idTesting], [idUser], [nameOfTest], [scoreOfTest], [dateOfTest]) VALUES (1031, 1, N'Основные понятия и принципы математического моделирования', 2, CAST(N'2020-06-16' AS Date))
SET IDENTITY_INSERT [dbo].[testing] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([idUser], [surname], [name], [middlename], [email], [password], [idRole], [phone]) VALUES (1, N'Канаев', N'Григорий', N'Олегович', N'pro-anton@bk.ru', N'pswrd1AscA.A', 1, N'+7 (   )    -')
INSERT [dbo].[users] ([idUser], [surname], [name], [middlename], [email], [password], [idRole], [phone]) VALUES (3, N'Рябой', N'Евгений', N'Эдуардович', N'evged@yandex.ru', N'Pasdas12.A', 2, N'+7 (   )    -')
INSERT [dbo].[users] ([idUser], [surname], [name], [middlename], [email], [password], [idRole], [phone]) VALUES (1003, N'Репняков', N'Лев', N'', N'rep@yandex.ru', N'Privet1.', 2, N'+7 (   )    -')
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[testing]  WITH CHECK ADD  CONSTRAINT [FK_testing_users] FOREIGN KEY([idUser])
REFERENCES [dbo].[users] ([idUser])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[testing] CHECK CONSTRAINT [FK_testing_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([idRole])
REFERENCES [dbo].[roles] ([idRole])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
USE [master]
GO
ALTER DATABASE [usersDB] SET  READ_WRITE 
GO
