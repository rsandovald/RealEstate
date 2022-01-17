
/****** Object:  StoredProcedure [RealEstate].[RegionFindByCode]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP PROCEDURE IF EXISTS [RealEstate].[RegionFindByCode]
GO
/****** Object:  StoredProcedure [RealEstate].[PropertyViewSelect]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP PROCEDURE IF EXISTS [RealEstate].[PropertyViewSelect]
GO
/****** Object:  StoredProcedure [RealEstate].[PropertyUpdate]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP PROCEDURE IF EXISTS [RealEstate].[PropertyUpdate]
GO
/****** Object:  StoredProcedure [RealEstate].[PropertyInsert]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP PROCEDURE IF EXISTS [RealEstate].[PropertyInsert]
GO
/****** Object:  StoredProcedure [RealEstate].[PropertyImageInsert]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP PROCEDURE IF EXISTS [RealEstate].[PropertyImageInsert]
GO
/****** Object:  StoredProcedure [RealEstate].[PropertyImageFindByPropertyId]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP PROCEDURE IF EXISTS [RealEstate].[PropertyImageFindByPropertyId]
GO
/****** Object:  StoredProcedure [RealEstate].[PersonFindByEmail]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP PROCEDURE IF EXISTS [RealEstate].[PersonFindByEmail]
GO
/****** Object:  StoredProcedure [RealEstate].[ApplicationLogInsert]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP PROCEDURE IF EXISTS [RealEstate].[ApplicationLogInsert]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[TransactionLog]') AND type in (N'U'))
ALTER TABLE [RealEstate].[TransactionLog] DROP CONSTRAINT IF EXISTS [FK__Transacti__Appli__3D5E1FD2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[Region]') AND type in (N'U'))
ALTER TABLE [RealEstate].[Region] DROP CONSTRAINT IF EXISTS [FK__Region__ParentRe__403A8C7D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[PropertySale]') AND type in (N'U'))
ALTER TABLE [RealEstate].[PropertySale] DROP CONSTRAINT IF EXISTS [FK__PropertyS__Prope__440B1D61]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[PropertySale]') AND type in (N'U'))
ALTER TABLE [RealEstate].[PropertySale] DROP CONSTRAINT IF EXISTS [FK__PropertyS__Custo__44FF419A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[PropertyImage]') AND type in (N'U'))
ALTER TABLE [RealEstate].[PropertyImage] DROP CONSTRAINT IF EXISTS [FK__PropertyI__Prope__45F365D3]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[PropertyExtendedFeature]') AND type in (N'U'))
ALTER TABLE [RealEstate].[PropertyExtendedFeature] DROP CONSTRAINT IF EXISTS [FK__PropertyE__Prope__46E78A0C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[PropertyExtendedFeature]') AND type in (N'U'))
ALTER TABLE [RealEstate].[PropertyExtendedFeature] DROP CONSTRAINT IF EXISTS [FK__PropertyE__Exten__47DBAE45]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[Property]') AND type in (N'U'))
ALTER TABLE [RealEstate].[Property] DROP CONSTRAINT IF EXISTS [FK_Property_Person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[Property]') AND type in (N'U'))
ALTER TABLE [RealEstate].[Property] DROP CONSTRAINT IF EXISTS [FK__Property__Region__4316F928]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[Person]') AND type in (N'U'))
ALTER TABLE [RealEstate].[Person] DROP CONSTRAINT IF EXISTS [FK__Person__RegionId__412EB0B6]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[ExtendedFeatureCatalog]') AND type in (N'U'))
ALTER TABLE [RealEstate].[ExtendedFeatureCatalog] DROP CONSTRAINT IF EXISTS [FK__ExtendedF__Catal__3F466844]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[CatalogItems]') AND type in (N'U'))
ALTER TABLE [RealEstate].[CatalogItems] DROP CONSTRAINT IF EXISTS [FK__CatalogIt__Catal__3E52440B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[ApplicationMessage]') AND type in (N'U'))
ALTER TABLE [RealEstate].[ApplicationMessage] DROP CONSTRAINT IF EXISTS [FK__Applicati__Appli__3C69FB99]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RealEstate].[ApplicationLog]') AND type in (N'U'))
ALTER TABLE [RealEstate].[ApplicationLog] DROP CONSTRAINT IF EXISTS [FK__Applicati__Appli__3B75D760]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserTokens]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserTokens] DROP CONSTRAINT IF EXISTS [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoleClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetRoleClaims] DROP CONSTRAINT IF EXISTS [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
/****** Object:  Index [IX_Property]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP INDEX IF EXISTS [IX_Property] ON [RealEstate].[Property]
GO
/****** Object:  Index [Person_index_1]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP INDEX IF EXISTS [Person_index_1] ON [RealEstate].[Person]
GO
/****** Object:  Index [Person_index_0]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP INDEX IF EXISTS [Person_index_0] ON [RealEstate].[Person]
GO
/****** Object:  Table [RealEstate].[TransactionLog]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[TransactionLog]
GO
/****** Object:  Table [RealEstate].[PropertySale]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[PropertySale]
GO
/****** Object:  Table [RealEstate].[PropertyImage]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[PropertyImage]
GO
/****** Object:  Table [RealEstate].[PropertyExtendedFeature]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[PropertyExtendedFeature]
GO
/****** Object:  Table [RealEstate].[ExtendedFeatureCatalog]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[ExtendedFeatureCatalog]
GO
/****** Object:  Table [RealEstate].[CatalogItems]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[CatalogItems]
GO
/****** Object:  Table [RealEstate].[Catalog]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[Catalog]
GO
/****** Object:  Table [RealEstate].[ApplicationMessage]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[ApplicationMessage]
GO
/****** Object:  Table [RealEstate].[ApplicationLog]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[ApplicationLog]
GO
/****** Object:  Table [RealEstate].[Application]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[Application]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserTokens]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoleClaims]
GO
/****** Object:  View [RealEstate].[PropertyView]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP VIEW IF EXISTS [RealEstate].[PropertyView]
GO
/****** Object:  Table [RealEstate].[Property]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[Property]
GO
/****** Object:  Table [RealEstate].[Person]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[Person]
GO
/****** Object:  Table [RealEstate].[Region]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP TABLE IF EXISTS [RealEstate].[Region]
GO
/****** Object:  Schema [RealEstate]    Script Date: 16/01/2022 9:18:55 a. m. ******/
DROP SCHEMA IF EXISTS [RealEstate]
GO
/****** Object:  Schema [RealEstate]    Script Date: 16/01/2022 9:18:55 a. m. ******/
CREATE SCHEMA [RealEstate]
GO
/****** Object:  Table [RealEstate].[Region]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[Region](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[ParentRegionId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[Person]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[Person](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Photo] [varchar](200) NULL,
	[BirthDay] [datetime] NULL,
	[Email] [varchar](200) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Address] [varchar](200) NULL,
	[RegionId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[Property]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[Property](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Year] [int] NOT NULL,
	[OwnerId] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[UpdatedBy] [varchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[RegionId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [RealEstate].[PropertyView]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [RealEstate].[PropertyView]
AS
SELECT        RealEstate.Property.Id, RealEstate.Property.Code, RealEstate.Property.Price, RealEstate.Property.Year, RealEstate.Property.OwnerId, RealEstate.Property.CreatedDate, RealEstate.Property.UpdatedDate, 
                         RealEstate.Property.CreatedBy, RealEstate.Property.UpdatedBy, RealEstate.Property.IsDeleted, RealEstate.Property.Address, RealEstate.Property.RegionId, RealEstate.Person.Name AS OwnerName, 
                         RealEstate.Person.Email AS OwnerEmail, RealEstate.Person.Phone AS OwnerPhone, RealEstate.Region.Name AS RegionName, RealEstate.Region.Code AS RegionCode
FROM            RealEstate.Region INNER JOIN
                         RealEstate.Property ON RealEstate.Region.Id = RealEstate.Property.RegionId INNER JOIN
                         RealEstate.Person ON RealEstate.Property.OwnerId = RealEstate.Person.Id
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[Application]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[Application](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[ApplicationLog]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[ApplicationLog](
	[Id] [uniqueidentifier] NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[ApplicationId] [uniqueidentifier] NULL,
	[TypeId] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[ApplicationMessage]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[ApplicationMessage](
	[Id] [uniqueidentifier] NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[TypeId] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[Catalog]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[Catalog](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[CatalogItems]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[CatalogItems](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[CatalogId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[ExtendedFeatureCatalog]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[ExtendedFeatureCatalog](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[CatalogItemsId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[PropertyExtendedFeature]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[PropertyExtendedFeature](
	[Id] [uniqueidentifier] NOT NULL,
	[VarcharValue] [varchar](100) NULL,
	[NumberValue] [decimal](10, 2) NULL,
	[BooleanValue] [bit] NULL,
	[PropertyId] [uniqueidentifier] NOT NULL,
	[ExtendedFeatureCatalogId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[PropertyImage]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[PropertyImage](
	[Id] [uniqueidentifier] NOT NULL,
	[File] [varchar](200) NOT NULL,
	[PropertyId] [uniqueidentifier] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
 CONSTRAINT [PK__Property__3214EC075AB9C98D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[PropertySale]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[PropertySale](
	[Id] [uniqueidentifier] NOT NULL,
	[DateSale] [datetime] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[PropertyId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Tax] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RealEstate].[TransactionLog]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RealEstate].[TransactionLog](
	[Id] [uniqueidentifier] NOT NULL,
	[InputData] [varchar](max) NOT NULL,
	[OutputData] [varchar](max) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[IndexData] [varchar](20) NULL,
	[StartedDate] [datetime] NOT NULL,
	[EndedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Person_index_0]    Script Date: 16/01/2022 9:18:55 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [Person_index_0] ON [RealEstate].[Person]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Person_index_1]    Script Date: 16/01/2022 9:18:55 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [Person_index_1] ON [RealEstate].[Person]
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Property]    Script Date: 16/01/2022 9:18:55 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Property] ON [RealEstate].[Property]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [RealEstate].[ApplicationLog]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [RealEstate].[Application] ([Id])
GO
ALTER TABLE [RealEstate].[ApplicationMessage]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [RealEstate].[Application] ([Id])
GO
ALTER TABLE [RealEstate].[CatalogItems]  WITH CHECK ADD FOREIGN KEY([CatalogId])
REFERENCES [RealEstate].[Catalog] ([Id])
GO
ALTER TABLE [RealEstate].[ExtendedFeatureCatalog]  WITH CHECK ADD FOREIGN KEY([CatalogItemsId])
REFERENCES [RealEstate].[CatalogItems] ([Id])
GO
ALTER TABLE [RealEstate].[Person]  WITH CHECK ADD FOREIGN KEY([RegionId])
REFERENCES [RealEstate].[Region] ([Id])
GO
ALTER TABLE [RealEstate].[Property]  WITH CHECK ADD FOREIGN KEY([RegionId])
REFERENCES [RealEstate].[Region] ([Id])
GO
ALTER TABLE [RealEstate].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Person] FOREIGN KEY([OwnerId])
REFERENCES [RealEstate].[Person] ([Id])
GO
ALTER TABLE [RealEstate].[Property] CHECK CONSTRAINT [FK_Property_Person]
GO
ALTER TABLE [RealEstate].[PropertyExtendedFeature]  WITH CHECK ADD FOREIGN KEY([ExtendedFeatureCatalogId])
REFERENCES [RealEstate].[ExtendedFeatureCatalog] ([Id])
GO
ALTER TABLE [RealEstate].[PropertyExtendedFeature]  WITH CHECK ADD  CONSTRAINT [FK__PropertyE__Prope__46E78A0C] FOREIGN KEY([PropertyId])
REFERENCES [RealEstate].[Property] ([Id])
GO
ALTER TABLE [RealEstate].[PropertyExtendedFeature] CHECK CONSTRAINT [FK__PropertyE__Prope__46E78A0C]
GO
ALTER TABLE [RealEstate].[PropertyImage]  WITH CHECK ADD  CONSTRAINT [FK__PropertyI__Prope__45F365D3] FOREIGN KEY([PropertyId])
REFERENCES [RealEstate].[Property] ([Id])
GO
ALTER TABLE [RealEstate].[PropertyImage] CHECK CONSTRAINT [FK__PropertyI__Prope__45F365D3]
GO
ALTER TABLE [RealEstate].[PropertySale]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [RealEstate].[Person] ([Id])
GO
ALTER TABLE [RealEstate].[PropertySale]  WITH CHECK ADD  CONSTRAINT [FK__PropertyS__Prope__440B1D61] FOREIGN KEY([PropertyId])
REFERENCES [RealEstate].[Property] ([Id])
GO
ALTER TABLE [RealEstate].[PropertySale] CHECK CONSTRAINT [FK__PropertyS__Prope__440B1D61]
GO
ALTER TABLE [RealEstate].[Region]  WITH CHECK ADD FOREIGN KEY([ParentRegionId])
REFERENCES [RealEstate].[Region] ([Id])
GO
ALTER TABLE [RealEstate].[TransactionLog]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [RealEstate].[Application] ([Id])
GO
/****** Object:  StoredProcedure [RealEstate].[ApplicationLogInsert]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    PROCEDURE   [RealEstate].[ApplicationLogInsert]
(@Message varchar(max)
,@ApplicationId uniqueidentifier
,@TypeId uniqueidentifier)
AS
BEGIN 

DECLARE @Id  AS uniqueidentifier
DECLARE @CreatedDate AS datetime

SET @Id = NEWID () 
SET @CreatedDate = GETDATE () 

INSERT INTO [RealEstate].[ApplicationLog]
           ([Id]
           ,[Message]
           ,[ApplicationId]
           ,[TypeId]
           ,[CreatedDate])
     VALUES
           (@Id
           ,@Message
           ,@ApplicationId
           ,@TypeId
           ,@CreatedDate) 

END
GO
/****** Object:  StoredProcedure [RealEstate].[PersonFindByEmail]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [RealEstate].[PersonFindByEmail]
@Email AS VARCHAR (200)
AS
BEGIN 
SELECT [Id]
      ,[Name]
      ,[Photo]
      ,[BirthDay]
      ,[Email]
      ,[Phone]
      ,[Address]
      ,[RegionId]
  FROM [RealEstate].[Person]
  WHERE
  Email = @Email
END 

GO
/****** Object:  StoredProcedure [RealEstate].[PropertyImageFindByPropertyId]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE   PROCEDURE  [RealEstate].[PropertyImageFindByPropertyId]
@PropertyId uniqueidentifier
AS 
BEGIN 

	SELECT [Id]
		  ,[File]
		  ,[PropertyId]
	FROM  [RealEstate].[PropertyImage]
	WHERE
		PropertyId = @PropertyId

END
GO
/****** Object:  StoredProcedure [RealEstate].[PropertyImageInsert]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE  [RealEstate].[PropertyImageInsert]
@Id AS  uniqueidentifier
, @File AS varchar(200)
, @PropertyId AS uniqueidentifier
,@UserEmail varchar(100)
AS
BEGIN 

	DECLARE	@CreatedDate datetime

	SET @CreatedDate = GETDATE () 

	INSERT INTO [RealEstate].[PropertyImage]
           ([Id]
           ,[File]
           ,[PropertyId]
           ,isDeleted
		   ,[CreatedDate]
           ,[UpdatedDate]
           ,[CreatedBy]
           ,[UpdatedBy])
     VALUES
           (@Id
		   , @File
		   , @PropertyId
		   , 0
		   , @CreatedDate
		   , NULL
		   , @UserEmail
		   , NULL)
END 


GO
/****** Object:  StoredProcedure [RealEstate].[PropertyInsert]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [RealEstate].[PropertyInsert]
( @Id  uniqueidentifier
, @Code varchar(50)
,@Price decimal(10,2)
,@Year  int
,@OwnerId uniqueidentifier
,@UserEmail varchar(100)
,@Address varchar(200)
,@RegionId uniqueidentifier
,@IsDeleted bit = 0
)
AS

BEGIN

DECLARE	@CreatedDate datetime

SET @CreatedDate = GETDATE () 

INSERT INTO [RealEstate].[Property]
           ([Id]
           ,[Code]
           ,[Price]
           ,[Year]
           ,[OwnerId]
           ,[CreatedDate]
           ,[UpdatedDate]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[Address]
           ,[RegionId]
		   )
     VALUES
           (@Id
           ,@Code
           ,@Price
           ,@Year
           ,@OwnerId
           ,@CreatedDate
           ,NULL
           ,@UserEmail
           ,NULL
           ,@IsDeleted
           ,@Address
           ,@RegionId  ) 
END 

GO
/****** Object:  StoredProcedure [RealEstate].[PropertyUpdate]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [RealEstate].[PropertyUpdate]
( @Id  uniqueidentifier = NULL
,@Code varchar(50)
,@Price decimal(10,2) = NULL
,@Year  int = NULL
,@OwnerId uniqueidentifier = NULL
,@UserEmail varchar(100)
,@Address varchar(200) = NULL
,@RegionId uniqueidentifier = NULL
,@IsDeleted bit = 0 ) 
AS
BEGIN

	DECLARE	@UpdatedDate datetime

	IF @Price = 0 
	BEGIN 
		SET @Price = NULL
	END

	IF @Year = 0 
	BEGIN 
		SET @Year = NULL 
	END

	IF @Address = '' 
	BEGIN 
		SET @Address = NULL
	END

	SET @UpdatedDate = GETDATE () 

	IF @Code IS NOT NULL
	BEGIN 
		UPDATE [RealEstate].[Property]
			SET 		   
				[Price] = ISNULL (@Price, Price)
				,[Year] = ISNULL (@Year, Year)
				,[OwnerId] = ISNULL (@OwnerId , OwnerId)    
				,[UpdatedDate] = @UpdatedDate
				,[UpdatedBy] = @UserEmail
				,[IsDeleted] = @IsDeleted
				,[Address] = ISNULL (@Address , Address) 
				,[RegionId] = ISNULL (@RegionId , RegionId) 
			WHERE 
			[Code] = @Code
	END
END 

GO
/****** Object:  StoredProcedure [RealEstate].[PropertyViewSelect]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     PROCEDURE [RealEstate].[PropertyViewSelect]
(@Id  uniqueidentifier = NULL
,@Code varchar(50)  = NULL
,@PriceGreaterThan	 decimal(10,2)  = 0
,@PriceLessThan	 decimal(10,2) = 99999999.99
,@YearGreatherThan  int = 0
,@YearLessThan  int = 9999
,@OwnerEmail varchar (200) = NULL 
,@RegionCode varchar (10) = NULL) 

/*TEST
EXEC [RealEstate].[PropertyViewSelect]
*/

