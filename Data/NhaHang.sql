USE [master]
GO
/****** Object:  Database [NhaHang]    Script Date: 11/22/2017 6:26:40 PM ******/
CREATE DATABASE [NhaHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NhaHang', FILENAME = N'D:\GITHUB\ASP\Web\NhaHang\App_Data\NhaHang.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NhaHang_log', FILENAME = N'D:\GITHUB\ASP\Web\NhaHang\App_Data\NhaHang_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NhaHang] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NhaHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NhaHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NhaHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NhaHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NhaHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NhaHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [NhaHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NhaHang] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NhaHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NhaHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NhaHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NhaHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NhaHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NhaHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NhaHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NhaHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NhaHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NhaHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NhaHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NhaHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NhaHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NhaHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NhaHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NhaHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NhaHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NhaHang] SET  MULTI_USER 
GO
ALTER DATABASE [NhaHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NhaHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NhaHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NhaHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [NhaHang]
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblAbout]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblAbout]
(
	@Original_ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblAbout] WHERE (([ID] = @Original_ID))
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblAccount]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblAccount]
(
	@Original_ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblAccount] WHERE (([ID] = @Original_ID))
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblAbout]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblAbout]
(
	@URLMap nvarchar(500),
	@Name nvarchar(200),
	@Address nvarchar(200),
	@Email nchar(200),
	@Phone1 nchar(15),
	@Phone2 nchar(15),
	@Contents ntext,
	@AccountID int,
	@CreateDate datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblAbout] ([URLMap], [Name], [Address], [Email], [Phone1], [Phone2], [Contents], [AccountID], [CreateDate]) VALUES (@URLMap, @Name, @Address, @Email, @Phone1, @Phone2, @Contents, @AccountID, @CreateDate);
	
SELECT ID, URLMap, Name, Address, Email, Phone1, Phone2, Contents, AccountID, CreateDate FROM tblAbout WHERE (ID = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblAccount]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblAccount]
(
	@Email nchar(200),
	@Password nchar(50),
	@RemeberPassword bit,
	@Type int,
	@Name nvarchar(200),
	@Avatar nvarchar(100),
	@Address nvarchar(200),
	@Phone char(15),
	@Status bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblAccount] ([Email], [Password], [RemeberPassword], [Type], [Name], [Avatar], [Address], [Phone], [Status]) VALUES (@Email, @Password, @RemeberPassword, @Type, @Name, @Avatar, @Address, @Phone, @Status);
	
SELECT ID, Email, Password, RemeberPassword, Type, Name, Avatar, Address, Phone, Status FROM tblAccount WHERE (ID = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblAbout]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblAbout]
AS
	SET NOCOUNT ON;
SELECT        tblAbout.*
FROM            tblAbout
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblAccount]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblAccount]
AS
	SET NOCOUNT ON;
