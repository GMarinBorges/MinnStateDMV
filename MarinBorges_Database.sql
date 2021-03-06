USE [master]
GO
/****** Object:  Database [MinnStateDMV]    Script Date: 5/12/2022 10:09:07 PM ******/
CREATE DATABASE [MinnStateDMV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MinnStateDMV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MinnStateDMV.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MinnStateDMV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MinnStateDMV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MinnStateDMV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MinnStateDMV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MinnStateDMV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MinnStateDMV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MinnStateDMV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MinnStateDMV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MinnStateDMV] SET ARITHABORT OFF 
GO
ALTER DATABASE [MinnStateDMV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MinnStateDMV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MinnStateDMV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MinnStateDMV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MinnStateDMV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MinnStateDMV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MinnStateDMV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MinnStateDMV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MinnStateDMV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MinnStateDMV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MinnStateDMV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MinnStateDMV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MinnStateDMV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MinnStateDMV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MinnStateDMV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MinnStateDMV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MinnStateDMV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MinnStateDMV] SET RECOVERY FULL 
GO
ALTER DATABASE [MinnStateDMV] SET  MULTI_USER 
GO
ALTER DATABASE [MinnStateDMV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MinnStateDMV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MinnStateDMV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MinnStateDMV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MinnStateDMV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MinnStateDMV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MinnStateDMV', N'ON'
GO
ALTER DATABASE [MinnStateDMV] SET QUERY_STORE = OFF
GO
USE [MinnStateDMV]
GO
/****** Object:  Table [dbo].[DMVPersonnel]    Script Date: 5/12/2022 10:09:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMVPersonnel](
	[DMVID] [int] NOT NULL,
	[DMVFirstName] [nvarchar](50) NULL,
	[DMVLastName] [nvarchar](50) NULL,
	[DMVEmail] [nvarchar](50) NULL,
	[DMVBirthDate] [date] NULL,
	[DMVHiredOn] [date] NULL,
	[DMVStreet] [nvarchar](50) NULL,
	[DMVCity] [nvarchar](50) NULL,
	[DMVState] [nvarchar](50) NULL,
	[DMVZip] [int] NULL,
 CONSTRAINT [PK_DMVPersonnel] PRIMARY KEY CLUSTERED 
(
	[DMVID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 5/12/2022 10:09:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[DriverFirstName] [nvarchar](50) NOT NULL,
	[DriverLastName] [nvarchar](50) NULL,
	[DriverBirthDate] [date] NULL,
	[DriverSSN] [int] NOT NULL,
	[DriverPlateNumber] [nvarchar](50) NOT NULL,
	[DriverStreet] [nvarchar](50) NULL,
	[DriverCity] [nvarchar](50) NULL,
	[DriverState] [nvarchar](50) NULL,
	[DriverZip] [int] NULL,
 CONSTRAINT [PK_Drivers] PRIMARY KEY CLUSTERED 
(
	[DriverFirstName] ASC,
	[DriverSSN] ASC,
	[DriverPlateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infractions]    Script Date: 5/12/2022 10:09:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infractions](
	[InfractionsID] [int] NOT NULL,
	[LawID] [int] NULL,
	[VehicleID] [int] NULL,
	[InfractionType] [nvarchar](50) NULL,
	[InfractionAmount] [money] NULL,
	[DriverFirstName] [nvarchar](50) NULL,
	[DriverSSN] [int] NULL,
	[DriverPlateNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Infractions] PRIMARY KEY CLUSTERED 
(
	[InfractionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LawPersonnel]    Script Date: 5/12/2022 10:09:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LawPersonnel](
	[LawID] [int] NOT NULL,
	[LawFirstName] [nvarchar](50) NULL,
	[LastLastName] [nvarchar](50) NULL,
	[LawEmail] [nvarchar](50) NULL,
	[LawBirthDate] [date] NULL,
	[LawHiredOn] [date] NULL,
	[LawStreet] [nvarchar](50) NULL,
	[LawCity] [nvarchar](50) NULL,
	[LawState] [nvarchar](50) NULL,
	[LawZip] [int] NULL,
 CONSTRAINT [PK_LawPersonnel] PRIMARY KEY CLUSTERED 
(
	[LawID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 5/12/2022 10:09:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [int] NOT NULL,
	[DMVID] [int] NULL,
	[VehicleModel] [nvarchar](50) NULL,
	[VehicleColor] [nvarchar](50) NULL,
	[DriverFirstName] [nvarchar](50) NULL,
	[DriverSSN] [int] NULL,
	[DriverPlateNumber] [nvarchar](50) NULL,
	[Insurance] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DMVPersonnel] ([DMVID], [DMVFirstName], [DMVLastName], [DMVEmail], [DMVBirthDate], [DMVHiredOn], [DMVStreet], [DMVCity], [DMVState], [DMVZip]) VALUES (1, N'Fahmida', N'Zuniga', N'Fahmida@DMV.com', CAST(N'1984-05-16' AS Date), CAST(N'2018-03-05' AS Date), N'31198 Norgrens Rd', N'Ashby', N'MN', 56309)
INSERT [dbo].[DMVPersonnel] ([DMVID], [DMVFirstName], [DMVLastName], [DMVEmail], [DMVBirthDate], [DMVHiredOn], [DMVStreet], [DMVCity], [DMVState], [DMVZip]) VALUES (2, N'Rocky', N'Moore', N'Rocky@DMV.com', CAST(N'1996-04-20' AS Date), CAST(N'2017-08-16' AS Date), N'4274 Harbor Dr', N'Nisswa', N'MN', 56468)
INSERT [dbo].[DMVPersonnel] ([DMVID], [DMVFirstName], [DMVLastName], [DMVEmail], [DMVBirthDate], [DMVHiredOn], [DMVStreet], [DMVCity], [DMVState], [DMVZip]) VALUES (3, N'Fahima', N'Iles', N'Fahima@DMV.com', CAST(N'1973-07-27' AS Date), CAST(N'2017-03-19' AS Date), N'5889 Corleen Dr', N'Nisswa', N'MN', 56468)
INSERT [dbo].[DMVPersonnel] ([DMVID], [DMVFirstName], [DMVLastName], [DMVEmail], [DMVBirthDate], [DMVHiredOn], [DMVStreet], [DMVCity], [DMVState], [DMVZip]) VALUES (4, N'Awais', N'Wade', N'Awais@DMV.com', CAST(N'1973-10-01' AS Date), CAST(N'2017-03-28' AS Date), N'424 W 1st St', N'Duluth', N'MN', 55802)
INSERT [dbo].[DMVPersonnel] ([DMVID], [DMVFirstName], [DMVLastName], [DMVEmail], [DMVBirthDate], [DMVHiredOn], [DMVStreet], [DMVCity], [DMVState], [DMVZip]) VALUES (5, N'Caoimhe', N'Levine', N'Caoimhe@DMV.com', CAST(N'1973-05-20' AS Date), CAST(N'2021-03-06' AS Date), N'5356 Roosevelt St', N'Duluth', N'MN', 55807)
INSERT [dbo].[DMVPersonnel] ([DMVID], [DMVFirstName], [DMVLastName], [DMVEmail], [DMVBirthDate], [DMVHiredOn], [DMVStreet], [DMVCity], [DMVState], [DMVZip]) VALUES (6, N'Isaac', N'Perez', N'Isaac@DMV.com', CAST(N'1980-03-01' AS Date), CAST(N'2017-04-23' AS Date), N'11331 71st Pl N', N'Osseo', N'MN', 55369)
INSERT [dbo].[DMVPersonnel] ([DMVID], [DMVFirstName], [DMVLastName], [DMVEmail], [DMVBirthDate], [DMVHiredOn], [DMVStreet], [DMVCity], [DMVState], [DMVZip]) VALUES (7, N'Montel', N'Duncan', N'Montel@DMV.com', CAST(N'1976-05-24' AS Date), CAST(N'2020-06-05' AS Date), N'343 1st Ave SW', N'Forest Lake', N'MN', 55025)
INSERT [dbo].[DMVPersonnel] ([DMVID], [DMVFirstName], [DMVLastName], [DMVEmail], [DMVBirthDate], [DMVHiredOn], [DMVStreet], [DMVCity], [DMVState], [DMVZip]) VALUES (8, N'Isaac', N'Knapp', N'Isaac@DMV.com', CAST(N'1980-03-14' AS Date), CAST(N'2020-05-22' AS Date), N'9073 Pine Dr', N'Cloquet', N'MN', 55720)
INSERT [dbo].[DMVPersonnel] ([DMVID], [DMVFirstName], [DMVLastName], [DMVEmail], [DMVBirthDate], [DMVHiredOn], [DMVStreet], [DMVCity], [DMVState], [DMVZip]) VALUES (9, N'Efan', N'Ponce', N'Efan@DMV.com', CAST(N'1978-10-30' AS Date), CAST(N'2019-11-24' AS Date), N'6348 236th Street Cir N', N'Forest Lake', N'MN', 55025)
INSERT [dbo].[DMVPersonnel] ([DMVID], [DMVFirstName], [DMVLastName], [DMVEmail], [DMVBirthDate], [DMVHiredOn], [DMVStreet], [DMVCity], [DMVState], [DMVZip]) VALUES (10, N'Roseann', N'Gilliam', N'Roseann@DMV.com', CAST(N'1996-01-01' AS Date), CAST(N'2020-03-03' AS Date), N'5350 140th Ave NW', N'Anoka', N'MN', 55303)
GO
INSERT [dbo].[Drivers] ([DriverFirstName], [DriverLastName], [DriverBirthDate], [DriverSSN], [DriverPlateNumber], [DriverStreet], [DriverCity], [DriverState], [DriverZip]) VALUES (N'Blake', N'Blake', CAST(N'1996-03-02' AS Date), 584211110, N'H982418', N'624 29th St NW', N'Rochester', N'MN', 55901)
INSERT [dbo].[Drivers] ([DriverFirstName], [DriverLastName], [DriverBirthDate], [DriverSSN], [DriverPlateNumber], [DriverStreet], [DriverCity], [DriverState], [DriverZip]) VALUES (N'Boby', N'Califormia', CAST(N'1998-10-13' AS Date), 933747135, N'LTJ0835', N'14996 Mustang Path', N'Savage', N'MN', 55378)
INSERT [dbo].[Drivers] ([DriverFirstName], [DriverLastName], [DriverBirthDate], [DriverSSN], [DriverPlateNumber], [DriverStreet], [DriverCity], [DriverState], [DriverZip]) VALUES (N'Dexter', N'Dakota', CAST(N'1994-07-10' AS Date), 497114302, N'8CLV268', N'2523 Ocarina Dr', N'Sauk Rapids', N'MN', 56379)
INSERT [dbo].[Drivers] ([DriverFirstName], [DriverLastName], [DriverBirthDate], [DriverSSN], [DriverPlateNumber], [DriverStreet], [DriverCity], [DriverState], [DriverZip]) VALUES (N'Dracula', N'Transilvania', CAST(N'1996-09-12' AS Date), 580742726, N'6FJW805', N'Po Box 578', N'Alexandria', N'MN', 56308)
INSERT [dbo].[Drivers] ([DriverFirstName], [DriverLastName], [DriverBirthDate], [DriverSSN], [DriverPlateNumber], [DriverStreet], [DriverCity], [DriverState], [DriverZip]) VALUES (N'Fito ', N'Florida', CAST(N'1995-05-08' AS Date), 719631581, N'BE69361', N'128 9th Ave N', N'Waite Park', N'MN', 56387)
INSERT [dbo].[Drivers] ([DriverFirstName], [DriverLastName], [DriverBirthDate], [DriverSSN], [DriverPlateNumber], [DriverStreet], [DriverCity], [DriverState], [DriverZip]) VALUES (N'Gustavo', N'Marin', CAST(N'1995-08-11' AS Date), 124172125, N'FMT9656', N'14565 Lakeview Cir', N'Shakopee', N'MN', 55379)
INSERT [dbo].[Drivers] ([DriverFirstName], [DriverLastName], [DriverBirthDate], [DriverSSN], [DriverPlateNumber], [DriverStreet], [DriverCity], [DriverState], [DriverZip]) VALUES (N'John', N'Bravo', CAST(N'2000-12-15' AS Date), 837218687, N'7KAA783', N'248 3rd St S #313B', N'Waite Park', N'MN', 56387)
INSERT [dbo].[Drivers] ([DriverFirstName], [DriverLastName], [DriverBirthDate], [DriverSSN], [DriverPlateNumber], [DriverStreet], [DriverCity], [DriverState], [DriverZip]) VALUES (N'Manny', N'Minnesota', CAST(N'1994-06-09' AS Date), 98720062, N'JAU3344', N'1817 64th Ave N', N'Saint Cloud', N'MN', 56303)
INSERT [dbo].[Drivers] ([DriverFirstName], [DriverLastName], [DriverBirthDate], [DriverSSN], [DriverPlateNumber], [DriverStreet], [DriverCity], [DriverState], [DriverZip]) VALUES (N'Peter', N'Pitsbur', CAST(N'1995-04-01' AS Date), 272412640, N'5WYV991', N'909 Celebration Cir', N'Sartell', N'MN', 56377)
INSERT [dbo].[Drivers] ([DriverFirstName], [DriverLastName], [DriverBirthDate], [DriverSSN], [DriverPlateNumber], [DriverStreet], [DriverCity], [DriverState], [DriverZip]) VALUES (N'Timmy', N'Texas', CAST(N'1999-11-14' AS Date), 700868466, N'1643YX', N'401 7th St S #106', N'Waite Park', N'MN', 56387)
GO
INSERT [dbo].[Infractions] ([InfractionsID], [LawID], [VehicleID], [InfractionType], [InfractionAmount], [DriverFirstName], [DriverSSN], [DriverPlateNumber]) VALUES (1, 3, 2, N'Speeding', 383.0000, N'Dexter', 497114302, N'8CLV268')
INSERT [dbo].[Infractions] ([InfractionsID], [LawID], [VehicleID], [InfractionType], [InfractionAmount], [DriverFirstName], [DriverSSN], [DriverPlateNumber]) VALUES (2, 9, 6, N'Distracted driving', 490.0000, N'Manny', 98720062, N'JAU3344')
INSERT [dbo].[Infractions] ([InfractionsID], [LawID], [VehicleID], [InfractionType], [InfractionAmount], [DriverFirstName], [DriverSSN], [DriverPlateNumber]) VALUES (3, 9, 9, N'DUI', 302.0000, N'Dracula', 580742726, N'6FJW805')
INSERT [dbo].[Infractions] ([InfractionsID], [LawID], [VehicleID], [InfractionType], [InfractionAmount], [DriverFirstName], [DriverSSN], [DriverPlateNumber]) VALUES (4, 1, 3, N'Speeding', 490.0000, N'Timmy', 700868466, N'1643YX')
INSERT [dbo].[Infractions] ([InfractionsID], [LawID], [VehicleID], [InfractionType], [InfractionAmount], [DriverFirstName], [DriverSSN], [DriverPlateNumber]) VALUES (5, 5, 5, N'DUI', 456.0000, N'Fito ', 719631581, N'BE69361')
INSERT [dbo].[Infractions] ([InfractionsID], [LawID], [VehicleID], [InfractionType], [InfractionAmount], [DriverFirstName], [DriverSSN], [DriverPlateNumber]) VALUES (6, 3, 8, N'Speeding', 317.0000, N'Blake', 584211110, N'H982418')
INSERT [dbo].[Infractions] ([InfractionsID], [LawID], [VehicleID], [InfractionType], [InfractionAmount], [DriverFirstName], [DriverSSN], [DriverPlateNumber]) VALUES (7, 5, 4, N'Distracted driving', 306.0000, N'Manny', 98720062, N'JAU3344')
INSERT [dbo].[Infractions] ([InfractionsID], [LawID], [VehicleID], [InfractionType], [InfractionAmount], [DriverFirstName], [DriverSSN], [DriverPlateNumber]) VALUES (8, 4, 10, N'Distracted driving', 456.0000, N'Timmy', 700868466, N'1643YX')
INSERT [dbo].[Infractions] ([InfractionsID], [LawID], [VehicleID], [InfractionType], [InfractionAmount], [DriverFirstName], [DriverSSN], [DriverPlateNumber]) VALUES (9, 6, 1, N'Speeding', 364.0000, N'John', 837218687, N'7KAA783')
INSERT [dbo].[Infractions] ([InfractionsID], [LawID], [VehicleID], [InfractionType], [InfractionAmount], [DriverFirstName], [DriverSSN], [DriverPlateNumber]) VALUES (10, 5, 3, N'Speeding', 477.0000, N'Fito ', 719631581, N'BE69361')
GO
INSERT [dbo].[LawPersonnel] ([LawID], [LawFirstName], [LastLastName], [LawEmail], [LawBirthDate], [LawHiredOn], [LawStreet], [LawCity], [LawState], [LawZip]) VALUES (1, N'Donut', N'Coffe', N'Donut@law.com', CAST(N'1995-12-30' AS Date), CAST(N'2020-12-03' AS Date), N'815 #1893 252', N'Lakeland', N'MN', 55043)
INSERT [dbo].[LawPersonnel] ([LawID], [LawFirstName], [LastLastName], [LawEmail], [LawBirthDate], [LawHiredOn], [LawStreet], [LawCity], [LawState], [LawZip]) VALUES (2, N'Cake', N'Milk ', N'Cake@law.com', CAST(N'1983-01-05' AS Date), CAST(N'2017-11-25' AS Date), N'16240 Hillcrest Ln', N'Eden Prairie', N'MN', 55346)
INSERT [dbo].[LawPersonnel] ([LawID], [LawFirstName], [LastLastName], [LawEmail], [LawBirthDate], [LawHiredOn], [LawStreet], [LawCity], [LawState], [LawZip]) VALUES (3, N'Cookie', N'Chocolate', N'Cookie@law.com', CAST(N'1989-10-19' AS Date), CAST(N'2017-05-10' AS Date), N'404 Perry St', N'Eagle Lake', N'MN', 56024)
INSERT [dbo].[LawPersonnel] ([LawID], [LawFirstName], [LastLastName], [LawEmail], [LawBirthDate], [LawHiredOn], [LawStreet], [LawCity], [LawState], [LawZip]) VALUES (4, N'Jello', N'Red', N'Jello@law.com', CAST(N'1986-04-12' AS Date), CAST(N'2017-07-22' AS Date), N'1301 2nd St NW', N'Waseca', N'MN', 56093)
INSERT [dbo].[LawPersonnel] ([LawID], [LawFirstName], [LastLastName], [LawEmail], [LawBirthDate], [LawHiredOn], [LawStreet], [LawCity], [LawState], [LawZip]) VALUES (5, N'Pudin', N'Dessert', N'Pudin@law.com', CAST(N'1989-09-30' AS Date), CAST(N'2021-03-29' AS Date), N'1301 2nd St NW', N'Waseca', N'MN', 56093)
INSERT [dbo].[LawPersonnel] ([LawID], [LawFirstName], [LastLastName], [LawEmail], [LawBirthDate], [LawHiredOn], [LawStreet], [LawCity], [LawState], [LawZip]) VALUES (6, N'Coke', N'Soda', N'Coke@law.com', CAST(N'1999-12-18' AS Date), CAST(N'2017-01-08' AS Date), N'116 14th Ave NW', N'Waseca', N'MN', 56093)
INSERT [dbo].[LawPersonnel] ([LawID], [LawFirstName], [LastLastName], [LawEmail], [LawBirthDate], [LawHiredOn], [LawStreet], [LawCity], [LawState], [LawZip]) VALUES (7, N'Calvin', N'Candy', N'Calvin@law.com', CAST(N'2004-02-03' AS Date), CAST(N'2020-03-05' AS Date), N'810 Bristol Ln NE', N'Rochester', N'MN', 55906)
INSERT [dbo].[LawPersonnel] ([LawID], [LawFirstName], [LastLastName], [LawEmail], [LawBirthDate], [LawHiredOn], [LawStreet], [LawCity], [LawState], [LawZip]) VALUES (8, N'Willie', N'Candyman', N'Willie@law.com', CAST(N'1984-05-16' AS Date), CAST(N'2019-12-08' AS Date), N'22 N Broadway Ave', N'Rochester', N'MN', 55906)
INSERT [dbo].[LawPersonnel] ([LawID], [LawFirstName], [LastLastName], [LawEmail], [LawBirthDate], [LawHiredOn], [LawStreet], [LawCity], [LawState], [LawZip]) VALUES (9, N'Fruity', N'Fruit', N'Fruity@law.com', CAST(N'2000-06-25' AS Date), CAST(N'2021-01-19' AS Date), N'3039 30th Ave SE #134 S', N'Stewartville', N'MN', 55976)
INSERT [dbo].[LawPersonnel] ([LawID], [LawFirstName], [LastLastName], [LawEmail], [LawBirthDate], [LawHiredOn], [LawStreet], [LawCity], [LawState], [LawZip]) VALUES (10, N'Cereal', N'Killer', N'Cereal@law.com', CAST(N'1993-01-12' AS Date), CAST(N'2021-03-14' AS Date), N'8802 261st Ave NW', N'Zimmerman', N'MN', 55398)
GO
INSERT [dbo].[Vehicles] ([VehicleID], [DMVID], [VehicleModel], [VehicleColor], [DriverFirstName], [DriverSSN], [DriverPlateNumber], [Insurance]) VALUES (1, 6, N'Suzuki LT-R450', N'Red', N'Dexter', 497114302, N'8CLV268', N'WWW')
INSERT [dbo].[Vehicles] ([VehicleID], [DMVID], [VehicleModel], [VehicleColor], [DriverFirstName], [DriverSSN], [DriverPlateNumber], [Insurance]) VALUES (2, 10, N'Chrysler 300', N'Black', N'Manny', 98720062, N'JAU3344', N'AllCities')
INSERT [dbo].[Vehicles] ([VehicleID], [DMVID], [VehicleModel], [VehicleColor], [DriverFirstName], [DriverSSN], [DriverPlateNumber], [Insurance]) VALUES (3, 5, N'Ford E-250', N'White', N'Dracula', 580742726, N'6FJW805', N'LibertyI ndividual')
INSERT [dbo].[Vehicles] ([VehicleID], [DMVID], [VehicleModel], [VehicleColor], [DriverFirstName], [DriverSSN], [DriverPlateNumber], [Insurance]) VALUES (4, 4, N'Mercedes-Benz CLS63', N'Yellow', N'Timmy', 700868466, N'1643YX', N'Nation Narrow')
INSERT [dbo].[Vehicles] ([VehicleID], [DMVID], [VehicleModel], [VehicleColor], [DriverFirstName], [DriverSSN], [DriverPlateNumber], [Insurance]) VALUES (5, 3, N'Ford E-450', N'Blue', N'Fito ', 719631581, N'BE69361', N'State City')
INSERT [dbo].[Vehicles] ([VehicleID], [DMVID], [VehicleModel], [VehicleColor], [DriverFirstName], [DriverSSN], [DriverPlateNumber], [Insurance]) VALUES (6, 5, N'Lexus GS350', N'Red', N'Blake', 584211110, N'H982418', N'Decelerate')
INSERT [dbo].[Vehicles] ([VehicleID], [DMVID], [VehicleModel], [VehicleColor], [DriverFirstName], [DriverSSN], [DriverPlateNumber], [Insurance]) VALUES (7, 7, N'Kia RIO', N'Green', N'Manny', 98720062, N'JAU3344', N'Speed Mercury')
INSERT [dbo].[Vehicles] ([VehicleID], [DMVID], [VehicleModel], [VehicleColor], [DriverFirstName], [DriverSSN], [DriverPlateNumber], [Insurance]) VALUES (8, 8, N'Toyota VENZA', N'Black', N'Timmy', 700868466, N'1643YX', N'USCarS')
INSERT [dbo].[Vehicles] ([VehicleID], [DMVID], [VehicleModel], [VehicleColor], [DriverFirstName], [DriverSSN], [DriverPlateNumber], [Insurance]) VALUES (9, 1, N'Audi A8', N'White', N'John', 837218687, N'7KAA783', N'Don''t Die')
INSERT [dbo].[Vehicles] ([VehicleID], [DMVID], [VehicleModel], [VehicleColor], [DriverFirstName], [DriverSSN], [DriverPlateNumber], [Insurance]) VALUES (10, 7, N'Acura ILX', N'Blue', N'Fito ', 719631581, N'BE69361', N'We won''t pay')
GO
ALTER TABLE [dbo].[Infractions]  WITH CHECK ADD  CONSTRAINT [FK_Infractions_Drivers] FOREIGN KEY([DriverFirstName], [DriverSSN], [DriverPlateNumber])
REFERENCES [dbo].[Drivers] ([DriverFirstName], [DriverSSN], [DriverPlateNumber])
GO
ALTER TABLE [dbo].[Infractions] CHECK CONSTRAINT [FK_Infractions_Drivers]
GO
ALTER TABLE [dbo].[Infractions]  WITH CHECK ADD  CONSTRAINT [FK_Infractions_LawPersonnel] FOREIGN KEY([LawID])
REFERENCES [dbo].[LawPersonnel] ([LawID])
GO
ALTER TABLE [dbo].[Infractions] CHECK CONSTRAINT [FK_Infractions_LawPersonnel]
GO
ALTER TABLE [dbo].[Infractions]  WITH CHECK ADD  CONSTRAINT [FK_Infractions_Vehicles] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
GO
ALTER TABLE [dbo].[Infractions] CHECK CONSTRAINT [FK_Infractions_Vehicles]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_DMVPersonnel] FOREIGN KEY([DMVID])
REFERENCES [dbo].[DMVPersonnel] ([DMVID])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Vehicles_DMVPersonnel]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_Drivers] FOREIGN KEY([DriverFirstName], [DriverSSN], [DriverPlateNumber])
REFERENCES [dbo].[Drivers] ([DriverFirstName], [DriverSSN], [DriverPlateNumber])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Vehicles_Drivers]
GO
USE [master]
GO
ALTER DATABASE [MinnStateDMV] SET  READ_WRITE 
GO
