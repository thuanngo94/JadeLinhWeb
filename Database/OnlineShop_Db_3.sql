USE [master]
GO
/****** Object:  Database [OnlineShopDb]    Script Date: 9/17/2017 7:28:16 PM ******/
CREATE DATABASE [OnlineShopDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShopDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\OnlineShopDb.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineShopDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\OnlineShopDb_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineShopDb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShopDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShopDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShopDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShopDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShopDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShopDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShopDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OnlineShopDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShopDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShopDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShopDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShopDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShopDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShopDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShopDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShopDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShopDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShopDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShopDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShopDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShopDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShopDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShopDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShopDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineShopDb] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShopDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShopDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShopDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShopDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineShopDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OnlineShopDb]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[RecordID] [int] NOT NULL,
	[CartID] [nvarchar](250) NULL,
	[ProductID] [int] NULL,
	[DateCreated] [datetime] NULL,
	[Count] [int] NULL,
	[CustomerID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YourName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Subject] [nvarchar](250) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [varchar](50) NOT NULL,
	[Last Name] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Permission] [bit] NOT NULL,
	[Age] [int] NULL,
	[Gender] [varchar](50) NULL,
	[DateofBirth] [date] NULL,
	[Organization] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Picture] [varchar](250) NULL,
	[IsEmailVerified] [bit] NULL,
	[ActivationCode] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[PayTypeID] [int] NULL,
	[Discount] [int] NULL CONSTRAINT [DF_Order_Discount]  DEFAULT ((0)),
	[Total] [decimal](18, 0) NULL,
	[OrderDate] [datetime] NULL CONSTRAINT [DF__Order__OrderDate__0425A276]  DEFAULT (getdate()),
	[ShippingDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
	[OrderDate] [datetime] NULL,
	[CustomerName] [varchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[ColorName] [nvarchar](250) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PayTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PayTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[SubcategoryID] [int] NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[OldPrice] [decimal](18, 0) NULL,
	[UnitWeight] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[Discount] [decimal](18, 0) NULL,
	[UnitInStock] [int] NULL,
	[ImageURL] [varchar](500) NULL,
	[ShortDescription] [varchar](300) NULL,
	[LongDescription] [varchar](2000) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[Picture3] [varchar](500) NULL,
	[Picture4] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Products_CreatedDate]  DEFAULT (getdate()),
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK__SubCateg__26BE5BF90DAF0CB0] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[ContactName] [varchar](50) NULL,
	[ContactTitle] [varchar](50) NULL,
	[Address] [varchar](128) NULL,
	[Mobile] [varchar](15) NULL,
	[Phone] [varchar](15) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[Country] [varchar](20) NULL,
 CONSTRAINT [PK__Supplier__4BE66694117F9D94] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/17/2017 7:28:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[NameUser] [nvarchar](50) NULL,
	[PasswordUser] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (1, N'Men')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (2, N'Women')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (3, N'Boys')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (4, N'Girls')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [YourName], [Email], [Subject], [Message]) VALUES (1, N'User 2', N'user2@gmail.com', N'Request Promo Code Customer Services', N'Request Promo Code Customer Services')