SELECT        tblAccount.*
FROM            tblAccount
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblAbout]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblAbout]
(
	@URLMap nvarchar(500),
	@Name nvarchar(200),
	@Address nvarchar(200),
	@Email nchar(200),
	@Phone1 nchar(15),
	@Phone2 nchar(15),
	@Contents ntext,
	@AccountID int,
	@CreateDate datetime,
	@Original_ID int,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [tblAbout] SET [URLMap] = @URLMap, [Name] = @Name, [Address] = @Address, [Email] = @Email, [Phone1] = @Phone1, [Phone2] = @Phone2, [Contents] = @Contents, [AccountID] = @AccountID, [CreateDate] = @CreateDate WHERE (([ID] = @Original_ID));
	
SELECT ID, URLMap, Name, Address, Email, Phone1, Phone2, Contents, AccountID, CreateDate FROM tblAbout WHERE (ID = @ID)
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblAccount]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblAccount]
(
	@Email nchar(200),
	@Password nchar(50),
	@RemeberPassword bit,
	@Type int,
	@Name nvarchar(200),
	@Avatar nvarchar(100),
	@Address nvarchar(200),
	@Phone char(15),
	@Status bit,
	@Original_ID int,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [tblAccount] SET [Email] = @Email, [Password] = @Password, [RemeberPassword] = @RemeberPassword, [Type] = @Type, [Name] = @Name, [Avatar] = @Avatar, [Address] = @Address, [Phone] = @Phone, [Status] = @Status WHERE (([ID] = @Original_ID));
	
SELECT ID, Email, Password, RemeberPassword, Type, Name, Avatar, Address, Phone, Status FROM tblAccount WHERE (ID = @ID)
GO
/****** Object:  Table [dbo].[tblAbout]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAbout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[URLMap] [nvarchar](500) NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [nchar](200) NULL,
	[Phone1] [nchar](15) NULL,
	[Phone2] [nchar](15) NULL,
	[Contents] [ntext] NULL,
	[AccountID] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_ThongTinNhaHang_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](200) NOT NULL,
	[Password] [nchar](50) NOT NULL,
	[RemeberPassword] [bit] NULL,
	[Type] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [char](15) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAccountType]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_LoaiMon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[AccountID] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDeails]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDeails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tblOrderDeails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[CategoryID] [int] NULL,
	[Images] [nvarchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
	[Contents] [nvarchar](1000) NULL,
	[CreateDate] [datetime] NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_MonAn] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoom]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Images] [nvarchar](50) NULL,
	[About] [nvarchar](1000) NULL,
	[Type] [int] NULL,
	[AccountID] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_GioiThieuNhaHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoomType]    Script Date: 11/22/2017 6:26:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoomType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[AccountID] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_LoaiKhongGianNhaHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblAbout] ON 

INSERT [dbo].[tblAbout] ([ID], [URLMap], [Name], [Address], [Email], [Phone1], [Phone2], [Contents], [AccountID], [CreateDate]) VALUES (1, N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3903.5542775457907!2d108.43174131481152!3d11.936076291541085!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3171133183e34293%3A0xd50d1d446350749c!2zR2FuZXlhIFJlc3R1YXJhbnQgLSBOaMOgIEjDoG5nIE5o4bqtdCBC4bqjbg!5e0!3m2!1svi!2sin!4v1503227601502', N'GANEYA Nhật Bản', N'5A Đào Duy Từ, Phường 4, Tp. Đà Lạt', N'phuacn@gmail.com                                                                                                                                                                                        ', N'0167 394 0628  ', N'0263 354 7868  ', N'Giờ mở cửa: Ganeya Nhật Bản mở cửa 7 ngày trong tuần, buổi trưa từ 11:30AM - 2PM, buổi tối từ 5PM - 11PM.', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblAbout] OFF
SET IDENTITY_INSERT [dbo].[tblAccount] ON 

INSERT [dbo].[tblAccount] ([ID], [Email], [Password], [RemeberPassword], [Type], [Name], [Avatar], [Address], [Phone], [Status]) VALUES (1, N'congnvctk37@gmail.com                                                                                                                                                                                   ', N'fcea920f7412b5da7be0cf42b8c93759                  ', NULL, 1, N'Công', N'images.jpg', NULL, NULL, NULL)
INSERT [dbo].[tblAccount] ([ID], [Email], [Password], [RemeberPassword], [Type], [Name], [Avatar], [Address], [Phone], [Status]) VALUES (18, N'vvv@gmail.com                                                                                                                                                                                           ', N'e10adc3949ba59abbe56e057f20f883e                  ', NULL, 3, N'phuacn', N'hinh-the-dep.jpg', NULL, NULL, NULL)
INSERT [dbo].[tblAccount] ([ID], [Email], [Password], [RemeberPassword], [Type], [Name], [Avatar], [Address], [Phone], [Status]) VALUES (1027, N'Khach1@gmail.com                                                                                                                                                                                        ', N'e10adc3949ba59abbe56e057f20f883e                  ', 0, 2, N'1234', N'', NULL, NULL, NULL)
INSERT [dbo].[tblAccount] ([ID], [Email], [Password], [RemeberPassword], [Type], [Name], [Avatar], [Address], [Phone], [Status]) VALUES (1028, N'khanhvinhit@gmail.com                                                                                                                                                                                   ', N'25f9e794323b453885f5181f1b624d0b                  ', 0, 2, N'khanhvinhit', N'21557793_1945664422425482_5881026006499851471_n.jpg', N'LĐ', N'123456789      ', NULL)
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
SET IDENTITY_INSERT [dbo].[tblAccountType] ON 

INSERT [dbo].[tblAccountType] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[tblAccountType] ([ID], [Name]) VALUES (2, N'Khách Hàng')
INSERT [dbo].[tblAccountType] ([ID], [Name]) VALUES (3, N'Nhân Viên')
SET IDENTITY_INSERT [dbo].[tblAccountType] OFF
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([ID], [Name], [CreateDate], [AccountID]) VALUES (1, N'SASHIMI', NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [Name], [CreateDate], [AccountID]) VALUES (2, N'SUSHI', NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [Name], [CreateDate], [AccountID]) VALUES (3, N'MÓN LẨU', NULL, NULL)
INSERT [dbo].[tblCategory] ([ID], [Name], [CreateDate], [AccountID]) VALUES (4, N'MÓN NƯỚNG', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (1, N'Sake(Cá Hồi)', 1, N'sake-ikura-don-com-voi-ca-hoi-va-trung-ca-hoi-song.jpg', CAST(100000 AS Decimal(18, 0)), NULL, N'Cá hồi chứa lượng DHA, EPA phong phú, chất này giúp cho trí nhớ, việc học tập, ngăn chặn xơ cứng động mạch, tắc nghẽn tim mạch, thần kinh, bệnh tiểu đường, chuyển hóa cholesteron và làm tăng chức năng gan nhờ vào lượng khá lớn chất Taurine chứa trong nó. cá hồi còn chứa Canxi giúp phòng tránh chứng rỗng xương, mềm xương. Làm tăng sức khỏe cho làn da bằng Vitamin A, B, D, E. Thúc đẩy máu tuần hoàn, điều hòa nhiệt độ, Giữ cho da không bị dị ứng, khô.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (4, N'Otoro(Bụng cá ngừ)', 1, N'Otoro.jpg', CAST(100000 AS Decimal(18, 0)), NULL, N'Là phần bụng và cũng là phần có giá trị nhất bởi vị béo thơm ngon của nó. Được lấy từ lớp thịt bên dưới của cá gần với đầu cá, otoro có màu hồng nhạt bắt mắt, xen giữa là những thớ mỡ trắng đặc trưng.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (5, N'sushi trứng cá hồi', 2, N'sushi-trung-ca-hoi.jpg', CAST(50000 AS Decimal(18, 0)), NULL, N'Loài cá hồi (tự nhiên) vốn là một loại cá quý, ngon và được ưa chuộng trên khắp thế giới. Cũng như thịt cá hồi, trứng của loài cá này cũng chứa hàm lượng dinh dưỡng rất cao. Việc tách trứng khỏi cá hồi, chế biến và bảo quản vô cùng khắt khe.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (6, N'sushi thịt cá hồi', 2, N'cach-lam-sushi-ca-hoi12.jpg', CAST(80000 AS Decimal(18, 0)), NULL, N'Có nhiều cách kết hợp để ra một món sushi hoàn chỉnh. Trong đó số đó, sự kết hợp tài tình của vị tươi ngon của cá hồi cùng vị béo của bơ sáp sẽ luôn làm mọi người thích thú với món sushi các hồi. ', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (7, N'sushi dưa leo', 2, N'cach-lam-sushi-dua-chuot-5.jpg', CAST(30000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (8, N'sushi thịt cá ngừ', 2, N'ThitCaNgu.jpg', CAST(89000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (9, N'sushi nhím biển', 2, N'sushinhimbien.jpg', CAST(280000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (10, N'Lẩu Shabu Shabu', 3, N'shabu-shabu.jpg', CAST(500000 AS Decimal(18, 0)), NULL, N'Lẩu Sukiyaki và Shabu Shabu biểu trưng cho văn hóa ẩm thực tinh tế của Nhật Bản, hấp dẫn không chỉ bởi hương vị đậm đà mà còn ở cách thưởng thức khác lạ, độc đáo. Thông thường, thịt bò xắt lát mỏng được dùng để nhúng lẩu nhưng tại nhiều nơi, thịt lợn, thịt gà, thịt cừu, vịt, hoặc tôm hùm… cũng được sử dụng để nhúng lẩu. Đặc biệt, thịt bò Wagyu nổi tiếng không chỉ tại Nhật Bản mà còn trên khắp thế giới bởi vị ngon với lượng vân mỡ hoàn mĩ, hương vị tinh tế.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (11, N'Lẩu Sukiyaki', 3, N'Sukiyaki.jpg', CAST(470000 AS Decimal(18, 0)), NULL, N'Lẩu Sukiyaki có hương vị ngọt bùi xen lẫn vị mặn giống như nước sốt Teriyaki, tuy nhiên khi kết hợp giữa thịt bò Mỹ và một số loại rau ăn kèm thỳ lẩu Sukiyaki đã tạo nên hương vị riêng mà không một loại lẩu nào có thể có được. Đó cũng là điểm đặc trưng của lẩu Sukiyaki mà được người dân ở Nhật Bản rất ưa chuộng.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (12, N'Thịt nướng Yakiniku', 4, N'thitnuong.jpg', CAST(150000 AS Decimal(18, 0)), NULL, N'Bên cạnh các món thịt, cá giàu đạm, protein và chất béo thì bữa ăn của người Nhật không thể thiếu những loại rau củ xanh. Phong cách nướng Yakiniku mang trọn sự kết hợp hài hòa giữa thịt và rau củ nướng giúp bữa ăn thịt nướng vừa ngon lại tốt cho sức khỏe. Chính sự cân bằng dưỡng chất trong chế độ dinh dưỡng là bí quyết để xứ sở mặt trời mọc trở thành một trong những nơi có tuổi thọ người dân cao nhất thế giới.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (13, N'Lươn nướng', 4, N'luon_nuong.jpg', CAST(150000 AS Decimal(18, 0)), NULL, N'Là món ăn chưa nhiều chất dinh dưỡng, các loại vitamin và chất khoáng, lươn thường được xếp vào danh sách các món ăn giải nhiệt mùa hè được yêu thích nhất tại Nhật Bản.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (14, N'Ba rọi cuộn cần nước', 4, N'Baroi.jpg', CAST(120000 AS Decimal(18, 0)), NULL, N'Sử dụng chủ yếu loại nước sốt teriyaki mang phong vị đặc trưng của ẩm thực Nhật, món ba rọi (ba chỉ) cuộn cần nước nướng có mùi vị thơm ngon, hấp dẫn. Gắp cuộn thịt ba rọi, quét thêm chút sốt trong đĩa bỏ vào miệng, bạn sẽ thích cảm giác mềm ngọt của thịt nướng, giòn giòn của cần nước.

Món này mang trọn sự kết hợp hài hòa giữa thịt và rau củ nướng giúp bữa ăn vừa ngon lại tốt cho sức khỏe. Chính sự cân bằng dưỡng chất trong chế độ dinh dưỡng là bí quyết để xứ sở mặt trời mọc trở thành một trong những nơi có tuổi thọ người dân cao nhất thế giới.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (15, N'Phi lê cá basa', 4, N'philecabasa.jpg', CAST(100000 AS Decimal(18, 0)), NULL, N'Món ăn này được nướng thơm phức và rưới nước sốt yummy cay. Cắn thử một miếng, bạn sẽ khẽ nhận ra vị cay lan tỏa trong miệng, có thể hít hà và nhanh chóng tìm nước uống. Sự tinh tế trong ẩm thực Nhật thể hiện đậm nét ở nước sốt, mỗi loại thức ăn sẽ được đi kèm cùng một loại nước sốt đặc biệt, giúp “đánh thức” vị giác của bạn khi nếm món cá basa nướng này.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (20, N'Bò nướng sả cay', 4, N'BoNuong.jpg', CAST(120000 AS Decimal(18, 0)), NULL, N'Để thưởng thức món này, bạn cần phải ăn ngay khi vừa được đem ra, nếu để nguội sẽ mất đi vị ngon. Đừng ngại ngần cầm tay khi ăn bò nướng sả cay. Bò nướng thơm, mềm, kết hợp với hương sả toát ra, khiến cho bạn không bị ngán vì dung nạp nhiều thịt.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (23, N'Akami( Cá ngừ đỏ sẫm)', 1, N'Akami.jpg', CAST(150000 AS Decimal(18, 0)), NULL, N'Đây là lớp thịt phía trên của cá, có màu đỏ đậm, đây có thể coi là phần nạc của cá ngừ vây xanh. Tuy độ béo không cao nhưng Akami lại có một vị ngọt thanh tao mà ít loại cá nào có thể so sánh được.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (24, N'Chutoro(Cá ngừ đỏ hồng)', 1, N'Chutoro.jpg', CAST(120000 AS Decimal(18, 0)), NULL, N'Là phần chính giữa akami và otoro, có nhiều ở phần giữa và phía sau đuôi cá. Chutoro có màu hồng đậm hơn otoro một chút, ít béo hơn otoro nhưng lại có vị ngọt của phần Akami. Có thể coi là phần trung hòa của akami và otoro.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (25, N'Lẩu Shabu Shabu', 3, N'shabu-shabu.jpg', CAST(500000 AS Decimal(18, 0)), NULL, N'Lẩu Sukiyaki và Shabu Shabu biểu trưng cho văn hóa ẩm thực tinh tế của Nhật Bản, hấp dẫn không chỉ bởi hương vị đậm đà mà còn ở cách thưởng thức khác lạ, độc đáo. Thông thường, thịt bò xắt lát mỏng được dùng để nhúng lẩu nhưng tại nhiều nơi, thịt lợn, thịt gà, thịt cừu, vịt, hoặc tôm hùm… cũng được sử dụng để nhúng lẩu. Đặc biệt, thịt bò Wagyu nổi tiếng không chỉ tại Nhật Bản mà còn trên khắp thế giới bởi vị ngon với lượng vân mỡ hoàn mĩ, hương vị tinh tế.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (26, N'Lẩu Sukiyaki', 3, N'Sukiyaki.jpg', CAST(470000 AS Decimal(18, 0)), NULL, N'Lẩu Sukiyaki có hương vị ngọt bùi xen lẫn vị mặn giống như nước sốt Teriyaki, tuy nhiên khi kết hợp giữa thịt bò Mỹ và một số loại rau ăn kèm thỳ lẩu Sukiyaki đã tạo nên hương vị riêng mà không một loại lẩu nào có thể có được. Đó cũng là điểm đặc trưng của lẩu Sukiyaki mà được người dân ở Nhật Bản rất ưa chuộng.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (27, N'Chutoro(Cá ngừ đỏ hồng)', 1, N'Chutoro.jpg', CAST(120000 AS Decimal(18, 0)), NULL, N'Là phần chính giữa akami và otoro, có nhiều ở phần giữa và phía sau đuôi cá. Chutoro có màu hồng đậm hơn otoro một chút, ít béo hơn otoro nhưng lại có vị ngọt của phần Akami. Có thể coi là phần trung hòa của akami và otoro.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (28, N'Akami( Cá ngừ đỏ sẫm)', 1, N'Akami.jpg', CAST(150000 AS Decimal(18, 0)), NULL, N'Đây là lớp thịt phía trên của cá, có màu đỏ đậm, đây có thể coi là phần nạc của cá ngừ vây xanh. Tuy độ béo không cao nhưng Akami lại có một vị ngọt thanh tao mà ít loại cá nào có thể so sánh được.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (29, N'Otoro(Bụng cá ngừ)', 1, N'Otoro.jpg', CAST(100000 AS Decimal(18, 0)), NULL, N'Là phần bụng và cũng là phần có giá trị nhất bởi vị béo thơm ngon của nó. Được lấy từ lớp thịt bên dưới của cá gần với đầu cá, otoro có màu hồng nhạt bắt mắt, xen giữa là những thớ mỡ trắng đặc trưng.', NULL, NULL)
INSERT [dbo].[tblProduct] ([ID], [Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (30, N'sushi thịt cá hồi', 2, N'cach-lam-sushi-ca-hoi12.jpg', CAST(80000 AS Decimal(18, 0)), NULL, N'Có nhiều cách kết hợp để ra một món sushi hoàn chỉnh. Trong đó số đó, sự kết hợp tài tình của vị tươi ngon của cá hồi cùng vị béo của bơ sáp sẽ luôn làm mọi người thích thú với món sushi các hồi. ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
SET IDENTITY_INSERT [dbo].[tblRoom] ON 

INSERT [dbo].[tblRoom] ([ID], [Name], [Images], [About], [Type], [AccountID], [CreateDate]) VALUES (1, N'1', N'lautren1.jpg', NULL, 3, 1, CAST(0x0000A7E000000000 AS DateTime))
INSERT [dbo].[tblRoom] ([ID], [Name], [Images], [About], [Type], [AccountID], [CreateDate]) VALUES (2, N'Lầu trên 2', N'nhatren2.jpg', NULL, 3, 1, CAST(0x0000A7E000000000 AS DateTime))
INSERT [dbo].[tblRoom] ([ID], [Name], [Images], [About], [Type], [AccountID], [CreateDate]) VALUES (3, N'Sân vườn', N'MatTien.jpg', NULL, 2, 1, CAST(0x0000A7E000000000 AS DateTime))
INSERT [dbo].[tblRoom] ([ID], [Name], [Images], [About], [Type], [AccountID], [CreateDate]) VALUES (4, N'Nhà bếp', N'nha bep.jpg', NULL, 1, 1, CAST(0x0000A7E000000000 AS DateTime))
INSERT [dbo].[tblRoom] ([ID], [Name], [Images], [About], [Type], [AccountID], [CreateDate]) VALUES (5, N'Lau dưới 1', N'lauduoi1.jpg', NULL, 4, 1, CAST(0x0000A7E000000000 AS DateTime))
INSERT [dbo].[tblRoom] ([ID], [Name], [Images], [About], [Type], [AccountID], [CreateDate]) VALUES (6, N'Lầu dưới', N'lau duoi2.jpg', NULL, 4, 1, CAST(0x0000A7E000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblRoom] OFF
SET IDENTITY_INSERT [dbo].[tblRoomType] ON 

INSERT [dbo].[tblRoomType] ([ID], [Name], [AccountID], [CreateDate]) VALUES (1, N'Nhà bếp', NULL, NULL)
INSERT [dbo].[tblRoomType] ([ID], [Name], [AccountID], [CreateDate]) VALUES (2, N'Sân vườn', NULL, NULL)
INSERT [dbo].[tblRoomType] ([ID], [Name], [AccountID], [CreateDate]) VALUES (3, N'Lầu trên', NULL, NULL)
INSERT [dbo].[tblRoomType] ([ID], [Name], [AccountID], [CreateDate]) VALUES (4, N'Lầu Dưới', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblRoomType] OFF
ALTER TABLE [dbo].[tblAccount] ADD  CONSTRAINT [DF_TaiKhoan_NhoMatKhau]  DEFAULT ((0)) FOR [RemeberPassword]
GO
ALTER TABLE [dbo].[tblAccount] ADD  CONSTRAINT [DF_TaiKhoan_LoaiTaiKhoan]  DEFAULT ((2)) FOR [Type]
GO
ALTER TABLE [dbo].[tblAbout]  WITH CHECK ADD  CONSTRAINT [FK_tblAbout_tblAccount] FOREIGN KEY([AccountID])
REFERENCES [dbo].[tblAccount] ([ID])
GO
ALTER TABLE [dbo].[tblAbout] CHECK CONSTRAINT [FK_tblAbout_tblAccount]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_LoaiTaiKhoan] FOREIGN KEY([Type])
REFERENCES [dbo].[tblAccountType] ([ID])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_TaiKhoan_LoaiTaiKhoan]
GO
ALTER TABLE [dbo].[tblCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblCategory_tblAccount] FOREIGN KEY([AccountID])
REFERENCES [dbo].[tblAccount] ([ID])
GO
ALTER TABLE [dbo].[tblCategory] CHECK CONSTRAINT [FK_tblCategory_tblAccount]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblAccount] FOREIGN KEY([AccountID])
REFERENCES [dbo].[tblAccount] ([ID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblAccount]
GO
ALTER TABLE [dbo].[tblOrderDeails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDeails_tblOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrder] ([ID])
GO
ALTER TABLE [dbo].[tblOrderDeails] CHECK CONSTRAINT [FK_tblOrderDeails_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDeails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDeails_tblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProduct] ([ID])
GO
ALTER TABLE [dbo].[tblOrderDeails] CHECK CONSTRAINT [FK_tblOrderDeails_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_LoaiMon] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_MonAn_LoaiMon]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblAccount] FOREIGN KEY([AccountID])
REFERENCES [dbo].[tblAccount] ([ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblAccount]
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD  CONSTRAINT [FK_KhongGianNhaHang_LoaiKhongGianNhaHang] FOREIGN KEY([Type])
REFERENCES [dbo].[tblRoomType] ([ID])
GO
ALTER TABLE [dbo].[tblRoom] CHECK CONSTRAINT [FK_KhongGianNhaHang_LoaiKhongGianNhaHang]
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD  CONSTRAINT [FK_KhongGianNhaHang_TaiKhoan] FOREIGN KEY([AccountID])
REFERENCES [dbo].[tblAccount] ([ID])
GO
ALTER TABLE [dbo].[tblRoom] CHECK CONSTRAINT [FK_KhongGianNhaHang_TaiKhoan]
GO
USE [master]
GO
ALTER DATABASE [NhaHang] SET  READ_WRITE 
GO
