USE [master]
GO
/****** Object:  Database [QLSP]    Script Date: 14/10/2020 4:01:24 PM ******/
CREATE DATABASE [QLSP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLSP.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLSP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLSP_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLSP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSP] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLSP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLSP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLSP] SET  MULTI_USER 
GO
ALTER DATABASE [QLSP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLSP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLSP]
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 14/10/2020 4:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[Hoten] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Sdt] [int] NULL,
	[Diachi] [nvarchar](max) NULL,
	[NgayDat] [datetime] NULL,
	[Tongtien] [float] NULL,
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatHangDetail]    Script Date: 14/10/2020 4:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHangDetail](
	[MaCTDH] [int] IDENTITY(1,1) NOT NULL,
	[MaDH] [int] NOT NULL,
	[MaSP] [nchar](10) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[Anh] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[Gia] [int] NULL,
	[Giamgia] [float] NULL,
	[Tongtien] [float] NULL,
 CONSTRAINT [PK_DatHangDetail] PRIMARY KEY CLUSTERED 
(
	[MaCTDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 14/10/2020 4:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [nchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 14/10/2020 4:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nchar](10) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
	[MaLoai] [nchar](10) NOT NULL,
	[Anh] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DatHang] ON 

INSERT [dbo].[DatHang] ([MaDH], [MaKH], [Hoten], [Email], [Sdt], [Diachi], [NgayDat], [Tongtien]) VALUES (14, 1000, N'abc,abv', N'tdhapi@gmail.com', 243455, N'hy', CAST(N'2019-01-01 00:00:00.000' AS DateTime), 170500)
INSERT [dbo].[DatHang] ([MaDH], [MaKH], [Hoten], [Email], [Sdt], [Diachi], [NgayDat], [Tongtien]) VALUES (15, 1000, N'akj,sdsd', N'tdhapi@gmail.com', 1345, N'hưng yên', CAST(N'2019-01-01 00:00:00.000' AS DateTime), 125000)
INSERT [dbo].[DatHang] ([MaDH], [MaKH], [Hoten], [Email], [Sdt], [Diachi], [NgayDat], [Tongtien]) VALUES (16, 1000, N'abc,sfs', N'tdhapi@gmail.com', 123, N'hdgf', CAST(N'2019-01-01 00:00:00.000' AS DateTime), 10500)
INSERT [dbo].[DatHang] ([MaDH], [MaKH], [Hoten], [Email], [Sdt], [Diachi], [NgayDat], [Tongtien]) VALUES (17, 1000, N'hà,trần', N'tdhapi@gmail.com', 133334, N'hải dương', CAST(N'2019-04-12 00:00:00.000' AS DateTime), 93500)
INSERT [dbo].[DatHang] ([MaDH], [MaKH], [Hoten], [Email], [Sdt], [Diachi], [NgayDat], [Tongtien]) VALUES (18, 1000, N'abc,abc', N'tdhapi@gmail.com', 132243, N'dfgf', CAST(N'2019-04-12 00:00:00.000' AS DateTime), 73000)
INSERT [dbo].[DatHang] ([MaDH], [MaKH], [Hoten], [Email], [Sdt], [Diachi], [NgayDat], [Tongtien]) VALUES (19, 1000, N'hfgf,fgfg', N'tdhapi@gmail.com', 434, N'rtr', CAST(N'2019-04-12 00:00:00.000' AS DateTime), 62500)
SET IDENTITY_INSERT [dbo].[DatHang] OFF
SET IDENTITY_INSERT [dbo].[DatHangDetail] ON 

INSERT [dbo].[DatHangDetail] ([MaCTDH], [MaDH], [MaSP], [TenSP], [Anh], [SoLuong], [Gia], [Giamgia], [Tongtien]) VALUES (1, 17, N'SP02      ', N'Măng tây', N'', 1, 38500, 0, 38500)
INSERT [dbo].[DatHangDetail] ([MaCTDH], [MaDH], [MaSP], [TenSP], [Anh], [SoLuong], [Gia], [Giamgia], [Tongtien]) VALUES (2, 17, N'SP01      ', N'Cải bó xôi', N'', 1, 55000, 0, 55000)
INSERT [dbo].[DatHangDetail] ([MaCTDH], [MaDH], [MaSP], [TenSP], [Anh], [SoLuong], [Gia], [Giamgia], [Tongtien]) VALUES (3, 18, N'SP03      ', N'Cải bắp', N'vegetables/cabbage_300x300.jpg', 1, 52000, 0, 52000)
INSERT [dbo].[DatHangDetail] ([MaCTDH], [MaDH], [MaSP], [TenSP], [Anh], [SoLuong], [Gia], [Giamgia], [Tongtien]) VALUES (4, 18, N'SP04      ', N'Đu đủ', N'fruits/papaya_300x300.jpg', 2, 10500, 0, 21000)
INSERT [dbo].[DatHangDetail] ([MaCTDH], [MaDH], [MaSP], [TenSP], [Anh], [SoLuong], [Gia], [Giamgia], [Tongtien]) VALUES (5, 19, N'SP03      ', N'Cải bắp', N'vegetables/cabbage_300x300.jpg', 1, 52000, 0, 52000)
INSERT [dbo].[DatHangDetail] ([MaCTDH], [MaDH], [MaSP], [TenSP], [Anh], [SoLuong], [Gia], [Giamgia], [Tongtien]) VALUES (6, 19, N'SP04      ', N'Đu đủ', N'fruits/papaya_300x300.jpg', 1, 10500, 0, 10500)
SET IDENTITY_INSERT [dbo].[DatHangDetail] OFF
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'L01       ', N'Rau', N'rau')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'L02       ', N'Trái cây', N'trái cây')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'L03       ', N'Ngũ cốc', N'ngũ cốc')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [SoLuong], [DonGia], [MaLoai], [Anh]) VALUES (N'SP01      ', N'Cải bó xôi', N'Cải bó xôi (rau chân vịt) là một thành viên của họ rau dền, có nguồn gốc từ Trung Đông, được trồng ở Ba Tư cách đây hàng nghìn năm. Loại rau này được đưa vào trồng ở Trung Quốc cách đây khoảng 1.500 năm. Nó đã thâm nhập vào châu Âu vài trăm năm sau đó và nhanh chóng có mặt trong nhiều món ăn.', 10, 55000, N'L01       ', N'vegetables/spinach_300x300.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [SoLuong], [DonGia], [MaLoai], [Anh]) VALUES (N'SP02      ', N'Măng tây', N'Măng tây là một loại thực vật dùng làm rau. Cây thảo có thân mọc ngầm trong đất, thường gọi là thân rễ. Thân rễ dày, mang nhiều rễ dài, đường kính 5-6mm, màu nâu sáng, xốp. Các thân đứng mọc trong không khí lởm chởm những vết sẹo của những nhánh đã rụng', 100, 38500, N'L01       ', N'vegetables/Asparagus1_300x300.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [SoLuong], [DonGia], [MaLoai], [Anh]) VALUES (N'SP03      ', N'Cải bắp', N'Bắp cải hay cải bắp là một loại rau chủ lực trong họ Cải, phát sinh từ vùng Địa Trung Hải. Nó là cây thân thảo, sống hai năm, và là một thực vật có hoa thuộc nhóm hai lá mầm với các lá tạo thành một cụm đặc hình gần như hình cầu đặc trưng', 50, 52000, N'L01       ', N'vegetables/cabbage_300x300.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [SoLuong], [DonGia], [MaLoai], [Anh]) VALUES (N'SP04      ', N'Đu đủ', N'Đu đủ là một cây thuộc họ Đu đủ. Đây là cây thân thảo to, không hoặc ít khi có nhánh, cao từ 3–10 m. Lá to hình chân vịt, cuống dài, đường kính 50–70 cm, có khoảng 7 khía. Hoa trắng hay xanh, đài nhỏ, vành to năm cánh. Quả đu đủ to tròn, dài, khi chín mềm, hạt màu nâu hoặc đen tùy từng loại giống, có nhiều hạt', 30, 10500, N'L02       ', N'fruits/papaya_300x300.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [SoLuong], [DonGia], [MaLoai], [Anh]) VALUES (N'SP05      ', N'Bơ', N'Bơ là một loại cây cận nhiệt đới có nguồn gốc từ México và Trung Mỹ, được phân loại thực vật có hoa, hai lá mầm, họ Lauraceae. Con người biết ăn trái cây bơ từ xưa, bằng chứng là người ta tìm thấy bình nước hình trái bơ từ trước thời đại Inca tại tỉnh Chan Chan Trung Mỹ', 120, 52000, N'L02       ', N'fruits/avocado_300x300.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [SoLuong], [DonGia], [MaLoai], [Anh]) VALUES (N'SP06      ', N'Nho', N'Nho là một loại quả mọng lấy từ các loài cây thân leo thuộc chi Nho. Quả nho mọc thành chùm từ 6 đến 300 quả, chúng có màu đen, lam, vàng, lục, đỏ-tía hay trắng', 90, 120000, N'L02       ', N'fruits/grapes_300x300.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [SoLuong], [DonGia], [MaLoai], [Anh]) VALUES (N'SP07      ', N'Hạt sen', N'Hạt sen là hạt của các loài thực vật thuộc chi Sen, thường là loài Nelumbo nucifera, có vai trò quan trọng trong ẩm thực Đông Á. Hạt sen được bán dưới dạng hạt đã được làm khô hoặc bán với cả đài sen để ăn sống', 200, 150000, N'L03       ', N'nuts/lotusseed_300x300.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [SoLuong], [DonGia], [MaLoai], [Anh]) VALUES (N'SP08      ', N'Vừng đen', N'heo y học cổ truyền, vừng đen có vị ngọt, tính bình, có tác dụng dưỡng huyết, nhuận táo, bổ ngũ tạng, hư nhược, ích khí lực, bền gân cốt, sáng mắt, thêm thông minh, dùng ngoài đắp trị sưng tấy, vết bỏng và làm cao dán nhọt... Ngoài ra, hạt vừng và dầu hạt vừng được dùng để chữa táo bón, tăng cường dinh dưỡng', 140, 70000, N'L03       ', N'nuts/blacksesame_300x300.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [SoLuong], [DonGia], [MaLoai], [Anh]) VALUES (N'SP09      ', N'Dưa chuột', N'dưa chuột', 200, 15000, N'L01       ', N'vegetables/cucumber_300x300.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [SoLuong], [DonGia], [MaLoai], [Anh]) VALUES (N'SP10      ', N'Khoai tây', N'Khoai tây', 150, 20000, N'L01       ', N'vegetables/potato_300x300.jpg')
USE [master]
GO
ALTER DATABASE [QLSP] SET  READ_WRITE 
GO
