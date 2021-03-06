USE [master]
GO
/****** Object:  Database [db_egreetingcard]    Script Date: 5/28/2022 11:52:04 PM ******/
CREATE DATABASE [db_egreetingcard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_egreetingcard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_egreetingcard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_egreetingcard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_egreetingcard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_egreetingcard] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_egreetingcard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_egreetingcard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_egreetingcard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_egreetingcard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_egreetingcard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_egreetingcard] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_egreetingcard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_egreetingcard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_egreetingcard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_egreetingcard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_egreetingcard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_egreetingcard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_egreetingcard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_egreetingcard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_egreetingcard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_egreetingcard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_egreetingcard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_egreetingcard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_egreetingcard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_egreetingcard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_egreetingcard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_egreetingcard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_egreetingcard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_egreetingcard] SET RECOVERY FULL 
GO
ALTER DATABASE [db_egreetingcard] SET  MULTI_USER 
GO
ALTER DATABASE [db_egreetingcard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_egreetingcard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_egreetingcard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_egreetingcard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_egreetingcard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_egreetingcard] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_egreetingcard', N'ON'
GO
ALTER DATABASE [db_egreetingcard] SET QUERY_STORE = OFF
GO
USE [db_egreetingcard]
GO
/****** Object:  Table [dbo].[tb_cards]    Script Date: 5/28/2022 11:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cards](
	[ca_id] [int] IDENTITY(1,1) NOT NULL,
	[ca_pic] [varchar](max) NULL,
	[ca_fk_c] [int] NULL,
	[ca_name] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ca_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_category]    Script Date: 5/28/2022 11:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_category](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_categoryname] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_feedback]    Script Date: 5/28/2022 11:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_feedback](
	[FD_id] [int] IDENTITY(1,1) NOT NULL,
	[FD_reaction] [varchar](max) NULL,
	[FD_email] [varchar](max) NULL,
	[FD_message] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FD_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_newsletter]    Script Date: 5/28/2022 11:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_newsletter](
	[n_id] [int] IDENTITY(1,1) NOT NULL,
	[n_email] [varchar](max) NULL,
 CONSTRAINT [PK_tb_newsletter] PRIMARY KEY CLUSTERED 
(
	[n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_roles]    Script Date: 5/28/2022 11:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_roles](
	[r_id] [int] IDENTITY(1,1) NOT NULL,
	[r_group] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_trx]    Script Date: 5/28/2022 11:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_trx](
	[tr_id] [int] IDENTITY(1,1) NOT NULL,
	[tr_to] [varchar](255) NULL,
	[tr_cardname] [varchar](max) NULL,
	[tr_time] [datetime] NULL,
	[tr_fk_u] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_userdetails]    Script Date: 5/28/2022 11:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_userdetails](
	[U_id] [int] IDENTITY(1,1) NOT NULL,
	[U_fname] [nvarchar](max) NULL,
	[U_lname] [nvarchar](max) NULL,
	[U_email] [varchar](max) NULL,
	[U_pass] [varchar](max) NULL,
	[U_country] [varchar](max) NULL,
	[U_number] [varchar](max) NULL,
	[u_role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[U_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_cards] ON 

INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (1, N'https://images.unsplash.com/photo-1531956531700-dc0ee0f1f9a5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YmlydGhkYXl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 1003, N'Colorful Gift Box')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (4, N'https://images.unsplash.com/photo-1583875762487-5f8f7c718d14?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmlydGhkYXl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 1003, N'Pink Cup Cakes')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (5, N'https://images.unsplash.com/photo-1558636508-e0db3814bd1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGJpcnRoZGF5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60', 1003, N'Blue Flower')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (6, N'https://images.unsplash.com/photo-1601268588577-319223ba7cb3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjB8fGJpcnRoZGF5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 1003, N'Colorful Balloons')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (7, N'https://images.unsplash.com/photo-1558979235-9b4b27d624fa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTl8fGJpcnRoZGF5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 1003, N'Pink Flowers')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (8, N'https://images.unsplash.com/photo-1578922794704-7bdd46f70ce0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzV8fGJpcnRoZGF5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 1003, N'Colorful butterflies')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (9, N'https://images.unsplash.com/photo-1515934751635-c81c6bc9a2d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80', 4, N'Elegant Henna')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (10, N'https://images.unsplash.com/photo-1519657814741-5781d2018f70?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGFwcHklMjB3ZWRkaW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 4, N'Flower Leaves')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (11, N'https://images.unsplash.com/photo-1515715709530-858f7bfa1b10?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTAxfHx3ZWRkaW5nJTIwZ3JlZXRpbmclMjBjYXJkc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 4, N'chandelier')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (12, N'https://images.unsplash.com/photo-1529519195486-16945f0fb37f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTg1fHx3ZWRkaW5nJTIwYW5uaXZlcnNhcnklMjBjYXJkfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 4, N' Floral')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (13, N'https://images.unsplash.com/photo-1506072328856-cd6629b00b62?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE5fHx3ZWRkaW5nJTIwZ3JlZXRpbmclMjBjYXJkc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 4, N'Flower Wreath')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (14, N'https://images.unsplash.com/photo-1501161481074-4c024f8f2b8e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODh8fHdlZGRpbmclMjBhbm5pdmVyc2FyeSUyMGNhcmR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 4, N'Golden Beads')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (15, N'https://images.unsplash.com/photo-1607457255040-8ebca0a804e7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG5ldyUyMHllYXIlMjBjYXJkc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 5, N'Golden Stars')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (16, N'https://images.unsplash.com/photo-1546074177-31bfa593f731?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGFwcHklMjBuZXclMjB5ZWFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 5, N'Greeting')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (17, N'https://images.unsplash.com/photo-1577046848358-4623c0859b8a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGhhcHB5JTIwbmV3JTIweWVhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 5, N'newyear 2020')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (18, N'https://images.unsplash.com/photo-1577046823799-58b2d217d508?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGhhcHB5JTIwbmV3JTIweWVhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 5, N'ColorFul Fireworks')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (19, N'https://images.unsplash.com/photo-1577046848358-4623c0859b8a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGhhcHB5JTIwbmV3JTIweWVhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 5, N'Celeberation ')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (20, N'https://images.unsplash.com/photo-1515995301990-280d37b2a8c9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFwcHklMjBuZXclMjB5ZWFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 5, N'Silver Card')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (21, N'https://images.unsplash.com/photo-1505842465776-3b4953ca4f44?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZmVzdGl2YWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 6, N'Sheep Card')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (23, N'https://images.unsplash.com/photo-1626809259716-29eadc96fea9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGVpZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 6, N'Blue Card')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (24, N'https://images.unsplash.com/photo-1582711012124-a56cf82307a0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGZlc3RpdmFsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 6, N'Eid Greetings')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (25, N'https://images.unsplash.com/photo-1559760434-0981df057e83?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjZ8fGZlc3RpdmFsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 6, N'Red Trees Card')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (26, N'https://images.unsplash.com/photo-1497911174120-042e550e7e0a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGZlc3RpdmFsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 6, N'Good Easrter')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (27, N'https://images.unsplash.com/photo-1566571688621-2dca2366154e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fGZlc3RpdmFsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 6, N'Spooky Card')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (30, N'https://images.unsplash.com/photo-1514120649397-daec977c71b5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQzfHx3ZWRkaW5nJTIwYW5uaXZlcnNhcnklMjBjYXJkfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 4, N'test')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (31, N'https://images.unsplash.com/photo-1498814117408-e396f5507073?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTU0fHx3ZWRkaW5nJTIwYW5uaXZlcnNhcnklMjBjYXJkfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 4, N'ghh')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (32, N'https://images.unsplash.com/photo-1534875611686-50fe95ae2624?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2VkZGluZyUyMHJpbmd8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 4, N'banner')
INSERT [dbo].[tb_cards] ([ca_id], [ca_pic], [ca_fk_c], [ca_name]) VALUES (33, N'https://images.unsplash.com/photo-1555607124-8531c7c702d0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjV8fGJpcnRoZGF5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 1003, N'Birthday')
SET IDENTITY_INSERT [dbo].[tb_cards] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_category] ON 

INSERT [dbo].[tb_category] ([c_id], [c_categoryname]) VALUES (4, N'Wedding')
INSERT [dbo].[tb_category] ([c_id], [c_categoryname]) VALUES (5, N'Newyear')
INSERT [dbo].[tb_category] ([c_id], [c_categoryname]) VALUES (6, N'Festival')
INSERT [dbo].[tb_category] ([c_id], [c_categoryname]) VALUES (1003, N'Birthday')
INSERT [dbo].[tb_category] ([c_id], [c_categoryname]) VALUES (1007, N'eid')
SET IDENTITY_INSERT [dbo].[tb_category] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_feedback] ON 

INSERT [dbo].[tb_feedback] ([FD_id], [FD_reaction], [FD_email], [FD_message]) VALUES (2, N'Not Satisfied', N'msaad2110@gmail.com', N'test')
INSERT [dbo].[tb_feedback] ([FD_id], [FD_reaction], [FD_email], [FD_message]) VALUES (3, N'Neutral', N'msaad2110@gmail.com', N'test2')
INSERT [dbo].[tb_feedback] ([FD_id], [FD_reaction], [FD_email], [FD_message]) VALUES (4, N'Good', N'msaad2110@gmail.com', N'test8')
SET IDENTITY_INSERT [dbo].[tb_feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_newsletter] ON 

INSERT [dbo].[tb_newsletter] ([n_id], [n_email]) VALUES (1, N'hellgaming554@gmail.com')
SET IDENTITY_INSERT [dbo].[tb_newsletter] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_roles] ON 

INSERT [dbo].[tb_roles] ([r_id], [r_group]) VALUES (1, N'Admin')
INSERT [dbo].[tb_roles] ([r_id], [r_group]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[tb_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_trx] ON 

INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (2, N'msaad2110@gmail.com', N'Blue Flower', CAST(N'2020-02-20T20:46:30.687' AS DateTime), 1)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (3, N'hellgaming554@gmail.com', N'Blue Flower', CAST(N'2020-02-20T20:47:35.743' AS DateTime), 1)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (4, N'zdnonline@gmail.com', N'Blue Flower', CAST(N'2020-02-20T20:48:31.810' AS DateTime), 1)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (5, N'tahirak.afridi@hotmail.com', N'Blue Flower', CAST(N'2021-08-26T23:28:17.307' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (6, N'sfcfaculty25@gmail.com', N'Blue Flower', CAST(N'2021-08-26T23:37:19.150' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (7, N'tahirak.afridi@hotmail.com', N'Blue Flower', CAST(N'2021-08-26T23:38:27.467' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (8, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-26T23:43:50.463' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (9, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-26T23:47:40.403' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (13, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:04:21.510' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (14, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:06:24.833' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (15, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:08:33.003' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (16, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:12:00.900' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (17, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:18:28.673' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (18, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:21:33.327' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (19, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:25:27.070' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (20, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:26:19.587' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (21, N'', N'Blue Flower', CAST(N'2021-08-27T00:32:55.800' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (22, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:33:45.737' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (23, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:36:08.567' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (24, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:48:26.013' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (25, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:51:50.823' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (26, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:52:09.903' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (27, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T00:54:36.997' AS DateTime), 5)
INSERT [dbo].[tb_trx] ([tr_id], [tr_to], [tr_cardname], [tr_time], [tr_fk_u]) VALUES (28, N'sfcstudent101@outlook.com', N'Blue Flower', CAST(N'2021-08-27T01:03:43.367' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[tb_trx] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_userdetails] ON 

INSERT [dbo].[tb_userdetails] ([U_id], [U_fname], [U_lname], [U_email], [U_pass], [U_country], [U_number], [u_role_id]) VALUES (1, N'Muhammad', N'saad', N'user@egreetings.com', N'AEpQQsCd3AsFzconfOm2dr3FE96sOYNMNuIW77ANapWA23W9K8xabqy5LJUWRUPV/w==', N'1231241', N'41414141', 2)
INSERT [dbo].[tb_userdetails] ([U_id], [U_fname], [U_lname], [U_email], [U_pass], [U_country], [U_number], [u_role_id]) VALUES (2, N'Muhammad', N'asada', N'admin@egreetings.com', N'ALcw+5xFRolUDGRb+RBi6IWDeInz7u1NG3ZyyC1FkulhPvHEatXE6Zk0efpuWrP0OQ==', N'pakistan', N'1414', 1)
INSERT [dbo].[tb_userdetails] ([U_id], [U_fname], [U_lname], [U_email], [U_pass], [U_country], [U_number], [u_role_id]) VALUES (4, N'Muhammad', N'asada', N'msaad214@gmail.com', N'AL9MmkY87jUqXxyxNct1nhPlbh8nSrQGureu9KVGJjRp0pdlMtZ+/xfymPEYWStn0Q==', N'Pakistan', N'41414141', 2)
INSERT [dbo].[tb_userdetails] ([U_id], [U_fname], [U_lname], [U_email], [U_pass], [U_country], [U_number], [u_role_id]) VALUES (5, N'smith', N'john', N'smith@gmail.com', N'APXwe+y67P4WlwxS9XdAKk1FVvvlGzRdtLwj8LhejKBPh4esBu/RXdibRFGEO5PsFQ==', N'usa', N'45647657657', 2)
SET IDENTITY_INSERT [dbo].[tb_userdetails] OFF
GO
ALTER TABLE [dbo].[tb_cards]  WITH CHECK ADD FOREIGN KEY([ca_fk_c])
REFERENCES [dbo].[tb_category] ([c_id])
GO
ALTER TABLE [dbo].[tb_trx]  WITH CHECK ADD FOREIGN KEY([tr_fk_u])
REFERENCES [dbo].[tb_userdetails] ([U_id])
GO
ALTER TABLE [dbo].[tb_userdetails]  WITH CHECK ADD FOREIGN KEY([u_role_id])
REFERENCES [dbo].[tb_roles] ([r_id])
GO
/****** Object:  StoredProcedure [dbo].[report_join]    Script Date: 5/28/2022 11:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[report_join]
as
begin
SELECT tr_id, tr_to, tr_cardname, tr_time,U_fname,U_lname,U_email,U_number  FROM dbo.tb_trx
join
dbo.tb_userdetails
on
tr_fk_u=u_id
end
GO
USE [master]
GO
ALTER DATABASE [db_egreetingcard] SET  READ_WRITE 
GO
