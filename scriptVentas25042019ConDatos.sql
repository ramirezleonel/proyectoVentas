USE [master]
GO
/****** Object:  Database [db_ventas]    Script Date: 25/04/2019 13:25:22 ******/
CREATE DATABASE [db_ventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_ventas', FILENAME = N'C:\Sistema de ventass DB\db_ventas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_ventas_log', FILENAME = N'C:\Sistema de ventass DB\db_ventas_log.ldf' , SIZE = 5696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_ventas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_ventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_ventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_ventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_ventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_ventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_ventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_ventas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_ventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_ventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_ventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_ventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_ventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_ventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_ventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_ventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_ventas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_ventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_ventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_ventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_ventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_ventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_ventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_ventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_ventas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_ventas] SET  MULTI_USER 
GO
ALTER DATABASE [db_ventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_ventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_ventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_ventas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [db_ventas] SET DELAYED_DURABILITY = DISABLED 
GO
USE [db_ventas]
GO
/****** Object:  User [ventas]    Script Date: 25/04/2019 13:25:23 ******/
CREATE USER [ventas] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ventas]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [ventas]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [ventas]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ventas]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [ventas]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ventas]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ventas]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [ventas]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [ventas]
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[articulo](
	[idarticulo] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [varchar](100) NULL,
	[idcategoria] [int] NOT NULL,
	[precio] [money] NULL,
	[stock_actual] [int] NULL,
	[precio_Compra] [money] NULL,
	[utilidad] [decimal](5, 2) NULL,
	[estado] [bit] NULL,
	[pesable] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](150) NOT NULL,
	[fecha_nacimiento] [date] NULL,
	[cuit] [bigint] NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [int] NULL,
	[email] [varchar](80) NULL,
	[num_documento] [varchar](11) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Confequipo]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Confequipo](
	[id_equipo] [int] IDENTITY(1,1) NOT NULL,
	[equipo] [nvarchar](50) NOT NULL,
	[usuarioconectado] [nvarchar](50) NULL,
	[Turno] [nvarchar](50) NULL,
	[id_usuario] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cuentas]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cuentas](
	[idusuario] [int] IDENTITY(2,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[nombre] [varchar](50) NULL,
	[Turno] [nvarchar](50) NULL,
	[SA] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_movstock]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_movstock](
	[iddetalle_movstock] [int] IDENTITY(1,1) NOT NULL,
	[idmov_stock] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_detalle_movstock] PRIMARY KEY CLUSTERED 
