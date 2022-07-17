Create Database [albatros];

USE [albatros]
GO
/****** Object:  Table [dbo].[tbl_clientes]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[codigoCliente] [varchar](40) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[RTN] [varchar](50) NOT NULL,
	[direccion] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[codigoCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_detail]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_detail](
	[idDetail] [int] IDENTITY(1,1) NOT NULL,
	[idNumFactura] [int] NULL,
	[idItem] [int] NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](13, 2) NOT NULL,
	[idImpuesto] [int] NULL,
	[totalProductos] [decimal](13, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_header]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_header](
	[idNumFactura] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[fechaFactura] [datetime] NOT NULL,
	[totalImpuesto] [decimal](13, 2) NOT NULL,
	[TotalFactura] [decimal](13, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idNumFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_impuestos]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_impuestos](
	[idImpuesto] [int] IDENTITY(1,1) NOT NULL,
	[tipoImpuesto] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idImpuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_productos]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_productos](
	[idItem] [int] IDENTITY(1,1) NOT NULL,
	[codigoProducto] [varchar](40) NOT NULL,
	[descripcion] [varchar](80) NOT NULL,
	[precioProducto] [decimal](13, 2) NOT NULL,
	[idImpuesto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[codigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_detail]  WITH CHECK ADD  CONSTRAINT [FK_impuestosFactura] FOREIGN KEY([idImpuesto])
REFERENCES [dbo].[tbl_impuestos] ([idImpuesto])
GO
ALTER TABLE [dbo].[tbl_detail] CHECK CONSTRAINT [FK_impuestosFactura]
GO
ALTER TABLE [dbo].[tbl_detail]  WITH CHECK ADD  CONSTRAINT [FK_Nfacturas] FOREIGN KEY([idNumFactura])
REFERENCES [dbo].[tbl_header] ([idNumFactura])
GO
ALTER TABLE [dbo].[tbl_detail] CHECK CONSTRAINT [FK_Nfacturas]
GO
ALTER TABLE [dbo].[tbl_detail]  WITH CHECK ADD  CONSTRAINT [FK_productosFact] FOREIGN KEY([idItem])
REFERENCES [dbo].[tbl_productos] ([idItem])
GO
ALTER TABLE [dbo].[tbl_detail] CHECK CONSTRAINT [FK_productosFact]
GO
ALTER TABLE [dbo].[tbl_header]  WITH CHECK ADD  CONSTRAINT [FK_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[tbl_clientes] ([idCliente])
GO
ALTER TABLE [dbo].[tbl_header] CHECK CONSTRAINT [FK_Clientes]
GO
ALTER TABLE [dbo].[tbl_productos]  WITH CHECK ADD  CONSTRAINT [FK_impuesto] FOREIGN KEY([idImpuesto])
REFERENCES [dbo].[tbl_impuestos] ([idImpuesto])
GO
ALTER TABLE [dbo].[tbl_productos] CHECK CONSTRAINT [FK_impuesto]
GO
/****** Object:  StoredProcedure [dbo].[usp_deletecliente]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_deletecliente]
	-- Add the parameters for the stored procedure here
	@idCliente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete  tbl_clientes 
	where idCliente = @idCliente
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deletedetail]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_deletedetail]
	-- Add the parameters for the stored procedure here
	@idDetail int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete  tbl_detail 
	where idDetail = @idDetail;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteheader]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_deleteheader]
	-- Add the parameters for the stored procedure here
	@idNumFactura int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from tbl_header
	where idNumFactura = @idNumFactura;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteimpuesto]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_deleteimpuesto]
	-- Add the parameters for the stored procedure here
	@idImpuesto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from tbl_impuestos
	where idImpuesto = @idImpuesto;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteproducto]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_deleteproducto]
	-- Add the parameters for the stored procedure here
	@iditem int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from tbl_productos where idItem = @iditem
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getclientes]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_getclientes]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tbl_clientes;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getdetail]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_getdetail]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tbl_detail;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getimpuestos]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_getimpuestos]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tbl_impuestos;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getproductos]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_getproductos]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tbl_productos;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getreporte1]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[usp_getreporte1]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select h.fechaFactura,h.idNumFactura, c.nombre, h.totalImpuesto from tbl_header h
	inner join tbl_clientes c on h.idCliente = c.idCliente;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getreporte2]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_getreporte2] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select h.fechaFactura, h.idNumFactura, p.descripcion, d.cantidad, p.precioProducto, d.totalProductos
	from tbl_detail d
	inner join tbl_productos p on d.idItem=p.idItem
	inner join tbl_header h on d.idNumFactura=h.idNumFactura
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insertcliente]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_insertcliente]
	-- Add the parameters for the stored procedure here
	@codigoCliente varchar(40),
	@nombre varchar(80),
	@RTN varchar(80),
	@direccion varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_clientes (codigoCliente, nombre, RTN, direccion)
	values (@codigoCliente, @nombre, @RTN, @direccion)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insertdetail]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_insertdetail]
	-- Add the parameters for the stored procedure here
	@idNumFactura int,
	@idItem int,
	@cantidad int,
	@precio decimal(13,2),
	@idImpuesto int,
	@totalProductos decimal (13,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_detail (idNumFactura, idItem, cantidad, precio, idImpuesto, totalProductos) 
	values(@idNumFactura, @idItem, @cantidad, @precio, @idImpuesto, @totalProductos);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insertheader]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_insertheader]
	-- Add the parameters for the stored procedure here
	@idCliente int,
	@totalimpuesto decimal(13,2),
	@TotalFactura decimal(13,2)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_header (idCliente, fechaFactura, totalImpuesto, TotalFactura)
	values (@idCliente, CURRENT_TIMESTAMP, @totalimpuesto, @TotalFactura);
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insertImpuesto]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_insertImpuesto]
	-- Add the parameters for the stored procedure here
	 @tipoImpuesto varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO tbl_impuestos (tipoImpuesto) VALUES (@tipoImpuesto);

END
GO
/****** Object:  StoredProcedure [dbo].[usp_insertproducto]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_insertproducto]
	-- Add the parameters for the stored procedure here
	@codigoProducto varchar(40),
@descripcion varchar(80),
@precioProducto decimal(13,2),
@idImpuesto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_productos (codigoProducto, descripcion, precioProducto, idImpuesto)
	values (@codigoProducto, @descripcion, @precioProducto, @idImpuesto)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_selectimpuesto]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_selectimpuesto]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tbl_impuestos
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updatecliente]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_updatecliente] 
	-- Add the parameters for the stored procedure here
	@idCliente int,
	@codigoCliente varchar(40),
	@nombre varchar(80),
	@RTN varchar(80),
	@direccion varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tbl_clientes set codigoCliente = @codigoCliente, nombre = @nombre, RTN = @RTN, direccion = @direccion
	where idCliente = @idCliente;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updatedetail]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_updatedetail]
	-- Add the parameters for the stored procedure here
	@idDetail int,
	@idNumFactura int,
	@idItem int,
	@cantidad int,
	@precio decimal(13,2),
	@idImpuesto int,
	@totalProductos decimal (13,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tbl_detail set idNumFactura=@idNumFactura, idItem=@idItem, cantidad=@cantidad, precio=@precio, idImpuesto=@idImpuesto, totalProductos=@totalProductos
	where idDetail=@idDetail;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updateheader]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_updateheader]
	-- Add the parameters for the stored procedure here
	@idNumFactura int,
	@idCliente int,
	@totalimpuesto decimal(13,2),
	@TotalFactura decimal(13,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tbl_header set idCliente = @idCliente, fechaFactura = CURRENT_TIMESTAMP, totalImpuesto = @totalimpuesto, TotalFactura = @TotalFactura
	where idNumFactura = @idNumFactura;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updateimpuesto]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_updateimpuesto]
	-- Add the parameters for the stored procedure here
	 @idImpuesto int,
	 @tipoImpuesto varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tbl_impuestos set tipoImpuesto = @tipoImpuesto 
	where idImpuesto = @idImpuesto;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updateproducto]    Script Date: 7/16/2022 6:31:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_updateproducto]
	-- Add the parameters for the stored procedure here
@iditem int,
@codigoProducto varchar(40),
@descripcion varchar(80),
@precioProducto decimal(13,2),
@idImpuesto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tbl_productos set codigoProducto = @codigoProducto, descripcion = @descripcion, 
	precioProducto = @precioProducto, idImpuesto = @idImpuesto
	where idItem = @iditem; 
END
GO
