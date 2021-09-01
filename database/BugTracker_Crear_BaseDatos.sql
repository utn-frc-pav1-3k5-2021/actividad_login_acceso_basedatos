USE [master]

-------------------------------------------------------------------------------------------
/*-------------------------------------------------------------------------------------------
IMPORTANTE!!! REEMPLAZAR nombre de base de datos usando el legajo de cada uno: Ej. BugTracker12345 */
	
CREATE DATABASE [BugTracker]
GO

USE [BugTracker]
GO
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/****** Object:  Table [dbo].[Bugs]    Script Date: 1/9/2021 19:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bugs](
	[id_bug] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[descripcion] [varchar](1000) NULL,
	[fecha_alta] [date] NOT NULL,
	[id_usuario_responsable] [int] NULL,
	[id_usuario_asignado] [int] NULL,
	[id_producto] [int] NULL,
	[id_prioridad] [int] NULL,
	[id_criticidad] [int] NULL,
	[id_estado] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Bugs] PRIMARY KEY CLUSTERED 
(
	[id_bug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BugsHistorico]    Script Date: 1/9/2021 19:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BugsHistorico](
	[id_bug_historico] [int] IDENTITY(1,1) NOT NULL,
	[fecha_historico] [date] NULL,
	[titulo] [varchar](100) NOT NULL,
	[descripcion] [varchar](1000) NULL,
	[id_bug] [int] NOT NULL,
	[id_usuario_responsable] [int] NOT NULL,
	[id_usuario_asignado] [int] NULL,
	[id_producto] [int] NULL,
	[id_prioridad] [int] NULL,
	[id_criticidad] [int] NULL,
	[id_estado] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_BugsHistorico] PRIMARY KEY CLUSTERED 
(
	[id_bug_historico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criticidades]    Script Date: 1/9/2021 19:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criticidades](
	[id_criticidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Criticidades] PRIMARY KEY CLUSTERED 
(
	[id_criticidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 1/9/2021 19:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formularios]    Script Date: 1/9/2021 19:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formularios](
	[id_formulario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Formularios] PRIMARY KEY CLUSTERED 
(
	[id_formulario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 1/9/2021 19:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 1/9/2021 19:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[id_formulario] [int] NOT NULL,
	[id_perfil] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[id_formulario] ASC,
	[id_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prioridades]    Script Date: 1/9/2021 19:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prioridades](
	[id_prioridad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Prioridades] PRIMARY KEY CLUSTERED 
(
	[id_prioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 1/9/2021 19:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 1/9/2021 19:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_perfil] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bugs] ON 
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (1, N'Error conexión base de datos', N'Error funcional', CAST(N'2020-10-29' AS Date), 46, 23, 5, 4, 1, 1, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (3, N'Error conexión base de datos', N'Error conexión base de datos', CAST(N'2021-03-05' AS Date), 6, 47, 22, 2, 1, 2, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (4, N'Error abriendo ventana', N'Error Backend', CAST(N'2021-08-20' AS Date), 18, 12, 6, 3, 2, 2, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (7, N'Error abriendo ventana', N'Error conexión base de datos', CAST(N'2020-09-07' AS Date), 7, 49, 6, 3, 3, 2, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (8, N'Error Frontend', N'Error Frontend', CAST(N'2021-05-07' AS Date), 34, 42, 18, 1, 1, 4, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (9, N'Error Frontend', N'Error Backend', CAST(N'2021-08-19' AS Date), 42, 35, 23, 2, 1, 3, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (10, N'Error funcional', N'Error Backend', CAST(N'2020-09-16' AS Date), 26, 28, 12, 2, 1, 4, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (11, N'Error Backend', N'Error Backend', CAST(N'2020-09-26' AS Date), 12, 49, 9, 3, 2, 1, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (13, N'Error funcional', N'Error Backend', CAST(N'2021-02-11' AS Date), 9, 6, 30, 4, 3, 3, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (14, N'Error Backend', N'Error Frontend', CAST(N'2020-10-02' AS Date), 3, 20, 12, 2, 1, 4, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (15, N'Error conexión base de datos', N'Error conexión base de datos', CAST(N'2021-02-27' AS Date), 7, 28, 6, 1, 3, 2, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (21, N'Error Backend', N'Error Backend', CAST(N'2021-07-16' AS Date), 25, 3, 1, 2, 2, 2, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (22, N'Error conexión base de datos', N'Error conexión base de datos', CAST(N'2021-04-16' AS Date), 39, 42, 10, 1, 2, 4, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (23, N'Error Frontend', N'Error conexión base de datos', CAST(N'2021-04-16' AS Date), 7, 42, 10, 4, 3, 2, 0)
GO
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (28, N'Error funcional', N'Error Frontend', CAST(N'2021-08-24' AS Date), 13, 27, 21, 1, 1, 3, 0)
GO
SET IDENTITY_INSERT [dbo].[Bugs] OFF
GO
SET IDENTITY_INSERT [dbo].[Criticidades] ON 
GO
INSERT [dbo].[Criticidades] ([id_criticidad], [nombre], [borrado]) VALUES (1, N'LEVE', 0)
GO
INSERT [dbo].[Criticidades] ([id_criticidad], [nombre], [borrado]) VALUES (2, N'GRAVE', 0)
GO
INSERT [dbo].[Criticidades] ([id_criticidad], [nombre], [borrado]) VALUES (3, N'INVALIDANTE', 0)
GO
SET IDENTITY_INSERT [dbo].[Criticidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 
GO
INSERT [dbo].[Estados] ([id_estado], [nombre], [borrado]) VALUES (1, N'Nuevo', 0)
GO
INSERT [dbo].[Estados] ([id_estado], [nombre], [borrado]) VALUES (2, N'Asignado', 0)
GO
INSERT [dbo].[Estados] ([id_estado], [nombre], [borrado]) VALUES (3, N'Cerrado', 0)
GO
INSERT [dbo].[Estados] ([id_estado], [nombre], [borrado]) VALUES (4, N'En testing', 0)
GO
SET IDENTITY_INSERT [dbo].[Estados] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfiles] ON 
GO
INSERT [dbo].[Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (1, N'Administrador', 0)
GO
INSERT [dbo].[Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (2, N'Tester', 0)
GO
INSERT [dbo].[Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (3, N'Desarrollador', 0)
GO
INSERT [dbo].[Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (4, N'Responsable de Reportes', 0)
GO
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[Prioridades] ON 
GO
INSERT [dbo].[Prioridades] ([id_prioridad], [nombre], [borrado]) VALUES (1, N'BAJA', 0)
GO
INSERT [dbo].[Prioridades] ([id_prioridad], [nombre], [borrado]) VALUES (2, N'MEDIA', 0)
GO
INSERT [dbo].[Prioridades] ([id_prioridad], [nombre], [borrado]) VALUES (3, N'ALTA', 0)
GO
INSERT [dbo].[Prioridades] ([id_prioridad], [nombre], [borrado]) VALUES (4, N'URGENTE', 0)
GO
SET IDENTITY_INSERT [dbo].[Prioridades] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (1, N'SOFTWARE GESTION II', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (2, N'Konklab', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (3, N'Stim', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (4, N'Tempsoft', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (5, N'Flexidy', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (6, N'Zontrax', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (7, N'Holdlamis', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (8, N'Mat Lam Tam', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (9, N'Prodder', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (10, N'Regrant', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (11, N'Sonsing', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (12, N'Mat Lam Tam', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (13, N'Sub-Ex', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (14, N'Y-Solowarm', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (15, N'Bigtax', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (16, N'Konklab', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (17, N'Duobam', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (18, N'Span', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (19, N'Bamity', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (20, N'Alphazap', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (21, N'Zontrax', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (22, N'Andalax', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (23, N'Kanlam', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (24, N'Hatity', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (25, N'Viva', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (26, N'Holdlamis', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (27, N'Gembucket', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (28, N'Zontrax', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (29, N'Sonsing', 0)
GO
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (30, N'Y-find', 0)
GO
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (1, 2, N'fhambly0', N'NXNy7nC4RB', N'yschimke0@forbes.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (3, 3, N'garchell2', N'ET7Tu1uP', N'eprott2@mashable.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (4, 3, N'cburton3', N'SYl8lQDj', N'dclarae3@constantcontact.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (5, 3, N'balgore4', N'7TG1D6', N'mmandrake4@ft.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (6, 4, N'bscholard5', N'teqHLj', N'korro5@seesaa.net', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (7, 2, N'slaytham6', N'sXKBjjtj5', N'hphilippard6@auda.org.au', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (8, 3, N'rellinor7', N'ddGDQaqc', N'mcalladine7@angelfire.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (9, 3, N'dspeechly8', N'RD1LdeCG', N'lemeline8@bloomberg.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (11, 2, N'dperigoea', N'Le443n4', N'mbaskervillea@jigsy.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (12, 1, N'ecarlozzib', N'UT6gDHjv2e', N'adenizetb@rediff.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (13, 1, N'pcutrissc', N'QzVukPHkB', N'lrouxc@reverbnation.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (14, 3, N'aseeleyd', N'VdVsiKrLy4', N'gcopplestoned@nationalgeographic.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (18, 2, N'sgaraghanh', N'RuXyc6iuvJ', N'ctomsah@wisc.edu', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (20, 4, N'balbinj', N'SrV3bkhqDT', N'vrevillj@trellian.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (21, 3, N'epappsk', N'5yXrfuG', N'rmavingk@irs.gov', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (22, 4, N'cfreckletonl', N'OsmxIg', N'bkeppinl@theatlantic.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (23, 3, N'fhabershawm', N'kJA4N25', N'cmessrutherm@freewebs.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (24, 3, N'mtimbrelln', N'hfvXVKE', N'jfoulgern@vistaprint.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (25, 2, N'sfellgateo', N'8U6jZSQHc', N'tavisono@webeden.co.uk', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (26, 2, N'mcodyp', N'yIlMa0R', N'tmurdyp@dedecms.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (27, 3, N'grogersonq', N'1TX4e75m95', N'hattwillq@scribd.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (28, 4, N'nroughr', N'bRwqHpG5', N'sgeorgiusr@stumbleupon.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (30, 2, N'jadrianot', N'nMyOh22', N'herbet@cargocollective.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (31, 2, N'locrottyu', N'WlvHJ9oBR', N'jwageru@netvibes.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (33, 1, N'btaylderw', N'rs5x8xrp', N'mmardyw@hc360.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (34, 3, N'alongfellowx', N'Wgkwhc', N'lshadfourthx@flickr.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (35, 4, N'cpettifery', N'4pZplpUp43', N'etrimmey@topsy.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (37, 2, N'educhatel10', N'1P5PqF', N'mkubal10@smh.com.au', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (38, 2, N'jphiller11', N'Ue0ekl', N'ksimonetti11@alexa.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (39, 1, N'plefranc12', N'OmCxGzWq', N'tsharland12@tinypic.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (40, 4, N'jmcconnel13', N'fBnLR9d', N'gcastan13@myspace.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (42, 4, N'smallindine15', N'cCSekH', N'bmont15@delicious.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (46, 4, N'ibloyes19', N'gzSx2ii7I', N'ppetcher19@elegantthemes.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (47, 4, N'jmoralas1a', N'Txv4OYalI', N'chayers1a@163.com', 0)
GO
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (49, 1, N'mboik1c', N'OI55RYn4F', N'alugton1c@xinhuanet.com', 0)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Criticidades] FOREIGN KEY([id_criticidad])
REFERENCES [dbo].[Criticidades] ([id_criticidad])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Criticidades]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[Estados] ([id_estado])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Estados]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Prioridades] FOREIGN KEY([id_prioridad])
REFERENCES [dbo].[Prioridades] ([id_prioridad])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Prioridades]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Productos]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Usuarios] FOREIGN KEY([id_usuario_asignado])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Usuarios]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Usuarios1] FOREIGN KEY([id_usuario_responsable])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Usuarios1]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Bugs] FOREIGN KEY([id_bug])
REFERENCES [dbo].[Bugs] ([id_bug])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Bugs]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Criticidades] FOREIGN KEY([id_criticidad])
REFERENCES [dbo].[Criticidades] ([id_criticidad])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Criticidades]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[Estados] ([id_estado])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Estados]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Prioridades] FOREIGN KEY([id_prioridad])
REFERENCES [dbo].[Prioridades] ([id_prioridad])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Prioridades]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Productos]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Usuarios] FOREIGN KEY([id_usuario_responsable])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Usuarios]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Usuarios1] FOREIGN KEY([id_usuario_asignado])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Usuarios1]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Formularios] FOREIGN KEY([id_formulario])
REFERENCES [dbo].[Formularios] ([id_formulario])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Formularios]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[Perfiles] ([id_perfil])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Perfiles]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[Perfiles] ([id_perfil])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Perfiles]
GO
USE [master]
GO
ALTER DATABASE [BugTracker] SET  READ_WRITE 
GO