(
	[iddetalle_movstock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[descuento] [money] NULL,
	[id_articulo] [int] NULL,
	[importe] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fondo_cierre]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fondo_cierre](
	[Cod_cierre] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Turno] [nvarchar](50) NOT NULL,
	[Total_ingreso] [money] NOT NULL,
	[Tottal_egreso] [money] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fondo_mov_caja]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fondo_mov_caja](
	[Cod_mov] [int] IDENTITY(1,1) NOT NULL,
	[Cod_cuenta] [int] NOT NULL,
	[Ingreso] [money] NULL,
	[Egreso] [money] NULL,
	[Fecha] [datetime] NOT NULL,
	[Usuario] [nvarchar](50) NULL,
	[Idusuario] [int] NULL,
	[Turno] [nvarchar](50) NULL,
	[Concepto] [nvarchar](300) NULL,
	[Comprobante] [int] NULL,
	[Estado] [bit] NOT NULL,
	[Idcierre] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fondo_tipomov]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fondo_tipomov](
	[Codtipomov] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[TipoIngEgr] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ingreso]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idproveedor] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[tipo_comprobantes] [varchar](20) NOT NULL,
	[serie] [varchar](4) NOT NULL,
	[correlativa] [varchar](8) NOT NULL,
	[iva] [decimal](4, 2) NOT NULL,
	[estado] [varchar](7) NOT NULL,
 CONSTRAINT [PK_ingreso] PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mov_stock]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mov_stock](
	[idmov_stock] [int] IDENTITY(1,1) NOT NULL,
	[idproveedor] [int] NULL,
	[fecha] [date] NOT NULL,
	[tipo_comprobante] [varchar](50) NULL,
	[serie] [varchar](4) NULL,
	[correlativa] [varchar](8) NULL,
	[iva] [decimal](4, 2) NULL,
	[estado] [varchar](7) NOT NULL,
	[movimiento] [varchar](7) NOT NULL,
 CONSTRAINT [PK_mov_stock] PRIMARY KEY CLUSTERED 
(
	[idmov_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[plancuenta]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plancuenta](
	[Codigo_plan] [int] NOT NULL,
	[Cuenta] [nvarchar](300) NOT NULL,
	[Ingreso] [bit] NOT NULL,
	[Egreso] [bit] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Tipomovimiento] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proveedor](
	[idproveedor] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](150) NOT NULL,
	[cuit] [int] NOT NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [int] NULL,
	[email] [varchar](50) NULL,
	[num_documento] [varchar](11) NULL,
 CONSTRAINT [PK_proveedor] PRIMARY KEY CLUSTERED 
(
	[idproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[unidades]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[unidades](
	[idunidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_presentacion] PRIMARY KEY CLUSTERED 
(
	[idunidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[venta]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie] [varchar](4) NULL,
	[correlativo] [varchar](7) NULL,
	[IVA] [decimal](4, 2) NULL,
	[estado] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[articulo] ON 

INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (2174, N'0000000021746', N'Milanesa x Kg', N'', 9, 210.0000, 1, NULL, NULL, 1, 1)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1, N'7793704000232', N'Yerba Máte PLAYADITO 1/2 kg', N'', 1, 70.0000, 7, 14.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (2, N'7791290000674', N'Detergente ALA ULTRA Fragancia limon', N'', 1, 32.0000, 8, 14.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (3, N'', N'Jugo TANG Naranja-Banana', N'', 3, 20.0000, 49, 14.0000, CAST(0.00 AS Decimal(5, 2)), 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (4, N'7791290010499', N'Suavizante VIVERE 900ML Violeta y flors blancas', N'', 1, 48.0000, 0, 14.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (5, N'7791290013582', N'Suavizante VIVERE 810ML plancha facil', N'', 5, 45.0000, 1, 14.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (6, N'7793350000471', N'Pomada para calzado WASSINGTON PREMIUM MARRÓN', N'', 7, 30.0000, 2, 20.0000, CAST(0.00 AS Decimal(5, 2)), 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (7, N'7793350992950', N'Pomada para calzado WASSINGTON BLANCO', N'', 7, 30.1000, 2, 14.0000, CAST(115.00 AS Decimal(5, 2)), 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (8, N'7790250099123', N'TOALLITA FEMENINA LADYSOFT NORMAL', N'', 7, 25.0000, 10, 14.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (9, N'7798040052594', N'Protectores diario simply', N'', 7, 25.0000, 10, 14.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (10, N'7793100120220', N'kolynos triple', N'', 7, 30.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (11, N'7793100112225', N'Colgate herval', N'', 7, 35.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (12, N'7796551000059', N'Alcohol San Iginio', N'', 7, 27.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (13, N'7791293032009', N'jabon tocador rexona cotton fresh 3 x 125g c/u', N'', 7, 18.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (14, N'7891024028636', N'jabon tocador palmolive suavidad exfoliante 125g', N'', 7, 20.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (15, N'693775400151', N'Maquinita de afeitar GoodMax', N'', 7, 18.0000, 30, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (16, N'070330709485', N'Maquinita de afeitar bic confort 2', N'', 7, 20.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (17, N'7797749002633', N'Palillo dental el coloso', N'', 7, 15.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (18, N'7790740505523', N'Shampoo Plusbell suavidad y cuidado', N'', 7, 60.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (19, N'7791293030401', N'Shampoo Suave Naturales', N'', 7, 52.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (20, N'6939624396261', N'Cepillo dentales Ragel Focus', N'', 7, 24.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (21, N'6927236645550', N'Cepillo dental Junior in-gloria', N'', 7, 25.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (22, N'6910021007206', N'Cepillo dentales colgate premier clean', N'', 1, 35.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (23, N'3400590017099', N'Curita tela elastica Curitas', N'', 1, 23.0000, 7, 0.0000, NULL, 0, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (24, N'7798014062239', N'Barritas de asufre el coloso C/U', N'', 7, 2.5000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (25, N'7842285000541', N'Foco Rawlux 100W', N'', 7, 25.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (26, N'7622300868819', N'Jugo TANG Naranja-Durazno', N'', 9, 10.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (27, N'7622300868512', N'Jugo TANG Manzana', N'', 8, 10.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (28, N'7622300868727', N'Jugo TANG Multifruta', N'', 8, 10.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (29, N'7790580108762', N'Jugo NOEL Limonada', N'', 9, 6.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (30, N'7622300868697', N'Jugo TANG Limonada Dulce', N'', 8, 10.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (31, N'7622300868697', N'Jugo TANG Limonada dulce bajo en azucares', N'', 8, 10.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (32, N'7622300868543', N'Jugo TANG Naranja dulce', N'', 8, 10.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (33, N'7622300868604', N'Jugo TANG Ananá', N'', 8, 10.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (34, N'7622300861049', N'Jugo Verao Naranja', N'', 8, 7.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (35, N'7790580119935', N'Jugo NOEL Naranja-banana', N'', 8, 6.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (36, N'7622300868635', N'Jugo TANG Mix naranja y mango', N'', 8, 10.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (37, N'3101000000049', N'Cinta ancha pack marron 48x50', N'', 6, 50.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (38, N'7790550010125', N'Café en saquitos Cabrales C/U', N'', 1, 4.0000, 20, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (39, N'7790072001014', N'Sal fina Corrediza Celusal', N'', 8, 23.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (40, N'7791004000099', N'Sal gruesa libre de gruten Celusal', N'', 8, 29.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (41, N'7791120031564', N'arroz largo fino MOLINOS ALA x 500 grs', N'', 9, 25.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (42, N'7793695000044', N'arroz largo fino DANUBIO 500g', N'', 9, 27.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (43, N'7791478600047', N'arroz largo fino MITAI', N'', 9, 34.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (44, N'7792180004956', N'fideo mostachol SAN AGUSTIN 500g', N'', 9, 26.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (45, N'7798141970346', N'fideo seco spaghetti LA PROVIDENCIA', N'', 9, 30.0000, 4, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (46, N'7798141971497', N'fideos seco nidos spaghetti suelto LA PROVIDENCIA', N'', 9, 60.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (47, N'7791866001197', N'mayonesa NATURA 118g', N'', 9, 20.0000, 15, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (48, N'7792882000201', N'queso rallado LA QUESERA 40g', N'', 9, 18.0000, 16, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (49, N'7793253001889', N'poett aromatizante bebe', N'', 5, 30.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (50, N'7793253001865', N'poett aromatizante lavanda', N'', 5, 30.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (51, N'7790520009302', N'glade multisuperficies campos de lavanda', N'', 5, 30.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (52, N'7793699045430', N'lavavajilla cremoso Esencial', N'', 5, 25.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (53, N'7793699045577', N'lavavajilla cristalino Esencial', N'', 5, 25.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (54, N'7793699045454', N'lavavajilla cristalino Esencial', N'', 5, 25.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (55, N'7798040052273', N'lavavajilla cristal El coloso', N'', 5, 23.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (56, N'7721290000674', N'lavavajilla ALA ultra doble poder', N'', 5, 32.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (57, N'7793253000400', N'agua lavandina AYUDIN', N'', 5, 26.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (58, N'7793253001483', N'SELTON mata moscas y mosquitos', N'', 5, 57.0000, 7, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (59, N'7793253001513', N'SELTON mata cucarachas', N'', 5, 57.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (60, N'7790520009890', N'RAID mata polillas y larvas', N'', 5, 120.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (61, N'7790520018649', N'MR MUSCULO vidrios y multiusos', N'', 5, 32.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (62, N'7791290008472', N'CIF crema limon', N'', 5, 34.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (63, N'779129001802', N'CIF ultra higiene', N'', 5, 34.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (64, N'7793253386160', N'MORTIMER esponja de acero inoxidable', N'', 5, 15.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (65, N'7790927811164', N'REJILLA Americana', N'', 5, 25.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (66, N'7798022223707', N'MY HOGAR virulana x 12 unidades', N'', 5, 22.0000, 12, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (67, N'7797749002190', N'Esponja EL COLOSO', N'', 5, 15.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (68, N'7798017931495', N'Broches plasticos RAYITA', N'', 5, 25.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (69, N'7798061740104', N'SOPAPA negra', N'', 5, 34.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (70, N'7798132470039', N'jabon en pan ASTRO', N'', 5, 13.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (71, N'7797749000431', N'Vela EL COLOSO X 4 chicas', N'', 5, 10.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (72, N'7791290011755', N'Jabon en polvo ALA lavado a mano', N'', 5, 37.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (73, N'7791290011700', N'jabon en polvo ALA MATIC', N'', 5, 37.0000, 4, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (74, N'7790990992678', N'Jabon en polvo ZORRO', N'', 5, 24.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1049, N'7791290010819', N'Jabon en polvo DRIVE', N'', 5, 27.0000, 4, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1050, N'7790787002528', N'Leche entera ILOLAY', N'', 4, 38.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1051, N'7794710010017', N'Leche entera VERONICA', N'', 4, 35.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1052, N'7790787172566', N'Chocolatada ILOLAY KIDS', N'', 4, 48.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1055, N'7793893001966', N'Salchichas PANCHIN', N'', 4, 28.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1056, N'7790625001409', N'Salchichas 66', N'', 4, 25.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1057, N'7798001560588', N'Yogur frutilla y vainilla CREMIGAL', N'', 4, 10.0000, 4, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1058, N'7798001560816', N'Yogur con cereales CREMIGAL', N'', 4, 20.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1059, N'7795793102248', N'Manteca RAMOLAC', N'', 4, 25.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1060, N'7790813110104', N'Levadura CALSA X 100 GRS', N'', 4, 15.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1061, N'7795793102255', N'Crema de leche RAMOLAC', N'', 4, 45.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1062, N'7798138551961', N'Duraznos MOLTO', N'', 4, 50.0000, 4, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1063, N'2013381009157', N'Salame metro PAMPITA', N'', 4, 215.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1064, N'2000600090003', N'Fiambre PALETA x kg', N'', 4, 70.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1066, N'', N'Mortadela DON OTTO X KGS', N'', 4, 85.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1067, N'7793046001034', N'Dulce Batata DULCOR X KGS', N'', 4, 60.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1068, N'7793046004028', N'Dulce de Membrillo DULCOR x kgs', N'', 4, 70.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1069, N'7790787100415', N'Yogur bebible ILOLAY', N'', 4, 35.0000, 9, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1070, N'', N'Queso cremoso NOAL x kgs', N'', 4, 160.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1071, N'', N'Queso cremoso CASELIN x kgs', N'', 4, 145.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1072, N'7790787153657', N'Dulce de leche ILOLAY chico', N'', 4, 25.0000, 7, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1073, N'7793046008019', N'Mermelada DULCOR', N'', 4, 34.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1074, N'7798022227767', N'Amargo Serrano SUPER TOP', N'', 3, 25.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1075, N'7798062540284', N'LEVITE pomelo', N'', 3, 50.0000, 5, 0.0000, NULL, 1, NULL)
GO
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1076, N'7790036006970', N'BAGGIO Fresh', N'', 3, 28.0000, 4, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1077, N'7790950003420', N'Amargo Serrano TRES TORRSES', N'', 3, 35.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1078, N'7791085000018', N'Jugos PENT 10 Naranja', N'', 3, 30.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1079, N'7791375001800', N'CABALGATA Pomelo- Naranja-Cola y Lima', N'', 3, 45.0000, 17, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1080, N'7798113301246', N'Gaseosas MANAOS X 3 L', N'', 3, 45.0000, 16, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1081, N'7798113300294', N'Soda LA BICHY X 2,250', N'', 3, 27.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1082, N'7792758013038', N'SECCO Naranja', N'', 3, 50.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1083, N'7790036846262', N'VINO TALACASTO', N'', 3, 58.0000, 9, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1084, N'7790036000572', N'BAGGIO PRONTO chico', N'', 3, 15.0000, 7, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1085, N'7790036000466', N'BAGGIO PRONTO grande', N'', 3, 43.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1086, N'7798164280057', N'AGUAS De LAS MISIONES x 6L', N'', 3, 73.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1087, N'7790121000944', N'PETACAS ANIS', N'', 3, 38.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1088, N'7790121000890', N'PETACA Cafe al coñac', N'', 3, 38.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1089, N'7790121000968', N'PETACA LICOR dulce de leche', N'', 3, 38.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1090, N'7792023000046', N'FLUIDO desinfectante TRIUNFO', N'', 5, 48.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1091, N'7791866001357', N'Mayonesa NATURA x 1000 kgs', N'', 9, 135.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1092, N'7794000000568', N'Mayonesa RICK x 242 grs', N'', 9, 24.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1093, N'7794000960107', N'Mayonesa HELLMANNS x 237 grs', N'', 9, 32.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1094, N'7795184001907', N'Pure de tomate NOEL 520 grs', N'', 9, 19.0000, 12, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1095, N'7790580660000', N'Polenta PRESTO PRONTA x 500 grs', N'', 9, 34.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1096, N'7792170007196', N'Polenta QUAKER X 500 grs', N'', 9, 20.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1097, N'7798029630799', N'Harina EL AMERICANO x 1000 grs', N'', 9, 34.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1098, N'7792180004888', N'Leudante PUREZA', N'', 9, 38.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1099, N'7792180004567', N'Harina pizza PUREZA', N'', 9, 43.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1100, N'7794000599178', N'FECULA Maizena', N'', 9, 30.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1101, N'7797237001094', N'Harina comun SELECCIONADA', N'', 9, 25.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1102, N'7798089020028', N'LENTEJAS SECAS', N'', 9, 32.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1103, N'7792200000159', N'9 de oro CLASICO', N'', 9, 21.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1104, N'7792200000128', N'9 de oro AGRIDULCES', N'', 9, 21.0000, 7, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1105, N'7790270336307', N'GALLETITAS media tarde x 3', N'', 9, 30.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1106, N'7790270336307', N'GALLETITAS media tarde x unidad', N'', 9, 12.0000, 12, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1107, N'7790070412379', N'EXQUISITA Limon', N'', 9, 65.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1108, N'7790070412362', N'EXQUISITA Naranja', N'', 9, 65.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1109, N'7790070410139', N'EXQUISITA Vainilla', N'', 9, 65.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1110, N'7790070410658', N'Gelatina EXQUISITA', N'', 9, 26.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1111, N'7790580113445', N'Gelatina MOGUL', N'', 9, 18.0000, 8, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1112, N'7790387015126', N'Yerba MAÑANITA x 500 grs', N'', 9, 55.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1113, N'7792710002179', N'Yerba AMANDA x 500grs', N'', 9, 67.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1114, N'7790802000010', N'Yerba ROMANCE x 500 grs', N'', 9, 55.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1115, N'7793704000232', N'Yerba PLAYADITO x 500 grs', N'', 9, 72.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1116, N'7798087510019', N'azucar mitai', N'', 9, 25.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1117, N'7798156760741', N'pure de tomate sabor del Valle', N'', 9, 15.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1118, N'7798022222755', N'pure de tomate SAN REMO', N'', 9, 15.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1119, N'7790550010125', N'cafe en saquito', N'', 9, 5.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1120, N'7790387000849', N'mate cosido taragui', N'', 9, 1.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1121, N'7790387010305', N'el plaser del taragui', N'', 9, 1.5000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1122, N'7791293025025', N'shampoo en sobresito', N'', 9, 5.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1123, N'7793040030771', N'grasa FRIAR x 1 kg', N'', 9, 46.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1124, N'7798141970346', N'fideo la providensia espageti', N'', 9, 30.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1125, N'7798141970353', N'fideo tallarin la providensia', N'', 9, 30.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1126, N'7792180004956', N'fideos mostacholi san agustin', N'', 9, 26.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1127, N'7791004000099', N'sal gruesa salusal', N'', 9, 29.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1128, N'7790072001014', N'sal chica selusal', N'', 9, 23.0000, 10, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1129, N'7798141970476', N'fideos tirabuzon la providensia x kg', N'', 9, 60.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1130, N'7798141971497', N'fideos nidos spaghetti la providensia x kg', N'', 9, 60.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1131, N'7790989003248', N'picadillo la negra', N'', 9, 15.0000, 4, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1132, N'7798022220362', N'arveja san remo', N'', 9, 17.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1133, N'7795933000281', N'atun bahia', N'', 9, 52.0000, 7, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1134, N'7798130880670', N'rollo de cosina suapel', N'', 9, 30.0000, 4, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1135, N'7790250044390', N'pañal mdiano babysec por unidad', N'', 5, 10.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1136, N'7798130888928', N'papel higienico suapel 50 metros', N'', 5, 17.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1137, N'7791818002128', N'papel higienico suapel 120 metros', N'', 5, 35.0000, 5, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1138, N'7791905003373', N'Suavizante para ropa QUERUBIN x 3 L', N'', 5, 170.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1139, N'7791905000921', N'Suavizante para ropa QUERUBIN x 900 ml', N'', 5, 58.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1140, N'7793253002329', N'AYUDIN Ropa color x 470 ml', N'', 5, 45.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1141, N'7793253002343', N'AYUDIN Ropa blanca x 1L', N'', 5, 45.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1142, N'7793591002081', N'Grasa LA CORDOBESA x 500 grs', N'', 9, 30.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1143, N'7798303170096', N'Aceite girasol DESCOLLANTE', N'', 9, 55.0000, 3, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1144, N'7790940233240', N'Protectores diarios s/desodorante DONCELLA', N'', 7, 23.5000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1145, N'7790940235077', N'Protectores diarios respirables DONCELLA', N'', 7, 25.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1146, N'7790940233011', N'Protectores diarios duo forma DONCELLA', N'', 7, 34.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1147, N'7500435140584', N'Toallas femeninas ALWAYS', N'', 7, 65.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1148, N'7792308000013', N'dulce de leche santa maria', N'', 4, 26.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1149, N'7798018850184', N'levadua en polvo x 10 grs LEVEX', N'', 9, 15.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1150, N'7794980912288', N'Vainilla liquida x 28cc YUSPE', N'', 9, 18.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1151, N'7794321000025', N'Trapo de piso TASK', N'', 5, 34.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1152, N'7793253038106', N'Esponja  cuadriculada MORTIMER', N'', 5, 15.0000, 4, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1153, N'222', N'Bicarbonato de sodio x 20 grsYUSPE', N'', 7, 6.0000, 6, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1154, N'7793875360050', N'Provenzal x 25 grs Aromas&Sabores', N'', 9, 23.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1155, N'7793875360104', N'Adobo para pizza x 25 grs AROMAS & SABORES', N'', 9, 19.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1156, N'7790150496046', N'Tucos y guisos x 25 grs ALICANTE', N'', 9, 26.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1157, N'7790150042052', N'Comino x 25 grs ALICANTE', N'', 9, 26.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1158, N'7791085002371', N'Jugo de pomelo x 1,5 L PENT', N'', 3, 48.0000, 1, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1159, N'7791085000780', N'Jugo mix frutal x 500c  PENT 10', N'', 3, 30.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1160, N'7791085002241', N'Jugo nja-anana 500c PENT 10', N'', 3, 30.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1161, N'7791085000025', N'Jugo pomelo x 500c PENT 10', N'', 3, 30.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1162, N'7791085000063', N'Jugo cola x 500c PENT 10', N'', 3, 30.0000, 2, 0.0000, NULL, 1, NULL)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1163, N'7798022221956', N'Maiz pisingallo x 400 grs SAN REMO', N'', 9, 26.0000, 3, 0.0000, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[articulo] OFF
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (2, N'Panadería', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (3, N'Bebidas', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (4, N'Lácteos', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (5, N'Limpieza', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (6, N'Libreria', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (7, N'Perfumería', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (9, N'Comestibles', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (10, N'Farmacia', N'')
SET IDENTITY_INSERT [dbo].[categoria] OFF
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([idcliente], [razon_social], [fecha_nacimiento], [cuit], [direccion], [telefono], [email], [num_documento]) VALUES (1, N'Consumidor Final', CAST(N'2018-07-25' AS Date), 11111111113, N'', 0, N'', N'0')
SET IDENTITY_INSERT [dbo].[cliente] OFF
SET IDENTITY_INSERT [dbo].[Confequipo] ON 

INSERT [dbo].[Confequipo] ([id_equipo], [equipo], [usuarioconectado], [Turno], [id_usuario]) VALUES (1, N'DESKTOP-DT84KT2', N'CRISTIAN', N'MAÑANA', 1)
SET IDENTITY_INSERT [dbo].[Confequipo] OFF
SET IDENTITY_INSERT [dbo].[cuentas] ON 

INSERT [dbo].[cuentas] ([idusuario], [usuario], [password], [nombre], [Turno], [SA]) VALUES (1, N'CRIS', N'A', N'CRISTIAN RAMIREZ', N'MAÑANA ', 1)
INSERT [dbo].[cuentas] ([idusuario], [usuario], [password], [nombre], [Turno], [SA]) VALUES (2, N'LEO', N'B', N'LEONEL RAMIREZ', N'TARDE', 1)
SET IDENTITY_INSERT [dbo].[cuentas] OFF
SET IDENTITY_INSERT [dbo].[detalle_movstock] ON 

INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (24, 22, 33, 50.0000, 50)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (25, 23, 31, 50.0000, 1)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (26, 24, 31, 50.0000, 2)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (27, 25, 29, 50.0000, 50)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (28, 26, 30, 50.0000, 50)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (29, 27, 34, 50.0000, 2)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (30, 28, 31, 50.0000, 123)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (31, 29, 44, 70.0000, 2)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (32, 30, 32, 60.0000, 10)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (33, 30, 31, 80.0000, 1)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (34, 31, 30, 50.0000, 10)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (35, 31, 31, 10.0000, 15)
SET IDENTITY_INSERT [dbo].[detalle_movstock] OFF
SET IDENTITY_INSERT [dbo].[detalle_venta] ON 

INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (33, 42, 1, 23.0000, 0.0000, 23, 23.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (34, 42, 1, 70.0000, 0.0000, 1, 70.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (35, 42, 1, 32.0000, 0.0000, 2, 32.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1, 8, 1, 75.0000, 0.0000, 30, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (2, 9, 1, 75.0000, 0.0000, 30, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (3, 10, 1, 75.0000, 0.0000, 30, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (4, 10, 1, 75.0000, 0.0000, 30, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (5, 10, 1, 75.0000, 0.0000, 30, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (7, 13, 1, 38.0000, 0.0000, 27, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (8, 13, 1, 38.0000, 0.0000, 27, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (9, 14, 1, 38.0000, 0.0000, 27, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (10, 14, 1, 38.0000, 0.0000, 27, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (11, 15, 1, 52.0000, 0.0000, 32, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (12, 15, 1, 52.0000, 0.0000, 32, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (13, 15, 1, 52.0000, 0.0000, 32, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (14, 16, 1, 52.0000, 0.0000, 32, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (15, 16, 1, 52.0000, 0.0000, 32, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (16, 16, 1, 52.0000, 0.0000, 32, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (17, 17, 1, 75.0000, 0.0000, 30, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (18, 17, 1, 75.0000, 0.0000, 30, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (19, 17, 1, 52.0000, 0.0000, 32, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (20, 18, 1, 38.0000, 0.0000, 27, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (21, 18, 1, 75.0000, 0.0000, 30, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (22, 18, 1, 52.0000, 0.0000, 32, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (23, 19, 2, 52.0000, 0.0000, 32, 0.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (25, 40, 1, 23.0000, 0.0000, 23, 23.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (26, 40, 1, 70.0000, 0.0000, 1, 70.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (27, 41, 1, 23.0000, 0.0000, 23, 23.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (28, 41, 1, 70.0000, 0.0000, 1, 70.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (29, 41, 1, 32.0000, 0.0000, 2, 32.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (30, 41, 1, 20.0000, 0.0000, 3, 20.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (31, 41, 1, 48.0000, 0.0000, 4, 48.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (32, 41, 1, 45.0000, 0.0000, 5, 45.0000)
SET IDENTITY_INSERT [dbo].[detalle_venta] OFF
SET IDENTITY_INSERT [dbo].[fondo_mov_caja] ON 

INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (25, 4110107, 238.0000, 0.0000, CAST(N'2019-04-16 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1, 9100001, 1000.0000, 0.0000, CAST(N'2019-01-31 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'APERTURA DE CAJA', 0, 1, 1)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (2, 5130509, 100.0000, 0.0000, CAST(N'2019-01-31 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'gasto de luz', 0, 1, 1)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (3, 5130405, 0.0000, 8000.0000, CAST(N'2019-01-31 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'viaje a maiameeeee', 0, 1, 1)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (4, 4110107, 576.7500, 0.0000, CAST(N'2019-01-31 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 20', 20, 1, 1)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (5, 9100003, 0.0000, 323.2500, CAST(N'2019-01-31 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'FALTANTE DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (6, 9100002, 0.0000, 0.0000, CAST(N'2019-01-31 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'CIERRE DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (7, 9100001, 2000.0000, 0.0000, CAST(N'2019-02-01 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'APERTURA DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (8, 9100002, 0.0000, 0.0000, CAST(N'2019-02-01 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'CIERRE DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (15, 9100001, 2000.0000, 0.0000, CAST(N'2019-02-03 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'APERTURA DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (10, 4110107, 432.0000, 0.0000, CAST(N'2019-02-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 21', 21, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (11, 4110107, 240.2400, 0.0000, CAST(N'2019-02-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 22', 22, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (12, 4110107, 757.7400, 0.0000, CAST(N'2019-02-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 23', 23, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (13, 5120803, 0.0000, 500.0000, CAST(N'2019-02-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Fideo frescos', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (14, 4110107, 161.0700, 0.0000, CAST(N'2019-02-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 24', 24, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (17, 4110107, 155.2500, 0.0000, CAST(N'2019-02-03 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 25', 25, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (20, 9100001, 2000.0000, 0.0000, CAST(N'2019-02-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'APERTURA DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (19, 9100002, 0.0000, 0.0000, CAST(N'2019-02-03 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'CIERRE DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (21, 5120201, 0.0000, 100.3400, CAST(N'2019-02-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (22, 4110107, 163.0000, 0.0000, CAST(N'2019-04-16 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (23, 4110107, 93.0000, 0.0000, CAST(N'2019-04-16 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (24, 4110107, 93.0000, 0.0000, CAST(N'2019-04-16 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (26, 4110107, 125.0000, 0.0000, CAST(N'2019-04-16 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[fondo_mov_caja] OFF
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (0, N'SISTEMA', N'S', 0)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (1, N'INGRESOS VARIOS          ', N'I', 1)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (2, N'INGRESO POR VENTAS  ', N'I', 1)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (3, N'INGRESO POR COBRANZA     ', N'I', 1)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (4, N'EGRESOS VARIOS           ', N'E', 1)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (5, N'EGRESO C/IVA             ', N'E', 0)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (6, N'EGRESO P/ EMPLEADOS      ', N'E', 0)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (7, N'TRANSFERENCIA E/CUENTAS  ', N'E', 1)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (8, N'TRANSFERENCIA E/EMPRESAS', N'E', 0)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (9, N'TRANSFERENCIA E/CUENTAS  ', N'I', 1)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (10, N'ING. A CUENTA RENDICIONES', N'I', 0)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (11, N'EGR. COMPENS.RENDICIONES', N'E', 0)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (12, N'ORDENES DE PAGO', N'E', 1)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (13, N'EGRESO POR COBRANZA     ', N'E', 0)
INSERT [dbo].[fondo_tipomov] ([Codtipomov], [Nombre], [TipoIngEgr], [Estado]) VALUES (14, N'INGESO/EGRESO', N'A', 1)
SET IDENTITY_INSERT [dbo].[mov_stock] ON 

INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (22, 1, CAST(N'2018-05-02' AS Date), N'', N'0', N'0', CAST(0.00 AS Decimal(4, 2)), N'ANULADO', N'INGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (23, 7, CAST(N'2018-05-02' AS Date), N'TICKET', N'0050', N'00000001', CAST(21.00 AS Decimal(4, 2)), N'EMITIDO', N'EGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (24, 1, CAST(N'2018-05-02' AS Date), N'TICKET', N'0020', N'00000123', CAST(21.00 AS Decimal(4, 2)), N'EMITIDO', N'EGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (25, 1, CAST(N'2018-05-02' AS Date), N'BOLETA', N'0050', N'00000012', CAST(21.00 AS Decimal(4, 2)), N'EMITIDO', N'EGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (26, 7, CAST(N'2018-05-19' AS Date), N'BOLETA', N'1233', N'21321233', CAST(21.00 AS Decimal(4, 2)), N'EMITIDO', N'INGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (27, 7, CAST(N'2018-05-19' AS Date), N'', N'0', N'0', CAST(0.00 AS Decimal(4, 2)), N'EMITIDO', N'INGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (28, 1, CAST(N'2018-05-25' AS Date), N'', N'', N'', CAST(0.00 AS Decimal(4, 2)), N'EMITIDO', N'INGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (29, 1, CAST(N'2019-01-10' AS Date), N'', N'0', N'0', CAST(0.00 AS Decimal(4, 2)), N'EMITIDO', N'INGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (30, 1, CAST(N'2019-01-12' AS Date), N'FACTURA', N'0005', N'23312123', CAST(10.50 AS Decimal(4, 2)), N'EMITIDO', N'INGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (31, 1, CAST(N'2019-01-12' AS Date), N'', N'0', N'0', CAST(0.00 AS Decimal(4, 2)), N'EMITIDO', N'INGRESO')
SET IDENTITY_INSERT [dbo].[mov_stock] OFF
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1000000, N'ACTIVO', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1100000, N'DISPONIBILIDADES', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1104000, N'BIENES DE CAMBIO', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1104100, N'MERCADERIAS DE REVENTA', 0, 1, 1, 5)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110000, N'Caja', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110001, N'Efectivo', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110002, N'Deposito en cuenta propia', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110003, N'Deposito Pago a Proveedor', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110004, N'Comprobantes a Recuperar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110005, N'Cheques Corrientes', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110006, N'Moneda Extranjera - Dolares', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110007, N'Otros', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110008, N'CAJA CENTRAL ', 1, 1, 1, 7)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110009, N'CAJA SUC. 1', 1, 1, 1, 7)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1110010, N'CAJA SUC.2 ', 1, 1, 1, 7)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1120000, N'Bancos', 0, 0, 0, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1120001, N'Banco Macro Cta Cte pesos - Q- Game  ', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1120002, N'Banco Corrientes Cta Cte pesos - Q-Game  ', 1, 1, 0, 7)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1120003, N'Banco Corrientes Cta Cte dólares - Q-Game  ', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1120004, N'Banco Corrientes Cta Comitente - Q- Game  ', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1120005, N'Banco Santander Rio Cta Cte pesos - Q-Game', 1, 1, 0, 9)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1120006, N'BanCo - ADM CENT 101 - BT', 1, 1, 0, 7)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1120007, N'BanCo - Dolares BT', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1120008, N'BanCo - MERCDES 02 BT', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1120009, N'Banco Santander Rio  Cta Cte pesos - Bras Tec', 0, 0, 0, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1130000, N'Fondo Fijo', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1130001, N'Fondo Fijo', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1200000, N'INVERSIONES TEMPORARIAS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1210000, N'Depositos a Plazo Fijo', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1210001, N'Plazo Fijo', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1220000, N'Titulos - Bonos', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1240000, N'Prestamos', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1240001, N'Creditos por mutuo - Prestamos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1240002, N'Creditos/Prestamos con garantia real', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1240003, N'Creditos por Cesión - Prestamos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1240004, N'Creditos por Mutuo - Con Garantia', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1300000, N'CREDITOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1310000, N'Por ventas', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1310100, N'Clientes', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1310101, N'DEUDORES POR VENTAS', 0, 0, 0, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1310500, N'Otros Deudores por Ventas', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1310501, N'Cheques Diferidos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1310502, N'Tarjetas de Credito a Cobrar            ', 1, 1, 0, 2)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1310504, N'Cheques Rechazados', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1310505, N'Tarjetas de Debito a Cobrar             ', 0, 0, 0, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320000, N'Creditos Fiscales', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320001, N'AFIP Anticipo Impto.a las Ganan.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320002, N'AFIP IVA Credito Fiscal 21%', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320003, N'AFIP Imptos.Internos Cdto.Fiscal', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320004, N'AFIP Reintegro IVA', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320005, N'AFIP Retencion Impto.a Ganancias', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320006, N'AFIP Retencion y Percepcion  IVA', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320007, N'AFIP Saldo DDJJ IVA', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320008, N'AFIP Cesion credito Fiscal', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320009, N'AFIP-Dec.814/01(% CS pago cta Iva-IG)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320010, N'AFIP - Otros', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320017, N'DGR-Percep.y Retencion I.B.-Bs As.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320025, N'AFIP - IVA Credito Fiscal 10.5%', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320026, N'AFIP - Ahorro Obligatorio', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320027, N'DGR-Ret y  Percep TEM y PP - Bs As.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320028, N'DRM - Ret y Percep TEM y PP', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320029, N'AFIP - IVA Cdto. Fiscal  a formalizar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1320031, N'AFIP-Retencion SUSS', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1330000, N'Otros Creditos', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1330001, N'Anticipos a Proveedores', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1330002, N'Anticipos y vales al personal', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1330003, N'Deudores Varios', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1330004, N'Depositos en Garantia', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1330005, N'Socio MA Cta Particular  ', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1330006, N'Socio EA Cta Particular  ', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1330013, N'SIRCREB', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1330016, N'Embargos Judiciales', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1400000, N'BIENES DE CAMBIO', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1410000, N'Mercaderia', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1410006, N'Mercaderias - Alimentos', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1410007, N'Mercaderias - Bebidas', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1410008, N'Mercaderias - Otros Insumos', 1, 1, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1420000, N'Inmuebles para la Venta', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1500000, N'INVERSIONES PERMANENTES', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1520000, N'Inmuebles para Renta', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1520001, N'Inmuebles para Renta', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1520100, N'Terreno', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1520200, N'Edificaciones', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1600000, N'BIENES DE USO', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1640000, N'Muebles y Utiles', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1640001, N'Costo Origen', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1640002, N'Mejora', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1640003, N'Revaluos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1640004, N'(Amortizacio Acum.Muebles y Ut.)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1650000, N'Rodados', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1650001, N'Costo Origen', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1650002, N'Mejora', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1650003, N' Revaluos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1650004, N'(Amortizacion Acum. Rodados)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1660000, N'Maquinarias', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1660001, N'Costo Origen', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1660002, N'Mejora', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1660003, N'Revaluos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1660004, N'(Amortizacion Acum. Maquinarias)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1690001, N'Bs.de Uso-Compras', 1, 1, 0, 14)
GO
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2000000, N'PASIVO', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2100000, N'DEUDAS COMERCIALES', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2101001, N'Proveedores', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2101003, N'PRE-PAGO DE CLIENTES', 1, 0, 1, 2)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110000, N'Proveedores', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110002, N'Proveedores documentados sin Gtia.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110003, N'Proveedores doc.con Gtia.prendaria', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110004, N'Proveedores doc.con Gtia.hipotecaria', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110005, N'Proveedores en Moneda extranjera', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110006, N'Retencion Fondo de Garantia', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110008, N'Proveedores en Moneda Extranjera', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110100, N'Creditos de Clientes', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110101, N'Liquidaciones Netas a Pag.Com.(CC)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110102, N'Compras Socios a Pagar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2110103, N'(Comercios Adheridos Saldos Deudores)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2120000, N'BANCARIAS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2120001, N'Adelantos en Cta Cte con Gtia.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2120002, N'Adelantos Cta Cte sin Gtia.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2120003, N'Prestamos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130000, N'DEUDAS SOCIALES', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130100, N'Sueldos y jornales a pagar', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130101, N'Sueldos a Pagar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130102, N'Aguinaldos a pagar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130200, N'Cargas Sociales a Pagar', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130201, N'Aportes y Contribuciones Anses a Pag.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130202, N'Aport.y Contribuciones Faecys a pagar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130203, N'Aport.y Cont.Faecys La Estrella a pag', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130204, N'Aportes y Contribuciones Seoc a pagar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130205, N'Aportes y Cont.Salud Pública a pagar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130206, N'Aportes y Cont.Obra Social a pagar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130207, N'Aport.y Cont.Fdo.de Repar.Soc.a Pag.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130208, N'Aportes y Contribuciones ART', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130209, N'Aportes y Contribuciones Coop Asist', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130210, N'Aportes y Contribuciones INACAP', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130211, N'Aportes y Contribuciones  FAS', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130212, N'Seguro de vida colectivo SANCOR', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130300, N'Retenciones judiciales a pagar', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130301, N'Retenciones judiciales a depositar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130400, N'Indemnizaciones por despido', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2130401, N'Indemnizaciones por despido a Pag.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140000, N'DEUDAS FISCALES', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140100, N'Deudas AFIP', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140101, N'Deudas AFIP IVA Debito fiscal', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140102, N'Deudas AFIP Imptos.Internos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140103, N'Deudas AFIP p/Ret.de Impto.a Ganan.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140104, N'Deudas AFIP p/Percepciones IVA', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140105, N'Deudas AFIP p/Retenciones IVA', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140106, N'Deudas AFIP Otras', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140107, N'Deudas AFIP - IVA Tarjeta', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140108, N'Deudas AFIP - Imptos. a Pag.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140109, N'Deudas AFIP por Reten. SUSS', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140200, N'Deudas DGR (por provincia)', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140201, N'Deudas DGR  I.Brutos-Bs.As.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140202, N'Deudas DGR  I.Brutos-Cap.Federal', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140207, N'Deudas DGR Sellos-Bs.As.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140208, N'Deudas DGR  Sellos-Capital Federal', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140213, N'Deudas DGR Ret.y Percep.I.B.-Bs.As.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140214, N'Deudas DGR Ret.y Percep.I.B.-Capital Federal', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140219, N'Deudas DGR Otras - Bs.As.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140220, N'Deudas DGR  Otras - Capital Federal', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140225, N'Deudas DGR - Imp.Inmobiliario', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2140226, N'Deudas DGR - Rodados', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150000, N'OTRAS DEUDAS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150100, N'Acreedores Varios', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150101, N'Acreedores Vs. sin documentar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150102, N'Acreedores Vs.documentados sin Gtia.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150103, N'Acreedores Vs.documentados con Gtia.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150104, N'Acreedores Vs.doc.con Gtia.prendaria', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150105, N'Acreedores Vs.en Moneda extranjera', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150106, N'Acreedores p/Cheq.Vencidos Ajustados', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150114, N'Acreedores Vs.por N/C pendiente', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150200, N'Honorarios Directores a Pag.', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150201, N'Socio MA Cta Particular', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150202, N'Socio EA Cta Particular', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2150206, N'Honorarios a Pagar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2160000, N'PREVISIONES', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2160001, N'Prev. Indemnizaciones p/despido', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2160002, N'Prevision dp/Deudores incobrables', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2160003, N'Otras indemnizaciones', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2160004, N'Impuesto a las Ganancias', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2160005, N'Perdidas de Acciones', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2170000, N'DEUDAS AFIP - LARGO PLAZO', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2170001, N'Deudas AFIP - Impuestos Diferidos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (2170002, N'Deudas AFIP - Otras', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3000000, N'PATRIMONIO NETO', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3100000, N'CAPITAL', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3110000, N'Acciones en Circulacion', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3110001, N'Acciones ordinarias en circulacion', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3110002, N'Acciones preferidas en circulacion', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3120000, N'Acciones en Cartera', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3120001, N'Acciones ordinarias en cartera', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3120002, N'Acciones preferidas en cartera', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3130000, N'Ajustes de Capital', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3130001, N'Ajustes de Capital', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3140000, N'Primas de Emision', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3150000, N'RESULTADOS ACUMULADOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3150100, N'Resultados Asignados', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3150101, N'Reservas Legales', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3150102, N'Reservas Estatutarias', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3150103, N'Reservas Facultativas', 1, 1, 0, 14)
GO
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3150200, N'Resultados No asignados', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3150201, N'Del Ejercicio', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3150202, N'De ejercicios anteriores (AREA)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (3150300, N'Revalúos Contables', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4000000, N'INGRESOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4100000, N'INGRESOS ORDINARIOS OPERATIVOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4110000, N'INGRESOS POR VENTAS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4110100, N'Ventas Convencionales', 1, 1, 1, 2)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4110106, N'Ventas Otros Rubros', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4110107, N'INGRESO POR VENTAS Y SERVICIOS', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4110200, N'INTERESES', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4110201, N'Intereses por financiacion', 0, 0, 0, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4120000, N'INGRESOS FINANCIEROS Y POR TENENCIA', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4130000, N'INGRESOS POR RECUPERO DE GASTOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4130100, N'Recupero Gastos de Publicidad', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4130300, N'Reintegros ART', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4130301, N'Reintegros ART', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4130400, N'Recupero de Otros Gastos', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4130401, N'Recupero Gastos de Sellado', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4130402, N'Recuperacion Gastos Bancarios', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4130403, N'Recupero de Seguros', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4130404, N'Recupero Gastos de Juicio', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4130405, N'Recupero de Otros Gastos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4140000, N'DESCUENTOS Y BONIFICACIONES OBTENIDAS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4140006, N'Desc. Obtenidos Varios', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4150003, N'Alquileres', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4200000, N'INGRESOS ORDINARIOS NO OPERATIVOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4210000, N'INTERESES BANCARIOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4210001, N'Intereses Plazo Fijo', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4210002, N'Intereses Caja Ahorro', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4220000, N'INTERESES Y RESULTADOS FINANCIEROS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4220001, N'Renta  Títulos y Acciones', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4220002, N'Diferencia de Cambio (+)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4230000, N'INGRESOS CESION CREDITO FISCAL', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4250000, N'OTROS INGRESOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4250001, N'Diferencias de caja (+)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4300000, N'INGRESOS EXTRAORDINARIOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4300002, N'Siniestros Cobrados', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4300003, N'Ing. Extraord. por Ajustes', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (4300004, N'Venta Bienes de Uso', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5000000, N'EGRESOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5100000, N'EGRESOS ORDINARIOS OPERATIVOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120000, N'GASTOS DE COMERCIALIZACION', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120100, N'Fletes', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120101, N'Fletes Varios', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120106, N'Fletes Prov. OTROS RUBROS', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120108, N'Fletes a Clientes', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120200, N'Publicidad', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120201, N'Publicidad', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120202, N'Pub.Televisión', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120203, N'Pub. Radios', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120204, N'Pub. Estatica Via publica', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120205, N'Pub. Estatica locales y carteleria', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120206, N'Pub.Gastos de Imprenta', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120207, N'Pub. Gastos de Correo', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120208, N'Pub.Gastos en Promociones', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120209, N'Pub.Honorarios', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120210, N'Pub. Web', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120211, N'Marketing', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120300, N'Reparaciones y Repuestos', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120301, N'Reparac.y Repuestos Bs.de Cambio', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120400, N'Prendas y Patentamiento', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120401, N'Gastos de Prendas y Patentamientos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120402, N'Honorarios p/Prendas y patentam.', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120600, N'PERSONAL', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120601, N'Sueldos Remunerativos', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120602, N'Sueldos No Remunerativos', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120603, N'Sueldos Planes del Gobierno', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120604, N'Cargas Sociales', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120605, N'Conciliacion Acta Acuerdo', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120609, N'Personal Eventual', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120610, N'Comida Personal', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120700, N'Otros Gastos de Personal Suc.', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120701, N'Uniformes', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120702, N'Medicina Laboral', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120703, N'Gtos.de Selec.de Personal, informes', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120704, N'Gastos de Farmacia, Botiquin y otros', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120705, N'SEGUROS DEL PERSONAL', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120706, N'Servicio de clable', 0, 1, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120707, N'Servicio de clable', 0, 1, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120708, N'Servicio de cable', 0, 1, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120800, N'Gtos.de Movilidad/Representacion', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120801, N'Movilidad y Refrigerios', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120802, N'Combustible', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120803, N'Gastos de comida y colaciones', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120804, N'Gastos de hotel y alojamiento', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120805, N'Costo de venta Bebidas', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120806, N'Costo de venta Alimentos', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120807, N'Costo de desayuno', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120900, N'Alquileres', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120901, N'Alquiler inmueble', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5120902, N'Alquiler de Maquinas de Casino', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5121000, N'Ajustes y Diferencias', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5121001, N'Otros ajustes a favor cliente', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5121002, N'Servicio de Area Protegida', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130000, N'GASTOS DE ESTRUCTURA Y ADMINISTRACION', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130100, N'Reparaciones y Repuestos', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130101, N'Insumos de Mantenimiento', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130102, N'Mantenimiento rodados', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130103, N'Reparacion y Mantenimientos', 1, 1, 1, 14)
GO
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130104, N'Rep.y Rep.Bs.de Uso - Otros', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130105, N'Combustibles y Gas', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130106, N'Lavado y Engrase', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130107, N'Combustibles y Gas', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130108, N'Mantenimiento de Maquinarias', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130200, N'Personal', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130201, N'Sueldos Remunerativos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130202, N'Sueldos No Remunerativos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130203, N'Sueldos Planes del Gobierno', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130204, N'Cargas Sociales', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130205, N'Conciliacion Acta Acuerdo', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130206, N'Adicional Obra Social', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130207, N'Vacaciones', 1, 1, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130300, N'Otros Gastos de Personal (No Suc)', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130301, N'Uniformes', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130302, N'Medicina Laboral', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130303, N'Gtos.de Selec. de Personal, informe', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130304, N'Gastos de Farmacia, Botiquin y otros', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130305, N'Juicios Laborales', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130400, N'Gastos de Movilidad y Represen.', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130401, N'Movilidad y Refrigerios', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130402, N'Gtos.de transporte, taxis y remis', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130403, N'Gastos de comida y colaciones', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130404, N'Gastos de hotel y alojamiento', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130405, N'Viatico', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130500, N'Gastos Generales', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130501, N'Papelería y librería', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130502, N'Insumos Bebidas', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130503, N'Uniformes', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130504, N'Blancos, vajilla y útiles de cocina', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130505, N'Correo a Clientes (No Publicidad)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130506, N'Gastos de Lavandería', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130507, N'Amenities', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130508, N'Gastos de Limpieza', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130509, N'Luz', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130510, N'Internet', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130511, N'Gas', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130512, N'Gastos eventos y shows', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130514, N'Agua', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130515, N'AADICAPIF y SADAIC', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130516, N'Alquiler de máquinas', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130518, N'Gastos Frigobar', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130519, N'Transportes, encomiendas y remises', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130520, N'Canon Lotería', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130521, N'Gastos Varios', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130522, N'Software y Licencias', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130523, N'Servicios de Terceros p/Sistemas', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130524, N'Cuota Asociaciones Empresarias', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130525, N'Gastos atención a clientes', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130526, N'Regalos empresariales', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130527, N'Donaciones', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130530, N'Otros Gastos p/Cursos de Capacitación', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130531, N'LUZ - Reintegros por cortes de luz', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130532, N'Insumos de Informatica', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130533, N'Insumos Varios', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130534, N'Telefono', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130535, N'Servicios Varios', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130536, N'Insumos de Cocina', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130600, N'Seguridad', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130601, N'Seguridad y vigilancia', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130700, N'Seguros (No de Personal)', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130703, N'Seguros Resp.Civil Comprensiv', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130800, N'Imptos, Tas.y Contribuciones', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130801, N'Imp. Nac. - Ganancias', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130802, N'Imp. Nac.-Multas y Recargos', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130803, N'Imp.Nac.-Deb.yCred.-Bco.', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130816, N'Imp. Prov. - Ing. Brutos -Conv Mult', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130817, N'Imp. Prov. - Impuestos Inmobiliario', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130818, N'Imp. Prov. - Impuesto al Automotor', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130819, N'Imp. Prov. - Multas y Recargos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130820, N'Imp. Prov. - Sellos', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130821, N'Impuestos, tasas y canon Municipial', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130822, N'Tasas Municip. - Sobre los Inmuebles', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130823, N'Tasas Municip. - Multas y Recargos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130824, N'Tasas Municip. - Pub y Prop ocup esp pub', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130825, N'Imp. Prov. - Ing. Brutos -', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130830, N'Tasa Municipal - Automotor', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130831, N'IVA CF no computable', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130832, N'Otros Impuestos y Tasas', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130833, N'Canon entidad benefica o club', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130834, N'Impuesto nacional al juego', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130835, N'Amortizaciones', 0, 0, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130900, N'Gastos Financieros', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130901, N'Intereses  Comerciales Pagados', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130902, N'Diferencia de Cotizacion (-)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130903, N'Costo Avales', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5130906, N'Comisiones y gastos bancarios', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131000, N'Amortizaciones', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131001, N'Amortizacion Edificios', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131002, N'Amortizacion  Instalaciones', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131003, N'Amortizacion Muebles y Utiles', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131004, N'Amortizacion Rodados', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131005, N'Amortizacion Maquinarias', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131100, N'Previsiones', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131101, N'Deudores Incobrables', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131200, N'Honorarios', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131201, N'Comisiones agencias de viajes', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5131202, N'Honorarios profesionales', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5200000, N'EGRESOS ORDINARIOS NO OPERATIVOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5230000, N'Otros Egresos', 0, 0, 1, 0)
GO
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5230001, N'Diferencias de Caja (-)', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5300000, N'EGRESOS EXTRAORDINARIOS', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5300001, N'Siniestros', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5300002, N'Perdidas Extraordinarias', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (5300003, N'Costo Venta Bienes de Uso', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000000, N'CUENTAS DE ORDEN', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000001, N'Vales a Rendir', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000002, N'Vales de Directivos', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000003, N'Vales de Directivos - 2', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000004, N'Diferencias de caja', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000005, N'Descuentos a Proveedores', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000006, N'Intereses CC a Clientes a Cobrar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000007, N'Compras CC', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000012, N'Fondo Puente Devolucion', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000016, N'Vales de Fondo Fijo', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000020, N'Diferencia Asiento de Cierre', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000021, N'Clientes Agencia - Prestamo Efectivo', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000022, N'Desdoble Asiento de Cierre', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000023, N'Adelantos de Fondos a Liquidar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6000029, N'Gastos pendientes de Imputar', 1, 1, 0, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6100025, N'IVA DEBITO FISCAL', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6100026, N'Ticket de Premios Pagados', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (6100027, N'Extraccion de Maquinas de Casino', 1, 1, 1, 14)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (9000000, N'ESPECIALES', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (9100000, N'ESPECIALES DE CAJA', 0, 1, 1, 6)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (9100001, N'APERTURA DE CAJA', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (9100002, N'CIERRE DE CAJA', 0, 0, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (9100003, N'FALTANTE DE CAJA', 0, 1, 1, 4)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (9100004, N'SOBRANTE DE CAJA', 0, 1, 1, 4)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (9100005, N'CIERRE DE TURNO', 1, 1, 1, 0)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (9100020, N'INGRESO TRANSFERENCIA OTRA EMPRESA', 1, 1, 0, 1)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (9100021, N'EGRESO TRANSF. OTRA EMPRESA', 1, 1, 0, 4)
INSERT [dbo].[plancuenta] ([Codigo_plan], [Cuenta], [Ingreso], [Egreso], [Estado], [Tipomovimiento]) VALUES (1690002, N'Extraccion caja', 0, 1, 1, 14)
SET IDENTITY_INSERT [dbo].[proveedor] ON 

INSERT [dbo].[proveedor] ([idproveedor], [razon_social], [cuit], [direccion], [telefono], [email], [num_documento]) VALUES (0, N'Desconocido', 0, N'', 0, N'', N'0')
INSERT [dbo].[proveedor] ([idproveedor], [razon_social], [cuit], [direccion], [telefono], [email], [num_documento]) VALUES (1, N'milkaut', 678687, N'micasa', 768, N'kjhjk', N'45646')
INSERT [dbo].[proveedor] ([idproveedor], [razon_social], [cuit], [direccion], [telefono], [email], [num_documento]) VALUES (7, N'd', 3, N'', 0, N'', N'0')
INSERT [dbo].[proveedor] ([idproveedor], [razon_social], [cuit], [direccion], [telefono], [email], [num_documento]) VALUES (8, N'ramon', 132, N'nicolas acosta n 750', 321231, N'ramon@gmail.com', N'123')
SET IDENTITY_INSERT [dbo].[proveedor] OFF
SET IDENTITY_INSERT [dbo].[unidades] ON 

INSERT [dbo].[unidades] ([idunidad], [nombre]) VALUES (1, N'LTS')
SET IDENTITY_INSERT [dbo].[unidades] OFF
SET IDENTITY_INSERT [dbo].[venta] ON 

INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (40, 1, CAST(N'2019-04-16' AS Date), N'V', N'0000', N'0000001', CAST(21.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (42, 1, CAST(N'2019-04-16' AS Date), N'V', N'0000', N'0000001', CAST(21.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (1, 1, CAST(N'2019-01-13' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (8, 1, CAST(N'2019-01-15' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (9, 1, CAST(N'2019-01-15' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (10, 1, CAST(N'2019-01-15' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (13, 1, CAST(N'2019-01-15' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (14, 1, CAST(N'2019-01-15' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (15, 1, CAST(N'2019-01-16' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (16, 1, CAST(N'2019-01-16' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (17, 1, CAST(N'2019-01-16' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (18, 1, CAST(N'2019-01-16' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (19, 1, CAST(N'2019-01-31' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (20, 1, CAST(N'2019-01-31' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (21, 1, CAST(N'2019-02-02' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (22, 1, CAST(N'2019-02-02' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (23, 1, CAST(N'2019-02-02' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (24, 1, CAST(N'2019-02-02' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (25, 1, CAST(N'2019-02-03' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (26, 1, CAST(N'2019-02-04' AS Date), N'TICKET', N'', N'', CAST(0.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (27, 1, CAST(N'2019-04-16' AS Date), N'V', N'0000', N'0000000', CAST(98.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (28, 1, CAST(N'2019-04-16' AS Date), N'V', N'0000', N'0000000', CAST(21.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (29, 1, CAST(N'2019-04-16' AS Date), N'V', N'0000', N'0000001', CAST(21.00 AS Decimal(4, 2)), NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [serie], [correlativo], [IVA], [estado]) VALUES (41, 1, CAST(N'2019-04-16' AS Date), N'V', N'0000', N'0000001', CAST(21.00 AS Decimal(4, 2)), N'F')
SET IDENTITY_INSERT [dbo].[venta] OFF
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD  CONSTRAINT [FK_ingreso_proveedor] FOREIGN KEY([idproveedor])
REFERENCES [dbo].[proveedor] ([idproveedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ingreso] CHECK CONSTRAINT [FK_ingreso_proveedor]
GO
/****** Object:  StoredProcedure [dbo].[SP_ARTICULO]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ARTICULO]
@buscarTexto varchar(50)=null,
@modo int=null,
@nombre varchar (50)=null,
@idarticulo int output,
@cod_producto int=null,
@descripcion varchar(50)=null,
@codigo varchar(50) =null,
@idcategoria int =null,
@precio money =null,
@stockActual int =null,
@utilidad decimal=null,
@precio_compra money=null,
@estado bit =null,
@pesable bit = null
AS
IF @modo=1
--INSERTAR
BEGIN
--el estado es 1 cuando está habilitado y 0 cuando no
insert into articulo (codigo,nombre,descripcion,idcategoria,precio,precio_Compra,utilidad,stock_actual,estado,pesable)
values (@codigo,@nombre,@descripcion,@idcategoria,@precio,@precio_compra,@utilidad,@stockActual,1,@pesable)
END
else IF @modo=2
--MODIFICAR
BEGIN
update articulo set codigo=@codigo,
nombre=@nombre,descripcion=@descripcion,
idcategoria=@idcategoria,precio=@precio,stock_actual=@stockActual,
pesable=@pesable
where idarticulo=@idarticulo
END

else IF @modo=3
--ELIMINAR
BEGIN 
 update articulo set estado=0 where idarticulo=@idarticulo
END
else IF @modo=4
--BUSCAR TEXTO NOMBRE
BEGIN
SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
dbo.articulo.descripcion, dbo.articulo.idcategoria, 
dbo.categoria.nombre AS Categoria,dbo.articulo.precio,stock_actual
FROM dbo.articulo 
INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
WHERE dbo.articulo.nombre like '%' +@buscarTexto+ '%' and estado=1
END
else IF @modo=5
--MOSTRAR
BEGIN 
SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
dbo.articulo.descripcion, dbo.articulo.idcategoria, 
dbo.categoria.nombre AS Categoria,stock_actual,utilidad,precio_Compra,precio
FROM dbo.articulo 
INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
where estado=1
END
else IF @modo=6
--BUSCAR TEXTO CODIGOBARRA
BEGIN
SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
dbo.articulo.descripcion, dbo.articulo.idcategoria, 
dbo.categoria.nombre AS Categoria,precio,stock_actual
FROM dbo.articulo 
INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
WHERE dbo.articulo.codigo like '%' +@buscarTexto+ '%' and estado=1
END
else IF @modo=7
--BUSCAR TEXTO CATEGORIA
BEGIN
SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
dbo.articulo.descripcion, dbo.articulo.idcategoria, 
dbo.categoria.nombre AS Categoria,precio,stock_actual
FROM dbo.articulo 
INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
WHERE categoria.nombre like '%' +@buscarTexto+ '%'  and estado=1
END
else IF @modo=8
--BUSCAR TEXTO idArticulo
BEGIN
SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
dbo.articulo.descripcion, dbo.articulo.idcategoria, 
dbo.categoria.nombre AS Categoria,stock_actual,utilidad,precio_Compra,precio
FROM dbo.articulo 
INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
WHERE dbo.articulo.idarticulo  like @buscarTexto+ '%'  and estado=1
END

else IF @modo=9
--MODIFICAR PRECIO
BEGIN
update articulo set 
precio=@precio,precio_Compra=@precio_compra,utilidad=@utilidad
where idarticulo=@idarticulo
END
else IF @modo=10
--Encontrar solo un unico registro con el idArticulo
BEGIN
SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
dbo.articulo.descripcion, dbo.articulo.idcategoria, 
dbo.categoria.nombre AS Categoria,stock_actual,utilidad,precio_Compra,precio
FROM dbo.articulo 
INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
WHERE dbo.articulo.idarticulo= @idarticulo  and estado=1
END
else IF @modo=11
--Encontrar si existe un producto con ese codigo
BEGIN
select codigo from articulo where codigo=@codigo and estado=1
END



--select  IDENT_CURRENT('articulo')+1 (obtiene el ultimo valor del idarticulo)

GO
/****** Object:  StoredProcedure [dbo].[SP_CAJA]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SP_CAJA]

@codmov int = 1,
@codcuenta int = 1,
@ingreso money = null,
@egreso money = null,
@usuario varchar (50)=null,
@idusuario int=null,
@turno varchar (50)=null,
@concepto varchar (500)=null,
@comprobante int=null,
@estado bit = 0,
@nombre varchar(50)=null,
@descripcion varchar(50)=null,
@modo int=null,
@buscarTexto varchar(50)=null,
@Tipomovimiento int = 0,
@Tipoingegr varchar (10) = 'I',
@Fecha datetime = '20190101'

AS
IF @modo=1
--Insertar
BEGIN 

 insert into fondo_mov_caja(Cod_cuenta ,Ingreso ,Egreso,Fecha ,Usuario ,Idusuario ,Turno,Concepto,Comprobante,Estado) 
values(@codcuenta,@ingreso,@egreso,@Fecha,@usuario,@idusuario,@turno,@concepto,@comprobante,@estado )
END

else IF @modo=3
--ELIMINAR
BEGIN 
 delete from fondo_mov_caja where Cod_mov  = @codmov
END

else if @modo=5
--mostrar plan de cuentas
Begin
    
 if @Tipomovimiento = 1 or @Tipomovimiento = 4 

 Begin 

   select Codigo_plan, Cuenta ,Ingreso,Egreso ,Estado,Tipomovimiento from plancuenta 
   where (Tipomovimiento  =  @Tipomovimiento or Tipomovimiento = 14) and Estado = 1  
 end

 else 
 
 begin
 
   select Codigo_plan, Cuenta ,Ingreso,Egreso ,Estado,Tipomovimiento from plancuenta 
   where Tipomovimiento  =  @Tipomovimiento and Estado = 1

 end 
    
end
else if @modo=6
--mostrar tipo de movimiento
Begin
 select Codtipomov ,Nombre,TipoIngEgr,Estado from fondo_tipomov  where TipoIngEgr = @Tipoingegr  
end

else if @modo=7
--consultar caja por fecha 
Begin

 select  Cod_mov,Cod_cuenta,Concepto,Fecha ,Comprobante,Ingreso,Egreso,Turno
 FROM fondo_mov_caja  
 where Fecha = @fecha

end

else if @modo = 8
--consultar la suma del ingreso y el egreso de caja
Begin 

select sum (Ingreso) as ingreso, sum (Egreso) as egreso from fondo_mov_caja
where Fecha = @fecha

end 
GO
/****** Object:  StoredProcedure [dbo].[SP_CATEGORIA]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CATEGORIA]

@idcategoria INT OUTPUT,
@nombre varchar(50)=null,
@descripcion varchar(50)=null,
@modo int=null,
@buscarTexto varchar(50)=null

AS
IF @modo=1
--insertar
BEGIN 

 insert into categoria(nombre,descripcion) 
values(@nombre,@descripcion)
END

else IF @modo=2
--editar
BEGIN 
 update categoria set nombre=@nombre,
descripcion=@descripcion
--modifica en el caso de que exista coincidencia en idcategoria
where idcategoria=@idcategoria

END

else IF @modo=3
--borrar
BEGIN 
 delete from categoria where idcategoria=@idcategoria
END

else IF @modo=4
--buscar
BEGIN 
 select * from categoria where nombre like '%'+@buscarTexto+'%'
END
else if @modo=5
--mostrar
Begin
 select * from categoria
end

GO
/****** Object:  StoredProcedure [dbo].[SP_CLIENTE]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CLIENTE]

@buscarTexto varchar(50)=null,
@modo int=null,
@idcliente int output,
@cuit bigint= null,
@razon_social varchar(150)=null,
@direccion varchar (50)=null,
@telefono int= null,
@email varchar(50) =null,
@num_documento varchar(11)=null,
@fecha_nacimiento date =null
AS

IF @modo=1
--INSERTAR
BEGIN
insert into cliente(razon_social,fecha_nacimiento,cuit,direccion,telefono,email,num_documento)
values (@razon_Social,@fecha_nacimiento,@cuit,@direccion,@telefono,@email,@num_documento)
END
else IF @modo=2
--MODIFICAR
BEGIN
update cliente set  razon_Social=@razon_Social
,fecha_nacimiento=@fecha_nacimiento
,cuit=@cuit,direccion=@direccion
,email=@email,num_documento=@num_documento
,telefono=@telefono
where idcliente=@idcliente
END
else IF @modo=3
--ELIMINAR
BEGIN 
 delete from cliente where idcliente= @idcliente
END

else IF @modo=4
--BUSCAR TEXTO
BEGIN
SELECT * FROM cliente
WHERE cliente.razon_social like '%' +@buscarTexto+ '%' 
END

else IF @modo=5
--MOSTRAR
BEGIN 
SELECT * FROM cliente
END
else IF @modo=6
--BUSCAR TEXTO
BEGIN
SELECT * FROM cliente
WHERE cliente.idcliente like @buscarTexto + '%'  
END
--cambiarnombre en una columna
--sp_rename 'proveedor.razon_Social', 'proveedor.razon_social';

GO
/****** Object:  StoredProcedure [dbo].[SP_DETALLEMOVSTOCK]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_DETALLEMOVSTOCK]
@buscarTexto int =null,
@modo int=null,
@iddetalle_movStock int output,
@idmov_stock int=null,
@idarticulo int=null,
@precio money =null,
@cantidad int =null
AS
IF @modo=1
--INSERTAR
BEGIN
insert into detalle_movstock(idmov_stock ,idarticulo,precio,cantidad)
values (@idmov_stock ,@idarticulo ,@precio,@cantidad )
END
else IF @modo=2
--MOSTRAR
BEGIN 
SELECT d.idarticulo,a.nombre as [Nombre del Producto],
d.precio as [PrecioCompra],a.precio as [Precio de Producto],a.stock_actual,d.cantidad,(d.precio*d.cantidad) as subtotal
from detalle_movstock d 
inner join articulo a on
d.idarticulo=a.idarticulo
where d.idmov_stock=@buscarTexto

END
else IF @modo=3
--DISMINUIR STOCK
BEGIN 
update articulo set stock_actual  = stock_actual - @cantidad 
where idarticulo = @idarticulo 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DETALLEVENTA]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_DETALLEVENTA]
	@iddetalle_venta int output,
	@idventa int=NULL, 
	@cantidad int=NULL,
	@importe money=NULL,
	@descuento money=NULL,
	@id_articulo int=NULL, 
	@precio money=NULL,
	@modo int=null,
	@textobuscar varchar(50)=null
as 
IF @modo=1
--INSERTAR
BEGIN
insert into detalle_venta (idventa,cantidad,importe,descuento,Id_Articulo,precio )
values 
	(@idventa,@cantidad ,
	@importe,
	@descuento ,
	@id_articulo , 
	@precio )
set @iddetalle_venta = @@IDENTITY 
END
ELSE IF @modo=2
BEGIN 
--MOSTRAR
select a.idarticulo , a.nombre as articulo, 
       d.cantidad, d.descuento,d.precio,d.precio,d.importe  
	   from detalle_venta d 
	   inner join articulo a on d.Id_Articulo = a.idarticulo 
	   where d.idventa = @textobuscar 


END
GO
/****** Object:  StoredProcedure [dbo].[SP_INGRESO]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_INGRESO]

@buscarTextoFecha varchar(50)=null,
@buscarTextoFecha2 varchar(50)=null,
@modo int=null,
@fecha date=null,
@idingreso int output,
@idproveedor int=null,
@tipo_comprobante varchar(20) =null,
@iva decimal(4,2)=null,
@serie varchar(4)=null,
@correlativa varchar(8)=null,
@estado varchar(7)=null
as 
IF @modo=1
--INSERTAR
BEGIN
insert into ingreso (fecha,idproveedor ,tipo_comprobantes ,iva ,serie ,correlativa,estado)
values (@fecha,@idproveedor ,@tipo_comprobante ,@iva ,@serie ,@correlativa,@estado )
--CODIGO IDARTICULO
SET @idingreso=@@IDENTITY
END
else IF @modo=2
--ANULAR
BEGIN
update ingreso set 
@estado='ANULADO'
where idingreso=@idingreso
END
else IF @modo=3
--BUSCAR ENTRE FECHAS
BEGIN
SELECT ing.idingreso,prov.razon_social AS proveedor , ing.fecha, 
tipo_comprobantes, ing.serie, ing.correlativa,ing.iva as IVA,ing.estado,SUM(ding.precio_compra*ding.stock_inicial) 
AS [TOTAL INGRESO]
FROM dbo.ingreso ing 
INNER JOIN dbo.proveedor ON ing.idproveedor= dbo.proveedor.idproveedor
INNER JOIN dbo.detalle_ingreso ding ON ing.idingreso=ding.idarticulo
INNER JOIN dbo.proveedor prov ON ing.idproveedor=prov.idproveedor
GROUP BY  ing.idingreso,prov.razon_social ,ing.fecha, 
tipo_comprobantes, ing.serie, ing.correlativa,ing.iva ,ing.estado
HAVING ing.fecha>=@buscarTextoFecha and ing.fecha<=@buscarTextoFecha2 

END
else IF @modo=4
--MOSTRAR
BEGIN 
SELECT TOP 200 ing.idingreso,prov.razon_social AS proveedor , ing.fecha, 
tipo_comprobantes, ing.serie, ing.correlativa,ing.iva as IVA,ing.estado,SUM(ding.precio_compra*ding.stock_inicial) 
AS [TOTAL INGRESO]
FROM dbo.ingreso ing 
INNER JOIN dbo.proveedor prov ON ing.idproveedor= prov.idproveedor
INNER JOIN detalle_ingreso ding on ing.idingreso=ding.iddetalle_ingreso
GROUP BY  ing.idingreso,prov.razon_social ,ing.fecha, 
tipo_comprobantes, ing.serie, ing.correlativa,ing.iva ,ing.estado
ORDER BY ing.idingreso DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MOVSTOCK]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_MOVSTOCK]
@buscarTextoFecha varchar(50)=null,
@buscarTextoFecha2 varchar(50)=null,
@modo int=null,
@fecha date=null,
@idmov_stock int output,
@idproveedor int=null,
@tipo_comprobante varchar(20) =null,
@iva decimal(4,2)=null,
@serie varchar(4)=null,
@correlativa varchar(8)=null,
@estado varchar(7)=null,
@movimiento varchar(7)=null
AS
IF @modo=1
--INSERTAR
BEGIN
insert into mov_stock(fecha,idproveedor ,tipo_comprobante ,iva ,serie ,correlativa,estado,movimiento)
values (@fecha,@idproveedor ,@tipo_comprobante ,@iva ,@serie ,@correlativa,@estado,@movimiento )
--CODIGO IDARTICULO
--DEVUELVE EL VALOR DEL IDMOV_STOCK PARA LUEGO UTILIZARLO
SET @idmov_stock=@@IDENTITY
END
else IF @modo=2
--ANULAR
BEGIN
update mov_stock set 
estado='ANULADO'
where idmov_stock=@idmov_stock
END
else IF @modo=3
--BUSCAR ENTRE FECHAS
BEGIN
SELECT mov.idmov_stock,prov.razon_social AS proveedor , mov.fecha, 
mov.tipo_comprobante, mov.serie,mov.correlativa,mov.iva as IVA,mov.estado,mov.movimiento,SUM(dmov.precio*dmov.cantidad) 
AS [TOTAL]
FROM dbo.mov_stock mov

INNER JOIN dbo.detalle_movstock dmov ON mov.idmov_stock=dmov.idmov_stock
INNER JOIN dbo.proveedor prov ON mov.idproveedor=prov.idproveedor
GROUP BY  mov.idmov_stock,prov.razon_social ,mov.fecha, 
mov.tipo_comprobante, mov.serie, mov.correlativa,mov.iva ,mov.estado,mov.movimiento
HAVING mov.fecha>=@buscarTextoFecha and mov.fecha<=@buscarTextoFecha2 

END
else IF @modo=4
--MOSTRAR
BEGIN 
--SUM MULTIPLICA EL PRECIO POR LA CANTIDAD
--agrupo por lo que voy a mostrar
SELECT TOP 200 mov.idmov_stock,prov.razon_social AS proveedor , mov.fecha, 
mov.tipo_comprobante, mov.serie, mov.correlativa,mov.iva as IVA,mov.estado,mov.movimiento,SUM(dmov.precio*dmov.cantidad) 
AS [TOTAL]
FROM dbo.mov_stock mov 
INNER JOIN dbo.proveedor prov ON mov.idproveedor= prov.idproveedor
INNER JOIN detalle_movstock dmov on mov.idmov_stock=dmov.idmov_stock
GROUP BY  mov.idmov_stock,prov.razon_social ,mov.fecha, 
mov.tipo_comprobante, mov.serie, mov.correlativa,mov.iva ,mov.estado,mov.movimiento
ORDER BY mov.idmov_stock DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SP_PROVEEDOR]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_PROVEEDOR] 

@buscarTexto varchar(50)=null,
@modo int=null,
@direccion varchar (50)=null,
@idproveedor int output,
@razon_social varchar(150)=null,
@cuit int= null,
@telefono int= null,
@email varchar(50) =null,
@num_documento varchar(11)=null
AS

IF @modo=1
--INSERTAR
BEGIN
insert into proveedor(razon_Social,direccion,email,cuit,num_documento,telefono)
values (@razon_Social,@direccion,@email,@cuit,@num_documento,@telefono)
END
else IF @modo=2
--MODIFICAR
BEGIN
update proveedor set razon_Social=@razon_Social
,direccion=@direccion
,email=@email,cuit=@cuit,num_documento=@num_documento
,telefono=@telefono
where idproveedor=@idproveedor
END
else IF @modo=3
--ELIMINAR
BEGIN 

 delete from proveedor where idproveedor= @idproveedor and idproveedor!=0
END

else IF @modo=4
--BUSCAR TEXTO
BEGIN
SELECT * FROM proveedor 
WHERE proveedor.razon_Social like '%' +@buscarTexto+ '%' 
END

else IF @modo=5
--MOSTRAR
BEGIN 
SELECT * FROM proveedor
END

--cambiarnombre en una columna
--sp_rename 'proveedor.razon_Social', 'proveedor.razon_social';

--IMPORTANTE: Proveedor por Defecto
--insert into proveedor(razon_Social,cuit,num_documento,telefono)values('Desconocido',0,0,0)
GO
/****** Object:  StoredProcedure [dbo].[SP_UNIDADES]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UNIDADES]

@idUnidad INT OUTPUT,
@nombre varchar(50)=null,
@modo int=null,
@buscarTexto varchar(50)=null
AS


IF @modo=1
--insertar
BEGIN 
 insert into unidades(nombre) 
values(@nombre)
END

else IF @modo=2
--editar
BEGIN 


 update unidades set nombre=@nombre 
 where idunidad=@idUnidad
END

else IF @modo=3
--borrar
BEGIN 
 delete from unidades where idunidad=@idUnidad
END

else IF @modo=4
--buscar
BEGIN 
 select * from unidades where nombre like '%'+@buscarTexto+'%'
END
else if @modo=5
--mostrar
Begin
 select * from unidades
end
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIO]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SP_USUARIO]

--@id INT OUTPUT,
@codcuenta int = 1,
@ingreso money = null,
@egreso money = null,
@usuario varchar (50)=null,
@idusuario int=null,
@turno varchar (50)=null,
@concepto varchar (500)=null,
@comprobante int=null,
@estado bit = 0,
@nombre varchar(50)=null,
@descripcion varchar(50)=null,
@modo int=null,
@buscarTexto varchar(50)=null,
@Tipomovimiento int = 0,
@Tipoingegr varchar (10) = 'I',
@Fecha datetime = '20190101'

AS
IF @modo=1
--Insertar
BEGIN 

 insert into fondo_mov_caja(Cod_cuenta ,Ingreso ,Egreso,Fecha ,Usuario ,Idusuario ,Turno,Concepto,Comprobante,Estado) 
values(@codcuenta,@ingreso,@egreso,@Fecha,@usuario,@idusuario,@turno,@concepto,@comprobante,@estado )
END



else IF @modo=4
--buscar
BEGIN 
 select idusuario,usuario  from cuentas  
END
else if @modo=5
--mostrar plan de cuentas
Begin
   
  
 
 if @Tipomovimiento = 1 or @Tipomovimiento = 4 

 Begin 

   select Codigo_plan, Cuenta ,Ingreso,Egreso ,Estado,Tipomovimiento from plancuenta 
   where Tipomovimiento  =  @Tipomovimiento or Tipomovimiento = 14  
 end

 else 
 
 begin
 
   select Codigo_plan, Cuenta ,Ingreso,Egreso ,Estado,Tipomovimiento from plancuenta 
   where Tipomovimiento  =  @Tipomovimiento 

 end 
    
end
else if @modo=6
--mostrar tipo de movimiento
Begin
 select Codtipomov ,Nombre,TipoIngEgr,Estado from fondo_tipomov  where TipoIngEgr = @Tipoingegr  
end

else if @modo=7
--consultar caja por fecha 
Begin

 select  Cod_mov,Cod_cuenta,Ingreso,Egreso ,Fecha,Usuario ,Idusuario ,Turno,Concepto ,Comprobante,Estado
 FROM fondo_mov_caja  
 where Fecha = @fecha

end
GO
/****** Object:  StoredProcedure [dbo].[SP_VENTA]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_VENTA]
@modo int=null,
@idventa int = null output,
	@idcliente int=null,
	@fecha date=null,
	@tipo_comprobante varchar (20)=null,
	@serie varchar (4)=null,
	@correlativo varchar (7)=null,
	@iva decimal(4,2)=null,
@precio money =null,
@stockActual int =null,
@textobuscar varchar (50)=null,
	@textobuscar2 varchar (50)=null,
	@estado varchar(5)=null
		


AS
IF @modo=1
--INSERTAR
BEGIN

	

     insert into venta (idcliente,fecha,tipo_comprobante,serie,correlativo,IVA )
values 
     (@idcliente,@fecha,@tipo_comprobante,@serie,@correlativo,@iva   )
set @idventa = @@IDENTITY 

END



ELSE IF @modo=2
--Buscar
begin 


	select  v.idventa,
	c.razon_social ,
	v.fecha,v.tipo_comprobante, v.serie, v.correlativo,v.estado,
	 SUM(d.precio*d.cantidad) 
AS [total]
from detalle_venta d 
	inner join venta v on d.idventa = v.idventa 
	inner join cliente c on v.idcliente = c.idcliente 
where 
    v.fecha >= @textobuscar and v.fecha <= @textobuscar2 
group by  v.idventa,c.razon_social,v.fecha,v.tipo_comprobante,v.serie,v.correlativo
    ,v.estado





end
ELSE IF @modo=3
--ELIMINAR VENTA
delete from venta 
where idventa = @idventa 


ELSE IF @modo=4
--MOSTRAR
BEGIN
select top 100 v.idventa,
	c.razon_social ,
	v.fecha,v.tipo_comprobante, v.serie, v.correlativo,v.estado,
 SUM(d.precio*d.cantidad) 
AS [total]
from detalle_venta d 
	inner join venta v on d.idventa = v.idventa 
	inner join cliente c on v.idcliente = c.idcliente 
	group by v.idventa,c.razon_social,v.fecha,v.tipo_comprobante,v.serie,v.correlativo
,v.estado
order by v.idventa desc
END 

ElSE IF @modo=5
--NOTA DE VENTA
BEGIN
select v.idventa,
	c.razon_social ,
	v.fecha,v.tipo_comprobante, v.serie, v.correlativo,
	d.id_articulo,a.nombre,d.cantidad,d.precio, d.importe
from detalle_venta d 
	inner join venta v on d.idventa = v.idventa 
	inner join cliente c on v.idcliente = c.idcliente 
	inner join articulo a on d.id_articulo= a.idarticulo
--where v.idventa= (select top 1 idventa from venta order by idventa desc) 
--where v.idventa= (18) 

order by v.idventa desc
 
END

ElSE IF @modo=6
--CAMBIAR EL ESTADO DE FACTURA
BEGIN
UPDATE venta set estado=@estado
where idventa=@idventa


END
GO
/****** Object:  StoredProcedure [dbo].[SPREINICIAR_INDICE]    Script Date: 25/04/2019 13:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPREINICIAR_INDICE]
AS 
SELECT * FROM categoria
DBCC CHECKIDENT('dbo.categoria',RESEED,0)

GO
USE [master]
GO
ALTER DATABASE [db_ventas] SET  READ_WRITE 
GO
