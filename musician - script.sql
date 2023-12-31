USE [master]
GO
/****** Object:  Database [Musicians]    Script Date: 4.07.2023 19:50:27 ******/
CREATE DATABASE [Musicians]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Musician', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Musician.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Musician_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Musician_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Musicians] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Musicians].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Musicians] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Musicians] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Musicians] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Musicians] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Musicians] SET ARITHABORT OFF 
GO
ALTER DATABASE [Musicians] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Musicians] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Musicians] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Musicians] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Musicians] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Musicians] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Musicians] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Musicians] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Musicians] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Musicians] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Musicians] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Musicians] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Musicians] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Musicians] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Musicians] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Musicians] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Musicians] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Musicians] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Musicians] SET  MULTI_USER 
GO
ALTER DATABASE [Musicians] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Musicians] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Musicians] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Musicians] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Musicians] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Musicians] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Musicians] SET QUERY_STORE = OFF
GO
USE [Musicians]
GO
/****** Object:  Table [dbo].[band]    Script Date: 4.07.2023 19:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[band](
	[band_no] [int] NOT NULL,
	[band_name] [nvarchar](50) NULL,
	[band_home] [int] NULL,
	[band_type] [nvarchar](50) NULL,
	[b_date] [date] NULL,
	[band_contact] [int] NULL,
 CONSTRAINT [PK_band] PRIMARY KEY CLUSTERED 
(
	[band_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[composer]    Script Date: 4.07.2023 19:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[composer](
	[comp_no] [int] NOT NULL,
	[comp_is] [int] NULL,
	[comp_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_composer] PRIMARY KEY CLUSTERED 
(
	[comp_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[composition]    Script Date: 4.07.2023 19:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[composition](
	[c_no] [int] NOT NULL,
	[comp_date] [date] NULL,
	[c_title] [nvarchar](50) NULL,
	[c_in] [int] NULL,
 CONSTRAINT [PK_composition] PRIMARY KEY CLUSTERED 
(
	[c_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[concert]    Script Date: 4.07.2023 19:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[concert](
	[concert_no] [int] NOT NULL,
	[concert_venue] [nvarchar](50) NULL,
	[concert_in] [int] NULL,
	[con_date] [date] NULL,
	[concert_orgniser] [int] NULL,
 CONSTRAINT [PK_concert] PRIMARY KEY CLUSTERED 
(
	[concert_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[has_composed]    Script Date: 4.07.2023 19:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[has_composed](
	[cmpr_no] [int] NULL,
	[cmpn_no] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musician]    Script Date: 4.07.2023 19:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musician](
	[m_no] [int] NOT NULL,
	[m_name] [nvarchar](50) NULL,
	[born] [date] NULL,
	[died] [date] NULL,
	[born_in] [int] NULL,
	[living_in] [int] NULL,
 CONSTRAINT [PK_musician] PRIMARY KEY CLUSTERED 
(
	[m_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[performance]    Script Date: 4.07.2023 19:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[performance](
	[pfrmnc_no] [int] NOT NULL,
	[gave] [int] NULL,
	[performed] [int] NULL,
	[conducted_by] [int] NULL,
	[performed_in] [int] NULL,
 CONSTRAINT [PK_performance] PRIMARY KEY CLUSTERED 
(
	[pfrmnc_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[performer]    Script Date: 4.07.2023 19:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[performer](
	[perf_no] [int] NOT NULL,
	[perf_is] [int] NULL,
	[instrument] [nvarchar](50) NULL,
	[perf_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_performer] PRIMARY KEY CLUSTERED 
(
	[perf_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[place]    Script Date: 4.07.2023 19:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[place](
	[place_no] [int] NOT NULL,
	[place_town] [nvarchar](50) NULL,
	[place_country] [nvarchar](50) NULL,
 CONSTRAINT [PK_place] PRIMARY KEY CLUSTERED 
(
	[place_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plays_in]    Script Date: 4.07.2023 19:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plays_in](
	[player] [int] NULL,
	[band_id] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[band] ([band_no], [band_name], [band_home], [band_type], [b_date], [band_contact]) VALUES (1, N'ROP', 5, N'classical', CAST(N'2001-01-30' AS Date), 11)
INSERT [dbo].[band] ([band_no], [band_name], [band_home], [band_type], [b_date], [band_contact]) VALUES (2, N'AASO', 6, N'classical', NULL, 10)
INSERT [dbo].[band] ([band_no], [band_name], [band_home], [band_type], [b_date], [band_contact]) VALUES (3, N'The J Bs', 8, N'jazz', NULL, 12)
INSERT [dbo].[band] ([band_no], [band_name], [band_home], [band_type], [b_date], [band_contact]) VALUES (4, N'BBSO', 9, N'classical', NULL, 21)
INSERT [dbo].[band] ([band_no], [band_name], [band_home], [band_type], [b_date], [band_contact]) VALUES (5, N'The left Overs', 2, N'jazz', NULL, 8)
INSERT [dbo].[band] ([band_no], [band_name], [band_home], [band_type], [b_date], [band_contact]) VALUES (6, N'Somebody Loves this', 1, N'jazz', NULL, 6)
INSERT [dbo].[band] ([band_no], [band_name], [band_home], [band_type], [b_date], [band_contact]) VALUES (7, N'Oh well', 4, N'classical', NULL, 3)
INSERT [dbo].[band] ([band_no], [band_name], [band_home], [band_type], [b_date], [band_contact]) VALUES (8, N'Swinging strings', 4, N'classical', NULL, 7)
INSERT [dbo].[band] ([band_no], [band_name], [band_home], [band_type], [b_date], [band_contact]) VALUES (9, N'The Rest', 9, N'jazz', NULL, 16)
GO
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (1, 1, N'jazz')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (2, 3, N'classical')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (3, 5, N'jazz')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (4, 7, N'classical')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (5, 9, N'jazz')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (6, 11, N'rock')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (7, 13, N'classical')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (8, 15, N'jazz')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (9, 17, N'classical')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (10, 19, N'jazz')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (11, 10, N'rock')
INSERT [dbo].[composer] ([comp_no], [comp_is], [comp_type]) VALUES (12, 8, N'jazz')
GO
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (1, CAST(N'1975-06-17' AS Date), N'Opus 1', 1)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (2, CAST(N'1976-07-21' AS Date), N'Here Goes', 2)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (3, CAST(N'1981-12-14' AS Date), N'Valiant Knight', 3)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (4, CAST(N'1982-01-12' AS Date), N'Little Piece', 4)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (5, CAST(N'1985-03-13' AS Date), N'Simple Song', 5)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (6, CAST(N'1986-04-14' AS Date), N'Little Swing Song', 6)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (7, CAST(N'1987-05-13' AS Date), N'	Fast Journey', 7)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (8, CAST(N'1976-02-14' AS Date), N'	Simple Love Song', 8)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (9, CAST(N'1982-01-21' AS Date), N'	Complex Rythms', 9)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (10, CAST(N'1985-02-23' AS Date), N'Drumming Rythms', 9)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (11, CAST(N'1978-03-18' AS Date), N'Fast Drumming', 8)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (12, CAST(N'1984-08-13' AS Date), N'Slow Song', 7)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (13, CAST(N'1968-09-14' AS Date), N'Blue Roses', 6)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (14, CAST(N'1983-11-15' AS Date), N'	Velvet Rain', 5)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (15, CAST(N'1982-05-16' AS Date), N'	Cold Wind', 4)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (16, CAST(N'1983-06-18' AS Date), N'	After the Wind Blows', 3)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (17, NULL, N'A Simple Piece', 2)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (18, CAST(N'1985-01-12' AS Date), N'Long Rythms', 1)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (19, CAST(N'1988-02-12' AS Date), N'	Eastern Wind', 1)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (20, NULL, N'Slow Symphony Blowing', 2)
INSERT [dbo].[composition] ([c_no], [comp_date], [c_title], [c_in]) VALUES (21, CAST(N'1990-07-12' AS Date), N'	A Last Song', 6)
GO
INSERT [dbo].[concert] ([concert_no], [concert_venue], [concert_in], [con_date], [concert_orgniser]) VALUES (1, N'Bridgewater Hall', 1, CAST(N'1995-01-06' AS Date), 21)
INSERT [dbo].[concert] ([concert_no], [concert_venue], [concert_in], [con_date], [concert_orgniser]) VALUES (2, N'Bridgewater Hall', 1, CAST(N'1996-05-08' AS Date), 3)
INSERT [dbo].[concert] ([concert_no], [concert_venue], [concert_in], [con_date], [concert_orgniser]) VALUES (3, N'Usher Hall', 2, CAST(N'1995-06-03' AS Date), 3)
INSERT [dbo].[concert] ([concert_no], [concert_venue], [concert_in], [con_date], [concert_orgniser]) VALUES (4, N'Assembly Rooms', 2, CAST(N'1997-09-20' AS Date), 21)
INSERT [dbo].[concert] ([concert_no], [concert_venue], [concert_in], [con_date], [concert_orgniser]) VALUES (5, N'Festspiel Haus', 3, CAST(N'1995-02-21' AS Date), 8)
INSERT [dbo].[concert] ([concert_no], [concert_venue], [concert_in], [con_date], [concert_orgniser]) VALUES (6, N'Royal Albert Hall', 7, CAST(N'1993-04-12' AS Date), 8)
INSERT [dbo].[concert] ([concert_no], [concert_venue], [concert_in], [con_date], [concert_orgniser]) VALUES (7, N'Concertgebouw', 9, CAST(N'1993-05-14' AS Date), 8)
INSERT [dbo].[concert] ([concert_no], [concert_venue], [concert_in], [con_date], [concert_orgniser]) VALUES (8, N'Metropolitan', 4, CAST(N'1997-06-15' AS Date), 21)
GO
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (1, 1)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (1, 8)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (2, 11)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (3, 2)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (3, 13)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (3, 14)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (3, 18)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (4, 12)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (4, 20)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (5, 3)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (5, 13)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (5, 14)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (6, 15)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (6, 21)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (7, 4)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (7, 9)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (8, 16)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (9, 5)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (9, 10)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (10, 17)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (11, 6)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (12, 7)
INSERT [dbo].[has_composed] ([cmpr_no], [cmpn_no]) VALUES (12, 19)
GO
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (1, N'Fred Bloggs', CAST(N'2048-01-02' AS Date), NULL, 1, 2)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (2, N'John Smith', CAST(N'1950-03-03' AS Date), NULL, 3, 4)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (3, N'Helen Smyth', CAST(N'2048-08-08' AS Date), NULL, 4, 5)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (4, N'Harriet Smithson', CAST(N'1909-05-09' AS Date), CAST(N'1980-09-20' AS Date), 5, 6)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (5, N'James First', CAST(N'1965-06-10' AS Date), NULL, 7, 7)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (6, N'Theo Mengel', CAST(N'2048-08-12' AS Date), NULL, 7, 1)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (7, N'Sue Little', CAST(N'2045-02-21' AS Date), NULL, 8, 9)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (8, N'Harry Forte', CAST(N'1951-02-28' AS Date), NULL, 1, 8)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (9, N'Phil Hot', CAST(N'2042-06-30' AS Date), NULL, 2, 7)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (10, N'Jeff Dawn', CAST(N'2045-12-12' AS Date), NULL, 3, 6)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (11, N'Rose Spring', CAST(N'2048-05-25' AS Date), NULL, 4, 5)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (12, N'Davis Heavan', CAST(N'1975-10-03' AS Date), NULL, 5, 4)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (13, N'Lovely Time', CAST(N'2048-12-28' AS Date), NULL, 6, 3)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (14, N'Alan Fluff', CAST(N'2035-01-15' AS Date), CAST(N'1997-05-15' AS Date), 7, 2)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (15, N'Tony Smythe', CAST(N'2032-04-02' AS Date), NULL, 8, 1)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (16, N'James Quick', CAST(N'1924-08-08' AS Date), NULL, 9, 2)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (17, N'Freda Miles', CAST(N'1920-07-04' AS Date), NULL, 9, 3)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (18, N'Elsie James', CAST(N'2047-05-06' AS Date), NULL, 8, 5)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (19, N'Andy Jones', CAST(N'1958-10-08' AS Date), NULL, 7, 6)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (20, N'Louise Simpson', CAST(N'2048-01-10' AS Date), CAST(N'1998-02-11' AS Date), 6, 6)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (21, N'James Steeple', CAST(N'2047-01-10' AS Date), NULL, 5, 6)
INSERT [dbo].[musician] ([m_no], [m_name], [born], [died], [born_in], [living_in]) VALUES (22, N'Steven Chaytors', CAST(N'1956-03-11' AS Date), NULL, 6, 7)
GO
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (1, 1, 1, 21, 1)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (2, 1, 3, 21, 1)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (3, 1, 5, 21, 1)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (4, 1, 2, 1, 2)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (5, 2, 4, 21, 2)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (6, 2, 6, 21, 2)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (7, 4, 19, 9, 3)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (8, 4, 20, 10, 3)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (9, 5, 12, 10, 4)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (10, 5, 13, 11, 4)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (11, 3, 5, 13, 5)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (12, 3, 6, 13, 5)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (13, 3, 7, 13, 5)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (14, 6, 20, 14, 6)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (15, 8, 12, 15, 7)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (16, 9, 16, 21, 8)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (17, 9, 17, 21, 8)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (18, 9, 18, 21, 8)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (19, 9, 19, 21, 8)
INSERT [dbo].[performance] ([pfrmnc_no], [gave], [performed], [conducted_by], [performed_in]) VALUES (20, 4, 12, 10, 3)
GO
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (1, 2, N'violin', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (2, 4, N'viola', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (3, 6, N'banjo', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (4, 8, N'violin', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (5, 12, N'guitar', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (6, 14, N'violin', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (7, 16, N'trumpet', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (8, 18, N'viola', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (9, 20, N'bass', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (10, 2, N'flute', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (11, 20, N'cornet', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (12, 6, N'violin', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (13, 8, N'	drums', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (14, 10, N'violin', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (15, 12, N'cello', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (16, 14, N'viola', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (17, 16, N'flute', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (18, 18, N'guitar', N'not known')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (19, 20, N'trombone', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (20, 3, N'horn', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (21, 5, N'violin', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (22, 7, N'cello', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (23, 2, N'bass', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (24, 4, N'violin', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (25, 6, N'	drums', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (26, 8, N'clarinet', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (27, 10, N'bass', N'jazz')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (28, 12, N'viola', N'classical')
INSERT [dbo].[performer] ([perf_no], [perf_is], [instrument], [perf_type]) VALUES (29, 18, N'cello', N'classical')
GO
INSERT [dbo].[place] ([place_no], [place_town], [place_country]) VALUES (1, N'Manchester', N'England')
INSERT [dbo].[place] ([place_no], [place_town], [place_country]) VALUES (2, N'Edinburgh', N'Scotland')
INSERT [dbo].[place] ([place_no], [place_town], [place_country]) VALUES (3, N'Salzburg', N'Austria')
INSERT [dbo].[place] ([place_no], [place_town], [place_country]) VALUES (4, N'New York', N'USA')
INSERT [dbo].[place] ([place_no], [place_town], [place_country]) VALUES (5, N'Birmingham', N'England')
INSERT [dbo].[place] ([place_no], [place_town], [place_country]) VALUES (6, N'Glasgow', N'Scotland')
INSERT [dbo].[place] ([place_no], [place_town], [place_country]) VALUES (7, N'London', N'England')
INSERT [dbo].[place] ([place_no], [place_town], [place_country]) VALUES (8, N'Chicago', N'USA')
INSERT [dbo].[place] ([place_no], [place_town], [place_country]) VALUES (9, N'Amsterdam', N'Netherlands')
GO
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (1, 1)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (1, 7)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (3, 1)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (4, 1)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (4, 7)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (5, 1)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (6, 1)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (6, 7)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (7, 1)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (8, 1)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (8, 7)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (10, 2)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (12, 2)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (13, 2)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (14, 2)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (14, 8)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (15, 2)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (15, 8)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (17, 2)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (18, 2)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (19, 3)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (20, 3)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (21, 4)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (22, 4)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (23, 4)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (25, 5)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (26, 6)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (27, 6)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (28, 7)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (28, 8)
INSERT [dbo].[plays_in] ([player], [band_id]) VALUES (29, 7)
GO
ALTER TABLE [dbo].[band]  WITH CHECK ADD  CONSTRAINT [FK_band_musician] FOREIGN KEY([band_contact])
REFERENCES [dbo].[musician] ([m_no])
GO
ALTER TABLE [dbo].[band] CHECK CONSTRAINT [FK_band_musician]
GO
ALTER TABLE [dbo].[band]  WITH CHECK ADD  CONSTRAINT [FK_band_place] FOREIGN KEY([band_home])
REFERENCES [dbo].[place] ([place_no])
GO
ALTER TABLE [dbo].[band] CHECK CONSTRAINT [FK_band_place]
GO
ALTER TABLE [dbo].[composer]  WITH CHECK ADD  CONSTRAINT [FK_composer_musician] FOREIGN KEY([comp_is])
REFERENCES [dbo].[musician] ([m_no])
GO
ALTER TABLE [dbo].[composer] CHECK CONSTRAINT [FK_composer_musician]
GO
ALTER TABLE [dbo].[composition]  WITH CHECK ADD  CONSTRAINT [FK_composition_place] FOREIGN KEY([c_in])
REFERENCES [dbo].[place] ([place_no])
GO
ALTER TABLE [dbo].[composition] CHECK CONSTRAINT [FK_composition_place]
GO
ALTER TABLE [dbo].[concert]  WITH CHECK ADD  CONSTRAINT [FK_concert_musician] FOREIGN KEY([concert_orgniser])
REFERENCES [dbo].[musician] ([m_no])
GO
ALTER TABLE [dbo].[concert] CHECK CONSTRAINT [FK_concert_musician]
GO
ALTER TABLE [dbo].[concert]  WITH CHECK ADD  CONSTRAINT [FK_concert_place] FOREIGN KEY([concert_in])
REFERENCES [dbo].[place] ([place_no])
GO
ALTER TABLE [dbo].[concert] CHECK CONSTRAINT [FK_concert_place]
GO
ALTER TABLE [dbo].[has_composed]  WITH CHECK ADD  CONSTRAINT [FK_has_composed_composer] FOREIGN KEY([cmpr_no])
REFERENCES [dbo].[composer] ([comp_no])
GO
ALTER TABLE [dbo].[has_composed] CHECK CONSTRAINT [FK_has_composed_composer]
GO
ALTER TABLE [dbo].[has_composed]  WITH CHECK ADD  CONSTRAINT [FK_has_composed_composition] FOREIGN KEY([cmpn_no])
REFERENCES [dbo].[composition] ([c_no])
GO
ALTER TABLE [dbo].[has_composed] CHECK CONSTRAINT [FK_has_composed_composition]
GO
ALTER TABLE [dbo].[musician]  WITH CHECK ADD  CONSTRAINT [FK_musician_place] FOREIGN KEY([born_in])
REFERENCES [dbo].[place] ([place_no])
GO
ALTER TABLE [dbo].[musician] CHECK CONSTRAINT [FK_musician_place]
GO
ALTER TABLE [dbo].[musician]  WITH CHECK ADD  CONSTRAINT [FK_musician_place1] FOREIGN KEY([living_in])
REFERENCES [dbo].[place] ([place_no])
GO
ALTER TABLE [dbo].[musician] CHECK CONSTRAINT [FK_musician_place1]
GO
ALTER TABLE [dbo].[performance]  WITH CHECK ADD  CONSTRAINT [FK_performance_band] FOREIGN KEY([gave])
REFERENCES [dbo].[band] ([band_no])
GO
ALTER TABLE [dbo].[performance] CHECK CONSTRAINT [FK_performance_band]
GO
ALTER TABLE [dbo].[performance]  WITH CHECK ADD  CONSTRAINT [FK_performance_composition] FOREIGN KEY([performed])
REFERENCES [dbo].[composition] ([c_no])
GO
ALTER TABLE [dbo].[performance] CHECK CONSTRAINT [FK_performance_composition]
GO
ALTER TABLE [dbo].[performance]  WITH CHECK ADD  CONSTRAINT [FK_performance_concert] FOREIGN KEY([performed_in])
REFERENCES [dbo].[concert] ([concert_no])
GO
ALTER TABLE [dbo].[performance] CHECK CONSTRAINT [FK_performance_concert]
GO
ALTER TABLE [dbo].[performance]  WITH CHECK ADD  CONSTRAINT [FK_performance_musician] FOREIGN KEY([conducted_by])
REFERENCES [dbo].[musician] ([m_no])
GO
ALTER TABLE [dbo].[performance] CHECK CONSTRAINT [FK_performance_musician]
GO
ALTER TABLE [dbo].[performer]  WITH CHECK ADD  CONSTRAINT [FK_performer_musician] FOREIGN KEY([perf_is])
REFERENCES [dbo].[musician] ([m_no])
GO
ALTER TABLE [dbo].[performer] CHECK CONSTRAINT [FK_performer_musician]
GO
ALTER TABLE [dbo].[plays_in]  WITH CHECK ADD  CONSTRAINT [FK_plays_in_band] FOREIGN KEY([band_id])
REFERENCES [dbo].[band] ([band_no])
GO
ALTER TABLE [dbo].[plays_in] CHECK CONSTRAINT [FK_plays_in_band]
GO
ALTER TABLE [dbo].[plays_in]  WITH CHECK ADD  CONSTRAINT [FK_plays_in_performer] FOREIGN KEY([player])
REFERENCES [dbo].[performer] ([perf_no])
GO
ALTER TABLE [dbo].[plays_in] CHECK CONSTRAINT [FK_plays_in_performer]
GO
USE [master]
GO
ALTER DATABASE [Musicians] SET  READ_WRITE 
GO
