USE [master]
GO
/****** Object:  Database [db_ventas]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  User [ventas]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[articulo]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[categoria]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[cliente]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[Confequipo]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[cuentas]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[detalle_movstock]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[fondo_cierre]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[fondo_mov_caja]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[fondo_tipomov]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[ingreso]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[mov_stock]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[plancuenta]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[proveedor]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[unidades]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  Table [dbo].[venta]    Script Date: 17/04/2019 19:32:51 ******/
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
	[IVA] [decimal](4, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD  CONSTRAINT [FK_ingreso_proveedor] FOREIGN KEY([idproveedor])
REFERENCES [dbo].[proveedor] ([idproveedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ingreso] CHECK CONSTRAINT [FK_ingreso_proveedor]
GO
/****** Object:  StoredProcedure [dbo].[SP_ARTICULO]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CAJA]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CATEGORIA]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_CLIENTE]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DETALLEMOVSTOCK]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DETALLEVENTA]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_INGRESO]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_MOVSTOCK]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_PROVEEDOR]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_UNIDADES]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_USUARIO]    Script Date: 17/04/2019 19:32:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_VENTA]    Script Date: 17/04/2019 19:32:51 ******/
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
	@textobuscar2 varchar (50)=null
		


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
	v.fecha,v.tipo_comprobante, v.serie, v.correlativo,
	d.importe
from detalle_venta d 
	inner join venta v on d.idventa = v.idventa 
	inner join cliente c on v.idcliente = c.idcliente 
where 
    v.fecha >= @textobuscar and v.fecha <= @textobuscar2 

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
	v.fecha,v.tipo_comprobante, v.serie, v.correlativo,
 SUM(d.precio*d.cantidad) 
AS [TOTAL]
from detalle_venta d 
	inner join venta v on d.idventa = v.idventa 
	inner join cliente c on v.idcliente = c.idcliente 
	group by v.idventa,c.razon_social,v.fecha,v.tipo_comprobante,v.serie,v.correlativo
,d.importe
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
GO
/****** Object:  StoredProcedure [dbo].[SPREINICIAR_INDICE]    Script Date: 17/04/2019 19:32:51 ******/
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
