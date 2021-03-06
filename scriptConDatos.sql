USE [master]
GO
/****** Object:  Database [db_ventas]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  User [ventas]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  Table [dbo].[articulo]    Script Date: 17/05/2019 19:09:39 ******/
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
	[pesable] [bit] NULL,
 CONSTRAINT [PK_articulo] PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  Table [dbo].[cliente]    Script Date: 17/05/2019 19:09:39 ******/
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
	[activo] [bit] NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Confequipo]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Confequipo](
	[id_equipo] [int] IDENTITY(1,1) NOT NULL,
	[equipo] [nvarchar](50) NOT NULL,
	[usuarioconectado] [nvarchar](50) NULL,
	[Turno] [nvarchar](50) NULL,
	[id_usuario] [int] NULL,
	[pv] [int] NULL,
 CONSTRAINT [PK_Confequipo] PRIMARY KEY CLUSTERED 
(
	[id_equipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[config_empresa]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[config_empresa](
	[cod_empresa] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](70) NOT NULL,
	[cuit] [bigint] NULL,
	[logo] [image] NULL,
	[condicion_frente_iva] [varchar](70) NULL,
	[path_backup] [varchar](150) NULL,
 CONSTRAINT [PK_config_empresa] PRIMARY KEY CLUSTERED 
(
	[cod_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cuentas]    Script Date: 17/05/2019 19:09:39 ******/
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
	[SA] [bit] NULL,
	[activo] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_movstock]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_movstock](
	[iddetalle_movstock] [int] IDENTITY(1,1) NOT NULL,
	[idmov_stock] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[cantidad] [money] NULL,
 CONSTRAINT [PK_detalle_movstock] PRIMARY KEY CLUSTERED 
(
	[iddetalle_movstock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[cantidad] [money] NULL,
	[precio] [money] NOT NULL,
	[descuento] [money] NULL,
	[id_articulo] [int] NULL,
	[importe] [money] NULL,
 CONSTRAINT [PK_detalle_venta] PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fondo_cierre]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  Table [dbo].[fondo_mov_caja]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  Table [dbo].[fondo_tipomov]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  Table [dbo].[forma_pago]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[forma_pago](
	[cod_forma_pago] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_forma_pago] PRIMARY KEY CLUSTERED 
(
	[cod_forma_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ingreso]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  Table [dbo].[mov_stock]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  Table [dbo].[plancuenta]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  Table [dbo].[proveedor]    Script Date: 17/05/2019 19:09:39 ******/
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
	[activo] [bit] NULL,
 CONSTRAINT [PK_proveedor] PRIMARY KEY CLUSTERED 
(
	[idproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sucursal](
	[cod_sucursal] [int] NOT NULL,
	[cod_empresa] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [int] NOT NULL,
 CONSTRAINT [PK_sucursal] PRIMARY KEY CLUSTERED 
(
	[cod_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tarjeta]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tarjeta](
	[cod_tarjeta] [int] IDENTITY(1,1) NOT NULL,
	[cod_forma_pago] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tarjeta] PRIMARY KEY CLUSTERED 
(
	[cod_tarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[unidades]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  Table [dbo].[venta]    Script Date: 17/05/2019 19:09:39 ******/
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
	[IVA] [decimal](4, 2) NULL,
	[estado] [varchar](5) NULL,
	[categoria] [varchar](50) NULL,
 CONSTRAINT [PK_venta] PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[venta_forma_pago]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta_forma_pago](
	[idventa] [int] NOT NULL,
	[cod_forma_pago] [int] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[articulo] ON 

INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1, N'7793704000232', N'Yerba Máte PLAYADITO 1/2 kg', N'', 1, 70.0000, 5, 14.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (2, N'7791290000674', N'Detergente ALA ULTRA Fragancia limon', N'', 1, 32.0000, 8, 14.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (3, N'', N'Jugo TANG Naranja-Banana', N'', 3, 20.0000, 49, 14.0000, CAST(0.00 AS Decimal(5, 2)), 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (4, N'7791290010499', N'Suavizante VIVERE 900ML Violeta y flors blancas', N'', 1, 48.0000, 0, 14.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (5, N'7791290013582', N'Suavizante VIVERE 810ML plancha facil', N'', 5, 45.0000, -2, 14.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (6, N'7793350000471', N'Pomada para calzado WASSINGTON PREMIUM MARRÓN', N'', 7, 11.5000, 2, 10.0000, CAST(15.00 AS Decimal(5, 2)), 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (7, N'7793350992950', N'Pomada para calzado WASSINGTON BLANCO', N'', 7, 30.1000, 2, 14.0000, CAST(115.00 AS Decimal(5, 2)), 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (8, N'7790250099123', N'TOALLITA FEMENINA LADYSOFT NORMAL', N'', 7, 40.0000, 20, 30.0000, CAST(0.00 AS Decimal(5, 2)), 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (9, N'7798040052594', N'Protectores diario simply', N'', 7, 25.0000, 10, 14.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (10, N'7793100120220', N'kolynos triple', N'', 7, 30.0000, 18, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (11, N'7793100112225', N'Colgate herval', N'', 7, 35.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (12, N'7796551000059', N'Alcohol San Iginio', N'', 7, 27.0000, 9, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (13, N'7791293032009', N'jabon tocador rexona cotton fresh 3 x 125g c/u', N'', 7, 18.0000, -7, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (14, N'7891024028636', N'jabon tocador palmolive suavidad exfoliante 125g', N'', 7, 20.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (15, N'693775400151', N'Maquinita de afeitar GoodMax', N'', 7, 18.0000, 30, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (16, N'070330709485', N'Maquinita de afeitar bic confort 2', N'', 7, 20.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (17, N'7797749002633', N'Palillo dental el coloso', N'', 7, 15.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (18, N'7790740505523', N'Shampoo Plusbell suavidad y cuidado', N'', 7, 60.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (19, N'7791293030401', N'Shampoo Suave Naturales', N'', 7, 52.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (20, N'6939624396261', N'Cepillo dentales Ragel Focus', N'', 7, 24.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (21, N'6927236645550', N'Cepillo dental Junior in-gloria', N'', 7, 25.0000, -21, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (22, N'6910021007206', N'Cepillo dentales colgate premier clean', N'', 1, 35.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (23, N'3400590017099', N'Curita tela elastica Curitas', N'', 1, 23.0000, -100266, 0.0000, NULL, 0, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (24, N'7798014062239', N'Barritas de asufre el coloso C/U', N'', 7, 2.5000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (25, N'7842285000541', N'Foco Rawlux 100W', N'', 7, 25.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (26, N'7622300868819', N'Jugo TANG Naranja-Durazno', N'', 9, 10.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (27, N'7622300868512', N'Jugo TANG Manzana', N'', 8, 10.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (28, N'7622300868727', N'Jugo TANG Multifruta', N'', 8, 10.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (29, N'7790580108762', N'Jugo NOEL Limonada', N'', 9, 6.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (30, N'7622300868697', N'Jugo TANG Limonada Dulce', N'', 8, 10.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (31, N'7622300868697', N'Jugo TANG Limonada dulce bajo en azucares', N'', 8, 10.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (32, N'7622300868543', N'Jugo TANG Naranja dulce', N'', 8, 10.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (33, N'7622300868604', N'Jugo TANG Ananá', N'', 8, 10.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (34, N'7622300861049', N'Jugo Verao Naranja', N'', 8, 7.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (35, N'7790580119935', N'Jugo NOEL Naranja-banana', N'', 8, 6.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (36, N'7622300868635', N'Jugo TANG Mix naranja y mango', N'', 8, 10.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (37, N'3101000000049', N'Cinta ancha pack marron 48x50', N'', 6, 50.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (38, N'7790550010125', N'Café en saquitos Cabrales C/U', N'', 1, 4.0000, 20, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (39, N'7790072001014', N'Sal fina Corrediza Celusal', N'', 8, 23.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (40, N'7791004000099', N'Sal gruesa libre de gruten Celusal', N'', 8, 29.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (41, N'7791120031564', N'arroz largo fino MOLINOS ALA x 500 grs', N'', 9, 25.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (42, N'7793695000044', N'arroz largo fino DANUBIO 500g', N'', 9, 27.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (43, N'7791478600047', N'arroz largo fino MITAI', N'', 9, 34.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (44, N'7792180004956', N'fideo mostachol SAN AGUSTIN 500g', N'', 9, 26.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (45, N'7798141970346', N'fideo seco spaghetti LA PROVIDENCIA', N'', 9, 30.0000, 4, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (46, N'7798141971497', N'fideos seco nidos spaghetti suelto LA PROVIDENCIA', N'', 9, 60.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (47, N'7791866001197', N'mayonesa NATURA 118g', N'', 9, 20.0000, 15, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (48, N'7792882000201', N'queso rallado LA QUESERA 40g', N'', 9, 18.0000, 16, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (49, N'7793253001889', N'poett aromatizante bebe', N'', 5, 30.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (50, N'7793253001865', N'poett aromatizante lavanda', N'', 5, 30.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (51, N'7790520009302', N'glade multisuperficies campos de lavanda', N'', 5, 30.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (52, N'7793699045430', N'lavavajilla cremoso Esencial', N'', 5, 25.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (53, N'7793699045577', N'lavavajilla cristalino Esencial', N'', 5, 25.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (54, N'7793699045454', N'lavavajilla cristalino Esencial', N'', 5, 25.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (55, N'7798040052273', N'lavavajilla cristal El coloso', N'', 5, 23.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (56, N'7721290000674', N'lavavajilla ALA ultra doble poder', N'', 5, 32.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (57, N'7793253000400', N'agua lavandina AYUDIN', N'', 5, 26.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (58, N'7793253001483', N'SELTON mata moscas y mosquitos', N'', 5, 57.0000, 7, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (59, N'7793253001513', N'SELTON mata cucarachas', N'', 5, 300.0000, 2, 200.0000, CAST(0.00 AS Decimal(5, 2)), 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (60, N'7790520009890', N'RAID mata polillas y larvas', N'', 5, 120.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (61, N'7790520018649', N'MR MUSCULO vidrios y multiusos', N'', 5, 32.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (62, N'7791290008472', N'CIF crema limon', N'', 5, 34.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (63, N'779129001802', N'CIF ultra higiene', N'', 5, 34.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (64, N'7793253386160', N'MORTIMER esponja de acero inoxidable', N'', 5, 15.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (65, N'7790927811164', N'REJILLA Americana', N'', 5, 25.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (66, N'7798022223707', N'MY HOGAR virulana x 12 unidades', N'', 5, 22.0000, 12, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (67, N'7797749002190', N'Esponja EL COLOSO', N'', 5, 15.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (68, N'7798017931495', N'Broches plasticos RAYITA', N'', 5, 25.0000, 20, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (69, N'7798061740104', N'SOPAPA negra', N'', 5, 34.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (70, N'7798132470039', N'jabon en pan ASTRO', N'', 5, 13.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (71, N'7797749000431', N'Vela EL COLOSO X 4 chicas', N'', 5, 10.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (72, N'7791290011755', N'Jabon en polvo ALA lavado a mano', N'', 5, 37.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (73, N'7791290011700', N'jabon en polvo ALA MATIC', N'', 5, 37.0000, 4, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (74, N'7790990992678', N'Jabon en polvo ZORRO', N'', 5, 24.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1049, N'7791290010819', N'Jabon en polvo DRIVE', N'', 5, 27.0000, 4, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1050, N'7790787002528', N'Leche entera ILOLAY', N'', 4, 38.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1051, N'7794710010017', N'Leche entera VERONICA', N'', 4, 35.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1052, N'7790787172566', N'Chocolatada ILOLAY KIDS', N'', 4, 48.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1055, N'7793893001966', N'Salchichas PANCHIN', N'', 4, 28.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1056, N'7790625001409', N'Salchichas 66', N'', 4, 25.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1057, N'7798001560588', N'Yogur frutilla y vainilla CREMIGAL', N'', 4, 10.0000, 4, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1058, N'7798001560816', N'Yogur con cereales CREMIGAL', N'', 4, 20.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1059, N'7795793102248', N'Manteca RAMOLAC', N'', 4, 25.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1060, N'7790813110104', N'Levadura CALSA X 100 GRS', N'', 4, 15.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1061, N'7795793102255', N'Crema de leche RAMOLAC', N'', 4, 45.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1062, N'7798138551961', N'Duraznos MOLTO', N'', 4, 50.0000, 4, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1063, N'2013381009157', N'Salame metro PAMPITA', N'', 4, 215.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1064, N'2000600090003', N'Fiambre PALETA x kg', N'', 4, 70.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1066, N'', N'Mortadela DON OTTO X KGS', N'', 4, 85.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1067, N'7793046001034', N'Dulce Batata DULCOR X KGS', N'', 4, 60.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1068, N'7793046004028', N'Dulce de Membrillo DULCOR x kgs', N'', 4, 70.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1069, N'7790787100415', N'Yogur bebible ILOLAY', N'', 4, 35.0000, 9, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1070, N'', N'Queso cremoso NOAL x kgs', N'', 4, 165.0000, 1, NULL, CAST(65.00 AS Decimal(5, 2)), 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1071, N'', N'Queso cremoso CASELIN x kgs', N'', 4, 145.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1072, N'7790787153657', N'Dulce de leche ILOLAY chico', N'', 4, 25.0000, 7, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1073, N'7793046008019', N'Mermelada DULCOR', N'', 4, 34.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1074, N'7798022227767', N'Amargo Serrano SUPER TOP', N'', 3, 25.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1075, N'7798062540284', N'LEVITE pomelo', N'', 3, 50.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1076, N'7790036006970', N'BAGGIO Fresh', N'', 3, 28.0000, 4, 0.0000, NULL, 1, 0)
GO
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1077, N'7790950003420', N'Amargo Serrano TRES TORRSES', N'', 3, 35.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1078, N'7791085000018', N'Jugos PENT 10 Naranja', N'', 3, 30.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1079, N'7791375001800', N'CABALGATA Pomelo- Naranja-Cola y Lima', N'', 3, 45.0000, 17, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1080, N'7798113301246', N'Gaseosas MANAOS X 3 L', N'', 3, 45.0000, 16, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1081, N'7798113300294', N'Soda LA BICHY X 2,250', N'', 3, 27.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1082, N'7792758013038', N'SECCO Naranja', N'', 3, 50.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1083, N'7790036846262', N'VINO TALACASTO', N'', 3, 58.0000, 9, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1084, N'7790036000572', N'BAGGIO PRONTO chico', N'', 3, 15.0000, 7, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1085, N'7790036000466', N'BAGGIO PRONTO grande', N'', 3, 43.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1086, N'7798164280057', N'AGUAS De LAS MISIONES x 6L', N'', 3, 73.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1087, N'7790121000944', N'PETACAS ANIS', N'', 3, 38.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1088, N'7790121000890', N'PETACA Cafe al coñac', N'', 3, 38.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1089, N'7790121000968', N'PETACA LICOR dulce de leche', N'', 3, 38.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1090, N'7792023000046', N'FLUIDO desinfectante TRIUNFO', N'', 5, 48.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1091, N'7791866001357', N'Mayonesa NATURA x 1000 kgs', N'', 9, 135.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1092, N'7794000000568', N'Mayonesa RICK x 242 grs', N'', 9, 24.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1093, N'7794000960107', N'Mayonesa HELLMANNS x 237 grs', N'', 9, 32.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1094, N'7795184001907', N'Pure de tomate NOEL 520 grs', N'', 9, 19.0000, 12, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1095, N'7790580660000', N'Polenta PRESTO PRONTA x 500 grs', N'', 9, 34.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1096, N'7792170007196', N'Polenta QUAKER X 500 grs', N'', 9, 20.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1097, N'7798029630799', N'Harina EL AMERICANO x 1000 grs', N'', 9, 34.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1098, N'7792180004888', N'Leudante PUREZA', N'', 9, 38.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1099, N'7792180004567', N'Harina pizza PUREZA', N'', 9, 43.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1100, N'7794000599178', N'FECULA Maizena', N'', 9, 30.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1101, N'7797237001094', N'Harina comun SELECCIONADA', N'', 9, 25.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1102, N'7798089020028', N'LENTEJAS SECAS', N'', 9, 32.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1103, N'7792200000159', N'9 de oro CLASICO', N'', 9, 21.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1104, N'7792200000128', N'9 de oro AGRIDULCES', N'', 9, 21.0000, 7, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1105, N'7790270336307', N'GALLETITAS media tarde x 3', N'', 9, 30.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1106, N'7790270336307', N'GALLETITAS media tarde x unidad', N'', 9, 12.0000, 12, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1107, N'7790070412379', N'EXQUISITA Limon', N'', 9, 65.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1108, N'7790070412362', N'EXQUISITA Naranja', N'', 9, 65.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1109, N'7790070410139', N'EXQUISITA Vainilla', N'', 9, 65.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1110, N'7790070410658', N'Gelatina EXQUISITA', N'', 9, 26.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1111, N'7790580113445', N'Gelatina MOGUL', N'', 9, 18.0000, 8, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1112, N'7790387015126', N'Yerba MAÑANITA x 500 grs', N'', 9, 55.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1113, N'7792710002179', N'Yerba AMANDA x 500grs', N'', 9, 67.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1114, N'7790802000010', N'Yerba ROMANCE x 500 grs', N'', 9, 55.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1115, N'7793704000232', N'Yerba PLAYADITO x 500 grs', N'', 9, 72.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1116, N'7798087510019', N'azucar mitai', N'', 9, 25.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1117, N'7798156760741', N'pure de tomate sabor del Valle', N'', 9, 15.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1118, N'7798022222755', N'pure de tomate SAN REMO', N'', 9, 15.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1119, N'7790550010125', N'cafe en saquito', N'', 9, 5.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1120, N'7790387000849', N'mate cosido taragui', N'', 9, 1.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1121, N'7790387010305', N'el plaser del taragui', N'', 9, 1.5000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1122, N'7791293025025', N'shampoo en sobresito', N'', 9, 5.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1123, N'7793040030771', N'grasa FRIAR x 1 kg', N'', 9, 46.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1124, N'7798141970346', N'fideo la providensia espageti', N'', 9, 30.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1125, N'7798141970353', N'fideo tallarin la providensia', N'', 9, 30.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1126, N'7792180004956', N'fideos mostacholi san agustin', N'', 9, 26.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1127, N'7791004000099', N'sal gruesa salusal', N'', 9, 29.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1128, N'7790072001014', N'sal chica selusal', N'', 9, 23.0000, 10, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1129, N'7798141970476', N'fideos tirabuzon la providensia x kg', N'', 9, 60.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1130, N'7798141971497', N'fideos nidos spaghetti la providensia x kg', N'', 9, 60.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1131, N'7790989003248', N'picadillo la negra', N'', 9, 15.0000, 4, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1132, N'7798022220362', N'arveja san remo', N'', 9, 17.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1133, N'7795933000281', N'atun bahia', N'', 9, 52.0000, 7, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1134, N'7798130880670', N'rollo de cosina suapel', N'', 9, 30.0000, 4, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1135, N'7790250044390', N'pañal mdiano babysec por unidad', N'', 5, 10.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1136, N'7798130888928', N'papel higienico suapel 50 metros', N'', 5, 17.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1137, N'7791818002128', N'papel higienico suapel 120 metros', N'', 5, 35.0000, 5, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1138, N'7791905003373', N'Suavizante para ropa QUERUBIN x 3 L', N'', 5, 170.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1139, N'7791905000921', N'Suavizante para ropa QUERUBIN x 900 ml', N'', 5, 58.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1140, N'7793253002329', N'AYUDIN Ropa color x 470 ml', N'', 5, 45.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1141, N'7793253002343', N'AYUDIN Ropa blanca x 1L', N'', 5, 45.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1142, N'7793591002081', N'Grasa LA CORDOBESA x 500 grs', N'', 9, 30.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1143, N'7798303170096', N'Aceite girasol DESCOLLANTE', N'', 9, 55.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1144, N'7790940233240', N'Protectores diarios s/desodorante DONCELLA', N'', 7, 23.5000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1145, N'7790940235077', N'Protectores diarios respirables DONCELLA', N'', 7, 25.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1146, N'7790940233011', N'Protectores diarios duo forma DONCELLA', N'', 7, 34.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1147, N'7500435140584', N'Toallas femeninas ALWAYS', N'', 7, 65.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1148, N'7792308000013', N'dulce de leche santa maria', N'', 4, 26.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1149, N'7798018850184', N'levadua en polvo x 10 grs LEVEX', N'', 9, 15.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1150, N'7794980912288', N'Vainilla liquida x 28cc YUSPE', N'', 9, 18.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1151, N'7794321000025', N'Trapo de piso TASK', N'', 5, 34.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1152, N'7793253038106', N'Esponja  cuadriculada MORTIMER', N'', 5, 15.0000, 14, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1153, N'222', N'Bicarbonato de sodio x 20 grsYUSPE', N'', 7, 6.0000, 6, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1154, N'7793875360050', N'Provenzal x 25 grs Aromas&Sabores', N'', 9, 23.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1155, N'7793875360104', N'Adobo para pizza x 25 grs AROMAS & SABORES', N'', 9, 19.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1156, N'7790150496046', N'Tucos y guisos x 25 grs ALICANTE', N'', 9, 26.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1157, N'7790150042052', N'Comino x 25 grs ALICANTE', N'', 9, 26.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1158, N'7791085002371', N'Jugo de pomelo x 1,5 L PENT', N'', 3, 48.0000, 1, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1159, N'7791085000780', N'Jugo mix frutal x 500c  PENT 10', N'', 3, 30.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1160, N'7791085002241', N'Jugo nja-anana 500c PENT 10', N'', 3, 30.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1161, N'7791085000025', N'Jugo pomelo x 500c PENT 10', N'', 3, 30.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1162, N'7791085000063', N'Jugo cola x 500c PENT 10', N'', 3, 30.0000, 2, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (1163, N'7798022221956', N'Maiz pisingallo x 400 grs SAN REMO', N'', 9, 26.0000, 3, 0.0000, NULL, 1, 0)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (2174, N'0000000021746', N'Milanesa x Kg', N'', 11, 220.0000, 68, 200.0000, CAST(10.00 AS Decimal(5, 2)), 1, 1)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (2175, N'', N'ARTICULOS VARIOS', NULL, 1, 0.0000, NULL, 0.0000, CAST(0.00 AS Decimal(5, 2)), 0, 1)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (2176, N'0000000021760', N'pulpa x kg', N'', 11, 250.0000, 12, NULL, NULL, 1, 1)
INSERT [dbo].[articulo] ([idarticulo], [codigo], [nombre], [descripcion], [idcategoria], [precio], [stock_actual], [precio_Compra], [utilidad], [estado], [pesable]) VALUES (2177, N'0000000021777', N'Pan x kg', N'', 11, 50.0000, 15, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[articulo] OFF
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (2, N'Panaderia', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (3, N'Bebidas', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (4, N'Lácteos', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (5, N'Limpieza', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (6, N'Libreria', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (7, N'Perfumeria', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (9, N'Comestibles', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (10, N'Farmacia', N'')
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion]) VALUES (11, N'Carniceria', N'')
SET IDENTITY_INSERT [dbo].[categoria] OFF
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([idcliente], [razon_social], [fecha_nacimiento], [cuit], [direccion], [telefono], [email], [num_documento], [activo]) VALUES (1, N'Consumidor Final', CAST(N'2018-07-25' AS Date), 11111111113, N'', 0, N'', N'0', 1)
SET IDENTITY_INSERT [dbo].[cliente] OFF
SET IDENTITY_INSERT [dbo].[Confequipo] ON 

INSERT [dbo].[Confequipo] ([id_equipo], [equipo], [usuarioconectado], [Turno], [id_usuario], [pv]) VALUES (1, N'DESKTOP-DT84KT2', N'CRISTIAN', N'MAÑANA', 1, NULL)
SET IDENTITY_INSERT [dbo].[Confequipo] OFF
SET IDENTITY_INSERT [dbo].[config_empresa] ON 

INSERT [dbo].[config_empresa] ([cod_empresa], [razon_social], [cuit], [logo], [condicion_frente_iva], [path_backup]) VALUES (21, N'mercadito', 31123213, 0xFFD8FFE000104A46494600010101006000600000FFE1005A4578696600004D4D002A00000008000503010005000000010000004A030300010000000100000000511000010000000101000000511100040000000100000EC3511200040000000100000EC300000000000186A00000B18FFFDB004300080606070605080707070909080A0C140D0C0B0B0C1912130F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F27393D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232FFC000110800EC00FD03012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7EA28A2800A28A28011982A9663800649AE48FC51F03AB153E25B0041C11BCFF8575373FF001EB37FB8DFCABE0E92379B5078A35DCEF295551DC93C5007D8FF00F0B4BC0DFF00433587FDF67FC2BA3D2F54B1D6B4F8AFF4DBA8EE6D25CEC963390D8383FA8AF90FFE15178F7FE85BB9FF00BEE3FF00E2ABE96F855A45FE85F0E74CD3B53B66B6BC8BCCDF13104AE64623A71D08A00BDA978FFC27A3EA13586A3AF59DB5DC240922918EE5C804678F422AA7FC2D2F037FD0CD61FF007D9FF0AF9BFE34DADC5BFC55D6249A178D2731C91330C075F2D4647AF208FC2B91D1742D4BC45A80B0D26D4DCDD152C225655240EB8C919A00FB6B44F11691E23B692E347D421BD8637D8EF11C856C671F91A835BF17F87FC373C50EB3AB5B59492AEF8D656C1619C66B87F819E19D67C2FE19D4AD75AB092CE696F3CC44720EE5D8A33C13DC1AE1BF693B4B8FEDAD16F04127D9BECCD19976FCA1B76719F5C5007AE7FC2D2F037FD0CD61FF007D9FF0ABDA4F8E7C2FAF6A0B61A56B76B7774CA58451B12481D6BE28B5B696F2EA2B681434B2B0440582824F4E4F02BDB3E0F7C3FF0015787BE20DBEA1AB68D35ADA2C12A9959D0804AF1D09A00FA328A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A008AE7FE3D66FF0071BF957C270CC96FADC73C99D91DC876C0EC1B26BEEE953CC85D01C6E5233F5AF9E25FD9BB55926771E20B31B989FF0052DEB401DCFF00C2FF00F03FFCF5D43FF01BFF00AF5DEF877C4163E29D0EDF58D34C86D27DDB0C89B5B8254F1F515E0DFF000CD7AAFF00D0C167FF007E5ABDABC09E1A97C21E0EB1D127B84B892DB7E6445201DCE5BBFD6803CEFE2CF8A7C01AA3DDF86B5E6BC8F53B23FBBB886DF7189CA861839E4608C8AF9CAD6F27D2F528EEEC2E5E39A093745327CA720F06BE87F1BFC0CD43C57E31D475C8759B5823BB65611BC4C4AE1157A8FA573FFF000CD7AAFF00D0C165FF007E5A803D57E1678E24F1D7853ED9730F95796B27D9EE0AFDD76001DC3D320F4A8FE2378C7C21A35BAE87E2B8669A1BF84B8448778C6719CE7820D3BE17F80EE3C01A25E585CDEC576D7173E7068D4A8036818E7E9593F147E15DE7C40D56C6F2DB5382D05B40622B2216DC4B673C5007CC3ADC5A5C3AB4EBA35D4B71605B313CD1EC703D08F515EE9F027E235F5FDCA784752DF71B6267B5B8272515464A37A8C74ACCFF00866BD57FE860B2FF00BF2D5D5FC3BF8317FE0AF1743AD5C6AF6D731C71488638E3604EE18EF401EC5451450014514500145145001451450014514500145145001451450014514500145145001451450063C9E2BD02195E29356B559118AB297E411DA9BFF097F877FE83169FF7DD78478A6110F8AB548F1D2E5FF539AC8C57B30CB2128A9736E7853CDA71938F2AD0FA3BFE12FF000EFF00D062D3FEFBA3FE12FF000EFF00D062D3FEFBAF9C71462ABFB2A1FCCC9FED89FF002A3E8EFF0084BFC3BFF418B4FF00BEE8FF0084BFC3BFF418B4FF00BEEBE71C518A3FB2A1FCCC3FB627FCA8FA3BFE12FF000EFF00D062D3FEFBA3FE12FF000EFF00D062D3FEFBAF9C7028E28FECA87F330FED8A9FCA8FA3BFE12FF0EFFD062D3FEFBA3FE12FF0EFFD062D3FEFBAF9C78A38A3FB2A1FCC1FDB153F951F477FC25FE1DFFA0C5A7FDF747FC25FE1DFFA0C5A7FDF75F38F147147F6543F9987F6C54FE547D1DFF097F877FE83169FF7DD1FF097F877FE83169FF7DD7CE3C51C51FD950FE661FDB153F951F4BD8EBDA56A73982C6FE0B8942EE2B1B6481EB5A35E3BF07E2DDAEEA32E3EE5B000FD5BFF00AD5EC55E66268AA351C13B9EB616B3AD494DAB0514515CE74851451400514514005145140051451400514514005145140051451401F3EF8FA2F2BC6FA90C637386FCC0AE6ABB3F8A30F97E3495B1C490A37E95C657D5615DE8C5F91F218B8DABCD798514E48DE5711C68CEE7A2A8C93F8558FECBD43FE7C2EFFEFC37F856AE515BB315193D91568AB5FD97A87FCF85DFFDF86FF0A3FB2F50FF009F0BBFFBF0DFE14BDA43B8FD9CFB32AD6FE8E88D6196452779E48ACAFECCD43FE7C2EFFEFC37F856FE8FA7DEAD861ACEE41DE783137F85295485B72654E76D992F9317FCF24FFBE451E4C5FF003C93FEF9156FEC379FF3E971FF007E9BFC28FB0DE7FCFA5C7FDFA6FF000A8F691EE47B3A9D9953C98BFE7927FDF228F262FF009E49FF007C8AB7F61BCFF9F4B8FF00BF4DFE1486CAED412D6B3803924C678FD28F691EE2F673ECCABE4C5FF3C93FEF915CEEA981A8C814000003007B574B5CB5FB6EBF9CFF00B66B48EE10DCF4EF83907EE356B82392F1A03F8135EA35C07C23876785AE2523FD65D37E400AEE2F78D3EE48E3F74DFC8D7CDE3657AF267D7E0636C3C493CD8C9C0913FEFA14E2C14658803D49AF89BC33A8DCA78DB4B32DECAB10BF8CB17948006F19CF3D2BE86F8DBAD58CBF0D6E92CB54B779CDC458582E14B63773D0E6B94EB3D495D18E15D49F639A4F3A2FF9E89FF7D0AF993E00DD5CCFE33D41649E6907F674980CE4F3B96BCEB51835F82E2E65922D4A38964625D9640A067D6803EE0F3A2FF9E89FF7D0A51223676BA9C75C1AF8420B9D4EE65114135DCB237448DD989FC057AE7C1D875582DBC5ED7D1DEC63FB25B619D5C73CF4CF7A00FA484B193812273FED0A7D7C191EA9A8432A491DEDC2BA30652243C11D2BE86D53E345BBFC218EFADE651AF5CA9B33103F32381F349F4C723DCD007B579D17FCF44FFBE852B3A2FDE7519E9935F07C7A85EB4CA4DE5C1CB0CFEF5BD7EB5EBBF1FAEAE21D57C3C229E54074E04857233CD007D28ACAC32AC08F634B5E45FB3CCD2CDE07BD6964791BEDADCBB13FC2B5EBB4005145140051451401E37F17A1D9E21B297B496D8FC431AF3CAF53F8C709DDA4CFDBF789FC8D79677AFA5C03BE1E27CAE611B62646B785E6FB3F8AB4B901C62E141FA1E2BDFB273D4D7CE56530B6BFB79CE7114AAE71EC735EBBFF000B2FC3D9CEEB9FFBF55C999519CE7170573B72BAF4E9C24A6EC761B8FA9A371F535C7FFC2CAF0F7F7AE7FEFD51FF000B2BC3DFDEB9FF00BF55E6FD56BFF2B3D4FADE1FF991D86E3EA6AEDA9261E7D4D7091FC46D0A594471FDADDD8E02AC24935D9E9575F6BB212F9134209E1655C37E559CE94E1F1AB1A53AD4EA7C0EE5EA298D22AF53FA533ED510EE7F2ACCD49AB37C412F93E1FBE7FF00A62C3F3E2AC1BF80776FFBE6B9BF15F8834F7D1AE6CA39B75C480008074E7BD6B460E551248E7C4D48C2949B7D0F3715C8CC774F237AB1FE75D639DB1B37A2935C867824D7D540F8D81EF1F0CE2F2BC0F687182EEEFF00F8F574F7DFF20FB9FF00AE4DFC8D6478261F23C19A5A1EBE483F9D6CDD2349673C6832CD1B281EE457CAD777AB27E6CFB4C3AE5A515E48F83C412DD5FF00D9E08DA49A49362228C9624F00569EA5E0FF0011E8D66D79A968B7B6B6CA42996588AA827A735DEE81F07FC6D65E2CD3AFA7D2D56086F12576F3D7850C093D6BDBBE2D787F52F13F80AE34CD260135D3CD1B042C178072793591B1E2FF00B3AFFC8FD77FF5E2FF00FA12D7B6FC59FF00925BAFFF00D7BFFECC2BCF3E0CFC3BF13784FC5D717DAC58882DDED1A35612AB7CC594E383EC6BD43E2169379AEF80F56D334F8BCDBAB8876C684819391DCD007CD3F04BFE4AAE97FEECBFFA01AFAA3C4BFF0022B6ADFF005E72FF00E806BC23E177C2EF16F873C7F61A9EA7A72C369107DEE25538CA903806BDF35BB696F341D42D605DD2CD6D2468338C92A40A00F88FC3DA43EBFE20B1D263904725DCA22563D89E9FAD4D61E18D4AFF00C591F87120617ED71E43291F7483C93EC064D7A47827E1278CF48F1B68DA8DEE98B1DB5B5D2492BF9CA76A83C9C66BE8283C25A35B78AEE3C4B15A28D4E78844F276C77207627804FB5007C55A8590D3B5CB8B10FBFECF70D16EC633B5B19AF56FDA0FFE42DE1DFF00B070FE759FAD7C1DF1BDDF892FEF21D295A196E9E443E7A0CA962477AEE3E307C3DF12F8AB51D1A5D22C44E96D642294991570D9E9C9A0087E04F8AB40D0FC1D796FAA6AF6767335E1611CD285246D1CD7B0697E2CF0FEB7746DB4BD62CEEE70BB8C70CA18E3D6BE5BFF008525E3CFFA042FFDFF004FF1AF44F839F0E7C4DE14F18CB7FAC582C16ED6CD18712AB7248F43401EF145145001451450079E7C5E837F876CA7FF009E5738FCD48AF1BAF75F8A30F9DE089DBFE794D1BFEB8FEB5E155F41963BD0B7667CDE6B1B57BF741451DABD6BC29E04D0C585AEA37824BD9268C4811F845CFB77FC6BAB11888508F348E4C361A788972C4F33D3346D4B599845A7D9CB39EECABF28FA9E82BD0748F849210B2EB178147530C1D7F126BD2EDDEDAD2110DBDBAC51AF458D401521BB5238435E356CCAACF48688F6E8E574A1ACF566269BE1CD2B424DB616691B11CC87E673F89ADDB4FF0051F89AACF206FE1FD6875BC6B2DB64F124849F9A50481F80AE07294DDE4CF4546308DA289E764890B3BAA281C966C62B93D4FC5F616CCC96D9B9901EABC2FE74DBEF07EB3A8B96BBD6124FF64A90A3F0AA7FF0AEAEFF00E7FE0FFBE4D7651A7865AD495CF3B115B192D2942DF71877FE23D42F8143279519FE18F8FD6B22BB3FF857579FF3FF0007FDF26B1F5EF0DCBA0A42D2DCC72F9A48010118C57A746B61EEA14CF171186C5D9D4AC9D8E7AEDB659CCDE886B93ED5D46A4DB74F98FA8C573512EF9A34FEF301FAD772D15CE4A68FA534455B5F0F69E8CC142DBA0C938EC2AEFDA21FF9ED1FFDF42B95F1C4057C12AA323CA31F4F6E2BC977B7F79BF3AF84C5633D954B5AE7E9D97E54B13479F9ED6D36FF00827D09F6887FE7B47FF7D0A3ED10FF00CF68FF00EFA15F3DEF6FEF37E746F6FEF37E75CFFDA5FDDFC4EEFEC0FF00A79F87FC13E84FB443FF003DA3FF00BE851F6887FE7B47FF007D0AF9EF7B7F79BF3A37B7F79BF3A3FB4BFBBF887F607FD3CFC3FE09F427DA21FF009ED1FF00DF428FB443FF003DA3FF00BE857CF7BDBFBCDF9D1BDBFBCDF9D1FDA5FDDFC43FB03FE9E7E1FF0004FA13ED10FF00CF68FF00EFA147DA21FF009ED1FF00DF42BE7BDEDFDE6FCE8DEDFDE6FCE8FED2FEEFE21FD81FF4F3F0FF00827D09F6887FE7B47FF7D0A3ED10FF00CF68FF00EFA15F3DEF6FEF37E746F6FEF37E747F697F77F10FEC0FFA79F87FC13E84FB443FF3DA3FFBE851F6887FE7B47FF7D0AF9EF7B7F79BF3A37B7F79BF3A3FB4BFBBF887F607FD3CFC3FE09F4209E1270258C93FED0A92BC1B44579F5DB18B737CD3AF7F7AF79AEBC3623DB26ED6B1E5E3F02B09251E6BDC28A28AE9380E6FC7D179BE08D517D230DF9106BE7C1D2BE90F14C5E7785B538F19CDBBFF002AF9B874AF732A7FBB92F33E7F385FBC8BF216BDDBC19379FE10D35BD22DBF91C5784D743A678D35AD22C12CAD2789608F3B434609E7DEBA31B879578251DCE6C06263426E52D8F72A2BC63FE163F88FFE7E20FF00BF228FF858FE23FF009F883FEFC8AF33FB32BF91EB7F6B50F33D9EAF5AFF00A8FC4D7857FC2C7F11FF00CFC41FF7E456D695E3CD7A6B3DEF71167711C44293CB2B2EC0F36A0BB9EC345795FF00C26FAE7FCF78FF00EFD8AE9BC1FAEEA3ACDCDD2DE488C91A02A1500E4D655305529C5CA56B174732A35A6A11BDD9D75701F116426E2CA2F4566AEFEBCDBE2049BB5A853FBB0FF5A78057AE859ACAD867F2384D5DB1A7B0F5602B1F4B8BCFD62CA2FEFCE8BFF8F0AD4D6CE2CD47ABD45E1187ED1E2FD2A3C75B853F9735F41376A6D9F3787579C5799EDDE348BCDF095F0FEEA86FC88AF15AF75F1247E6F86F504F585ABC2ABF3BCC57EF13F23F5EC85FEE64BCFF0040A28A912DE69177243232FAAA922BCF3DC6D2DC8E8A9BEC973FF3EF37FDF068FB25CFFCFBCDFF007C1A7662E68F721A92101A55046453BEC973FF003EF37FDF06A482D2E7CE5FF479BFEF8349A7617347B937951FF717F2A3CA8FFB8BF9559FB25CFF00CFB4DFF7C1A3EC973FF3ED37FDF06B1B488E75DCADE547FDC5FCA8F2A3FEE2FE5567EC973FF3ED37FDF068FB25CFFCFB4DFF007C1A2D20E75DCADE547FDC5FCAA1B945541B540E6ADBA3C6DB5D595BD1860D54BB3F74538DEE5A77347C21179BE2BD3D7D24DDF90AF6EAF1DF00C5E678B2DCE33B119BF4AF62AF7B2F5FBA6FCCF96CF657C425E5FE6145145779E2957538FCDD26F23FEF40E3F435F31918623D0D7D4922EF89D0F46522BE60BC4F2EFAE13FBB2B0FD6BD8CA5FC4BD0F13385F03F521AF41F02786346D7B489E6BEB769268E6D991215E31E82BCFABD3BE144B9B5D4A1CFDD7461F8835DB8F94A341B8BB1C397C632AE9495CDDFF8579E1AFF009F293FEFF37F8D795789F4E874AF125ED95BA958637F90139C0201EB5EFB5E55E3EF0DEAB71E209B50B5B1927B791172D18DC41030723AD79F80C4C9D5B5497DE7A598E162A9274E3ADFA1C0D743A2FF00C83FFE066B0658A581F64D1BC6C3B3A906B7745FF8F0FF00819AF69EA8F9E9A696A68D77DF0EA3FDC5F49EACABFA7FF5EB88B7B2BABB6C5BDB4B29FF006109AF4BF0669775A5E972ADDC4639249376D272718AF371F523EC9C6FA9DF95529BC4295B447495E5BE397DDE25907F763515EA55E49E2D7DFE27BCE738603F4AE2CB95EB5FC8F4F3876C3A5E671DAE9FDD423FDA26AF7C3A8BCDF1C58F1F7373FE42B335E3FBC857D89AE8FE1445BFC5CCF8FF00576EC7F32057B18976C3C9F91E360A37AD05E67B2EA2824D32E90F3BA161FA57CFE46091E95F43B8DD1B2E3A822BE7DBA4F2EEE74C636C8C31F8D7C1E64BE17EA7EA5904BF891F4FD48ABD33C02E1FC3EEBC1D9330AF33AF42F8772674FBD8FF00BB283F98AE7C0BB564776731BE11BECD1D9E07A0FCA8C0F41F9515997BE21D2B4FB96B6BABB11CCA012BB49EBF857B529462AF2763E4614E751DA09B7E469E07A0FCAA5B703CF5E07E55CFFF00C25FA17FCFF8FF00BE1BFC2A5B7F17E85E7AFF00A7AFFDF0DFE151EDE97F32FBCD7EA988FE47F733AAC0F414607A0AC3FF0084BF42FF009FF5FF00BE1BFC28FF0084BF42FF009FF5FF00BE1BFC297D628FF32FBC3EA988FE47F7337303D05181E82B0FFE12FD0BFE7FD7FEF86FF0A5FF0084BF42FF009FF5FF00BE1BFC28FAC51FE65F787D5311FC8FEE679FF8BA4F33C5179FEC90BF9015CCDD9F9D47B56CEB172979ACDE5CC6DBA3925254FA8ED58B74732FD057CE4E5CD564FCD9F6B868F2D28C7B25F91D5FC368F7788E57C7DC80FF00315EAF5E65F0BD33A95FBE3A44A33F53FF00D6AF4DAF7702AD451F2F9CCAF8B6BB24145145761E5057CD5E2184C1E24D4A2231B6E1F8FC6BE95AF9E7C750F91E35D517FBD2EE1F8806BD4CA9FEF1AF23C8CDD7EEA2FCCE7ABD07E14CB8D4F508BFBD0AB7E46BCFAADE9FA9DEE9571F68B1B97825230597B8F435EBE2293AB49C1753C6C355546AA9BE87D0EDF74E3D2B946D46F55D819DB20E2B8CB1F89BACDBE16EA382E97B92BB4FE95D24538BA892E00DA2501F1E99E6BE0388A857C2AA72BDAF7D9FA1F619762A96279947A135CC86F176DCAC730FF6D01AAB059DADB1CC36F12739C05E3F2A9E8AF9A58BC4256537F7B3D27469377715F716D354BD8976C73945F4518A7FF6C6A3FF003F727E75468A9FAC56FE77F7B2B923D8BDFDB1A87FCFD49F9D67CD14771334D346AF239CB311C9AB3691AC97015C657078AD0FB1DBFF00CF21F99A5F5DAD07A4DFDEC1D0A735EF453F91CEC9A5D8CCC1A4B4898818195AB1A7C31695334D631241232ED2C83048ADAFB1DBFF00CF21F99A3EC76FFF003C87E668798621AB3A92FBDFF9896169277515F715BFB6750FF9FA7FCEB25EC6D6491A47B78D9D892C48EA4D6FFD8EDFFE790FCCD53BE8A388A08D02E4124D67F599CF4727F79AC6F4F58E9E8723AF4105B8816189109C93B4726B7BE1D49FBDBF8FD555AB07C46D9BA857D13FAD6AFC3E936EAF711FF7A1CFE46BDCCB5B538367A95D3965AEFDAFF89E8D5E67E3E8F6F8855FFBF0A9FCABD32B99F12F85E5D76EE19E2B848BCB4D8432939E6BDAC653954A568EE78995D7850C4734DD9599E615241FEB96BB0FF857775FF3FF000FFDF26A5B7F87574675FF004F87FEF935E4BC1D7B7C27D2FF006A613F9FF3399A2BB4FF00857577FF0041087FEF8347FC2BABBFFA0843FF007C1ACBEA588FE523FB4F09FCFF0099C5D15DA7FC2BABBFFA0843FF007C1A8E7F87F7305BC9335FC2446A588D87B0A3EA55D7D91ACCB0ADD94FF338FAA3707F7CD57AB3E6FF005CDF5AC21B9DF13D13E1747FBAD4A5C7F122E7F027FAD7A15715F0CE129A05C4B8FF0059707F402BB5AFA3C22B5189F1799CB9B1736145145749C015E15F1421F2BC6B33F6962461F963FA57BAD79AFC46F07EADADEAB0EA1A6C29322402374DE0364127A7E35DB80A91856BC9D91C19952954A168ABB3C8A8AB77BA5EA1A74863BCB29E061FDF4207E754F35F46A4A4AE8F98717176685AF4CD11FCCD12CDBFE9981F95799D7A1F861F7E816FFEC965FD6BE4F8C217C1C25DA5F9A67BDC3F2B62251EEBF546C514515F9D1F5C15762D2AEE689644452AC323E6AA55D769DFF20F83FDC15E965B84A7899B8CFA2E8635AA382BA39FB7824B6D43CA94618293C1ADA8B4FB89A2122282A7A73542EFFE43ADFEE7F4AEA34DFF00907C5F43461F014AB63274657B46FF0098E75A51A6A4BA993FD9575FDC1F9D1FD9575FDC1F9D743457A9FD8386EEFEFF00F8061F5BA873AFA65CA233B28C0193CD60EA2D99917D16BB8BE3B6C663FECD70B7E41BAC0ECA0578F98E0A9616AC634EFAABEA7451AB2A916D9C66BEDBB5223FBA80568781A4D9E258D73F7E365ACAD65B76A937B60547A6EA12E97A8477900532479C06E8722BB30B2507093E963E99D275307ECD6EE3FA1ED54579BFFC2C1D4FFE7DEDBF2347FC2C1D4FFE7DEDBF235EDFD7E89F3BFD8B8BECBEF3D22A5B7FF5EB5E65FF000B0753FF009F7B6FC8D496FF0010754F3D7FD1EDBF23FE34BEBF445FD8D8AECBEF3D628AF36FF8583A9FFCFBDB7E46A483C7BA9CB71145F67B7F9DC2F43DCD2598D07DFEE13C9F1495ECBEF3D16B3F5C93CAD0AF9FD216FE55A1DB9AC5F1649E5F862F8FAA05FCC8AEAACED4E4FC99C3878F3568AF35F99E463A0ACD6FBEDF5AD13D0FD2B34FAD7CBC0FBE89EC5E0084C5E11B627FE5A3BBFEB8FE95D3D63784E2F23C2BA6A7FD310DF9F3FD6B66BEA28AB538AF247C1E2A5CD5E6FCDFE61451456873851451400D9228E65DB2C6AEBE8C322B9DD4BC09E1CD4C132E9C9139FE380EC3FA5749455C67283BC5D889D384D5A4AE794EA9F0818167D27510475115CAFF00ECC3FC2A3D2B44D4340B2FB16A31AA49BCB2ED6DC083DEBD6AB95F1628FB45B3F72A4570E7789AB5704E137749A6183C252A55F9E0ACCE768A28AF893D90AEBB4EFF00907C1FEE0AE46BAED3BFE41F07FB82BDBC8FF8B2F4FD4E6C57C28CABBFF90EB7FB9FD2BA8D37FE41F17D0D72F77FF21D6FF73FA5751A6FFC83E2FA1AD701FF00232ABF3FCC557F81133B5791D6F005760360E86A879D2FFCF47FFBE8D5DD63FE3F47FB82B3F04F406BC5CC67358BA893EA75514BD9A1E6591860BB11E84D62DD90D77263D715B263751928C07A915873906E2423A1635CD1E6BFBC54AD6D0E23516DFA8CEC3FBE69B60B1C9A8DB24CBBA26955587A8269972DBAEA56F573FCE991B6C951FF00BAC1BF235EDC3448FA951FDDF2AEC7AB9F07E8393FE823FEFB3587E2BF0E699A7E86D73676A23915D4160C4F06BB746DD1AB7AA83599E22B19B52D0AE2D6DD434AD82A09C6706BE82AD083A6F962AF6EC7C761B1959578F3CDDAEAF7678F54907FAE5AB579A36A56048B9B29900FE2DB91F98AAB07FAF5AF025171D1A3ECE338CD5E2EE8BF577474F3359B24F5997F9D548E3795B6C68CEC7B28CD751E1AF0DEAA358B4BB9AD1A28237DCC64383F975A5429CA73565D4E6C4D6853A727276D19E995CDF8EA4D9E199067EFC88BFAE6BA4AE3FE21C9B748B68FFBF367F215F438B76A12F43E472F8F362A0BCCF3793FD537D2B3AAFCFF00EA5AA9C2BBE78D7FBCE07EB5F394D1F6E9D95CF7AD26210E8F651818DB020FD055CA642BB208D07F0A81FA53EBEA92B2B1F9F49DE4D8514514C90A28A2800A28A2800AE73C5ABFB8B67F4622BA3AC3F14A83A62363EEC82B873257C2CCD68BFDE238FA28A2BE30F442BAED3BFE41F07FB82B91AEBB4EFF00907C1FEE0AF6F23FE2CBD3F539B15F0A32AEFF00E43ADFEE7F4AEA34DFF907C5F4AE5EEFFE43ADFEE7F4ADDB4D4A0B7B38E36DC580E4014616B53A39855954765AFE639C5CA8C5246934113BEF78D59BD48A708D17A228FA0ACB7D6C7F0427F135634FBD92F1A4DEAAA1718C57AB4B1F84A95553A6EF27E473CA9548C6EF623D64E2D507ABD70B21C7987EA6BB5D79BF7318FF0078FE95C25CB6CB499B38C21FE55E066AF9B1925E8766195E115DCE258E5D8FA9A43D28A2BA0FB33DAF4D7F334AB493FBD0A1FD055AAF1EB1F116ABA7055B7BB7F2D7A237CCBF9574567F10E75C2DE59A3FFB519C1FCABD9A78FA4D252D0F93C464D888C9B859A3BF3C8C1E47A1AADFD8BA65DDCAB4F6303B6739D98AC8B2F19E8D778569DADDCF694607E75D1594B1CEEAF0C89221FE24604575A953AAB4B33CD9D3AF877EF271FC0B905A5B5AAEDB7823887FB0A054D54AF757D3B4F07ED5791467FBA5B27F2EB5CEDE7C40B08B22D609673D89F94544EBD1A5A49A4553C2E22BEB18B7FD773AFAE13E2349FF001E117FBCDFCAB32F7C77AADCE44022B65FF6464FE66B9EBABCB9BD97CCBA9DE67F5739C579B8BC753A94DD38753DACBF2BAB46AAAB51AD3A14AE7FD4FE34DD2A3F3757B38F19DD320FD68BBFF56BF5AB7E178FCDF1469A98FF0096E0FE55C1455E49799EED5972D293F267B9D14515F507E7E1451450014514500145145001593E245DDA349C74606B5AB3F5B4DFA3DC0F45CD736315F0F35E4CBA7F1A38684069E352320B006BA29743B47CECDD19F635CE46DB2447C676906BA58B5BB393862D19FF006857CFE57F5671946BDBA5AE75D7E7BA7133A6D06E13989D641E87835B7648D159428E30CAB822A48E58E65CC722B8F634FAF730D82A3424EA52EBF71CB3A9292B48C0BBFF0090EB7FB9FD2A600B1C0049F6150DDFFC875BFDCFE95D3E98AA2C6360A327A9C57CE3C17D6F1D5217B5AEFF0013B555F67493B18F169F752F48881EADC56BE9F64D66AFBD8316C74ED576A096F2DE1FBF2A83E80E6BDAC3E5B86C1C95572D5756CE69D79D55CB6323C44C42803B464D71B71119AD2E1075F298FE42BA7D72E96E15DE3276840BC8F7ACCD1ED85E5EB4078DF13807D3231FD6BC3AAE35F1CDC5DD392FD0ECA6DD3826FA1E65DA8AEA2F7C01AE5A0263852E547789B9FC8D73B736971672797730490B0ECEA4576CE94E1F12B1F574B114AAFF000E4990D1451506C1566CAE278261E4CD2479E0EC6233F9556A921204AA49C0A3D04D26ACCBE4924924927A927268A89AE235EF9FA544D767F857F3AC795B26C5AA6B3AAF5602A934D23756FCAA3EF54A03E527B8955F017B56DF81A2F37C5D67FEC6E6FD2A858F87F56D4B06D6C66753FC45768FCCD777E0FF00075FE8DAA0BFBD7886232A235393935DB85A13738BB6973831F8AA30A138732BB4F43BBA28A2BDF3E2C28A28A0028A28A0028A28A002AAEA2BBF4DB851FF003CCD5AA8E75DD6F22FAA9A8A8B9A0D790E2ECCF37ED452B02AECA7A8241A4AF813D5155990E518A9F507157A2D62F62C0320703B38CD50A2B5A75EA5277849A138C65BA3412E5AEF53F399429298C0ADB8B539A1B75863551B7B9E6B9DB0FF008FB1FEE9AD5ACDE2AB42A3A91959BDD94A9C5C6CD13CB777137DF9588F4CE05414D7911065DC2FD4D40D7D02E704B1F61584A552A3BC9B6CB49474417CD8B561EA40A9FC2A80EA5237F762FEB5997178674D9B02AE73D79ADBF092FCF72F8EC066BD1CAE1FED304FB98577EE33A8A8A7B682EA331DC431CA87F85D41152D15F6C79A9B5AA398BEF00E85784B240F6CE7BC2D81F957377DF0C6E5016B1BE49476595769FCEBD2E8AE79E168CF7476D2CCB154B69DFD753C36FF00C2FAD69C4F9F612951FC718DC3F4AC96054E18153E8462BE88AA973A569F7841B8B282520E4168C135C93CB97D991E9D2CFA4B4A90FB8F07B7B4B9BA7096F6F2CAC7B22135D15878075CBCDA64852D90F795B9FC857AEC504502ED86248D7D1140A92AA197417C4EE67573DAB2D29C52FC4E0ECBE1959A60DEDECB29EEB18DA2BA5B0F0C68DA6E0DBD845BC7F1B8DCDF99AD7A2BAE187A50F862799571B88ABF1CD874181C0A28A2B639428A28A0028A28A0028A28A0028A28A0028A28A00A973A6595D8FDF5BA13EA060D655C785606C9B799A33D83722BA0A2B96AE0B0F57E38A2E35271D99C45CF87B50B7C958C4ABEA87FA56649149136D91190FA30C57A5531E28E518911587B8CD79B5723A6F5A72B7AEA6F1C4BEA8F3A86530C81D402471834F7BC9E4E37E3D9462BB29B40D3A56DC60DA7FD938AB3069B676C008ADD07BE326B8A392D494DA725A1A3C4A4B4470F069B7B76DFBAB776CFF11181F99AD6B7F0A4EFCDC4EB18F45E4D759457A34B25A11D66DCBF03196264F6D0C983C39A7C241643291FDF3C7E55A71C51C4BB634541E8A314FA2BD2A587A54BF87148C65394B761451456C48514514005145140051451400514514005145140051451401FFFD9, N'Responsable Monotributo', N'C:\Sistema de ventass DB\backup.bak')
SET IDENTITY_INSERT [dbo].[config_empresa] OFF
SET IDENTITY_INSERT [dbo].[cuentas] ON 

INSERT [dbo].[cuentas] ([idusuario], [usuario], [password], [nombre], [Turno], [SA], [activo]) VALUES (1, N'CRIS', N'A', N'CRISTIAN RAMIREZ', N'MAÑANA ', 1, 1)
INSERT [dbo].[cuentas] ([idusuario], [usuario], [password], [nombre], [Turno], [SA], [activo]) VALUES (2, N'LEO', N'B', N'LEONEL RAMIREZ', N'TARDE', 1, 1)
SET IDENTITY_INSERT [dbo].[cuentas] OFF
SET IDENTITY_INSERT [dbo].[detalle_movstock] ON 

INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (37, 33, 8, 50.0000, 10.0000)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (38, 34, 10, 25.0000, 10.0000)
INSERT [dbo].[detalle_movstock] ([iddetalle_movstock], [idmov_stock], [idarticulo], [precio], [cantidad]) VALUES (39, 35, 1152, 10.0000, 10.0000)
SET IDENTITY_INSERT [dbo].[detalle_movstock] OFF
SET IDENTITY_INSERT [dbo].[detalle_venta] ON 

INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1059, 1060, 2.0000, 210.0000, 0.0000, 2174, 350.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1060, 1061, 1.0000, 210.0000, 0.0000, 2174, 150.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1061, 1062, 1.0000, 210.0000, 0.0000, 2174, 300.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1062, 1063, 1.0000, 210.0000, 0.0000, 2174, 300.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1063, 1064, 1.0000, 210.0000, 0.0000, 2174, 301.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1064, 1065, 1.0000, 210.0000, 0.0000, 2174, 300.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1065, 1066, 0.0000, 210.0000, 0.0000, 2174, 300.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1066, 1067, 32.0000, 27.0000, 0.0000, 12, 300.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1067, 1068, 32.0000, 210.0000, 0.0000, 2174, 210.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1068, 1069, 32.4200, 30.0000, 0.0000, 10, 314.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1069, 1070, 32.4200, 210.0000, 0.0000, 2174, 3.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1070, 1071, 32.4200, 23.0000, 0.0000, 23, 23.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1071, 1071, 32.4200, 210.0000, 0.0000, 2174, 250.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1072, 1072, 32.4200, 23.0000, 0.0000, 23, 23.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1073, 1072, 32.4200, 70.0000, 0.0000, 1, 70.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1074, 1073, 1.3000, 210.0000, 0.0000, 2174, 200.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1075, 1073, 1.3000, 25.0000, 0.0000, 21, 375.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1076, 1074, 1.3000, 23.0000, 0.0000, 23, 23.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1077, 1076, 1.0000, 23.0000, 0.0000, 23, 23.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1078, 1076, 1.4290, 210.0000, 0.0000, 2174, 300.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1079, 1077, 0.1430, 210.0000, 0.0000, 2174, 30.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1080, 1078, 1.4290, 210.0000, 0.0000, 2174, 300.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1081, 1078, 200.0000, 23.0000, 0.0000, 23, 4600.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1082, 1079, 0.9090, 220.0000, 0.0000, 2174, 200.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1083, 1079, 20.0000, 25.0000, 0.0000, 21, 500.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1084, 1080, 10.0000, 25.0000, 0.0000, 21, 250.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1085, 1081, 13.6360, 220.0000, 0.0000, 2174, 3000.0000)
INSERT [dbo].[detalle_venta] ([iddetalle_venta], [idventa], [cantidad], [precio], [descuento], [id_articulo], [importe]) VALUES (1086, 1082, 1.0000, 23.0000, 0.0000, 23, 23.0000)
SET IDENTITY_INSERT [dbo].[detalle_venta] OFF
SET IDENTITY_INSERT [dbo].[fondo_mov_caja] ON 

INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (25, 4110107, 238.0000, 0.0000, CAST(N'2019-04-16 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (27, 4110107, 25.0000, 0.0000, CAST(N'2019-04-25 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (28, 4110107, 50.0000, 0.0000, CAST(N'2019-04-25 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (29, 4110107, 2299977.0000, 0.0000, CAST(N'2019-04-26 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (30, 4110107, 230.0000, 0.0000, CAST(N'2019-04-26 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (31, 4110107, 230.0000, 0.0000, CAST(N'2019-04-26 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (32, 9100004, 0.0000, 100.3400, CAST(N'2019-02-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'SOBRANTE DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (33, 9100002, 0.0000, 0.0000, CAST(N'2019-02-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'CIERRE DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (34, 9100004, 0.0000, 200.6801, CAST(N'2019-02-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'SOBRANTE DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (35, 9100002, 0.0000, 0.0000, CAST(N'2019-02-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'CIERRE DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (36, 9100001, 1000.0000, 0.0000, CAST(N'2019-04-28 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'APERTURA DE CAJA', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (37, 4110107, 346.0000, 0.0000, CAST(N'2019-04-28 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (38, 4110107, 675.0000, 0.0000, CAST(N'2019-04-28 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (39, 4110107, 347.3000, 0.0000, CAST(N'2019-04-30 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (40, 4110107, 233.4500, 0.0000, CAST(N'2019-04-30 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (41, 4110107, 180.0000, 0.0000, CAST(N'2019-04-30 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (42, 4110107, 323.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (43, 4110107, 300.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (44, 4110107, 730.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (45, 4110107, 300.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (47, 4110107, 50.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1042, 4110107, 40.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1044, 4110107, 350.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1045, 4110107, 150.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1046, 4110107, 300.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1047, 4110107, 300.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1048, 4110107, 301.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1050, 4110107, 300.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1051, 4110107, 300.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1052, 4110107, 210.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1054, 4110107, 3.0000, 0.0000, CAST(N'2019-05-03 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1055, 4110107, 273.0000, 0.0000, CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1058, 4110107, 23.0000, 0.0000, CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1059, 4110107, 323.0000, 0.0000, CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1060, 4110107, 30.0000, 0.0000, CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1065, 4110107, 3000.0000, 0.0000, CAST(N'2019-05-05 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1066, 4110107, 23.0000, 0.0000, CAST(N'2019-05-17 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
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
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1043, 4110107, 300.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1049, 4110107, 300.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (46, 4110107, 373.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1053, 4110107, 314.0000, 0.0000, CAST(N'2019-05-02 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1056, 4110107, 93.0000, 0.0000, CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1057, 4110107, 575.0000, 0.0000, CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1061, 4110107, 4900.0000, 0.0000, CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1062, 4110107, 700.0000, 0.0000, CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
INSERT [dbo].[fondo_mov_caja] ([Cod_mov], [Cod_cuenta], [Ingreso], [Egreso], [Fecha], [Usuario], [Idusuario], [Turno], [Concepto], [Comprobante], [Estado], [Idcierre]) VALUES (1063, 4110107, 250.0000, 0.0000, CAST(N'2019-05-04 00:00:00.000' AS DateTime), N'usuario', 1, N'mañana', N'Venta nro : 0', 0, 1, NULL)
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
SET IDENTITY_INSERT [dbo].[forma_pago] ON 

INSERT [dbo].[forma_pago] ([cod_forma_pago], [nombre]) VALUES (1, N'Efectivo')
INSERT [dbo].[forma_pago] ([cod_forma_pago], [nombre]) VALUES (2, N'Cheque')
INSERT [dbo].[forma_pago] ([cod_forma_pago], [nombre]) VALUES (3, N'Transferencia Electrónico de fondos')
INSERT [dbo].[forma_pago] ([cod_forma_pago], [nombre]) VALUES (4, N'Tarjeta de crédito')
INSERT [dbo].[forma_pago] ([cod_forma_pago], [nombre]) VALUES (5, N'Monedero electrónico')
INSERT [dbo].[forma_pago] ([cod_forma_pago], [nombre]) VALUES (6, N'Dinero electrónico')
INSERT [dbo].[forma_pago] ([cod_forma_pago], [nombre]) VALUES (7, N'Vales de despensa')
INSERT [dbo].[forma_pago] ([cod_forma_pago], [nombre]) VALUES (8, N'Tarjeta de débito')
INSERT [dbo].[forma_pago] ([cod_forma_pago], [nombre]) VALUES (9, N'Tarjeta de servicio')
INSERT [dbo].[forma_pago] ([cod_forma_pago], [nombre]) VALUES (10, N'Otros')
SET IDENTITY_INSERT [dbo].[forma_pago] OFF
SET IDENTITY_INSERT [dbo].[mov_stock] ON 

INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (33, 0, CAST(N'2019-05-03' AS Date), N'', N'0', N'0', CAST(0.00 AS Decimal(4, 2)), N'EMITIDO', N'INGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (34, 0, CAST(N'2019-05-03' AS Date), N'', N'0', N'0', CAST(0.00 AS Decimal(4, 2)), N'EMITIDO', N'INGRESO')
INSERT [dbo].[mov_stock] ([idmov_stock], [idproveedor], [fecha], [tipo_comprobante], [serie], [correlativa], [iva], [estado], [movimiento]) VALUES (35, 0, CAST(N'2019-05-04' AS Date), N'', N'0', N'0', CAST(0.00 AS Decimal(4, 2)), N'EMITIDO', N'INGRESO')
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

INSERT [dbo].[proveedor] ([idproveedor], [razon_social], [cuit], [direccion], [telefono], [email], [num_documento], [activo]) VALUES (0, N'Desconocido', 0, N'', 0, N'', N'0', 1)
INSERT [dbo].[proveedor] ([idproveedor], [razon_social], [cuit], [direccion], [telefono], [email], [num_documento], [activo]) VALUES (1, N'milkaut', 678687, N'micasa', 768, N'kjhjk', N'45646', 1)
INSERT [dbo].[proveedor] ([idproveedor], [razon_social], [cuit], [direccion], [telefono], [email], [num_documento], [activo]) VALUES (8, N'ramon', 132, N'nicolas acosta n 750', 321231, N'ramon@gmail.com', N'123', 1)
SET IDENTITY_INSERT [dbo].[proveedor] OFF
SET IDENTITY_INSERT [dbo].[tarjeta] ON 

INSERT [dbo].[tarjeta] ([cod_tarjeta], [cod_forma_pago], [nombre]) VALUES (12, 4, N'Tarjeta TUYA Debito')
INSERT [dbo].[tarjeta] ([cod_tarjeta], [cod_forma_pago], [nombre]) VALUES (13, 8, N'Tarjeta MasterCard Credito')
INSERT [dbo].[tarjeta] ([cod_tarjeta], [cod_forma_pago], [nombre]) VALUES (14, 4, N'Tarjeta MasterCard Debito')
INSERT [dbo].[tarjeta] ([cod_tarjeta], [cod_forma_pago], [nombre]) VALUES (15, 4, N'Tarjeta Cabal Debito')
INSERT [dbo].[tarjeta] ([cod_tarjeta], [cod_forma_pago], [nombre]) VALUES (16, 8, N'Tarjeta Cabal Credito')
INSERT [dbo].[tarjeta] ([cod_tarjeta], [cod_forma_pago], [nombre]) VALUES (17, 8, N'Tarjeta TUYA Credito')
SET IDENTITY_INSERT [dbo].[tarjeta] OFF
SET IDENTITY_INSERT [dbo].[unidades] ON 

INSERT [dbo].[unidades] ([idunidad], [nombre]) VALUES (1, N'LTS')
SET IDENTITY_INSERT [dbo].[unidades] OFF
SET IDENTITY_INSERT [dbo].[venta] ON 

INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1060, 1, CAST(N'2019-05-02' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1061, 1, CAST(N'2019-05-02' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1062, 1, CAST(N'2019-05-02' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1063, 1, CAST(N'2019-05-02' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1064, 1, CAST(N'2019-05-02' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1065, 1, CAST(N'2019-05-02' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1066, 1, CAST(N'2019-05-02' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1067, 1, CAST(N'2019-05-02' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1068, 1, CAST(N'2019-05-02' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1069, 1, CAST(N'2019-05-02' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1070, 1, CAST(N'2019-05-03' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1071, 1, CAST(N'2019-05-04' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1072, 1, CAST(N'2019-05-04' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1073, 1, CAST(N'2019-05-04' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1074, 1, CAST(N'2019-05-04' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1076, 1, CAST(N'2019-05-04' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1077, 1, CAST(N'2019-05-04' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1078, 1, CAST(N'2019-05-04' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1079, 1, CAST(N'2019-05-04' AS Date), N'V', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1080, 1, CAST(N'2019-05-04' AS Date), N'NOTA DE VENTA', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1081, 1, CAST(N'2019-05-05' AS Date), N'FACTURA', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
INSERT [dbo].[venta] ([idventa], [idcliente], [fecha], [tipo_comprobante], [IVA], [estado], [categoria]) VALUES (1082, 1, CAST(N'2019-05-17' AS Date), N'NOTA DE VENTA', CAST(21.00 AS Decimal(4, 2)), N'P', NULL)
SET IDENTITY_INSERT [dbo].[venta] OFF
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD  CONSTRAINT [FK_ingreso_proveedor] FOREIGN KEY([idproveedor])
REFERENCES [dbo].[proveedor] ([idproveedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ingreso] CHECK CONSTRAINT [FK_ingreso_proveedor]
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD  CONSTRAINT [FK_sucursal_config_empresa] FOREIGN KEY([cod_empresa])
REFERENCES [dbo].[config_empresa] ([cod_empresa])
GO
ALTER TABLE [dbo].[sucursal] CHECK CONSTRAINT [FK_sucursal_config_empresa]
GO
ALTER TABLE [dbo].[tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_tarjeta_forma_pago] FOREIGN KEY([cod_forma_pago])
REFERENCES [dbo].[forma_pago] ([cod_forma_pago])
GO
ALTER TABLE [dbo].[tarjeta] CHECK CONSTRAINT [FK_tarjeta_forma_pago]
GO
ALTER TABLE [dbo].[venta_forma_pago]  WITH CHECK ADD  CONSTRAINT [FK_venta_forma_pago_forma_pago] FOREIGN KEY([cod_forma_pago])
REFERENCES [dbo].[forma_pago] ([cod_forma_pago])
GO
ALTER TABLE [dbo].[venta_forma_pago] CHECK CONSTRAINT [FK_venta_forma_pago_forma_pago]
GO
ALTER TABLE [dbo].[venta_forma_pago]  WITH CHECK ADD  CONSTRAINT [FK_venta_forma_pago_venta] FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
GO
ALTER TABLE [dbo].[venta_forma_pago] CHECK CONSTRAINT [FK_venta_forma_pago_venta]
GO
/****** Object:  StoredProcedure [dbo].[SP_ARTICULO]    Script Date: 17/05/2019 19:09:39 ******/
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
dbo.categoria.nombre AS Categoria,stock_actual,utilidad,precio_compra,precio
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
else IF @modo=12
--MOSTRAR solo los pesables
BEGIN 
SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
dbo.articulo.descripcion, dbo.articulo.idcategoria, 
dbo.categoria.nombre AS Categoria,stock_actual,utilidad,precio_Compra,precio
FROM dbo.articulo 
INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
where estado=1 and pesable=1
END

else IF @modo=13
--MOSTRAR solo los pesables
BEGIN 
if @buscarTexto='nombre'
	begin
		SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
		dbo.articulo.descripcion, dbo.articulo.idcategoria, 
		dbo.categoria.nombre AS Categoria,stock_actual,utilidad,precio_Compra,precio
		FROM dbo.articulo 
		INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
		where estado=1 and pesable=1 and articulo.nombre like  '%'+ @nombre+ '%'
	end
	else if @buscarTexto='idarticulo'
	begin
		SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
		dbo.articulo.descripcion, dbo.articulo.idcategoria, 
		dbo.categoria.nombre AS Categoria,stock_actual,utilidad,precio_Compra,precio
		FROM dbo.articulo 
		INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
		where estado=1 and pesable=1 and dbo.articulo.idarticulo  like @idarticulo+ '%'
	end
	else if @buscarTexto='codigo'
	begin
		SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
		dbo.articulo.descripcion, dbo.articulo.idcategoria, 
		dbo.categoria.nombre AS Categoria,stock_actual,utilidad,precio_Compra,precio
		FROM dbo.articulo 
		INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
		where estado=1 and pesable=1 and articulo.idarticulo like  '%'+ @codigo+ '%'
	end
	else if @buscarTexto='categoria'
	begin
		SELECT dbo.articulo.idarticulo, dbo.articulo.codigo, dbo.articulo.nombre, 
		dbo.articulo.descripcion, dbo.articulo.idcategoria, 
		dbo.categoria.nombre AS Categoria,stock_actual,utilidad,precio_Compra,precio
		FROM dbo.articulo 
		INNER JOIN dbo.categoria ON dbo.articulo.idcategoria = dbo.categoria.idcategoria
		where estado=1 and pesable=1 and categoria.nombre like  '%'+ @nombre+ '%'
	end
END


--select  IDENT_CURRENT('articulo')+1 (obtiene el ultimo valor del idarticulo)

select * from articulo


--REGISTRO QUE TIENEN QUE ESTAR 
--INSERT INTO articulo(codigo,nombre,idcategoria,precio,precio_Compra,utilidad,estado,pesable) values('','ARTICULOS VARIOS',1,0.00,0.00,0,0,1)
GO
/****** Object:  StoredProcedure [dbo].[SP_BACKUP]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_BACKUP]
@path varchar(100)= null,
@row int =null
as
BACKUP DATABASE [db_ventas] TO  DISK = @path
WITH NOFORMAT, NOINIT,  NAME = N' Base de datos Copia de seguridad', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;


if(exists(select * from config_empresa))
begin
update config_empresa set path_backup=@path;
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CAJA]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CATEGORIA]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CLIENTE]    Script Date: 17/05/2019 19:09:39 ******/
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
insert into cliente(razon_social,fecha_nacimiento,cuit,direccion,telefono,email,num_documento,activo)
values (@razon_Social,@fecha_nacimiento,@cuit,@direccion,@telefono,@email,@num_documento,1)
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
--ELIMINAR "DESACTIVAR"
BEGIN 
 UPDATE cliente SET activo=0 where idcliente= @idcliente
END

else IF @modo=4
--BUSCAR TEXTO
BEGIN
SELECT * FROM cliente
WHERE cliente.razon_social like '%' +@buscarTexto+ '%' and activo=1
END

else IF @modo=5
--MOSTRAR
BEGIN 
SELECT idcliente,cliente.razon_social,fecha_nacimiento,cuit,direccion,telefono,email,num_documento FROM cliente where activo=1
END
else IF @modo=6
--BUSCAR TEXTO
BEGIN
SELECT * FROM cliente
WHERE cliente.idcliente like @buscarTexto + '%'  and activo=1
END
--cambiarnombre en una columna
--sp_rename 'proveedor.razon_Social', 'proveedor.razon_social';

GO
/****** Object:  StoredProcedure [dbo].[SP_CONFIG_EMPRESA]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CONFIG_EMPRESA]


@razon_social varchar(50) =null,
@cuit bigint =null,
@logo image =null,
@cod_empresa int output,
@condicion_frente_iva varchar(100)=null ,
@MODO int =null	
as
IF @MODO=1
--MOSTRAR	
select top 1 cod_empresa,razon_social,cuit,logo,condicion_frente_iva,path_backup 
from config_empresa
IF @MODO=2
--Modificar	
update config_empresa set razon_social=@razon_social,cuit=@cuit,
logo=@logo,condicion_frente_iva=@condicion_frente_iva
IF @MODO=3
--Agregar	
insert into config_empresa(razon_social,cuit,condicion_frente_iva,logo) 
values(@razon_social,@cuit,@condicion_frente_iva,@logo)

--delete from config_empresa
GO
/****** Object:  StoredProcedure [dbo].[SP_CUENTA]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--

-- =============================================
CREATE PROCEDURE [dbo].[SP_CUENTA]
@MODO int =null,
@idcuenta int= null,
@nombre varchar(50)=null,
@password varchar(50)=null,
@SA bit=null,
@Turno nvarchar(50)=null,
@usuario varchar(50)=null
AS 
if @modo=1
begin
--mostrar
select * from cuenta where activo=1
end
else if @modo=2
begin 
--insertar
insert into cuentas  (nombre,password,SA,Turno,usuario,activo) values(@nombre,@password,@SA,@Turno,@usuario,1)
end

GO
/****** Object:  StoredProcedure [dbo].[SP_DETALLEMOVSTOCK]    Script Date: 17/05/2019 19:09:39 ******/
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
@cantidad decimal =null
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
--select * from articulo where idarticulo=2174
--update articulo set stock_actual=100.30 where idarticulo=2174
GO
/****** Object:  StoredProcedure [dbo].[SP_DETALLEVENTA]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_DETALLEVENTA]
	@iddetalle_venta int=null output,
	@idventa int=NULL, 
	@cantidad money=NULL,
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
       d.cantidad, d.descuento,d.precio,d.importe  
	   from detalle_venta d 
	   inner join articulo a on d.Id_Articulo = a.idarticulo 
	   where d.idventa =@textobuscar


END



GO
/****** Object:  StoredProcedure [dbo].[SP_FORMA_PAGO]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE  [dbo].[SP_FORMA_PAGO] 
	@cod_forma_pago int =null,
	@modo int =null,
	@nombre varchar(50)=null
	

AS
if @modo=1
BEGIN
--MOSTRAR FORMA DE PAGOS EXCEPTO EFECTIVO
	SELECT * FROM forma_pago 
END
else if @modo=2
BEGIN
--INSERTAR
INSERT INTO forma_pago(nombre) VALUES (@nombre)

END

--INSERT INTO forma_pago(nombre) VALUES ('Efectivo')
GO
/****** Object:  StoredProcedure [dbo].[SP_INGRESO]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_MOVSTOCK]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_PROVEEDOR]    Script Date: 17/05/2019 19:09:39 ******/
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
--ELIMINAR "DESACTIVAR"
--valor desconocido IMPORTANTE Tiene que estar este registro en el caso de que el usuario no especifique uno
--INSERT INTO proveedor (razon_social,cuit,direccion,email,num_documento,telefono,activo)
--Values('Desconocido',0,'','',0,0,1)
BEGIN 

 update proveedor set activo='0' where idproveedor= @idproveedor and idproveedor!=0
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
SELECT * FROM proveedor where activo=1
END

--cambiarnombre en una columna
--sp_rename 'proveedor.razon_Social', 'proveedor.razon_social';

--IMPORTANTE: Proveedor por Defecto
--insert into proveedor(razon_Social,cuit,num_documento,telefono)values('Desconocido',0,0,0)
GO
/****** Object:  StoredProcedure [dbo].[SP_TARJETA]    Script Date: 17/05/2019 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_TARJETA]
@cod_forma_pago int =null,
@modo int =null,
@nombre varchar(100) =null,
@cod_tarjeta int out 
as 

if @modo=1
--Agregar
begin 
insert into tarjeta(nombre,cod_forma_pago) values(@nombre,@cod_forma_pago)
end

else if @modo=2
--mostrar
begin
  select t.cod_tarjeta,t.cod_forma_pago,t.nombre,fp.nombre as [Forma_pago] from tarjeta t
  inner join forma_pago fp on fp.cod_forma_pago=t.cod_forma_pago
end


GO
/****** Object:  StoredProcedure [dbo].[SP_UNIDADES]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_USUARIO]    Script Date: 17/05/2019 19:09:39 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_VENTA]    Script Date: 17/05/2019 19:09:39 ******/
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
	@iva decimal(4,2)=null,
@precio money =null,
@stockActual int =null,
@textobuscar varchar (50)=null,
	@textobuscar2 varchar (50)=null,
	@estado varchar(5)=null,
	@categoria	varchar(20)=null


AS
IF @modo=1
--INSERTAR
--P DE PENDIENTE
BEGIN

	

     insert into venta (idcliente,fecha,tipo_comprobante,IVA,estado )
values 
     (@idcliente,@fecha,@tipo_comprobante,@iva,'P'   )
set @idventa = @@IDENTITY 

END



ELSE IF @modo=2
--Buscar
begin 


	select  v.idventa,
	c.razon_social ,
	v.fecha,v.tipo_comprobante,v.categoria,v.estado,
	 SUM(d.precio*d.cantidad) 
AS [total]
from detalle_venta d 
	inner join venta v on d.idventa = v.idventa 
	inner join cliente c on v.idcliente = c.idcliente 
where 
    v.fecha >= @textobuscar and v.fecha <= @textobuscar2 
group by  v.idventa,c.razon_social,v.fecha,v.tipo_comprobante,
    v.estado,v.categoria

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
	v.fecha,v.tipo_comprobante,v.categoria,v.estado,
 SUM(d.precio*d.cantidad) 
AS [total]
from detalle_venta d 
	inner join venta v on d.idventa = v.idventa 
	inner join cliente c on v.idcliente = c.idcliente 
	group by v.idventa,c.razon_social,v.fecha,v.tipo_comprobante,
v.estado,v.categoria
order by v.idventa desc
END 

ElSE IF @modo=5
--NOTA DE VENTA
BEGIN
select v.idventa,
	c.razon_social ,
	v.fecha,v.tipo_comprobante,v.categoria,d.id_articulo,a.nombre,d.cantidad,d.precio, d.importe
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
ElSE IF @modo=7
--ranking de los 5 productos mas vendidos
BEGIN

select top 5 a.idarticulo ,a.nombre,
      sum(d.cantidad) as Cantidad
	   from detalle_venta d 
	   inner join articulo a on d.Id_Articulo = a.idarticulo 
	   group by a.idarticulo,a.nombre
	   order by Cantidad desc


END

GO
/****** Object:  StoredProcedure [dbo].[SPREINICIAR_INDICE]    Script Date: 17/05/2019 19:09:39 ******/
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