INSERT [dbo].[Contact] ([ID], [YourName], [Email], [Subject], [Message]) VALUES (8, N'Kiet Tran', N'trankietcth11@gmail.com', N'Request Promo Code Customer Services', N'Request Promo Code Customer Services')
INSERT [dbo].[Contact] ([ID], [YourName], [Email], [Subject], [Message]) VALUES (11, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Permission], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [Phone], [Mobile], [Address], [Picture], [IsEmailVerified], [ActivationCode]) VALUES (12, N'user1', N'user1', N'user1', N'123', 0, 22, N'male', NULL, N'abc', N'VN', N'HCMC', N'HCMC', N'700000', N'user1@gmail.com', N'123213123', N'1231231', N'asdadasdasd', NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Permission], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [Phone], [Mobile], [Address], [Picture], [IsEmailVerified], [ActivationCode]) VALUES (13, N'user2', N'user2', N'user2', N'123', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'user2@gmail.com', N'1231235123', NULL, N'HCM', NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Permission], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [Phone], [Mobile], [Address], [Picture], [IsEmailVerified], [ActivationCode]) VALUES (15, N'admin', N'admin', N'admin', N'21232f297a57a5a743894a0e4a801fc3', 1, 23, N'Male', CAST(N'1995-06-09' AS Date), N'JadeLinh', N'VietNam', N'HCMC', N'HCMC', N'700000', N'admin@gmail.com', N'968057309', N'968057309', N'Vuon Lai St., , Ward An Phu Dong., Dist 12., HCMC', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CustomerID], [PayTypeID], [Discount], [Total], [OrderDate], [ShippingDate], [Status]) VALUES (14, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), CAST(N'2017-09-17 17:00:30.183' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PayTypeID], [Discount], [Total], [OrderDate], [ShippingDate], [Status]) VALUES (15, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), CAST(N'2017-09-17 17:00:40.830' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (1, N'Cash on Delevery', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (2, N'Paypal', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (3, N'Master Card', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (4, N'Easypaisa', NULL)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (32, N' Linen Dress For Women', 1, 2, 28, CAST(85 AS Decimal(18, 0)), CAST(120 AS Decimal(18, 0)), NULL, NULL, CAST(5 AS Decimal(18, 0)), 2, NULL, N'Dress Linen For Women', N'Dress Linen For Women. 100% Linen. Made in VietNam', NULL, NULL, NULL, NULL, CAST(N'2017-09-16 10:59:40.990' AS DateTime), 5)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (33, N'Blue Dress Linen Fashion', 1, 2, 28, CAST(78 AS Decimal(18, 0)), CAST(178 AS Decimal(18, 0)), NULL, NULL, CAST(5 AS Decimal(18, 0)), 2, NULL, N'Blue Dress Linen ', N'Blue Dress Linen with flower  Hand embroidery', NULL, NULL, NULL, NULL, CAST(N'2017-09-16 11:37:53.120' AS DateTime), 10)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (34, N'Flowers On Collar', 1, 2, 28, CAST(55 AS Decimal(18, 0)), CAST(75 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 1, NULL, N'Dress embroidered flower in neck', N'Dress embroidered flower in neck for women collection', NULL, NULL, NULL, NULL, CAST(N'2017-09-16 11:55:08.357' AS DateTime), 2)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (35, N'Linen Dress Flowers', 1, 2, 28, CAST(65 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 4, NULL, N' Linen Dress Fashion', N' Linen Dress Fashion For Women. Flowers Hand Embroidery', NULL, NULL, NULL, NULL, CAST(N'2017-09-16 13:20:06.543' AS DateTime), 9)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (36, N'Flowers  Dress Style', 1, 2, 28, CAST(70 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 3, NULL, N'Flowers  Dress Style For Women', N'Flowers  Dress Style. 100% Linen so beautyful', NULL, NULL, NULL, NULL, CAST(N'2017-09-16 13:22:56.610' AS DateTime), 5)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (37, N'Dress Linen Fashion', 1, 2, 28, CAST(60 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(5 AS Decimal(18, 0)), 3, NULL, N'Linen Dress With Flowers On Collar', N'Linen Dress with Flowers On Collar For Women', NULL, NULL, NULL, NULL, CAST(N'2017-09-16 13:45:34.920' AS DateTime), 4)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (38, N'Dress Orchid Flower', 1, 2, 28, CAST(77 AS Decimal(18, 0)), CAST(130 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 2, NULL, N'Linen Dress Orchid Flowers', N'Linen Dress Orchid Flower for Women. 100% Linen', NULL, NULL, NULL, NULL, CAST(N'2017-09-16 14:09:29.543' AS DateTime), 4)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (39, N'Violet Dress Linen', 1, 2, 28, CAST(88 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 5, NULL, N'Violet Dress Linen Fashion', N'Violet Dress Linen For Women with 100% linen ', NULL, NULL, NULL, NULL, CAST(N'2017-09-16 14:25:35.943' AS DateTime), 10)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (40, N'Dress Flower-Butterfly', 1, 2, 28, CAST(75 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 3, NULL, N'Violet Dress Linen Fashion', N'Violet Dress Linen Fashion. Dress has flower and butterfly be hand embbroidery', NULL, NULL, NULL, NULL, CAST(N'2017-09-16 14:34:54.907' AS DateTime), 4)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (41, N'Violet Dress Linen2', 1, 2, 28, CAST(80 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 4, NULL, N'Violet Dress Linen For Women', N'Violet dress linen fashion. 100% line', NULL, NULL, NULL, NULL, CAST(N'2017-09-16 14:45:18.540' AS DateTime), 4)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (42, N'Dress Linen Style', 1, 2, 28, CAST(88 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 2, NULL, N'Violet Dress Linen For Women', N'Linen Dress Orchid Flower for Women. 100% Linen', NULL, NULL, NULL, NULL, CAST(N'2017-09-17 14:10:06.090' AS DateTime), 3)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (43, N'Linen Fashion Style  ', 1, 2, 28, CAST(65 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 4, NULL, N'Dress Linen For Women', N'Dress Linen For Women. 100% Linen. Made in VietNam', NULL, NULL, NULL, NULL, CAST(N'2017-09-17 15:15:49.013' AS DateTime), 4)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (44, N'Linen Fashion Style 2', 1, 2, 28, CAST(55 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 5, NULL, N'Linen Fashion Style  ', N'Linen Fashion Style  For Women. 100% Linen', NULL, NULL, NULL, NULL, CAST(N'2017-09-17 16:38:38.163' AS DateTime), 8)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (45, N'Linen Fashion Style 3', 1, 2, 28, CAST(55 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 3, NULL, N'Linen Fashion Style 2', N'Linen Fashion Style 2', NULL, NULL, NULL, NULL, CAST(N'2017-09-17 16:39:07.033' AS DateTime), 5)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (46, N'Linen Fashion Style 4', 1, 2, 28, CAST(49 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 3, NULL, N'Linen Fashion Style 3.', N'Linen Fashion Style 3 For Women', NULL, NULL, NULL, NULL, CAST(N'2017-09-17 16:46:06.220' AS DateTime), 4)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (47, N'Linen Fashion Style 5', 1, 2, 28, CAST(59 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 4, NULL, N'Linen Fashion Style 4', N'Linen Fashion Style 4 For Women', NULL, NULL, NULL, NULL, CAST(N'2017-09-17 16:47:22.580' AS DateTime), 4)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (48, N'Linen Fashion Style 6', 1, 2, 28, CAST(72 AS Decimal(18, 0)), CAST(98 AS Decimal(18, 0)), NULL, NULL, CAST(5 AS Decimal(18, 0)), 3, NULL, N'Linen Fashion Style 5', N'Linen Fashion Style 5', NULL, NULL, NULL, NULL, CAST(N'2017-09-17 16:49:11.637' AS DateTime), 4)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate], [Quantity]) VALUES (49, N'Linen Fashion Style 7', 1, 2, 28, CAST(88 AS Decimal(18, 0)), CAST(120 AS Decimal(18, 0)), NULL, NULL, CAST(5 AS Decimal(18, 0)), 2, NULL, N'Linen Fashion Style 6', N'Linen Fashion Style 6', NULL, NULL, NULL, NULL, CAST(N'2017-09-17 16:52:52.890' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (8, 2, N'Long Dress          ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (9, 2, N'Apron               ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (10, 2, N'Ba Ba               ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (11, 2, N'Cach Tan            ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (12, 2, N'New                 ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (28, 2, N'Ao Dam', 1)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (1, N'ABC Ltd', N'Andy', N'Marketing Manager', N'US', N'0312312511', N'081231241', N'344123125125', N'andy@gmail.com', N'New York', N'America')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (2, N'Adidas', N'Brian', N'Sales Manager', N'California', N'86975423', N'8254136987', N'8475632', N'adidas.us@sales.com', N'America', N'USA')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [NameUser], [PasswordUser], [Position]) VALUES (1, N'thuanmn', N'thuannho', N'Admin')
INSERT [dbo].[Users] ([UserID], [NameUser], [PasswordUser], [Position]) VALUES (2, N'kiettran', N'kiet123', N'SubAdmin')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentType] FOREIGN KEY([PayTypeID])
REFERENCES [dbo].[PaymentType] ([PayTypeID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PaymentType]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderDetails] FOREIGN KEY([OrderDetailsID])
REFERENCES [dbo].[OrderDetails] ([OrderDetailsID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SubCategory] FOREIGN KEY([SubcategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SubCategory]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Categories]
GO
/****** Object:  StoredProcedure [dbo].[Get_Account]    Script Date: 9/17/2017 7:28:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Get_Account] @Username nvarchar(20), @Password nvarchar(20)
as
select *
from Account
where Username like @Username + @Password  + '%'

GO
/****** Object:  StoredProcedure [dbo].[Sp_Category_ListAll]    Script Date: 9/17/2017 7:28:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Category_ListAll]
as
select * from Category where Status =1
order by [Order] asc

GO
USE [master]
GO
ALTER DATABASE [OnlineShopDb] SET  READ_WRITE 
GO
