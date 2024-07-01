
create database [Ventas];
GO


USE [Ventas];
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 17/06/2024 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[Articulo_Id] [int] IDENTITY(1,1) NOT NULL,
	[Categoria_Id] [int] NOT NULL,
	[Articulo_Codigo] [varchar](50) NULL,
	[Articulo_Nombre] [varchar](100) NOT NULL,
	[Articulo_Precio_Venta] [decimal](11, 2) NOT NULL,
	[Articulo_Stock] [int] NOT NULL,
	[Articulo_Descripcion] [varchar](256) NULL,
	[Articulo_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Articulo_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 17/06/2024 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Categoria_Id] [int] IDENTITY(1,1) NOT NULL,
	[Categoria_Nombre] [varchar](50) NOT NULL,
	[Categoria_Descripcion] [varchar](256) NULL,
	[Categoria_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Categoria_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 17/06/2024 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[Persona_Id] [int] IDENTITY(1,1) NOT NULL,
	[Persona_Rut] [char](12) NULL,
	[Persona_Nombre] [varchar](100) NOT NULL,
	[Persona_Apellidos] [varchar](20) NULL,
	[Persona_Direccion] [varchar](70) NULL,
	[Persona_Telefono] [varchar](20) NULL,
	[Persona_Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Persona_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17/06/2024 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Rol_Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol_Nombre] [varchar](30) NOT NULL,
	[Rol_Descripcion] [varchar](100) NULL,
	[Rol_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Rol_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/06/2024 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Usuario_Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol_Id] [int] NOT NULL,
	[Usuario_Nombre] [varchar](100) NOT NULL,
	[Usuario_Direccion] [varchar](70) NULL,
	[Usuario_Telefono] [varchar](20) NULL,
	[Usuario_Email] [varchar](50) NOT NULL,
	[Usuario_Pass] [varchar](100) NOT NULL,
	[Usuario_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Usuario_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 17/06/2024 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Venta_Id] [int] IDENTITY(1,1) NOT NULL,
	[Persona_Id] [int] NOT NULL,
	[Usuario_Id] [int] NOT NULL,
	[Venta_Tipo_Comprobante] [varchar](20) NOT NULL,
	[Venta_Serie_Comprobante] [varchar](7) NULL,
	[Venta_Fecha_Hora] [datetime] NOT NULL,
	[Venta_Total] [decimal](11, 2) NOT NULL,
	[Venta_Estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Venta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas_Detalle]    Script Date: 17/06/2024 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas_Detalle](
	[Venta_Detalle_Id] [int] IDENTITY(1,1) NOT NULL,
	[Venta_Id] [int] NOT NULL,
	[Articulo_Id] [int] NOT NULL,
	[Ventas_Detalle_Cantidad] [int] NOT NULL,
	[Ventas_Detalle_Precio] [int] NOT NULL,
	[Ventas_Detalle_Descuento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Venta_Detalle_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (1, 1, N'0001', N'Quaker', CAST(1500.00 AS Decimal(11, 2)), 1000, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (2, 1, N'0002', N'Natur', CAST(800.00 AS Decimal(11, 2)), 500, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (3, 2, N'0003', N'Leche', CAST(900.00 AS Decimal(11, 2)), 600, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (4, 9, N'0004', N'Coca Cola 1.5 lt', CAST(300.00 AS Decimal(11, 2)), 1600, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (5, 8, N'0005', N'Fideos Espirales', CAST(500.00 AS Decimal(11, 2)), 900, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (6, 9, N'0006', N'Fideos tallarines', CAST(900.00 AS Decimal(11, 2)), 1000, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (7, 1, N'0007', N'Arroz', CAST(60.00 AS Decimal(11, 2)), 1200, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (8, 5, N'0008', N'Lomo Vetado', CAST(20.00 AS Decimal(11, 2)), 10000, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (9, 5, N'0009', N'Lomo Liso', CAST(30.00 AS Decimal(11, 2)), 9000, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (10, 5, N'0011', N'Sobre Costilla', CAST(15.00 AS Decimal(11, 2)), 8500, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (11, 5, N'0012', N'Asiento', CAST(10.00 AS Decimal(11, 2)), 9500, N'', 1)
GO
INSERT [dbo].[Articulos] ([Articulo_Id], [Categoria_Id], [Articulo_Codigo], [Articulo_Nombre], [Articulo_Precio_Venta], [Articulo_Stock], [Articulo_Descripcion], [Articulo_Estado]) VALUES (12, 5, N'0013', N'Entraña', CAST(5.00 AS Decimal(11, 2)), 25000, N'', 1)
GO
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 
GO
INSERT [dbo].[Categorias] ([Categoria_Id], [Categoria_Nombre], [Categoria_Descripcion], [Categoria_Estado]) VALUES (1, N'Cereales', N'', 1)
GO
INSERT [dbo].[Categorias] ([Categoria_Id], [Categoria_Nombre], [Categoria_Descripcion], [Categoria_Estado]) VALUES (2, N'Lacteos', N'', 1)
GO
INSERT [dbo].[Categorias] ([Categoria_Id], [Categoria_Nombre], [Categoria_Descripcion], [Categoria_Estado]) VALUES (3, N'Frutas', N'', 1)
GO
INSERT [dbo].[Categorias] ([Categoria_Id], [Categoria_Nombre], [Categoria_Descripcion], [Categoria_Estado]) VALUES (4, N'Verduras', N'', 1)
GO
INSERT [dbo].[Categorias] ([Categoria_Id], [Categoria_Nombre], [Categoria_Descripcion], [Categoria_Estado]) VALUES (5, N'Carnes Rojas', N'', 1)
GO
INSERT [dbo].[Categorias] ([Categoria_Id], [Categoria_Nombre], [Categoria_Descripcion], [Categoria_Estado]) VALUES (6, N'Carnes Blancas', N'', 1)
GO
INSERT [dbo].[Categorias] ([Categoria_Id], [Categoria_Nombre], [Categoria_Descripcion], [Categoria_Estado]) VALUES (7, N'Cecinas', N'', 1)
GO
INSERT [dbo].[Categorias] ([Categoria_Id], [Categoria_Nombre], [Categoria_Descripcion], [Categoria_Estado]) VALUES (8, N'Pastas', N'', 1)
GO
INSERT [dbo].[Categorias] ([Categoria_Id], [Categoria_Nombre], [Categoria_Descripcion], [Categoria_Estado]) VALUES (9, N'Bebidas', N'', 1)
GO
INSERT [dbo].[Categorias] ([Categoria_Id], [Categoria_Nombre], [Categoria_Descripcion], [Categoria_Estado]) VALUES (10, N'Bebidas Alcoholicas', N'', 1)
GO
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Personas] ON 
GO
INSERT [dbo].[Personas] ([Persona_Id], [Persona_Rut], [Persona_Nombre], [Persona_Apellidos], [Persona_Direccion], [Persona_Telefono], [Persona_Email]) VALUES (1, N'10.123.854-6', N'Benjamin', N'Perez', N'Av Videla #123', N'58423885', N'APrerez@hotmail.com')
GO
INSERT [dbo].[Personas] ([Persona_Id], [Persona_Rut], [Persona_Nombre], [Persona_Apellidos], [Persona_Direccion], [Persona_Telefono], [Persona_Email]) VALUES (2, N'16.254.528-4', N'Emilia', N'Gonzalez', N'Av Videla #6547', N'65465454', N'EGonzalez@hotmail.com')
GO
SET IDENTITY_INSERT [dbo].[Personas] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Rol_Id], [Rol_Nombre], [Rol_Descripcion], [Rol_Estado]) VALUES (1, N'Administrador', N'', 1)
GO
INSERT [dbo].[Roles] ([Rol_Id], [Rol_Nombre], [Rol_Descripcion], [Rol_Estado]) VALUES (2, N'Usuario', N'', 1)
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([Usuario_Id], [Rol_Id], [Usuario_Nombre], [Usuario_Direccion], [Usuario_Telefono], [Usuario_Email], [Usuario_Pass], [Usuario_Estado]) VALUES (1, 1, N'Pedro Perez', N'Av. el Sauce #123', N'2545245', N'pedro@hola.com', N'1234', 1)
GO
INSERT [dbo].[Usuarios] ([Usuario_Id], [Rol_Id], [Usuario_Nombre], [Usuario_Direccion], [Usuario_Telefono], [Usuario_Email], [Usuario_Pass], [Usuario_Estado]) VALUES (2, 2, N'Juan Perez', N'Av. el Sauce #456', N'2545245', N'juan@hola.com', N'1234', 1)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 
GO
INSERT [dbo].[Ventas] ([Venta_Id], [Persona_Id], [Usuario_Id], [Venta_Tipo_Comprobante], [Venta_Serie_Comprobante], [Venta_Fecha_Hora], [Venta_Total], [Venta_Estado]) VALUES (1, 1, 2, N'Boleta', N'00001', CAST(N'2022-08-01T09:30:00.000' AS DateTime), CAST(5000.00 AS Decimal(11, 2)), N'1')
GO
INSERT [dbo].[Ventas] ([Venta_Id], [Persona_Id], [Usuario_Id], [Venta_Tipo_Comprobante], [Venta_Serie_Comprobante], [Venta_Fecha_Hora], [Venta_Total], [Venta_Estado]) VALUES (2, 2, 2, N'Factura', N'00002', CAST(N'2022-09-01T14:30:00.000' AS DateTime), CAST(1500.00 AS Decimal(11, 2)), N'1')
GO
INSERT [dbo].[Ventas] ([Venta_Id], [Persona_Id], [Usuario_Id], [Venta_Tipo_Comprobante], [Venta_Serie_Comprobante], [Venta_Fecha_Hora], [Venta_Total], [Venta_Estado]) VALUES (3, 2, 1, N'Factura', N'00003', CAST(N'2022-10-01T14:30:00.000' AS DateTime), CAST(1500.00 AS Decimal(11, 2)), N'1')
GO
INSERT [dbo].[Ventas] ([Venta_Id], [Persona_Id], [Usuario_Id], [Venta_Tipo_Comprobante], [Venta_Serie_Comprobante], [Venta_Fecha_Hora], [Venta_Total], [Venta_Estado]) VALUES (4, 2, 1, N'Factura', N'00004', CAST(N'2022-10-01T17:30:00.000' AS DateTime), CAST(1500.00 AS Decimal(11, 2)), N'1')
GO
INSERT [dbo].[Ventas] ([Venta_Id], [Persona_Id], [Usuario_Id], [Venta_Tipo_Comprobante], [Venta_Serie_Comprobante], [Venta_Fecha_Hora], [Venta_Total], [Venta_Estado]) VALUES (5, 2, 1, N'Factura', N'00005', CAST(N'2022-10-01T16:30:00.000' AS DateTime), CAST(1500.00 AS Decimal(11, 2)), N'0')
GO
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas_Detalle] ON 
GO
INSERT [dbo].[Ventas_Detalle] ([Venta_Detalle_Id], [Venta_Id], [Articulo_Id], [Ventas_Detalle_Cantidad], [Ventas_Detalle_Precio], [Ventas_Detalle_Descuento]) VALUES (1, 1, 7, 5, 1000, 0)
GO
INSERT [dbo].[Ventas_Detalle] ([Venta_Detalle_Id], [Venta_Id], [Articulo_Id], [Ventas_Detalle_Cantidad], [Ventas_Detalle_Precio], [Ventas_Detalle_Descuento]) VALUES (2, 2, 8, 5, 1000, 0)
GO
INSERT [dbo].[Ventas_Detalle] ([Venta_Detalle_Id], [Venta_Id], [Articulo_Id], [Ventas_Detalle_Cantidad], [Ventas_Detalle_Precio], [Ventas_Detalle_Descuento]) VALUES (3, 2, 6, 2, 5000, 0)
GO
INSERT [dbo].[Ventas_Detalle] ([Venta_Detalle_Id], [Venta_Id], [Articulo_Id], [Ventas_Detalle_Cantidad], [Ventas_Detalle_Precio], [Ventas_Detalle_Descuento]) VALUES (4, 3, 9, 5, 1000, 0)
GO
INSERT [dbo].[Ventas_Detalle] ([Venta_Detalle_Id], [Venta_Id], [Articulo_Id], [Ventas_Detalle_Cantidad], [Ventas_Detalle_Precio], [Ventas_Detalle_Descuento]) VALUES (5, 3, 10, 2, 5000, 0)
GO
INSERT [dbo].[Ventas_Detalle] ([Venta_Detalle_Id], [Venta_Id], [Articulo_Id], [Ventas_Detalle_Cantidad], [Ventas_Detalle_Precio], [Ventas_Detalle_Descuento]) VALUES (6, 4, 1, 5, 1300, 200)
GO
INSERT [dbo].[Ventas_Detalle] ([Venta_Detalle_Id], [Venta_Id], [Articulo_Id], [Ventas_Detalle_Cantidad], [Ventas_Detalle_Precio], [Ventas_Detalle_Descuento]) VALUES (7, 4, 12, 2, 5000, 500)
GO
INSERT [dbo].[Ventas_Detalle] ([Venta_Detalle_Id], [Venta_Id], [Articulo_Id], [Ventas_Detalle_Cantidad], [Ventas_Detalle_Precio], [Ventas_Detalle_Descuento]) VALUES (8, 5, 5, 5, 5000, 400)
GO
INSERT [dbo].[Ventas_Detalle] ([Venta_Detalle_Id], [Venta_Id], [Articulo_Id], [Ventas_Detalle_Cantidad], [Ventas_Detalle_Precio], [Ventas_Detalle_Descuento]) VALUES (9, 5, 4, 5, 4500, 150)
GO
SET IDENTITY_INSERT [dbo].[Ventas_Detalle] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Articulo__454CC8938C679C99]    Script Date: 17/06/2024 15:23:29 ******/
ALTER TABLE [dbo].[Articulos] ADD UNIQUE NONCLUSTERED 
(
	[Articulo_Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__C39781F4FD1AE261]    Script Date: 17/06/2024 15:23:29 ******/
ALTER TABLE [dbo].[Categorias] ADD UNIQUE NONCLUSTERED 
(
	[Categoria_Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulos] ADD  DEFAULT ((1)) FOR [Articulo_Estado]
GO
ALTER TABLE [dbo].[Categorias] ADD  DEFAULT ((1)) FOR [Categoria_Estado]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((1)) FOR [Rol_Estado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [Usuario_Estado]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD FOREIGN KEY([Categoria_Id])
REFERENCES [dbo].[Categorias] ([Categoria_Id])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([Rol_Id])
REFERENCES [dbo].[Roles] ([Rol_Id])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([Persona_Id])
REFERENCES [dbo].[Personas] ([Persona_Id])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([Usuario_Id])
REFERENCES [dbo].[Usuarios] ([Usuario_Id])
GO
ALTER TABLE [dbo].[Ventas_Detalle]  WITH CHECK ADD FOREIGN KEY([Articulo_Id])
REFERENCES [dbo].[Articulos] ([Articulo_Id])
GO
ALTER TABLE [dbo].[Ventas_Detalle]  WITH CHECK ADD FOREIGN KEY([Venta_Id])
REFERENCES [dbo].[Ventas] ([Venta_Id])
ON DELETE CASCADE
GO
