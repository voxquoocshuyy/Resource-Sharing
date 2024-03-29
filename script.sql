USE [master]
GO
/****** Object:  Database [LabWeb1]    Script Date: 26/05/2021 2:45:41 CH ******/
CREATE DATABASE [LabWeb1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LabWeb1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LabWeb1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LabWeb1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LabWeb1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LabWeb1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LabWeb1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LabWeb1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LabWeb1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LabWeb1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LabWeb1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LabWeb1] SET ARITHABORT OFF 
GO
ALTER DATABASE [LabWeb1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LabWeb1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LabWeb1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LabWeb1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LabWeb1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LabWeb1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LabWeb1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LabWeb1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LabWeb1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LabWeb1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LabWeb1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LabWeb1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LabWeb1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LabWeb1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LabWeb1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LabWeb1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LabWeb1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LabWeb1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LabWeb1] SET  MULTI_USER 
GO
ALTER DATABASE [LabWeb1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LabWeb1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LabWeb1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LabWeb1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LabWeb1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LabWeb1]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 26/05/2021 2:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRequest]    Script Date: 26/05/2021 2:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRequest](
	[requestID] [int] IDENTITY(1,1) NOT NULL,
	[dateBook] [datetime] NOT NULL CONSTRAINT [DF_tblRequest_dateBook]  DEFAULT (getdate()),
	[statusreqName] [varchar](10) NOT NULL CONSTRAINT [DF_tblRequest_statusreqName]  DEFAULT ('New'),
	[userID] [varchar](10) NOT NULL,
	[resourceID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblRequest] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblResource]    Script Date: 26/05/2021 2:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblResource](
	[resourceID] [varchar](10) NOT NULL,
	[categoryID] [varchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[dateBook] [date] NULL,
 CONSTRAINT [PK_tblResource] PRIMARY KEY CLUSTERED 
(
	[resourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 26/05/2021 2:45:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](10) NOT NULL,
	[roleID] [int] NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[createDate] [datetime] NOT NULL CONSTRAINT [DF_tblUsers_createDate]  DEFAULT (getdate()),
	[status] [varchar](50) NOT NULL CONSTRAINT [DF_tblUsers_status]  DEFAULT ('New'),
	[roleName] [varchar](10) NOT NULL CONSTRAINT [DF_tblUsers_roleName]  DEFAULT ('employees'),
	[email] [varchar](50) NOT NULL,
	[code] [varchar](50) NOT NULL,
 CONSTRAINT [PK__tblUsers__CB9A1CDF68774FDB] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'1', N'Classroom')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'2', N'Meeting')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'3', N'Restroom')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'4', N'Entertainment room')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'5', N'Projection room')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'6', N'Living room')
SET IDENTITY_INSERT [dbo].[tblRequest] ON 

INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3, CAST(N'2021-05-17 13:21:45.160' AS DateTime), N'Delete', N'admin', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (5, CAST(N'2021-05-17 13:23:15.600' AS DateTime), N'Accept', N'admin', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (6, CAST(N'2021-05-17 13:23:17.350' AS DateTime), N'Accept', N'admin', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (7, CAST(N'2021-05-17 13:23:44.270' AS DateTime), N'New', N'admin', N'3')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (9, CAST(N'2021-05-17 15:03:02.033' AS DateTime), N'Accept', N'admin', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (10, CAST(N'2021-05-17 15:43:11.883' AS DateTime), N'Accept', N'admin', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (11, CAST(N'2021-05-17 19:32:34.567' AS DateTime), N'Delete', N'admin', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (12, CAST(N'2021-05-17 19:32:34.907' AS DateTime), N'New', N'admin', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (13, CAST(N'2021-05-17 19:32:35.557' AS DateTime), N'New', N'admin', N'3')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (14, CAST(N'2021-05-17 19:32:36.380' AS DateTime), N'New', N'admin', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (15, CAST(N'2021-05-17 19:58:57.990' AS DateTime), N'Delete', N'admin', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (16, CAST(N'2021-05-17 19:58:58.560' AS DateTime), N'New', N'admin', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (17, CAST(N'2021-05-17 19:58:59.177' AS DateTime), N'Delete', N'admin', N'3')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (18, CAST(N'2021-05-17 19:58:59.837' AS DateTime), N'New', N'admin', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (19, CAST(N'2021-05-18 15:56:51.300' AS DateTime), N'New', N'admin', N'3')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (20, CAST(N'2021-05-18 15:56:51.350' AS DateTime), N'New', N'admin', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1003, CAST(N'2021-05-21 15:30:56.567' AS DateTime), N'New', N'admin', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1004, CAST(N'2021-05-21 15:30:56.913' AS DateTime), N'New', N'admin', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1005, CAST(N'2021-05-21 15:30:57.743' AS DateTime), N'New', N'admin', N'3')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1006, CAST(N'2021-05-21 15:30:58.133' AS DateTime), N'New', N'admin', N'3')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1007, CAST(N'2021-05-21 15:30:58.700' AS DateTime), N'New', N'admin', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1008, CAST(N'2021-05-21 15:30:59.487' AS DateTime), N'New', N'admin', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1009, CAST(N'2021-05-21 15:30:59.923' AS DateTime), N'New', N'admin', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1010, CAST(N'2021-05-21 15:31:00.337' AS DateTime), N'New', N'admin', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1012, CAST(N'2021-05-21 15:32:15.960' AS DateTime), N'New', N'admin', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1013, CAST(N'2021-05-21 15:36:18.257' AS DateTime), N'New', N'admin', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1021, CAST(N'2021-05-22 13:53:54.650' AS DateTime), N'Accept', N'ep', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (1025, CAST(N'2021-05-22 16:30:28.720' AS DateTime), N'Accept', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2002, CAST(N'2021-05-22 18:33:12.763' AS DateTime), N'Accept', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2010, CAST(N'2021-05-23 15:49:00.923' AS DateTime), N'New', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2011, CAST(N'2021-05-23 15:49:01.243' AS DateTime), N'New', N'ep', N'3')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2012, CAST(N'2021-05-23 15:49:01.720' AS DateTime), N'New', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2013, CAST(N'2021-05-23 15:49:02.290' AS DateTime), N'New', N'ep', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2014, CAST(N'2021-05-23 15:49:02.570' AS DateTime), N'New', N'ep', N'3')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2015, CAST(N'2021-05-23 15:49:02.903' AS DateTime), N'New', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2016, CAST(N'2021-05-23 15:49:03.210' AS DateTime), N'New', N'ep', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2017, CAST(N'2021-05-23 15:49:03.747' AS DateTime), N'New', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2018, CAST(N'2021-05-23 15:49:03.987' AS DateTime), N'New', N'ep', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2019, CAST(N'2021-05-23 15:49:04.497' AS DateTime), N'New', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2020, CAST(N'2021-05-23 15:49:10.513' AS DateTime), N'New', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2030, CAST(N'2021-05-23 16:02:02.953' AS DateTime), N'Accept', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2031, CAST(N'2021-05-23 16:02:56.070' AS DateTime), N'New', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2032, CAST(N'2021-05-23 16:02:57.793' AS DateTime), N'Accept', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2034, CAST(N'2021-05-23 16:08:13.263' AS DateTime), N'New', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2035, CAST(N'2021-05-23 16:08:14.143' AS DateTime), N'New', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2036, CAST(N'2021-05-23 16:08:14.833' AS DateTime), N'Accept', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2037, CAST(N'2021-05-23 16:14:03.087' AS DateTime), N'Accept', N'ep', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2039, CAST(N'2021-05-23 16:18:08.080' AS DateTime), N'Accept', N'ep', N'4')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2042, CAST(N'2021-05-23 16:18:57.750' AS DateTime), N'Accept', N'ep', N'3')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2048, CAST(N'2021-05-23 19:42:47.897' AS DateTime), N'Accept', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2052, CAST(N'2021-05-23 19:52:57.950' AS DateTime), N'Delete', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2057, CAST(N'2021-05-24 13:24:39.740' AS DateTime), N'Delete', N'ep', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2061, CAST(N'2021-05-24 13:32:50.680' AS DateTime), N'Accept', N'ld', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (2062, CAST(N'2021-05-24 13:32:57.373' AS DateTime), N'Accept', N'ep', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3045, CAST(N'2021-05-24 21:39:14.677' AS DateTime), N'Accept', N'ep', N'3')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3052, CAST(N'2021-05-25 19:56:57.583' AS DateTime), N'New', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3053, CAST(N'2021-05-25 19:57:44.147' AS DateTime), N'New', N'ep', N'10')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3054, CAST(N'2021-05-25 19:57:59.940' AS DateTime), N'New', N'ep', N'2')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3055, CAST(N'2021-05-25 19:58:00.330' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3056, CAST(N'2021-05-25 19:58:00.663' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3077, CAST(N'2021-05-25 19:58:07.283' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3078, CAST(N'2021-05-25 19:58:07.477' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3079, CAST(N'2021-05-25 19:58:07.670' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3080, CAST(N'2021-05-25 19:58:07.843' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3082, CAST(N'2021-05-25 19:58:08.210' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3083, CAST(N'2021-05-25 19:58:08.393' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3084, CAST(N'2021-05-25 19:58:08.803' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3091, CAST(N'2021-05-25 19:58:10.773' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3092, CAST(N'2021-05-25 19:58:10.987' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3093, CAST(N'2021-05-25 19:58:11.177' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3098, CAST(N'2021-05-25 20:47:30.257' AS DateTime), N'Delete', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3100, CAST(N'2021-05-25 20:55:02.353' AS DateTime), N'Delete', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3101, CAST(N'2021-05-25 20:57:05.540' AS DateTime), N'Accept', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3102, CAST(N'2021-05-25 20:59:16.643' AS DateTime), N'Accept', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3103, CAST(N'2021-05-25 20:59:41.457' AS DateTime), N'Accept', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3104, CAST(N'2021-05-25 21:01:39.713' AS DateTime), N'New', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3105, CAST(N'2021-05-25 21:04:19.277' AS DateTime), N'Accept', N'ep', N'1')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3108, CAST(N'2021-05-25 21:22:06.657' AS DateTime), N'New', N'ep', N'15')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3109, CAST(N'2021-05-25 21:22:08.423' AS DateTime), N'New', N'ep', N'13')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3110, CAST(N'2021-05-25 21:22:09.390' AS DateTime), N'New', N'ep', N'17')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3111, CAST(N'2021-05-25 21:22:10.270' AS DateTime), N'New', N'ep', N'18')
INSERT [dbo].[tblRequest] ([requestID], [dateBook], [statusreqName], [userID], [resourceID]) VALUES (3112, CAST(N'2021-05-25 21:24:12.957' AS DateTime), N'Accept', N'ld', N'12')
SET IDENTITY_INSERT [dbo].[tblRequest] OFF
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'1', N'1', N'Classroom 111', 115, CAST(N'2021-05-23' AS Date))
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'10', N'2', N'Meeting 341', 100, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'11', N'3', N'Restroom 121', 12, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'12', N'3', N'Restroom 564', 1, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'13', N'3', N'Restroom 563', 26, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'14', N'3', N'Restroom 120', 34, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'15', N'3', N'Restroom 321', 3, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'16', N'4', N'Entertainment room 431', 3, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'17', N'4', N'Entertainment room 542', 4, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'18', N'4', N'Entertainment room 921', 12, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'19', N'4', N'Entertainment room 396', 23, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'2', N'1', N'Classroom 121', 100, CAST(N'2021-05-23' AS Date))
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'20', N'4', N'Entertainment room 461', 23, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'21', N'5', N'Projection room 452', 1, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'22', N'5', N'Projection room 091', 2, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'23', N'5', N'Projection room 573', 21, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'24', N'5', N'Projection room 129', 10, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'25', N'5', N'Projection room 351', 61, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'26', N'6', N'Living room 123', 1, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'27', N'6', N'Living room 763', 9, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'28', N'6', N'Living room 670', 25, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'29', N'6', N'Living room 042', 10, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'3', N'1', N'Classroom 231', 15, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'30', N'6', N'Living room 012', 15, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'4', N'1', N'Classroom 211', 15, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'5', N'1', N'Classroom 443', 12, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'6', N'2', N'Meeting 776', 123, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'7', N'2', N'Meeting 881', 12, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'8', N'2', N'Meeting 201', 5, NULL)
INSERT [dbo].[tblResource] ([resourceID], [categoryID], [name], [quantity], [dateBook]) VALUES (N'9', N'2', N'Meeting 743', 120, NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [password], [name], [phone], [address], [createDate], [status], [roleName], [email], [code]) VALUES (N'admin', 1, N'1', N'Vo Quoc Huy', N'0964091921', N'Tan Binh tpHCM', CAST(N'2021-05-15 15:35:11.707' AS DateTime), N'Active', N'manager', N'abc123@gmail.com', N'125431')
INSERT [dbo].[tblUsers] ([userID], [roleID], [password], [name], [phone], [address], [createDate], [status], [roleName], [email], [code]) VALUES (N'ep', 3, N'1', N'Employee', N'0964091921', N'Tan Binh tpHCM', CAST(N'2021-05-15 15:35:40.833' AS DateTime), N'Active', N'employee', N'xyz456@gmamil.com', N'956324')
INSERT [dbo].[tblUsers] ([userID], [roleID], [password], [name], [phone], [address], [createDate], [status], [roleName], [email], [code]) VALUES (N'ld', 2, N'1', N'Leader', N'0964091921', N'Tan Binh tpHCM', CAST(N'2021-05-15 15:35:34.193' AS DateTime), N'Active', N'leader', N'qwerdf@gmail.com', N'543121')
ALTER TABLE [dbo].[tblRequest]  WITH CHECK ADD  CONSTRAINT [FK__tblReques__userI__4E88ABD4] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblRequest] CHECK CONSTRAINT [FK__tblReques__userI__4E88ABD4]
GO
ALTER TABLE [dbo].[tblRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblRequest_tblResource] FOREIGN KEY([resourceID])
REFERENCES [dbo].[tblResource] ([resourceID])
GO
ALTER TABLE [dbo].[tblRequest] CHECK CONSTRAINT [FK_tblRequest_tblResource]
GO
ALTER TABLE [dbo].[tblResource]  WITH CHECK ADD  CONSTRAINT [FK__tblResour__categ__403A8C7D] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblResource] CHECK CONSTRAINT [FK__tblResour__categ__403A8C7D]
GO
USE [master]
GO
ALTER DATABASE [LabWeb1] SET  READ_WRITE 
GO
