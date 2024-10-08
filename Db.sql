USE [master]
GO
/****** Object:  Database [SatisVT]    Script Date: 9/3/2024 5:16:05 PM ******/
CREATE DATABASE [SatisVT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SatisVT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SatisVT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SatisVT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SatisVT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SatisVT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SatisVT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SatisVT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SatisVT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SatisVT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SatisVT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SatisVT] SET ARITHABORT OFF 
GO
ALTER DATABASE [SatisVT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SatisVT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SatisVT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SatisVT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SatisVT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SatisVT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SatisVT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SatisVT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SatisVT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SatisVT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SatisVT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SatisVT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SatisVT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SatisVT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SatisVT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SatisVT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SatisVT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SatisVT] SET RECOVERY FULL 
GO
ALTER DATABASE [SatisVT] SET  MULTI_USER 
GO
ALTER DATABASE [SatisVT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SatisVT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SatisVT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SatisVT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SatisVT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SatisVT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SatisVT', N'ON'
GO
ALTER DATABASE [SatisVT] SET QUERY_STORE = ON
GO
ALTER DATABASE [SatisVT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SatisVT]
GO
/****** Object:  Table [dbo].[tblkategori]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblkategori](
	[kategoriId] [tinyint] IDENTITY(1,1) NOT NULL,
	[kategoriAd] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[kategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[test1]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create view test1
--as
--select * from tblkategori

--select * from test1

CREATE view [dbo].[test1]
as
select * from tblkategori where kategoriId < 4
GO
/****** Object:  Table [dbo].[tblürünler]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblürünler](
	[ürünId] [int] IDENTITY(1,1) NOT NULL,
	[ürünAd] [varchar](30) NULL,
	[ürünMarka] [varchar](30) NULL,
	[kategori] [tinyint] NULL,
	[ürünAlışFiyat] [decimal](18, 2) NULL,
	[ürünSatışFiyat] [decimal](18, 2) NULL,
	[ürünStok] [smallint] NULL,
	[ürünDurum] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ürünId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[test2]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[test2]
AS
SELECT        dbo.tblürünler.ürünId, dbo.tblürünler.ürünAd, dbo.tblürünler.ürünMarka, dbo.tblkategori.kategoriAd
FROM            dbo.tblkategori INNER JOIN
                         dbo.tblürünler ON dbo.tblkategori.kategoriId = dbo.tblürünler.kategori
WHERE        (dbo.tblürünler.ürünAd LIKE '%a%')
GO
/****** Object:  Table [dbo].[tblpersonel]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblpersonel](
	[personelId] [smallint] IDENTITY(1,1) NOT NULL,
	[personelAdSoyad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[personelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblmüşteri]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblmüşteri](
	[müşteriId] [int] IDENTITY(1,1) NOT NULL,
	[müşteriAd] [varchar](20) NULL,
	[müşteriSoyad] [varchar](20) NULL,
	[müşteriŞehir] [varchar](13) NULL,
	[müşteriBakiye] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[müşteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[test3]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[test3]
AS
SELECT        dbo.tblürünler.ürünAd, dbo.tblmüşteri.müşteriAd, dbo.tblmüşteri.müşteriSoyad, dbo.tblpersonel.personelAdSoyad, dbo.tblharaket.tutar, dbo.tblharaket.adet, dbo.tblharaket.tarih, dbo.tblmüşteri.müşteriŞehir
FROM            dbo.tblharaket INNER JOIN
                         dbo.tblürünler ON dbo.tblharaket.ürün = dbo.tblürünler.ürünId INNER JOIN
                         dbo.tblpersonel ON dbo.tblharaket.personel = dbo.tblpersonel.personelId INNER JOIN
                         dbo.tblmüşteri ON dbo.tblharaket.müşteri = dbo.tblmüşteri.müşteriId
WHERE        (dbo.tblmüşteri.müşteriŞehir = 'Adana') AND (dbo.tblharaket.adet = 1) AND (dbo.tblharaket.tutar < 5000)
GO
/****** Object:  Table [dbo].[tblhareket]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblhareket](
	[haraketId] [int] IDENTITY(1,1) NOT NULL,
	[ürün] [int] NULL,
	[müşteri] [int] NULL,
	[personel] [smallint] NULL,
	[adet] [int] NULL,
	[tutar] [decimal](18, 2) NULL,
	[tarih] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[haraketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblkasa]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblkasa](
	[Toplam] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblsayac]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblsayac](
	[işlem] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblşehirler]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblşehirler](
	[plaka] [char](2) NOT NULL,
	[şehir] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbltplkategori]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbltplkategori](
	[adet] [tinyint] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblhareket] ON 

INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (1, 2, 1, 1, 1, CAST(5299.00 AS Decimal(18, 2)), CAST(N'2024-09-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (2, 3, 4, 1, 1, CAST(4588.00 AS Decimal(18, 2)), CAST(N'2019-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (3, 6, 4, 1, 1, CAST(1478.00 AS Decimal(18, 2)), CAST(N'2019-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (4, 10, 4, 1, 1, CAST(2435.00 AS Decimal(18, 2)), CAST(N'2019-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (5, 3, 5, 1, 1, CAST(4588.00 AS Decimal(18, 2)), CAST(N'2019-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (6, 7, 5, 1, 2, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2019-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (7, 1, 3, 3, 1, CAST(3000.00 AS Decimal(18, 2)), CAST(N'2019-10-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (8, 4, 3, 3, 1, CAST(5500.00 AS Decimal(18, 2)), CAST(N'2019-10-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (9, 9, 3, 3, 1, CAST(35.00 AS Decimal(18, 2)), CAST(N'2019-10-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (10, 10, 3, 3, 1, CAST(2453.00 AS Decimal(18, 2)), CAST(N'2019-10-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (11, 1, 2, 2, 1, CAST(3000.00 AS Decimal(18, 2)), CAST(N'2019-10-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (12, 1, 1, 2, 1, CAST(4588.00 AS Decimal(18, 2)), CAST(N'2019-10-03T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (13, 10, 1, 2, 1, CAST(2453.00 AS Decimal(18, 2)), CAST(N'2019-10-03T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (14, 2, 4, 1, 1, CAST(3000.00 AS Decimal(18, 2)), CAST(N'2019-10-04T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (15, 3, 4, 1, 1, CAST(5500.00 AS Decimal(18, 2)), CAST(N'2019-10-04T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (16, 9, 5, 2, 3, CAST(105.00 AS Decimal(18, 2)), CAST(N'2019-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (17, 10, 5, 1, 1, CAST(2453.00 AS Decimal(18, 2)), CAST(N'2019-07-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblhareket] ([haraketId], [ürün], [müşteri], [personel], [adet], [tutar], [tarih]) VALUES (18, 1, 1, 3, 2, CAST(10598.00 AS Decimal(18, 2)), CAST(N'2024-02-09T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tblhareket] OFF
GO
INSERT [dbo].[tblkasa] ([Toplam]) VALUES (CAST(50022.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[tblkategori] ON 

INSERT [dbo].[tblkategori] ([kategoriId], [kategoriAd]) VALUES (1, N'Bilgisayar')
INSERT [dbo].[tblkategori] ([kategoriId], [kategoriAd]) VALUES (2, N'Beyaz Eşya')
INSERT [dbo].[tblkategori] ([kategoriId], [kategoriAd]) VALUES (3, N'Küçük Ev Aleti')
INSERT [dbo].[tblkategori] ([kategoriId], [kategoriAd]) VALUES (4, N'TV')
INSERT [dbo].[tblkategori] ([kategoriId], [kategoriAd]) VALUES (7, N'Mobilya')
INSERT [dbo].[tblkategori] ([kategoriId], [kategoriAd]) VALUES (8, N'Diğer')
SET IDENTITY_INSERT [dbo].[tblkategori] OFF
GO
SET IDENTITY_INSERT [dbo].[tblmüşteri] ON 

INSERT [dbo].[tblmüşteri] ([müşteriId], [müşteriAd], [müşteriSoyad], [müşteriŞehir], [müşteriBakiye]) VALUES (1, N'Berkay', N'Karaduman', N'Gaziantep', CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblmüşteri] ([müşteriId], [müşteriAd], [müşteriSoyad], [müşteriŞehir], [müşteriBakiye]) VALUES (2, N'Verysel', N'Yıldırım', N'Adana', CAST(18000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblmüşteri] ([müşteriId], [müşteriAd], [müşteriSoyad], [müşteriŞehir], [müşteriBakiye]) VALUES (3, N'Emel', N'Özbey', N'Ankara', CAST(21000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblmüşteri] ([müşteriId], [müşteriAd], [müşteriSoyad], [müşteriŞehir], [müşteriBakiye]) VALUES (4, N'Aslı', N'Yıldırım', N'Bursa', CAST(16000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblmüşteri] ([müşteriId], [müşteriAd], [müşteriSoyad], [müşteriŞehir], [müşteriBakiye]) VALUES (5, N'Mehmet', N'Tunca', N'Adana', CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblmüşteri] ([müşteriId], [müşteriAd], [müşteriSoyad], [müşteriŞehir], [müşteriBakiye]) VALUES (6, N'Ayşegül', N'Özhan', N'İstanbul', CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblmüşteri] ([müşteriId], [müşteriAd], [müşteriSoyad], [müşteriŞehir], [müşteriBakiye]) VALUES (8, N'Salim', N'Çınar', N'Bitlis', CAST(35000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tblmüşteri] OFF
GO
SET IDENTITY_INSERT [dbo].[tblpersonel] ON 

INSERT [dbo].[tblpersonel] ([personelId], [personelAdSoyad]) VALUES (1, N'ALİ ÇINAR')
INSERT [dbo].[tblpersonel] ([personelId], [personelAdSoyad]) VALUES (2, N'MURAT YILMAZ')
INSERT [dbo].[tblpersonel] ([personelId], [personelAdSoyad]) VALUES (3, N'AYŞE ÖZTÜRK')
SET IDENTITY_INSERT [dbo].[tblpersonel] OFF
GO
INSERT [dbo].[tblsayac] ([işlem]) VALUES (19)
GO
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'01', N'Adana')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'02', N'Adıyaman')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'03', N'Afyon')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'04', N'Ağrı')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'05', N'Amasya')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'06', N'Ankara')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'07', N'Antalya')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'08', N'Artvin')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'09', N'Aydın')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'10', N'Balıkesir')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'11', N'Bilecik')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'12', N'Bingöl')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'13', N'Bitlis')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'14', N'Bolu')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'15', N'Burdur')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'16', N'Bursa')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'17', N'Çanakkale')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'18', N'Çankırı')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'19', N'Çorum')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'20', N'Denizli')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'21', N'Diyarbakır')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'22', N'Edirne')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'23', N'Elazığ')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'24', N'Erzincan')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'25', N'Erzurum')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'26', N'Eskişehir')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'27', N'Gaziantep')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'28', N'Giresun')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'29', N'Gümüşhane')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'30', N'Hakkari')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'31', N'Hatay')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'32', N'Isparta')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'33', N'Mersin')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'34', N'İstanbul')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'35', N'İzmir')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'36', N'Kars')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'37', N'Kastamonu')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'38', N'Kayseri')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'39', N'Kırklareli')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'40', N'Kırşehir')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'41', N'Kocaeli')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'42', N'Konya')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'43', N'Kütahya')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'44', N'Malatya')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'45', N'Manisa')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'46', N'K.Maraş')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'47', N'Mardin')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'48', N'Muğla')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'49', N'Muş')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'50', N'Nevşehir')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'51', N'Niğde')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'52', N'Ordu')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'53', N'Rize')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'54', N'Sakarya')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'55', N'Samsun')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'56', N'Siirt')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'57', N'Sinop')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'58', N'Sivas')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'59', N'Tekirdağ')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'60', N'Tokat')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'61', N'Trabzon')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'62', N'Tunceli')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'63', N'Şanlıurfa')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'64', N'Uşak')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'65', N'Van')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'66', N'Yozgat')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'67', N'Zonguldak')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'68', N'Aksaray')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'69', N'Bayburt')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'70', N'Karaman')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'71', N'Kırıkkale')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'72', N'Batman')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'73', N'Şırnak')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'74', N'Bartın')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'75', N'Ardahan')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'76', N'Iğdır')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'77', N'Yalova')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'78', N'Karabük')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'79', N'Kilis')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'80', N'Osmaniye')
INSERT [dbo].[tblşehirler] ([plaka], [şehir]) VALUES (N'81', N'Düzce')
GO
INSERT [dbo].[tbltplkategori] ([adet]) VALUES (4)
GO
SET IDENTITY_INSERT [dbo].[tblürünler] ON 

INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (1, N'Predator', N'Acer', 1, CAST(1200.00 AS Decimal(18, 2)), CAST(2750.00 AS Decimal(18, 2)), 10, 1)
INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (2, N'Rog Strix Scar 18', N'Asus', 1, CAST(2300.00 AS Decimal(18, 2)), CAST(5828.00 AS Decimal(18, 2)), 11, 1)
INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (3, N'Buzdolabı', N'Siemens', 2, CAST(4356.00 AS Decimal(18, 2)), CAST(5046.00 AS Decimal(18, 2)), 15, 1)
INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (4, N'LCD TV', N'LG', 4, CAST(2365.00 AS Decimal(18, 2)), CAST(2970.00 AS Decimal(18, 2)), 12, 1)
INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (5, N'Buzdolabı', N'Arçelik', 2, CAST(3366.00 AS Decimal(18, 2)), CAST(3800.00 AS Decimal(18, 2)), 23, 1)
INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (6, N'Çamaşır Makinesi', N'Arçelik', 2, CAST(1258.00 AS Decimal(18, 2)), CAST(1625.00 AS Decimal(18, 2)), 27, 1)
INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (7, N'Fırın', N'Siemens', 3, CAST(750.00 AS Decimal(18, 2)), CAST(1100.00 AS Decimal(18, 2)), 16, 1)
INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (8, N'Ütü', N'Siemens', 2, CAST(250.00 AS Decimal(18, 2)), CAST(422.00 AS Decimal(18, 2)), 18, 1)
INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (9, N'Su Isıstıcı', N'Arçelik', 3, CAST(20.00 AS Decimal(18, 2)), CAST(46.00 AS Decimal(18, 2)), 54, 1)
INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (10, N'Bulaşuk Makinesi', N'Bosch', 2, CAST(2236.00 AS Decimal(18, 2)), CAST(2678.00 AS Decimal(18, 2)), 15, 1)
INSERT [dbo].[tblürünler] ([ürünId], [ürünAd], [ürünMarka], [kategori], [ürünAlışFiyat], [ürünSatışFiyat], [ürünStok], [ürünDurum]) VALUES (13, N'Blender', N'Beko', 3, CAST(350.00 AS Decimal(18, 2)), CAST(650.00 AS Decimal(18, 2)), 15, 1)
SET IDENTITY_INSERT [dbo].[tblürünler] OFF
GO
ALTER TABLE [dbo].[tblürünler] ADD  DEFAULT ('1') FOR [ürünDurum]
GO
ALTER TABLE [dbo].[tblhareket]  WITH CHECK ADD  CONSTRAINT [FK_tblharaket_tblmüşteri] FOREIGN KEY([müşteri])
REFERENCES [dbo].[tblmüşteri] ([müşteriId])
GO
ALTER TABLE [dbo].[tblhareket] CHECK CONSTRAINT [FK_tblharaket_tblmüşteri]
GO
ALTER TABLE [dbo].[tblhareket]  WITH CHECK ADD  CONSTRAINT [FK_tblharaket_tblpersonel] FOREIGN KEY([personel])
REFERENCES [dbo].[tblpersonel] ([personelId])
GO
ALTER TABLE [dbo].[tblhareket] CHECK CONSTRAINT [FK_tblharaket_tblpersonel]
GO
ALTER TABLE [dbo].[tblhareket]  WITH CHECK ADD  CONSTRAINT [FK_tblharaket_tblürünler] FOREIGN KEY([ürün])
REFERENCES [dbo].[tblürünler] ([ürünId])
GO
ALTER TABLE [dbo].[tblhareket] CHECK CONSTRAINT [FK_tblharaket_tblürünler]
GO
ALTER TABLE [dbo].[tblürünler]  WITH CHECK ADD  CONSTRAINT [FK_tblürünler_tblkategori1] FOREIGN KEY([kategori])
REFERENCES [dbo].[tblkategori] ([kategoriId])
GO
ALTER TABLE [dbo].[tblürünler] CHECK CONSTRAINT [FK_tblürünler_tblkategori1]
GO
ALTER TABLE [dbo].[tblürünler]  WITH CHECK ADD CHECK  (([ürünStok]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[haraketler]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[haraketler]
as
select haraketId,ürünAd,left(müşteriAd,1) + '. ' + müşteriSoyad 
as 'Müşteri Ad Soyad',personelAdSoyad,adet,tutar,tarih
from tblharaket
inner join tblpersonel
on tblharaket.personel = tblpersonel.personelId
inner join tblürünler
on tblharaket.ürün = tblürünler.ürünId
inner join tblmüşteri
on tblharaket.müşteri = tblmüşteri.müşteriId
GO
/****** Object:  StoredProcedure [dbo].[stok]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stok]
@stok int
as
select * from tblürünler where ürünStok > @stok
GO
/****** Object:  StoredProcedure [dbo].[ürünDurum]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select ürünAd,ürünMarka,ürünDurum = case ürünDurum 
--when '1' then 'ürün var' 
--when '0' then 'ürün yok' end
--from tblürünler

--select ürünAd,ürünMarka,kategori = case kategori
--when '1' then 'Bilgisayar'
--when '2' then 'Beyaz Eşya'
--when '3' then 'Küçük Ev Aleti'
--when '4' then 'TV'
--when '7' then 'Mobilya'
--when '8' then 'Diğer' end
--from tblürünler

create procedure [dbo].[ürünDurum]
as
select ürünAd,ürünMarka,ürünStok,ürünStok = 
case
when ürünStok >= 1 and ürünStok <= 5 then 'Kritik seviyede'
when ürünStok >= 6 and ürünStok <= 10 then 'Takviye yapılmalı'
when ürünStok >= 11 and ürünStok <= 100 then 'Yeterli seviyede'
end
from tblürünler












GO
/****** Object:  StoredProcedure [dbo].[ürüngetir]    Script Date: 9/3/2024 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create procedure ürüngetir
--as
--select ürünAd,ürünStok,ürünMarka from tblürünler

CREATE procedure [dbo].[ürüngetir]
@deger varchar(30) = 'Buzdolabı'  --Derğişken tanımlama
as
select ürünAd,ürünStok,ürünMarka from tblürünler 
where ürünAd = @deger




--exec ürüngetir
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
         Begin Table = "tblkategori"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
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
         Alias = 900
         Table = 1170
         Output = 720
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'test1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'test1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[25] 2[21] 3) )"
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
         Begin Table = "tblkategori"
            Begin Extent = 
               Top = 46
               Left = 24
               Bottom = 142
               Right = 194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblürünler"
            Begin Extent = 
               Top = 0
               Left = 294
               Bottom = 130
               Right = 464
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
         Alias = 900
         Table = 1170
         Output = 720
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'test2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'test2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[29] 2[26] 3) )"
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
         Begin Table = "tblharaket"
            Begin Extent = 
               Top = 7
               Left = 209
               Bottom = 137
               Right = 379
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "tblürünler"
            Begin Extent = 
               Top = 4
               Left = 11
               Bottom = 134
               Right = 169
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblpersonel"
            Begin Extent = 
               Top = 37
               Left = 570
               Bottom = 133
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblmüşteri"
            Begin Extent = 
               Top = 0
               Left = 429
               Bottom = 130
               Right = 599
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
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1365
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'test3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'test3'
GO
USE [master]
GO
ALTER DATABASE [SatisVT] SET  READ_WRITE 
GO
