USE [Ellamey]
GO
/****** Object:  StoredProcedure [dbo].[sp_getrestaurants]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP PROCEDURE [dbo].[sp_getrestaurants]
GO
/****** Object:  StoredProcedure [dbo].[sp_getgroceryshops]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP PROCEDURE [dbo].[sp_getgroceryshops]
GO
ALTER TABLE [dbo].[Restaurateur] DROP CONSTRAINT [FK_Restaurateur_state]
GO
ALTER TABLE [dbo].[Restaurateur] DROP CONSTRAINT [FK_Restaurateur_conutry]
GO
ALTER TABLE [dbo].[RestaurantOrderItems] DROP CONSTRAINT [FK_RestaurantOrderItems_RestaurantOrder]
GO
ALTER TABLE [dbo].[RestaurantOrderItems] DROP CONSTRAINT [FK_RestaurantOrderItems_FoodItem]
GO
ALTER TABLE [dbo].[RestaurantOrder] DROP CONSTRAINT [FK_RestaurantOrder_Restaurateur]
GO
ALTER TABLE [dbo].[RestaurantOrder] DROP CONSTRAINT [FK_RestaurantOrder_PaymentStatus]
GO
ALTER TABLE [dbo].[RestaurantOrder] DROP CONSTRAINT [FK_RestaurantOrder_OrderStatusRestaurateur]
GO
ALTER TABLE [dbo].[RestaurantOrder] DROP CONSTRAINT [FK_RestaurantOrder_Login]
GO
ALTER TABLE [dbo].[Login] DROP CONSTRAINT [FK_Login_Roles]
GO
ALTER TABLE [dbo].[GroceryOrderItems] DROP CONSTRAINT [FK_GroceryOrderItems_GroceryOrder]
GO
ALTER TABLE [dbo].[GroceryOrderItems] DROP CONSTRAINT [FK_GroceryOrderItems_GroceryItem]
GO
ALTER TABLE [dbo].[GroceryOrder] DROP CONSTRAINT [FK_GroceryOrder_PaymentStatus]
GO
ALTER TABLE [dbo].[GroceryOrder] DROP CONSTRAINT [FK_GroceryOrder_OrderStatus]
GO
ALTER TABLE [dbo].[GroceryOrder] DROP CONSTRAINT [FK_GroceryOrder_Login]
GO
ALTER TABLE [dbo].[GroceryOrder] DROP CONSTRAINT [FK_GroceryOrder_Grocer]
GO
ALTER TABLE [dbo].[GroceryItem] DROP CONSTRAINT [FK_GroceryItem_Unit]
GO
ALTER TABLE [dbo].[GroceryItem] DROP CONSTRAINT [FK_GroceryItem_Grocer]
GO
ALTER TABLE [dbo].[Grocer] DROP CONSTRAINT [FK_Grocer_state]
GO
ALTER TABLE [dbo].[Grocer] DROP CONSTRAINT [FK_Grocer_conutry]
GO
ALTER TABLE [dbo].[FoodSubCategory] DROP CONSTRAINT [FK_FoodSubCategory_FoodCategory]
GO
ALTER TABLE [dbo].[FoodItem] DROP CONSTRAINT [FK_FoodItem_Restaurateur]
GO
ALTER TABLE [dbo].[Restaurateur] DROP CONSTRAINT [DF_Restaurateur_IsDeleted]
GO
ALTER TABLE [dbo].[RestaurantOrderItems] DROP CONSTRAINT [DF_RestaurantOrderItems_IsDeleted]
GO
ALTER TABLE [dbo].[RestaurantOrder] DROP CONSTRAINT [DF_RestaurantOrder_IsDeleted]
GO
ALTER TABLE [dbo].[Login] DROP CONSTRAINT [DF_Login_IsDeleted]
GO
ALTER TABLE [dbo].[GroceryOrderItems] DROP CONSTRAINT [DF_GroceryOrderItems_IsDeleted]
GO
ALTER TABLE [dbo].[GroceryOrder] DROP CONSTRAINT [DF_GroceryOrder_IsDeleted]
GO
ALTER TABLE [dbo].[GroceryItem] DROP CONSTRAINT [DF_GroceryItem_IsDeleted]
GO
ALTER TABLE [dbo].[Grocer] DROP CONSTRAINT [DF_Grocer_IsDeleted]
GO
ALTER TABLE [dbo].[FoodItem] DROP CONSTRAINT [DF_FoodItem_IsDeleted]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[Unit]
GO
/****** Object:  Table [dbo].[State]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[State]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Restaurateur]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[Restaurateur]
GO
/****** Object:  Table [dbo].[RestaurantOrderItems]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[RestaurantOrderItems]
GO
/****** Object:  Table [dbo].[RestaurantOrder]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[RestaurantOrder]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[PaymentStatus]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[PaymentMethod]
GO
/****** Object:  Table [dbo].[OrderStatusRestaurateur]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[OrderStatusRestaurateur]
GO
/****** Object:  Table [dbo].[OrderStatusGrocer]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[OrderStatusGrocer]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[Login]
GO
/****** Object:  Table [dbo].[GroceryOrderItems]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[GroceryOrderItems]
GO
/****** Object:  Table [dbo].[GroceryOrder]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[GroceryOrder]
GO
/****** Object:  Table [dbo].[GroceryItem]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[GroceryItem]
GO
/****** Object:  Table [dbo].[Grocer]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[Grocer]
GO
/****** Object:  Table [dbo].[FoodSubCategory]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[FoodSubCategory]
GO
/****** Object:  Table [dbo].[FoodItem]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[FoodItem]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[FoodCategory]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP TABLE [dbo].[Country]
GO
/****** Object:  User [ellamey]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP USER [ellamey]
GO
/****** Object:  User [IIS APPPOOL\.Net v4.5]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP USER [IIS APPPOOL\.Net v4.5]
GO
/****** Object:  User [IIS APPPOOL\Web]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP USER [IIS APPPOOL\Web]
GO
USE [master]
GO
/****** Object:  Database [Ellamey]    Script Date: 6/1/2019 9:43:27 PM ******/
DROP DATABASE [Ellamey]
GO
/****** Object:  Database [Ellamey]    Script Date: 6/1/2019 9:43:27 PM ******/
CREATE DATABASE [Ellamey] ON  PRIMARY 
( NAME = N'Ellamey', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Ellamey.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ellamey_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Ellamey_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ellamey] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ellamey].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ellamey] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ellamey] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ellamey] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ellamey] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ellamey] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ellamey] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Ellamey] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ellamey] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ellamey] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ellamey] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ellamey] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ellamey] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ellamey] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ellamey] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ellamey] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ellamey] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ellamey] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ellamey] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ellamey] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ellamey] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ellamey] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ellamey] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ellamey] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ellamey] SET  MULTI_USER 
GO
ALTER DATABASE [Ellamey] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ellamey] SET DB_CHAINING OFF 
GO
USE [Ellamey]
GO
/****** Object:  User [IIS APPPOOL\Web]    Script Date: 6/1/2019 9:43:27 PM ******/
CREATE USER [IIS APPPOOL\Web] FOR LOGIN [IIS APPPOOL\Web]
GO
/****** Object:  User [IIS APPPOOL\.Net v4.5]    Script Date: 6/1/2019 9:43:27 PM ******/
CREATE USER [IIS APPPOOL\.Net v4.5] FOR LOGIN [IIS APPPOOL\.Net v4.5]
GO
/****** Object:  User [ellamey]    Script Date: 6/1/2019 9:43:27 PM ******/
CREATE USER [ellamey] FOR LOGIN [ellamey] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\Web]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\Web]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\Web]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\.Net v4.5]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\.Net v4.5]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\.Net v4.5]
GO
ALTER ROLE [db_owner] ADD MEMBER [ellamey]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[FoodCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_FoodCategory] PRIMARY KEY CLUSTERED 
(
	[FoodCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FoodItem]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[FoodItem](
	[FoodItemId] [int] IDENTITY(1,1) NOT NULL,
	[RestaurateurId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [varchar](50) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsOutofstock] [bit] NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[FoodItem] ADD [PhotoPath] [varchar](5000) NULL
ALTER TABLE [dbo].[FoodItem] ADD [FoodCategoryId] [int] NULL
ALTER TABLE [dbo].[FoodItem] ADD [FoodSubCategoryId] [int] NULL
 CONSTRAINT [PK_FoodItem] PRIMARY KEY CLUSTERED 
(
	[FoodItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FoodSubCategory]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FoodSubCategory](
	[FoodSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[FoodCategoryId] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_FoodSubCategory] PRIMARY KEY CLUSTERED 
(
	[FoodSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grocer]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grocer](
	[GrocerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[website] [varchar](100) NULL,
	[email] [varchar](50) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[address1] [varchar](100) NOT NULL,
	[address2] [varchar](100) NOT NULL,
	[stateid] [int] NOT NULL,
	[countryid] [int] NOT NULL,
	[phonenumber] [varchar](50) NOT NULL,
	[gstin] [varchar](50) NULL,
	[bankaccountname] [varchar](50) NOT NULL,
	[bankname] [varchar](50) NOT NULL,
	[ifsccode] [varchar](50) NOT NULL,
	[accountnumber] [varchar](50) NOT NULL,
	[postalcode] [varchar](10) NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
	[PhotoPath] [varchar](5000) NULL,
 CONSTRAINT [PK_Grocer] PRIMARY KEY CLUSTERED 
(
	[GrocerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroceryItem]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroceryItem](
	[GroceryItemId] [int] IDENTITY(1,1) NOT NULL,
	[GrocerId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[weight] [varchar](50) NOT NULL,
	[unitid] [int] NOT NULL,
	[price] [varchar](50) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsOutofstock] [bit] NULL,
	[PhotoPath] [varchar](5000) NULL,
 CONSTRAINT [PK_GroceryItem] PRIMARY KEY CLUSTERED 
(
	[GroceryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroceryOrder]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroceryOrder](
	[GroceryOrderId] [int] IDENTITY(1,1) NOT NULL,
	[GrocerId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[Total] [varchar](50) NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[LoginId] [int] NOT NULL,
	[OrderDate] [varchar](50) NULL,
	[TransactionId] [varchar](250) NULL,
	[TrackingId] [varchar](50) NULL,
	[BankRefNo] [varchar](50) NULL,
	[OrderStatus] [varchar](50) NULL,
 CONSTRAINT [PK_GroceryOrder] PRIMARY KEY CLUSTERED 
(
	[GroceryOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroceryOrderItems]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroceryOrderItems](
	[GroceryOrderItemsId] [int] IDENTITY(1,1) NOT NULL,
	[GroceryOrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [varchar](50) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[GroceryItemId] [int] NOT NULL,
 CONSTRAINT [PK_GroceryOrderItems] PRIMARY KEY CLUSTERED 
(
	[GroceryOrderItemsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](250) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[isToRead] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[Name] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[RestaurateurId] [int] NULL,
	[GrocerId] [int] NULL,
	[PhotoPath] [varchar](5000) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[postalcode] [varchar](10) NULL,
	[city] [varchar](100) NULL,
	[stateid] [int] NULL,
	[countryid] [int] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderStatusGrocer]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderStatusGrocer](
	[OrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusName] [varchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderStatusRestaurateur]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderStatusRestaurateur](
	[OrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusName] [varchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_OrderStatusRestaurateur] PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[PaymentMethodId] [int] IDENTITY(1,1) NOT NULL,
	[method] [varchar](50) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[link] [varchar](250) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[PaymentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentStatusName] [varchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_PaymentStatus] PRIMARY KEY CLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RestaurantOrder]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RestaurantOrder](
	[RestaurantOrderId] [int] IDENTITY(1,1) NOT NULL,
	[RestaurateurId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[Total] [varchar](50) NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[LoginId] [int] NOT NULL,
	[OrderDate] [varchar](50) NULL,
	[TransactionId] [varchar](250) NULL,
	[TrackingId] [varchar](50) NULL,
	[BankRefNo] [varchar](50) NULL,
	[OrderStatus] [varchar](50) NULL,
 CONSTRAINT [PK_RestaurantOrder] PRIMARY KEY CLUSTERED 
(
	[RestaurantOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RestaurantOrderItems]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RestaurantOrderItems](
	[RestaurantOrderItemsId] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantOrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [varchar](50) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[FoodItemId] [int] NOT NULL,
 CONSTRAINT [PK_RestaurantOrderItems] PRIMARY KEY CLUSTERED 
(
	[RestaurantOrderItemsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Restaurateur]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Restaurateur](
	[RestaurateurId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[website] [varchar](100) NULL,
	[phonenumber] [varchar](100) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[address1] [varchar](100) NOT NULL,
	[address2] [varchar](100) NOT NULL,
	[stateid] [int] NOT NULL,
	[countryid] [int] NOT NULL,
	[gstin] [varchar](50) NULL,
	[bankaccountname] [varchar](50) NOT NULL,
	[bankname] [varchar](50) NOT NULL,
	[ifsccode] [varchar](50) NOT NULL,
	[accountnumber] [varchar](50) NOT NULL,
	[postalcode] [varchar](10) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[PhotoPath] [varchar](5000) NULL,
 CONSTRAINT [PK_Restaurateur] PRIMARY KEY CLUSTERED 
(
	[RestaurateurId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](250) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (1, N'China', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (2, N'Pakistan', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (3, N'Philippines', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (4, N'Viet Nam', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (5, N'Thailand', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (6, N'Afghanistan', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (7, N'Malaysia', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (8, N'Sri Lanka', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (9, N'India', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (10, N'Kazakhstan', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (1, N'Appetizer', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodCategory] ([FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (2, N'Starters', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodCategory] ([FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (3, N'Tandoori', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodCategory] ([FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (4, N'Gravy', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodCategory] ([FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (5, N'Main Course', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[FoodItem] ON 

INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (1, 2, N'zxxxx1', N'45.232', 1, CAST(N'2019-03-12T21:06:44.833' AS DateTime), 1, CAST(N'2019-03-12T21:10:38.070' AS DateTime), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (2, 2, N'fgfdfgs', N'451', 1, CAST(N'2019-03-12T21:07:30.293' AS DateTime), 2, CAST(N'2019-04-09T22:00:41.927' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (3, 5, N'ssdad', N'43', 1, CAST(N'2019-03-12T22:05:44.380' AS DateTime), 2, CAST(N'2019-04-09T22:00:57.197' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (4, 5, N'test1', N'901', 1, CAST(N'2019-03-12T22:06:00.537' AS DateTime), 2, CAST(N'2019-04-09T22:01:14.923' AS DateTime), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (5, 2, N'sds', N'234', 1, CAST(N'2019-03-13T22:21:51.403' AS DateTime), NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (6, 6, N'gdfgdg', N'234234', 1, CAST(N'2019-03-13T22:25:57.977' AS DateTime), 11, CAST(N'2019-03-20T10:19:35.393' AS DateTime), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (7, 6, N'dfgdg', N'55', NULL, CAST(N'2019-03-18T21:52:44.697' AS DateTime), NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (8, 6, N'fsf', N'3', NULL, CAST(N'2019-03-18T21:56:07.563' AS DateTime), NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (9, 6, N'sgscv', N'1,200.00', NULL, CAST(N'2019-03-18T21:56:34.557' AS DateTime), 16, CAST(N'2019-05-25T22:17:27.127' AS DateTime), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (10, 6, N'fdfs', N'4.00', NULL, CAST(N'2019-03-18T21:59:06.883' AS DateTime), 16, CAST(N'2019-05-25T22:16:50.170' AS DateTime), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (11, 9, N'xxxx1', N'33331', 2, CAST(N'2019-03-22T14:35:48.753' AS DateTime), 2, CAST(N'2019-03-22T14:36:17.347' AS DateTime), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (12, 9, N'Curd Rice', N'45', 2, CAST(N'2019-03-23T22:16:37.773' AS DateTime), NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (16, 9, N'Lemon Rice', N'34', 25, CAST(N'2019-03-25T15:02:58.087' AS DateTime), 2, CAST(N'2019-03-25T15:06:43.453' AS DateTime), 0, 0, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (17, 9, N'Lemon Rice', N'34', 2, CAST(N'2019-03-28T09:04:56.077' AS DateTime), NULL, NULL, 0, NULL, N'http://images.ellamey.online/images.jpg', NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (18, 5, N'vv', N'345.67', 2, CAST(N'2019-03-28T09:06:06.440' AS DateTime), NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (19, 5, N'ffff', N'45.69', 2, CAST(N'2019-03-28T09:06:49.467' AS DateTime), NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (20, 5, N'fff', N'34.54', 2, CAST(N'2019-03-28T09:07:24.127' AS DateTime), NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (21, 5, N'ff', N'34.56', 2, CAST(N'2019-03-28T09:07:46.487' AS DateTime), NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (22, 4, N'ddd', N'34.57', 2, CAST(N'2019-03-28T09:08:38.773' AS DateTime), NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (23, 3, N'Curd Rice', N'50.00', 2, CAST(N'2019-05-23T21:53:40.740' AS DateTime), NULL, NULL, 0, NULL, N'http://images.ellamey.online/images.jpg', NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (24, 9, N'Tomato Rice', N'80.00', 2, CAST(N'2019-05-23T21:54:04.110' AS DateTime), NULL, NULL, 0, NULL, N'http://images.ellamey.online/images.jpg', NULL, NULL)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (25, 6, N'chicken Tikka', N'78.00', 16, CAST(N'2019-05-25T22:01:27.897' AS DateTime), NULL, NULL, 0, NULL, N'', 2, 4)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (26, 6, N'Chicken Soup', N'78.00', 16, CAST(N'2019-05-25T22:14:12.893' AS DateTime), 16, CAST(N'2019-05-25T22:15:58.180' AS DateTime), 1, 1, N'', 1, 2)
INSERT [dbo].[FoodItem] ([FoodItemId], [RestaurateurId], [Name], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath], [FoodCategoryId], [FoodSubCategoryId]) VALUES (27, 2, N'Chicken Kuruma', N'56.00', 2, CAST(N'2019-05-26T10:34:22.177' AS DateTime), 2, CAST(N'2019-05-26T10:38:47.687' AS DateTime), 1, NULL, N'', 4, 10)
SET IDENTITY_INSERT [dbo].[FoodItem] OFF
SET IDENTITY_INSERT [dbo].[FoodSubCategory] ON 

INSERT [dbo].[FoodSubCategory] ([FoodSubCategoryId], [FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (1, 1, N'Veg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodSubCategory] ([FoodSubCategoryId], [FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (2, 1, N'Non Veg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodSubCategory] ([FoodSubCategoryId], [FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (3, 2, N'Veg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodSubCategory] ([FoodSubCategoryId], [FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (4, 2, N'Non Veg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodSubCategory] ([FoodSubCategoryId], [FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (6, 3, N'Veg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodSubCategory] ([FoodSubCategoryId], [FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (7, 3, N'Non Veg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodSubCategory] ([FoodSubCategoryId], [FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (9, 4, N'Veg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodSubCategory] ([FoodSubCategoryId], [FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (10, 4, N'Non Veg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodSubCategory] ([FoodSubCategoryId], [FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (11, 5, N'Veg', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FoodSubCategory] ([FoodSubCategoryId], [FoodCategoryId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (12, 5, N'Non Veg', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FoodSubCategory] OFF
SET IDENTITY_INSERT [dbo].[Grocer] ON 

INSERT [dbo].[Grocer] ([GrocerId], [Name], [city], [website], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [phonenumber], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [longitude], [latitude], [PhotoPath]) VALUES (1, N'zzz1', N'zz1', N'zz1', N'zz@sz1', 1, CAST(N'2019-03-12T13:54:46.977' AS DateTime), 1, CAST(N'2019-03-12T14:08:58.627' AS DateTime), 1, N'zzz1', N'zzz1', 3, 9, N'zzzzz1', N'11111', N'zzz1', N'zz1', N'zzzzz1', N'zzzzz1', N'zzzzzzz1', 77.374202, 11.156361, NULL)
INSERT [dbo].[Grocer] ([GrocerId], [Name], [city], [website], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [phonenumber], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [longitude], [latitude], [PhotoPath]) VALUES (2, N'11111a', N'44444a', N'66666a', N'8888@88a', 1, CAST(N'2019-03-12T14:18:46.627' AS DateTime), 1, CAST(N'2019-03-12T14:20:33.220' AS DateTime), 1, N'222222a', N'33333a', 5, 9, N'777777a', N'99999a', N'1111a', N'2222a', N'33333a', N'44444a', N'55555a', 77.296983, 11.072103, NULL)
INSERT [dbo].[Grocer] ([GrocerId], [Name], [city], [website], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [phonenumber], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [longitude], [latitude], [PhotoPath]) VALUES (3, N'asdsada', N'asdad', N'asdad', N'adsad@dasd', 1, CAST(N'2019-03-12T14:54:52.673' AS DateTime), NULL, NULL, 0, N'sdada', N'asdada', 4, 9, N'asdad', N'dasdad', N'asdad', N'adsad', N'asadad', N'asdadad', N'asdad', 77.408709, 11.270161, NULL)
INSERT [dbo].[Grocer] ([GrocerId], [Name], [city], [website], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [phonenumber], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [longitude], [latitude], [PhotoPath]) VALUES (4, N'sfsdfs', N'sdfsf', N'sdfsf', N'sfdsf@we', 2, CAST(N'2019-03-18T14:24:51.477' AS DateTime), 2, CAST(N'2019-03-18T14:25:58.407' AS DateTime), 1, N'sdfsfsdf', N'dfsf', 4, 9, N'sdsffsf', N'sdfsfsf', N'fdsf', N'sfdsfs', N'sdfsf', N'sdfsfsf', N'dsfsf', 12.972057, 80.239828, NULL)
INSERT [dbo].[Grocer] ([GrocerId], [Name], [city], [website], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [phonenumber], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [longitude], [latitude], [PhotoPath]) VALUES (5, N'dsdsd', N'sdsd', N'sdsd', N'sdsd@dd', 2, CAST(N'2019-03-25T19:59:42.513' AS DateTime), 2, CAST(N'2019-03-25T20:00:47.560' AS DateTime), 0, N'sdsd', N'sds', 3, 9, N'sdsdsd', N'', N'xxx', N'xxx', N'xxxxx', N'xxxxxx', N'sdsd', 77.38188, 11.15945, NULL)
SET IDENTITY_INSERT [dbo].[Grocer] OFF
SET IDENTITY_INSERT [dbo].[GroceryItem] ON 

INSERT [dbo].[GroceryItem] ([GroceryItemId], [GrocerId], [Name], [weight], [unitid], [price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath]) VALUES (1, 5, N'Tomato', N'1', 2, N'10.00', 1, CAST(N'2019-03-13T09:11:57.130' AS DateTime), 1, CAST(N'2019-03-13T09:17:44.373' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[GroceryItem] ([GroceryItemId], [GrocerId], [Name], [weight], [unitid], [price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath]) VALUES (2, 5, N'Apple', N'2', 2, N'107', 1, CAST(N'2019-03-13T09:14:48.983' AS DateTime), 1, CAST(N'2019-03-13T09:17:54.903' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[GroceryItem] ([GroceryItemId], [GrocerId], [Name], [weight], [unitid], [price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath]) VALUES (3, 5, N'asss1', N'231', 3, N'231', 1, CAST(N'2019-03-13T12:01:32.587' AS DateTime), 2, CAST(N'2019-03-25T15:22:43.197' AS DateTime), 0, 0, NULL)
INSERT [dbo].[GroceryItem] ([GroceryItemId], [GrocerId], [Name], [weight], [unitid], [price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath]) VALUES (4, 5, N'11111q', N'222224', 3, N'333334', 1, CAST(N'2019-03-13T12:13:12.607' AS DateTime), 22, CAST(N'2019-03-25T15:24:17.610' AS DateTime), 0, 0, NULL)
INSERT [dbo].[GroceryItem] ([GroceryItemId], [GrocerId], [Name], [weight], [unitid], [price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath]) VALUES (5, 5, N'22222', N'333333', 4, N'4444444', 1, CAST(N'2019-03-13T12:13:35.413' AS DateTime), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[GroceryItem] ([GroceryItemId], [GrocerId], [Name], [weight], [unitid], [price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath]) VALUES (6, 5, N'11111a', N'333337', 3, N'22227', 1, CAST(N'2019-03-13T12:17:59.223' AS DateTime), 1, CAST(N'2019-03-13T12:18:50.637' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[GroceryItem] ([GroceryItemId], [GrocerId], [Name], [weight], [unitid], [price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath]) VALUES (7, 5, N'sdfsf', N'2342', 2, N'24234', 1, CAST(N'2019-03-13T22:20:41.017' AS DateTime), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[GroceryItem] ([GroceryItemId], [GrocerId], [Name], [weight], [unitid], [price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath]) VALUES (8, 5, N'vvvvq', N'34', 4, N'4443', 9, CAST(N'2019-03-19T09:37:32.513' AS DateTime), 9, CAST(N'2019-03-19T09:41:45.713' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[GroceryItem] ([GroceryItemId], [GrocerId], [Name], [weight], [unitid], [price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [IsOutofstock], [PhotoPath]) VALUES (9, 3, N'xx', N'3', 4, N'3.00', 10, CAST(N'2019-04-09T22:04:53.017' AS DateTime), NULL, NULL, 0, NULL, N'')
SET IDENTITY_INSERT [dbo].[GroceryItem] OFF
SET IDENTITY_INSERT [dbo].[GroceryOrder] ON 

INSERT [dbo].[GroceryOrder] ([GroceryOrderId], [GrocerId], [OrderStatusId], [Total], [PaymentStatusId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [LoginId], [OrderDate], [TransactionId], [TrackingId], [BankRefNo], [OrderStatus]) VALUES (1, 3, 1, N'1', 2, NULL, NULL, 1, CAST(N'2019-03-15T13:11:15.967' AS DateTime), 0, 1, N'03-03-2019', NULL, NULL, NULL, NULL)
INSERT [dbo].[GroceryOrder] ([GroceryOrderId], [GrocerId], [OrderStatusId], [Total], [PaymentStatusId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [LoginId], [OrderDate], [TransactionId], [TrackingId], [BankRefNo], [OrderStatus]) VALUES (2, 5, 1, N'36.00', 2, 7, CAST(N'2019-05-20T23:40:01.003' AS DateTime), NULL, NULL, 0, 7, N'5/20/2019 11:40:01 PM', N'1558375800326', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GroceryOrder] OFF
SET IDENTITY_INSERT [dbo].[GroceryOrderItems] ON 

INSERT [dbo].[GroceryOrderItems] ([GroceryOrderItemsId], [GroceryOrderId], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [GroceryItemId]) VALUES (1, 1, 3, N'30.00', NULL, NULL, NULL, NULL, 0, 1)
INSERT [dbo].[GroceryOrderItems] ([GroceryOrderItemsId], [GroceryOrderId], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [GroceryItemId]) VALUES (2, 1, 1, N'1', NULL, NULL, NULL, NULL, 0, 3)
INSERT [dbo].[GroceryOrderItems] ([GroceryOrderItemsId], [GroceryOrderId], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [GroceryItemId]) VALUES (3, 2, 0, N'333334', 7, CAST(N'2019-05-20T23:40:01.583' AS DateTime), NULL, NULL, 0, 4)
INSERT [dbo].[GroceryOrderItems] ([GroceryOrderItemsId], [GroceryOrderId], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [GroceryItemId]) VALUES (4, 2, 0, N'231', 7, CAST(N'2019-05-20T23:40:01.583' AS DateTime), NULL, NULL, 0, 3)
INSERT [dbo].[GroceryOrderItems] ([GroceryOrderItemsId], [GroceryOrderId], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [GroceryItemId]) VALUES (5, 2, 3, N'10', 7, CAST(N'2019-05-20T23:40:01.580' AS DateTime), NULL, NULL, 0, 1)
INSERT [dbo].[GroceryOrderItems] ([GroceryOrderItemsId], [GroceryOrderId], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [GroceryItemId]) VALUES (6, 2, 0, N'107', 7, CAST(N'2019-05-20T23:40:01.593' AS DateTime), NULL, NULL, 0, 2)
INSERT [dbo].[GroceryOrderItems] ([GroceryOrderItemsId], [GroceryOrderId], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [GroceryItemId]) VALUES (7, 2, 0, N'4444444', 7, CAST(N'2019-05-20T23:40:01.583' AS DateTime), NULL, NULL, 0, 5)
INSERT [dbo].[GroceryOrderItems] ([GroceryOrderItemsId], [GroceryOrderId], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [GroceryItemId]) VALUES (8, 2, 0, N'22227', 7, CAST(N'2019-05-20T23:40:01.807' AS DateTime), NULL, NULL, 0, 6)
INSERT [dbo].[GroceryOrderItems] ([GroceryOrderItemsId], [GroceryOrderId], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [GroceryItemId]) VALUES (9, 2, 0, N'24234', 7, CAST(N'2019-05-20T23:40:01.827' AS DateTime), NULL, NULL, 0, 7)
SET IDENTITY_INSERT [dbo].[GroceryOrderItems] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (1, N'Test11', N'Shinekk1!', N'far@w1', 1, 3, NULL, NULL, 1, CAST(N'2019-04-15T11:57:18.913' AS DateTime), 0, N'Balaji1', N'9894524954', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (2, N'Shinebalaji', N'Balaji2!', N'shinebalaji@yahoo.co.in', 1, 1, NULL, NULL, NULL, NULL, 0, N'Balaji', N'123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (3, N'daddad', N'Shinelee2!', N'zczc@f', 1, 2, 1, CAST(N'2019-03-16T09:23:10.260' AS DateTime), NULL, NULL, 0, N'dadasd', N'fsfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (4, N'sgsgsg', N'Shinelee2!', N'adasd@dd', 1, 3, 1, CAST(N'2019-03-16T09:25:58.203' AS DateTime), 2, CAST(N'2019-03-19T13:17:20.130' AS DateTime), 1, N'dasdsd', N'asdad', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (5, N'dasdad', N'Shinelee2!', N'sdsd@dd', 1, 3, 1, CAST(N'2019-03-16T09:27:01.410' AS DateTime), 1, CAST(N'2019-03-16T09:47:50.140' AS DateTime), 1, N'sfsf', N'ddsdsd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (7, N'shinebalaji', N'Shinelee2', N'sdsd@sds.com', 1, 4, NULL, CAST(N'2019-03-18T19:56:29.667' AS DateTime), 7, CAST(N'2019-05-20T23:22:07.683' AS DateTime), 0, N'Balaswamy', N'9999999988', NULL, NULL, N'http://images.ellamey.online/IMG_20190407_191419.jpg', N'xx', N'xxx', N'333333', N'eeee', 5, 9)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (8, N'shinekkk', N'Shinerr2', N'sd@ss', 1, 4, NULL, CAST(N'2019-03-18T19:59:22.437' AS DateTime), NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (9, N'dd', N'Shinelee2', N'dsds@dsd', 1, 3, NULL, CAST(N'2019-03-18T20:13:18.813' AS DateTime), 2, CAST(N'2019-03-19T12:48:39.803' AS DateTime), 0, N'Test', N'Test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (10, N'sdsd', N'Shine2', N'sss2ss@s', 1, 3, NULL, CAST(N'2019-03-19T09:45:08.173' AS DateTime), 2, CAST(N'2019-03-19T13:15:46.903' AS DateTime), 0, N'fsdf', N'sdfsf', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (11, N'sdsdsdsd', N'S2dddddd', N'asas@ddddd1df', 1, 2, NULL, CAST(N'2019-03-19T09:49:32.270' AS DateTime), 11, CAST(N'2019-04-25T21:36:35.867' AS DateTime), 0, N'xxxxbn23bndd1df', N'33333', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (12, N'dsfsf', N'Shinelee2', N'ddd@ddd', 1, 1, 2, CAST(N'2019-03-19T11:46:50.533' AS DateTime), NULL, NULL, 0, N'vxcvxv', N'xvcxv', 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (13, N'ffsfsdf', N'Shinelee2', N'zxczc@d', 1, 1, 2, CAST(N'2019-03-19T11:59:49.187' AS DateTime), NULL, NULL, 0, N'czcz', N'cxzcz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (14, N'dffsf', N'Shinelee2', N'zc@ss', 1, 4, 2, CAST(N'2019-03-19T12:01:15.927' AS DateTime), NULL, NULL, 0, N'zxc', N'zxcz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (15, N'czxczc', N'Shinelee2', N'ad@ddd', 1, 3, 2, CAST(N'2019-03-19T12:02:13.387' AS DateTime), NULL, NULL, 0, N'dsd', N'adasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (16, N'asadsd', N'Shinelee2', N'cv@dsds', 1, 2, 2, CAST(N'2019-03-19T12:03:17.977' AS DateTime), NULL, NULL, 0, N'cvcv', N'cvv', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (17, N'sfsfs', N'Shinelee2', N'xv@xcxc', 1, 4, 2, CAST(N'2019-03-19T12:04:04.793' AS DateTime), NULL, NULL, 0, N'xcvx', N'xvcxv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (18, N'czczxc', N'Shinelee2', N'ss@ddd', 1, 2, 2, CAST(N'2019-03-19T12:05:14.713' AS DateTime), NULL, NULL, 0, N'vcxv', N'xcvxv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (19, N'hdsdhgtest', N'Shinelee2!', N'ss@ff', 1, 1, 2, CAST(N'2019-03-24T15:50:10.000' AS DateTime), 2, CAST(N'2019-03-24T15:51:31.467' AS DateTime), 1, N'jjjdh', N'kjkj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (20, N'sfds', N'Shinelee2', N'Seeeee@dd', 1, 3, 2, CAST(N'2019-03-25T13:37:59.493' AS DateTime), 2, CAST(N'2019-03-25T14:31:08.300' AS DateTime), 0, N'xvxvx', N'432424324', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (21, N'sdfsfsf', N'Shinelee3!', N'sss@ssss', 1, 2, 2, CAST(N'2019-03-25T14:32:03.940' AS DateTime), 2, CAST(N'2019-03-25T14:37:54.863' AS DateTime), 0, N'sdsd', N'232323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (22, N'DSDAD', N'Shinelee2', N'ss@dddd', 1, 3, 2, CAST(N'2019-03-25T14:41:47.893' AS DateTime), 2, CAST(N'2019-03-25T14:58:50.083' AS DateTime), 0, N'fdsf', N'sdfsf', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (23, N'saad', N'Shinelee2', N'sdfs@dfdfz', 1, 3, 2, CAST(N'2019-03-25T14:46:08.060' AS DateTime), 23, CAST(N'2019-04-25T22:15:45.410' AS DateTime), 0, N'fdfzx', N'sdfsf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (24, N'dadsad', N'Shine2', N'dd@www', 1, 3, 2, CAST(N'2019-03-25T14:46:41.893' AS DateTime), NULL, NULL, 0, N'ad', N'sdad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (25, N'dadad', N'Shinelee2', N'xxx@ss', 1, 2, 2, CAST(N'2019-03-25T15:00:53.380' AS DateTime), 2, CAST(N'2019-03-25T15:01:26.917' AS DateTime), 0, N'xx', N'xxxx', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (26, N'xxxxxxx', N'Shineleee2', N'xxx@xxxx', 1, 4, NULL, CAST(N'2019-04-01T20:37:32.757' AS DateTime), NULL, NULL, 0, NULL, N'9888888888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Login] ([LoginId], [UserName], [Password], [Email], [isToRead], [RoleId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Name], [PhoneNumber], [RestaurateurId], [GrocerId], [PhotoPath], [Address1], [Address2], [postalcode], [city], [stateid], [countryid]) VALUES (27, N'xxxx', N'A2sssss', N'ddd@ffff', 1, 5, 12, CAST(N'2019-05-20T23:11:31.837' AS DateTime), 12, CAST(N'2019-05-20T23:12:21.713' AS DateTime), 0, N'ss', N'55555555', NULL, NULL, N'', N'ss', N'sss', N'333333', N'ddd', 19, 9)
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[OrderStatusGrocer] ON 

INSERT [dbo].[OrderStatusGrocer] ([OrderStatusId], [OrderStatusName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (1, N'Order Received', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderStatusGrocer] ([OrderStatusId], [OrderStatusName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (2, N'Shipped', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderStatusGrocer] ([OrderStatusId], [OrderStatusName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (3, N'Delivered!!!', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderStatusGrocer] OFF
SET IDENTITY_INSERT [dbo].[OrderStatusRestaurateur] ON 

INSERT [dbo].[OrderStatusRestaurateur] ([OrderStatusId], [OrderStatusName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (1, N'Order Received', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderStatusRestaurateur] ([OrderStatusId], [OrderStatusName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (2, N'Preparing', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderStatusRestaurateur] ([OrderStatusId], [OrderStatusName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (3, N'Cooking', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderStatusRestaurateur] ([OrderStatusId], [OrderStatusName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (4, N'Arriving', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderStatusRestaurateur] ([OrderStatusId], [OrderStatusName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (5, N'Delivered!!!', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderStatusRestaurateur] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([PaymentMethodId], [method], [type], [link], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (1, N'test3', N'sdada', N'asdada', 1, CAST(N'2019-03-12T14:55:13.637' AS DateTime), 1, CAST(N'2019-04-08T20:46:20.697' AS DateTime), NULL)
INSERT [dbo].[PaymentMethod] ([PaymentMethodId], [method], [type], [link], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (2, N'dasda1', N'asdad', N'sdadad', 2, CAST(N'2019-03-18T13:28:17.577' AS DateTime), 2, CAST(N'2019-03-18T13:30:19.963' AS DateTime), 1)
INSERT [dbo].[PaymentMethod] ([PaymentMethodId], [method], [type], [link], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (3, N'cvcv', N'cvcv', N'cvcvcv', 2, CAST(N'2019-03-23T14:04:15.663' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[PaymentMethod] ([PaymentMethodId], [method], [type], [link], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (4, N'xx', N'xxx', N'333', 2, CAST(N'2019-03-24T13:18:13.617' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
SET IDENTITY_INSERT [dbo].[PaymentStatus] ON 

INSERT [dbo].[PaymentStatus] ([PaymentStatusId], [PaymentStatusName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (1, N'Paid', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PaymentStatus] ([PaymentStatusId], [PaymentStatusName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (2, N'Pending', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PaymentStatus] OFF
SET IDENTITY_INSERT [dbo].[RestaurantOrder] ON 

INSERT [dbo].[RestaurantOrder] ([RestaurantOrderId], [RestaurateurId], [OrderStatusId], [Total], [PaymentStatusId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [LoginId], [OrderDate], [TransactionId], [TrackingId], [BankRefNo], [OrderStatus]) VALUES (1, 5, 1, N'1', 1, NULL, NULL, 2, CAST(N'2019-05-09T22:57:53.247' AS DateTime), 0, 1, N'03-03-2019', NULL, NULL, NULL, NULL)
INSERT [dbo].[RestaurantOrder] ([RestaurantOrderId], [RestaurateurId], [OrderStatusId], [Total], [PaymentStatusId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [LoginId], [OrderDate], [TransactionId], [TrackingId], [BankRefNo], [OrderStatus]) VALUES (2, 6, 2, N'1', 1, NULL, NULL, 11, CAST(N'2019-03-20T10:18:52.873' AS DateTime), 0, 1, N'03-03-2019', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RestaurantOrder] OFF
SET IDENTITY_INSERT [dbo].[RestaurantOrderItems] ON 

INSERT [dbo].[RestaurantOrderItems] ([RestaurantOrderItemsId], [RestaurantOrderId], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [FoodItemId]) VALUES (5, 2, 3, N'345', NULL, NULL, NULL, NULL, 0, 6)
SET IDENTITY_INSERT [dbo].[RestaurantOrderItems] OFF
SET IDENTITY_INSERT [dbo].[Restaurateur] ON 

INSERT [dbo].[Restaurateur] ([RestaurateurId], [Name], [city], [website], [phonenumber], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [latitude], [longitude], [PhotoPath]) VALUES (1, N'Thambi Hotel', N'Coimbatore', N'asad', N'asdad', N'asdadd@we', 1, CAST(N'2019-03-12T12:22:26.590' AS DateTime), 1, CAST(N'2019-03-12T14:21:15.947' AS DateTime), 0, N'adasd', N'ada', 1, 9, N'dasdad', N'sada', N'adsad', N'dsada', N'asdadsas', N'asdad', 11.127122499999999, 78.6568942, N'http://images.ellamey.online/images.jpg')
INSERT [dbo].[Restaurateur] ([RestaurateurId], [Name], [city], [website], [phonenumber], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [latitude], [longitude], [PhotoPath]) VALUES (2, N'Aiswariya Drive Inn', N'Coimbatore', N'sfsd', N'sdfsf', N'fsdf@w', 1, CAST(N'2019-03-12T13:25:29.197' AS DateTime), 1, CAST(N'2019-03-12T14:21:27.677' AS DateTime), 0, N'sdfds', N'sfsdf', 4, 9, N'', N'fsdf', N'sfds', N'sfdsf', N'fsdff', N'sdfs', 11.072103, 77.296983, NULL)
INSERT [dbo].[Restaurateur] ([RestaurateurId], [Name], [city], [website], [phonenumber], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [latitude], [longitude], [PhotoPath]) VALUES (3, N'Sri Balaji Bhavan', N'Coimbatore', N'666666q', N'77777q', N'888@8q', 1, CAST(N'2019-03-12T13:26:47.810' AS DateTime), 1, CAST(N'2019-03-12T13:44:34.163' AS DateTime), 0, N'22222q', N'33333q', 10, 9, N'99999q', N'11111q', N'22222q', N'33333q', N'44444q', N'55555q', 11.270161, 77.408709, NULL)
INSERT [dbo].[Restaurateur] ([RestaurateurId], [Name], [city], [website], [phonenumber], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [latitude], [longitude], [PhotoPath]) VALUES (4, N'11111a', N'4444a', N'66666a', N'77777a', N'888882@da', 1, CAST(N'2019-03-12T13:47:33.370' AS DateTime), 1, CAST(N'2019-03-12T13:48:40.527' AS DateTime), 0, N'2222a', N'33333a', 1, 9, N'', N'9999a', N'1111a', N'22222a', N'33333a', N'55555a', 12.972057, 80.239828, NULL)
INSERT [dbo].[Restaurateur] ([RestaurateurId], [Name], [city], [website], [phonenumber], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [latitude], [longitude], [PhotoPath]) VALUES (5, N'sdasd', N'sd', N'asda', N'asdasd', N'sdad@ww', 1, CAST(N'2019-03-12T14:54:14.167' AS DateTime), 1, CAST(N'2019-03-13T22:23:47.190' AS DateTime), 0, N'sd', N'asd', 5, 9, N'sdaddsad', N'dasd', N'ad', N'asdadad', N'sdadasasd', N'saasd', 11.15945, 77.38188, NULL)
INSERT [dbo].[Restaurateur] ([RestaurateurId], [Name], [city], [website], [phonenumber], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [latitude], [longitude], [PhotoPath]) VALUES (6, N'asd', N'asdad', N'1231', N'32131', N'eee@er.com', 1, CAST(N'2019-03-13T22:25:38.827' AS DateTime), NULL, NULL, 0, N'adsad', N'adsad', 4, 9, N'sdfsdfs', N'sdfsf', N'sdfsf', N'sfsdf', N'sdfsf', N'2313', NULL, NULL, NULL)
INSERT [dbo].[Restaurateur] ([RestaurateurId], [Name], [city], [website], [phonenumber], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [latitude], [longitude], [PhotoPath]) VALUES (7, N'fgdd', N'dfgdg', N'dfgdg', N'fddgdgd', N'dfgdg@we', 2, CAST(N'2019-03-18T14:23:04.373' AS DateTime), 2, CAST(N'2019-03-18T14:23:59.330' AS DateTime), 0, N'dfgdg', N'dfgd', 4, 9, N'fgdgdgd', N'dfgdgd', N'df', N'dfgfgdg', N'gdfgdgfdg', N'dfgdgd', NULL, NULL, NULL)
INSERT [dbo].[Restaurateur] ([RestaurateurId], [Name], [city], [website], [phonenumber], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [latitude], [longitude], [PhotoPath]) VALUES (8, N'Aiswariya Drive Inn', N'Coimbatore', N'sdfsf', N'sdfsf', N'sdfsf@w', 2, CAST(N'2019-03-25T19:23:33.453' AS DateTime), 2, CAST(N'2019-03-25T19:46:32.283' AS DateTime), 0, N'fs', N'sfsd', 1, 9, N'', N'cccc', N'cccc', N'cccccc', N'ccccc', N'sdfs', 11.127122445, 78.656894245, NULL)
INSERT [dbo].[Restaurateur] ([RestaurateurId], [Name], [city], [website], [phonenumber], [email], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [address1], [address2], [stateid], [countryid], [gstin], [bankaccountname], [bankname], [ifsccode], [accountnumber], [postalcode], [latitude], [longitude], [PhotoPath]) VALUES (9, N'Sri Balaji Bhavan', N'Coimbatore', N'ddd', N'ddddc', N'dd@dddd', 2, CAST(N'2019-03-25T19:47:56.117' AS DateTime), 2, CAST(N'2019-03-25T19:48:49.013' AS DateTime), 0, N'ddd', N'ddd', 3, 9, N'', N'ddd', N'dddd', N'ddddd', N'ddddd', N'dddd', 11.127122499999999, 78.656894212, N'http://images.ellamey.online/images.jpg')
SET IDENTITY_INSERT [dbo].[Restaurateur] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (1, N'Admin', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (2, N'Restaurateur', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (3, N'Grocer', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (4, N'Customer', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (5, N'Driver', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (1, N'Arunachal Pradesh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (2, N'Andhra Pradesh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (3, N'Assam', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (4, N'Bihar', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (5, N'Chhattisgarh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (6, N'Goa', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (7, N'Gujarat', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (8, N'Haryana', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (9, N'Himachal Pradesh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (10, N'Jammu and Kashmir', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (11, N'Jharkhand', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (12, N'Karnataka', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (13, N'Kerala', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (14, N'Madhya Pradesh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (15, N'Maharashtra', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (16, N'Manipur', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (17, N'Meghalaya', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (18, N'Mizoram', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (19, N'Nagaland', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (20, N'Odisha', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (21, N'Punjab', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (22, N'Rajasthan', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (23, N'Sikkim', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (24, N'Tamil Nadu', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (25, N'Telangana', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (26, N'Tripura', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (27, N'Uttar Pradesh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (28, N'Uttarakhand', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[State] ([StateId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (29, N'West Bengal', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([UnitId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (1, N'gm', N'Grams', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Unit] ([UnitId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (2, N'kg', N'Kilo Grams', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Unit] ([UnitId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (3, N'pc', N'Piece', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Unit] ([UnitId], [Name], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted]) VALUES (4, N'pcs', N'Pieces', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Unit] OFF
ALTER TABLE [dbo].[FoodItem] ADD  CONSTRAINT [DF_FoodItem_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Grocer] ADD  CONSTRAINT [DF_Grocer_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GroceryItem] ADD  CONSTRAINT [DF_GroceryItem_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GroceryOrder] ADD  CONSTRAINT [DF_GroceryOrder_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GroceryOrderItems] ADD  CONSTRAINT [DF_GroceryOrderItems_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RestaurantOrder] ADD  CONSTRAINT [DF_RestaurantOrder_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RestaurantOrderItems] ADD  CONSTRAINT [DF_RestaurantOrderItems_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Restaurateur] ADD  CONSTRAINT [DF_Restaurateur_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[FoodItem]  WITH CHECK ADD  CONSTRAINT [FK_FoodItem_Restaurateur] FOREIGN KEY([RestaurateurId])
REFERENCES [dbo].[Restaurateur] ([RestaurateurId])
GO
ALTER TABLE [dbo].[FoodItem] CHECK CONSTRAINT [FK_FoodItem_Restaurateur]
GO
ALTER TABLE [dbo].[FoodSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_FoodSubCategory_FoodCategory] FOREIGN KEY([FoodCategoryId])
REFERENCES [dbo].[FoodCategory] ([FoodCategoryId])
GO
ALTER TABLE [dbo].[FoodSubCategory] CHECK CONSTRAINT [FK_FoodSubCategory_FoodCategory]
GO
ALTER TABLE [dbo].[Grocer]  WITH CHECK ADD  CONSTRAINT [FK_Grocer_conutry] FOREIGN KEY([countryid])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Grocer] CHECK CONSTRAINT [FK_Grocer_conutry]
GO
ALTER TABLE [dbo].[Grocer]  WITH CHECK ADD  CONSTRAINT [FK_Grocer_state] FOREIGN KEY([stateid])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[Grocer] CHECK CONSTRAINT [FK_Grocer_state]
GO
ALTER TABLE [dbo].[GroceryItem]  WITH CHECK ADD  CONSTRAINT [FK_GroceryItem_Grocer] FOREIGN KEY([GrocerId])
REFERENCES [dbo].[Grocer] ([GrocerId])
GO
ALTER TABLE [dbo].[GroceryItem] CHECK CONSTRAINT [FK_GroceryItem_Grocer]
GO
ALTER TABLE [dbo].[GroceryItem]  WITH CHECK ADD  CONSTRAINT [FK_GroceryItem_Unit] FOREIGN KEY([unitid])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[GroceryItem] CHECK CONSTRAINT [FK_GroceryItem_Unit]
GO
ALTER TABLE [dbo].[GroceryOrder]  WITH CHECK ADD  CONSTRAINT [FK_GroceryOrder_Grocer] FOREIGN KEY([GrocerId])
REFERENCES [dbo].[Grocer] ([GrocerId])
GO
ALTER TABLE [dbo].[GroceryOrder] CHECK CONSTRAINT [FK_GroceryOrder_Grocer]
GO
ALTER TABLE [dbo].[GroceryOrder]  WITH CHECK ADD  CONSTRAINT [FK_GroceryOrder_Login] FOREIGN KEY([LoginId])
REFERENCES [dbo].[Login] ([LoginId])
GO
ALTER TABLE [dbo].[GroceryOrder] CHECK CONSTRAINT [FK_GroceryOrder_Login]
GO
ALTER TABLE [dbo].[GroceryOrder]  WITH CHECK ADD  CONSTRAINT [FK_GroceryOrder_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatusGrocer] ([OrderStatusId])
GO
ALTER TABLE [dbo].[GroceryOrder] CHECK CONSTRAINT [FK_GroceryOrder_OrderStatus]
GO
ALTER TABLE [dbo].[GroceryOrder]  WITH CHECK ADD  CONSTRAINT [FK_GroceryOrder_PaymentStatus] FOREIGN KEY([PaymentStatusId])
REFERENCES [dbo].[PaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[GroceryOrder] CHECK CONSTRAINT [FK_GroceryOrder_PaymentStatus]
GO
ALTER TABLE [dbo].[GroceryOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_GroceryOrderItems_GroceryItem] FOREIGN KEY([GroceryItemId])
REFERENCES [dbo].[GroceryItem] ([GroceryItemId])
GO
ALTER TABLE [dbo].[GroceryOrderItems] CHECK CONSTRAINT [FK_GroceryOrderItems_GroceryItem]
GO
ALTER TABLE [dbo].[GroceryOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_GroceryOrderItems_GroceryOrder] FOREIGN KEY([GroceryOrderId])
REFERENCES [dbo].[GroceryOrder] ([GroceryOrderId])
GO
ALTER TABLE [dbo].[GroceryOrderItems] CHECK CONSTRAINT [FK_GroceryOrderItems_GroceryOrder]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Roles]
GO
ALTER TABLE [dbo].[RestaurantOrder]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantOrder_Login] FOREIGN KEY([LoginId])
REFERENCES [dbo].[Login] ([LoginId])
GO
ALTER TABLE [dbo].[RestaurantOrder] CHECK CONSTRAINT [FK_RestaurantOrder_Login]
GO
ALTER TABLE [dbo].[RestaurantOrder]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantOrder_OrderStatusRestaurateur] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatusRestaurateur] ([OrderStatusId])
GO
ALTER TABLE [dbo].[RestaurantOrder] CHECK CONSTRAINT [FK_RestaurantOrder_OrderStatusRestaurateur]
GO
ALTER TABLE [dbo].[RestaurantOrder]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantOrder_PaymentStatus] FOREIGN KEY([PaymentStatusId])
REFERENCES [dbo].[PaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[RestaurantOrder] CHECK CONSTRAINT [FK_RestaurantOrder_PaymentStatus]
GO
ALTER TABLE [dbo].[RestaurantOrder]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantOrder_Restaurateur] FOREIGN KEY([RestaurateurId])
REFERENCES [dbo].[Restaurateur] ([RestaurateurId])
GO
ALTER TABLE [dbo].[RestaurantOrder] CHECK CONSTRAINT [FK_RestaurantOrder_Restaurateur]
GO
ALTER TABLE [dbo].[RestaurantOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantOrderItems_FoodItem] FOREIGN KEY([FoodItemId])
REFERENCES [dbo].[FoodItem] ([FoodItemId])
GO
ALTER TABLE [dbo].[RestaurantOrderItems] CHECK CONSTRAINT [FK_RestaurantOrderItems_FoodItem]
GO
ALTER TABLE [dbo].[RestaurantOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantOrderItems_RestaurantOrder] FOREIGN KEY([RestaurantOrderId])
REFERENCES [dbo].[RestaurantOrder] ([RestaurantOrderId])
GO
ALTER TABLE [dbo].[RestaurantOrderItems] CHECK CONSTRAINT [FK_RestaurantOrderItems_RestaurantOrder]
GO
ALTER TABLE [dbo].[Restaurateur]  WITH CHECK ADD  CONSTRAINT [FK_Restaurateur_conutry] FOREIGN KEY([countryid])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Restaurateur] CHECK CONSTRAINT [FK_Restaurateur_conutry]
GO
ALTER TABLE [dbo].[Restaurateur]  WITH CHECK ADD  CONSTRAINT [FK_Restaurateur_state] FOREIGN KEY([stateid])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[Restaurateur] CHECK CONSTRAINT [FK_Restaurateur_state]
GO
/****** Object:  StoredProcedure [dbo].[sp_getgroceryshops]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[sp_getgroceryshops]
@LATITUDE AS FLOAT,
@LONGITUDE AS FLOAT,
@Distance AS FLOAT
as
--DECLARE @LATITUDE AS FLOAT
--DECLARE @LONGITUDE AS FLOAT

--SET @LATITUDE = 11.156388
--SET @LONGITUDE = 77.374471

--SELECT RestaurateurId, Latitude, Longitude
--FROM [dbo].[Restaurateur]
--ORDER BY (ABS(ABS(LATITUDE)-ABS(@LATITUDE)))+ABS(ABS(LONGITUDE)-ABS(@LONGITUDE))
--6371 for kms
select * from
(SELECT *,( 6371 * acos( cos( radians(@LATITUDE) ) * cos( radians( Latitude ) ) * 
cos( radians( Longitude ) - radians(@LONGITUDE) ) + sin( radians(@LATITUDE) ) * 
sin( radians( Latitude ) ) ) ) AS distance FROM [dbo].[Grocer]) as location_distance where distance<=@Distance

GO
/****** Object:  StoredProcedure [dbo].[sp_getrestaurants]    Script Date: 6/1/2019 9:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_getrestaurants]
@LATITUDE AS FLOAT,
@LONGITUDE AS FLOAT,
@Distance AS FLOAT
as
--DECLARE @LATITUDE AS FLOAT
--DECLARE @LONGITUDE AS FLOAT

--SET @LATITUDE = 11.156388
--SET @LONGITUDE = 77.374471

--SELECT RestaurateurId, Latitude, Longitude
--FROM [dbo].[Restaurateur]
--ORDER BY (ABS(ABS(LATITUDE)-ABS(@LATITUDE)))+ABS(ABS(LONGITUDE)-ABS(@LONGITUDE))
--6371 for kms
select * from
(SELECT *,( 6371 * acos( cos( radians(@LATITUDE) ) * cos( radians( Latitude ) ) * 
cos( radians( Longitude ) - radians(@LONGITUDE) ) + sin( radians(@LATITUDE) ) * 
sin( radians( Latitude ) ) ) ) AS distance FROM [dbo].[Restaurateur]) as location_distance where distance<=@Distance

GO
USE [master]
GO
ALTER DATABASE [Ellamey] SET  READ_WRITE 
GO
