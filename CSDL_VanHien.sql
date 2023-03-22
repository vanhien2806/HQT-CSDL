USE [master]
GO
/****** Object:  Database [QuanLyDeAn]    Script Date: 3/22/2023 9:03:03 AM ******/
CREATE DATABASE [QuanLyDeAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyDeAn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyDeAn.mdf' , SIZE = 20480KB , MAXSIZE = 1024000KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyDeAn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyDeAn_log.ldf' , SIZE = 6144KB , MAXSIZE = 20480KB , FILEGROWTH = 5%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyDeAn] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyDeAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyDeAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyDeAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyDeAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyDeAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyDeAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyDeAn] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyDeAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyDeAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyDeAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyDeAn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyDeAn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyDeAn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyDeAn] SET QUERY_STORE = OFF
GO
USE [QuanLyDeAn]
GO
/****** Object:  Table [dbo].[DEAN]    Script Date: 3/22/2023 9:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEAN](
	[MaDA] [varchar](2) NOT NULL,
	[TenDA] [nvarchar](50) NULL,
	[DDiemDA] [varchar](20) NULL,
 CONSTRAINT [PK_DEAN] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 3/22/2023 9:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [varchar](9) NOT NULL,
	[HoNV] [nvarchar](15) NULL,
	[TenLot] [nvarchar](30) NULL,
	[TenNV] [nvarchar](30) NULL,
	[NgSinh] [smalldatetime] NULL,
	[DiaChi] [nvarchar](150) NULL,
	[Phai] [nvarchar](3) NULL,
	[Luong] [numeric](18, 0) NULL,
	[Phong] [varchar](2) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 3/22/2023 9:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[MaNV] [varchar](9) NOT NULL,
	[MaDA] [varchar](2) NOT NULL,
	[ThoiGian] [numeric](18, 0) NULL,
 CONSTRAINT [PK_PHANCONG] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 3/22/2023 9:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONGBAN](
	[MaPhg] [varchar](2) NOT NULL,
	[TenPhg] [nvarchar](30) NULL,
 CONSTRAINT [PK_PHONGBAN] PRIMARY KEY CLUSTERED 
(
	[MaPhg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THANNHAN]    Script Date: 3/22/2023 9:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANNHAN](
	[MaNV] [varchar](9) NOT NULL,
	[TenTN] [varchar](20) NOT NULL,
	[NgaySinh] [smalldatetime] NULL,
	[Phai] [varchar](3) NULL,
	[QuanHe] [varchar](15) NULL,
 CONSTRAINT [PK_THANNHAN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[TenTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DEAN] ([MaDA], [TenDA], [DDiemDA]) VALUES (N'1', N'Nâng cao chất lượng muối', N'Sa Hu?nh')
INSERT [dbo].[DEAN] ([MaDA], [TenDA], [DDiemDA]) VALUES (N'10', N'Xây dựng nhà máy chế biến thủy sản ', N'Dung Qu?t')
INSERT [dbo].[DEAN] ([MaDA], [TenDA], [DDiemDA]) VALUES (N'2', N'Phát triển hạ tầng mạng', N'Tp Qu?ng Ng?i')
INSERT [dbo].[DEAN] ([MaDA], [TenDA], [DDiemDA]) VALUES (N'20', N'Truyền tải cáp quang', N'Tp Qu?ng Ng?i')
INSERT [dbo].[DEAN] ([MaDA], [TenDA], [DDiemDA]) VALUES (N'3', N'Tin học hóa trường học ', N'Ba Tơ')
INSERT [dbo].[DEAN] ([MaDA], [TenDA], [DDiemDA]) VALUES (N'30', N'Đào tạo nhân lực ', N'T?nh Phong')
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenLot], [TenNV], [NgSinh], [DiaChi], [Phai], [Luong], [Phong]) VALUES (N'123', N'Đinh', N'Bá ', N'Tiến', CAST(N'1982-02-27T00:00:00' AS SmallDateTime), N'Mộ Đức', N'Nam', NULL, N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenLot], [TenNV], [NgSinh], [DiaChi], [Phai], [Luong], [Phong]) VALUES (N'234', N'Nguyễn', N'Thanh', N'Tùng', CAST(N'1956-08-12T00:00:00' AS SmallDateTime), N'Sơn Tịnh', N'Nam', NULL, N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenLot], [TenNV], [NgSinh], [DiaChi], [Phai], [Luong], [Phong]) VALUES (N'345', N'Bùi', N'Thúy', N'Vũ', NULL, N'Tư Nghĩa', N'Nữ', NULL, N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenLot], [TenNV], [NgSinh], [DiaChi], [Phai], [Luong], [Phong]) VALUES (N'456', N'Lê ', N'Thị', N'Nhàn', CAST(N'1962-07-12T00:00:00' AS SmallDateTime), N'Mộ Đức ', N'Nữ', NULL, N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenLot], [TenNV], [NgSinh], [DiaChi], [Phai], [Luong], [Phong]) VALUES (N'567', N'Nguyễn', N'Mạnh', N'Hùng', CAST(N'1985-03-25T00:00:00' AS SmallDateTime), N'Sơn Tịnh', N'Nam', NULL, N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenLot], [TenNV], [NgSinh], [DiaChi], [Phai], [Luong], [Phong]) VALUES (N'678', N'Trần ', N'Hồng ', N'Quang', NULL, N'Bình Sơn', N'Nam', NULL, N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenLot], [TenNV], [NgSinh], [DiaChi], [Phai], [Luong], [Phong]) VALUES (N'789', N'Trần', N'Thanh', N'Tâm', CAST(N'1972-06-17T00:00:00' AS SmallDateTime), N'Tp Quãng Ngãi', N'Nam', NULL, N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenLot], [TenNV], [NgSinh], [DiaChi], [Phai], [Luong], [Phong]) VALUES (N'890', N'Cao ', N'Thanh', N'Huyền', NULL, N'Tư Nghĩa', N'Nữ', NULL, N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenLot], [TenNV], [NgSinh], [DiaChi], [Phai], [Luong], [Phong]) VALUES (N'901', N'Vương', N'Ngọc', N'Quyền ', CAST(N'1987-12-12T00:00:00' AS SmallDateTime), N'Mộ Đức', N'Nam', NULL, N'1')
GO
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'123', N'1', CAST(33 AS Numeric(18, 0)))
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'123', N'2', CAST(8 AS Numeric(18, 0)))
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'345', N'10', CAST(10 AS Numeric(18, 0)))
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'345', N'20', CAST(10 AS Numeric(18, 0)))
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'345', N'3', CAST(10 AS Numeric(18, 0)))
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'456', N'1', CAST(20 AS Numeric(18, 0)))
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'456', N'2', CAST(20 AS Numeric(18, 0)))
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'678', N'3', CAST(40 AS Numeric(18, 0)))
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'789', N'10', CAST(35 AS Numeric(18, 0)))
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'789', N'20', CAST(30 AS Numeric(18, 0)))
INSERT [dbo].[PHANCONG] ([MaNV], [MaDA], [ThoiGian]) VALUES (N'789', N'30', CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONGBAN] ([MaPhg], [TenPhg]) VALUES (N'1', N'Quản Lí')
INSERT [dbo].[PHONGBAN] ([MaPhg], [TenPhg]) VALUES (N'4', N'Điều hành')
INSERT [dbo].[PHONGBAN] ([MaPhg], [TenPhg]) VALUES (N'5', N'Nghiêm cứu')
GO
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (N'123', N'Châu', CAST(N'2005-10-30T00:00:00' AS SmallDateTime), N'N?', N'Con gái')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (N'123', N'Duy', CAST(N'2001-10-25T00:00:00' AS SmallDateTime), N'Nam', N'Con trai')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (N'123', N'Phương', CAST(N'1985-10-30T00:00:00' AS SmallDateTime), N'N?', N'V? ch?ng')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (N'234', N'Thanh', CAST(N'1980-05-04T00:00:00' AS SmallDateTime), N'N?', N'Con gái')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (N'345', N'Dương', CAST(N'1956-10-30T00:00:00' AS SmallDateTime), N'Nam', N'V? ch?ng')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (N'345', N'Khang', CAST(N'1982-10-25T00:00:00' AS SmallDateTime), N'Nam', N'Con trai')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (N'456', N'Hùng', CAST(N'1987-01-01T00:00:00' AS SmallDateTime), N'Nam', N'Con trai')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (N'901', N'Thương', CAST(N'1989-04-05T00:00:00' AS SmallDateTime), N'N?', N'V? ch?ng')
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_PHONGBAN] FOREIGN KEY([Phong])
REFERENCES [dbo].[PHONGBAN] ([MaPhg])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_PHONGBAN]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_PHANCONG_DEAN] FOREIGN KEY([MaDA])
REFERENCES [dbo].[DEAN] ([MaDA])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_DEAN]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_PHANCONG_NHANVIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_NHANVIEN]
GO
ALTER TABLE [dbo].[THANNHAN]  WITH CHECK ADD  CONSTRAINT [FK_THANNHAN_NHANVIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[THANNHAN] CHECK CONSTRAINT [FK_THANNHAN_NHANVIEN]
GO
USE [master]
GO
ALTER DATABASE [QuanLyDeAn] SET  READ_WRITE 
GO