AS
BEGIN


IF @RegionCode IS NOT NULL 
BEGIN 
	SET  @RegionCode = CONCAT (@RegionCode ,'%') 
END 

SELECT [Id]
      ,[Code]
      ,[Price]
      ,[Year]
      ,[OwnerId]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[IsDeleted]
      ,[Address]
      ,[RegionId]
      ,[OwnerName]
      ,[OwnerEmail]
      ,[OwnerPhone]
      ,[RegionName]
      ,[RegionCode]
  FROM [RealEstate].[PropertyView]
  WHERE
  Id  = ISNULL (@Id , Id)
  AND Code  = ISNULL (@Code , Code)
  AND Price >= @PriceGreaterThan
  AND Price <= @PriceLessThan
  AND Year >=@YearGreatherThan
  AND Year <= @YearLessThan
  AND OwnerEmail LIKE ISNULL (@OwnerEmail, OwnerEmail )
  AND RegionCode LIKE ISNULL (@RegionCode, RegionCode )

END


GO
/****** Object:  StoredProcedure [RealEstate].[RegionFindByCode]    Script Date: 16/01/2022 9:18:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [RealEstate].[RegionFindByCode]
@Code AS VARCHAR (10)
AS
BEGIN 
	SELECT [Id]
	,[Name]
	,[Code]
	,[ParentRegionId]
	FROM [RealEstate].[Region]
	WHERE
	CODE = @Code
END

GO
