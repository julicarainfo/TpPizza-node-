USE [master]
GO
/****** Object:  Database [DBpizza]    Script Date: 5/5/2023 08:08:27 ******/
CREATE DATABASE [DBpizza]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBpizza', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBpizza.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBpizza_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBpizza_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBpizza] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBpizza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBpizza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBpizza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBpizza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBpizza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBpizza] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBpizza] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBpizza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBpizza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBpizza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBpizza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBpizza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBpizza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBpizza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBpizza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBpizza] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBpizza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBpizza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBpizza] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBpizza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBpizza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBpizza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBpizza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBpizza] SET RECOVERY FULL 
GO
ALTER DATABASE [DBpizza] SET  MULTI_USER 
GO
ALTER DATABASE [DBpizza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBpizza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBpizza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBpizza] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBpizza] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBpizza', N'ON'
GO
ALTER DATABASE [DBpizza] SET QUERY_STORE = OFF
GO
USE [DBpizza]
GO
/****** Object:  User [alumno]    Script Date: 5/5/2023 08:08:27 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Pizza]    Script Date: 5/5/2023 08:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizza](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[LibreGluten] [bit] NULL,
	[Importe] [int] NULL,
	[Descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [DBpizza] SET  READ_WRITE 
GO
