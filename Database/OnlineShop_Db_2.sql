USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 6/21/2017 12:46:30 PM ******/
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\OnlineShop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/21/2017 12:46:30 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 6/21/2017 12:46:30 PM ******/
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
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/21/2017 12:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[PayTypeID] [int] NULL,
	[Discount] [int] NULL CONSTRAINT [DF_Order_Discount]  DEFAULT ((0)),
	[TotalAmount] [int] NULL,
	[OrderDate] [datetime] NULL DEFAULT (getdate()),
	[ShippingDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/21/2017 12:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](18, 0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 6/21/2017 12:46:30 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 6/21/2017 12:46:30 PM ******/
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
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 6/21/2017 12:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 6/21/2017 12:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 6/21/2017 12:46:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[isActive] [bit] NULL CONSTRAINT [DF_Wishlist_isActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (1, N'Men')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (2, N'Women')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (3, N'Boys')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (4, N'Girls')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Permission], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [Phone], [Mobile], [Address], [Picture]) VALUES (1, N'john', N'smith', N'john', N'123', 0, 22, N'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Permission], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [Phone], [Mobile], [Address], [Picture]) VALUES (2, N'hanna', N'scott', N'hanna', N'123', 1, 23, N'female', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Permission], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [Phone], [Mobile], [Address], [Picture]) VALUES (3, N'allen', N'scott', N'allen', N'123', 1, 33, N'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Permission], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [Phone], [Mobile], [Address], [Picture]) VALUES (5, N'leo', N'snart', N'leo', N'123', 0, 19, N'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Permission], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [Phone], [Mobile], [Address], [Picture]) VALUES (6, N'pain', N'smith', N'pain', N'123', 1, 18, N'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Permission], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [Phone], [Mobile], [Address], [Picture]) VALUES (8, N'Allen', N'Barry', N'allen', N'123', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'allen@gmail.com', NULL, N'123456789', N'New York, US', NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PayTypeID], [Discount], [TotalAmount], [OrderDate], [ShippingDate], [Status]) VALUES (1, 1, 1, 0, 450, CAST(N'2017-06-09 10:41:07.127' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PayTypeID], [Discount], [TotalAmount], [OrderDate], [ShippingDate], [Status]) VALUES (2, 6, 2, 0, 3250, CAST(N'2017-06-09 10:42:51.850' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (1, 1, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (2, 2, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (3, 2, 29, CAST(900 AS Decimal(18, 0)), 2, NULL, CAST(1800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (4, 2, 1, CAST(550 AS Decimal(18, 0)), 3, NULL, CAST(1650 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (5, 2, 25, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (6, 1, 3, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (1, N'Cash on Delevery', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (2, N'Paypal', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (3, N'Master Card', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (4, N'Easypaisa', NULL)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (4, N'T-Shirt 1', 1, 1, 1, CAST(180 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), NULL, NULL, CAST(1 AS Decimal(18, 0)), 8, N'/assets/client/images/Men/New/new1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (5, N'T-Shirt 2', 1, 1, 1, CAST(259 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 5, N'/assets/client/images/Men/New/new2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (6, N'T-Shirt 3', 1, 1, 1, CAST(233 AS Decimal(18, 0)), CAST(250 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 9, N'/assets/client/images/Men/New/new3.jpg', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (7, N'Vel illum qui dolorem 1', 1, 1, 23, CAST(325 AS Decimal(18, 0)), CAST(350 AS Decimal(18, 0)), NULL, NULL, CAST(5 AS Decimal(18, 0)), 3, N'/assets/client/images/19.jpg', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (10, N'Casual Shoes', 1, 1, 7, CAST(250 AS Decimal(18, 0)), CAST(350 AS Decimal(18, 0)), NULL, NULL, CAST(10 AS Decimal(18, 0)), 5, N'/assets/client/images/Men/product/accessories/21.jpg', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (11, N'Blazer', 1, 1, 2, CAST(480 AS Decimal(18, 0)), CAST(585 AS Decimal(18, 0)), NULL, NULL, CAST(15 AS Decimal(18, 0)), NULL, N'/assets/client/images/Men/product/24.jpg', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (12, N'Cach Tan 1', 1, 4, 22, CAST(220 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), NULL, NULL, CAST(5 AS Decimal(18, 0)), 9, N'/assets/client/images/girl/cachtan/1.jpg', N'Traditional Cach Tan  Long Dress ', NULL, NULL, NULL, NULL, NULL, CAST(N'2017-08-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (13, N'Cach Tan 2', 1, 4, 22, CAST(100 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), NULL, NULL, CAST(2 AS Decimal(18, 0)), 5, N'/assets/client/images/girl/cachtan/2.jpg', N'Traditional Cach Tan  Long Dress ', NULL, NULL, NULL, NULL, NULL, CAST(N'2017-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (14, N'Cach Tan 3', 1, 4, 22, CAST(100 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), NULL, NULL, CAST(3 AS Decimal(18, 0)), 10, N'/assets/client/images/girl/cachtan/3.jpg', N'Traditional Cach Tan  Long Dress ', NULL, NULL, NULL, NULL, NULL, CAST(N'2017-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (15, N'T-Shirt Boys 1', 1, 3, 16, CAST(90 AS Decimal(18, 0)), CAST(120 AS Decimal(18, 0)), NULL, NULL, CAST(13 AS Decimal(18, 0)), 4, N'/assets/client/images/boy/t-shirt/s1.jpg', N'T-Shirt fashion for boys', NULL, NULL, NULL, NULL, NULL, CAST(N'2017-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (16, N'T-Shirt Boys 2', 1, 3, 16, CAST(88 AS Decimal(18, 0)), CAST(110 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 2, N'/assets/client/images/boy/t-shirt/s2.jpg', N'T-Shirt fashion for boys', NULL, NULL, NULL, NULL, NULL, CAST(N'2017-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (17, N'T-Shirt Boys 3', 1, 3, 16, CAST(92 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 6, N'/assets/client/images/boy/t-shirt/s3.jpg', N'T-Shirt fashion for boys', NULL, NULL, NULL, NULL, NULL, CAST(N'2017-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (18, N'Long Dress', 1, 2, 8, CAST(320 AS Decimal(18, 0)), CAST(450 AS Decimal(18, 0)), NULL, NULL, CAST(0 AS Decimal(18, 0)), 11, N'/assets/client/images/Women/AoDai/Traditional/aodai1.png', N'Traditional Long Dress Fashion', NULL, NULL, NULL, NULL, NULL, CAST(N'2017-06-14 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (19, N'Long Dress 2', 1, 2, 8, CAST(339 AS Decimal(18, 0)), CAST(442 AS Decimal(18, 0)), NULL, NULL, CAST(7 AS Decimal(18, 0)), 7, N'/assets/client/images/Women/AoDai/Traditional/aodai2.png', N'Traditional Long Dress Fashion', NULL, NULL, NULL, NULL, NULL, CAST(N'2017-06-14 00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubcategoryID], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [ImageURL], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [CreatedDate]) VALUES (20, N'Apron For Women', 1, 2, 9, CAST(99 AS Decimal(18, 0)), CAST(190 AS Decimal(18, 0)), NULL, NULL, CAST(6 AS Decimal(18, 0)), 7, N'/assets/client/images/Women/Apron/apr1.jpg', N'Apron for women', NULL, NULL, NULL, NULL, NULL, CAST(N'2017-06-14 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (1, 1, N'T-Shirt             ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (2, 1, N'Jacket              ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (3, 1, N'Sport               ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (4, 1, N'Polo Shirt          ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (5, 1, N'New                 ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (6, 1, N'Custom Logo         ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (7, 1, N'Accessories         ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (8, 2, N'Long Dress          ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (9, 2, N'Apron               ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (10, 2, N'Ba Ba               ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (11, 2, N'Cach Tan            ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (12, 2, N'New                 ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (13, 3, N'New                 ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (14, 3, N'Custom Logo         ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (15, 3, N'Polo Shirt          ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (16, 3, N'T-Shirt             ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (17, 3, N'Sport               ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (18, 3, N'Accessories         ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (19, 4, N'New                 ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (20, 4, N'Long Dress          ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (21, 4, N'Ba Ba               ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (22, 4, N'Cach Tan            ', NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [isActive]) VALUES (23, 1, N'Shirt               ', NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country]) VALUES (1, N'ABC Ltd', N'Andy', N'Marketing Manager', N'US', N'0312312511', N'081231241', N'344123125125', N'andy@gmail.com', N'New York', N'America')
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (1, 1, 4, 1)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (3, 2, 7, 1)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (4, 6, 10, 1)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (5, 1, 12, 1)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (6, 3, 14, 1)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (7, 4, 17, 1)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
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
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Products]
GO
/****** Object:  StoredProcedure [dbo].[Get_Account]    Script Date: 6/21/2017 12:46:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Category_ListAll]    Script Date: 6/21/2017 12:46:30 PM ******/
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
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
