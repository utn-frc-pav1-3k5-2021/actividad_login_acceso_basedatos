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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bugs](
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BugsHistorico](
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Criticidades](
	[id_criticidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Criticidades] PRIMARY KEY CLUSTERED 
(
	[id_criticidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Estados](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Formularios](
	[id_formulario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Formularios] PRIMARY KEY CLUSTERED 
(
	[id_formulario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Perfiles](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Permisos](
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Prioridades](
	[id_prioridad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Prioridades] PRIMARY KEY CLUSTERED 
(
	[id_prioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Usuarios](
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
SET IDENTITY_INSERT [Bugs] ON 
GO
INSERT [Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (2, N'Test', N'First bug of test', CAST(N'2019-08-23' AS Date), 1, 1, 1, 1, 1, 1, 0)
GO
INSERT [Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (3, N'TEST FIRST BUG', N'hsfhkADSFHAKDS', CAST(N'2019-07-23' AS Date), 1, 2, 1, 1, 1, 2, 0)
GO
INSERT [Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (5, N'Tercer bug test', N'Tercer bug test', CAST(N'2019-07-24' AS Date), NULL, NULL, 1, 2, 3, 3, 0)
GO
SET IDENTITY_INSERT [Bugs] OFF
GO
SET IDENTITY_INSERT [BugsHistorico] ON 
GO
INSERT [BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (1, CAST(N'2019-08-24' AS Date), N'Test', N'First bug of test', 2, 1, NULL, 1, 4, 3, 1, 0)
GO
INSERT [BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (2, CAST(N'2019-08-25' AS Date), N'Test', N'Test', 2, 1, NULL, 1, 3, 3, 1, 0)
GO
INSERT [BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (3, CAST(N'2019-08-26' AS Date), N'Test', N'First bug of test', 2, 1, NULL, 1, 3, 3, 1, 0)
GO
INSERT [BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (4, CAST(N'2019-07-24' AS Date), N'TEST FIRST BUG', N'TEST FIRST BUG', 3, 1, 4, 1, 4, 3, 2, 0)
GO
INSERT [BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (5, CAST(N'2019-07-25' AS Date), N'TEST FIRST BUG', N'TEST FIRST BUG', 3, 1, 6, 1, 3, 3, 2, 0)
GO
INSERT [BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (6, CAST(N'2019-07-26' AS Date), N'TEST FIRST BUG', N'TEST FIRST BUG', 3, 1, 7, 1, 3, 3, 2, 0)
GO
INSERT [BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (7, CAST(N'2019-07-24' AS Date), N'Tercer bug test', N'Tercer bug test', 5, 1, 1, 1, 4, 3, 2, 0)
GO
INSERT [BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (8, CAST(N'2019-07-25' AS Date), N'Tercer bug test', N'Tercer bug test', 5, 1, 5, 1, 2, 3, 2, 0)
GO
INSERT [BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado], [borrado]) VALUES (9, CAST(N'2019-07-26' AS Date), N'Tercer bug test', N'Tercer bug test', 5, 1, 7, 1, 3, 3, 2, 0)
GO
SET IDENTITY_INSERT [BugsHistorico] OFF
GO
SET IDENTITY_INSERT [Criticidades] ON 
GO
INSERT [Criticidades] ([id_criticidad], [nombre], [borrado]) VALUES (1, N'LEVE', 0)
GO
INSERT [Criticidades] ([id_criticidad], [nombre], [borrado]) VALUES (2, N'GRAVE', 0)
GO
INSERT [Criticidades] ([id_criticidad], [nombre], [borrado]) VALUES (3, N'INVALIDANTE', 0)
GO
SET IDENTITY_INSERT [Criticidades] OFF
GO
SET IDENTITY_INSERT [Estados] ON 
GO
INSERT [Estados] ([id_estado], [nombre], [borrado]) VALUES (1, N'Nuevo', 0)
GO
INSERT [Estados] ([id_estado], [nombre], [borrado]) VALUES (2, N'Asignado', 0)
GO
INSERT [Estados] ([id_estado], [nombre], [borrado]) VALUES (3, N'Cerrado', 0)
GO
INSERT [Estados] ([id_estado], [nombre], [borrado]) VALUES (4, N'En testing', 0)
GO
SET IDENTITY_INSERT [Estados] OFF
GO
SET IDENTITY_INSERT [Perfiles] ON 
GO
INSERT [Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (1, N'Administrador', 0)
GO
INSERT [Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (2, N'Tester', 0)
GO
INSERT [Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (3, N'Desarrollador', 0)
GO
INSERT [Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (4, N'Responsable de Reportes', 0)
GO
SET IDENTITY_INSERT [Perfiles] OFF
GO
SET IDENTITY_INSERT [Prioridades] ON 
GO
INSERT [Prioridades] ([id_prioridad], [nombre], [borrado]) VALUES (1, N'BAJA', 0)
GO
INSERT [Prioridades] ([id_prioridad], [nombre], [borrado]) VALUES (2, N'MEDIA', 0)
GO
INSERT [Prioridades] ([id_prioridad], [nombre], [borrado]) VALUES (3, N'ALTA', 0)
GO
INSERT [Prioridades] ([id_prioridad], [nombre], [borrado]) VALUES (4, N'URGENTE', 0)
GO
SET IDENTITY_INSERT [Prioridades] OFF
GO
SET IDENTITY_INSERT [Productos] ON 
GO
INSERT [Productos] ([id_producto], [nombre], [borrado]) VALUES (1, N'SOFTWARE GESTION II', 0)
GO
SET IDENTITY_INSERT [Productos] OFF
GO
SET IDENTITY_INSERT [Usuarios] ON 
GO
INSERT [Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (1, 1, N'ADMIN', N'123', N'admin@bt.com', 0)
GO
INSERT [Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (2, 2, N'acme', N'test123', N'test123', 0)
GO
INSERT [Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (4, 3, N'Test3', N'test', N'test2@bt.com', 0)
GO
INSERT [Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (5, 2, N'one21', N'fhkjasdhfa', N'fhkjasdhfa', 0)
GO
INSERT [Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (6, 3, N'Test11-09', N'123', N'test1109@bugs.com.ar', 0)
GO
INSERT [Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [borrado]) VALUES (7, 4, N'Melisa', N'123', N'meli@gmail.com', 0)
GO
SET IDENTITY_INSERT [Usuarios] OFF
GO
ALTER TABLE [Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Criticidades] FOREIGN KEY([id_criticidad])
REFERENCES [Criticidades] ([id_criticidad])
GO
ALTER TABLE [Bugs] CHECK CONSTRAINT [FK_Bugs_Criticidades]
GO
ALTER TABLE [Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Estados] FOREIGN KEY([id_estado])
REFERENCES [Estados] ([id_estado])
GO
ALTER TABLE [Bugs] CHECK CONSTRAINT [FK_Bugs_Estados]
GO
ALTER TABLE [Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Prioridades] FOREIGN KEY([id_prioridad])
REFERENCES [Prioridades] ([id_prioridad])
GO
ALTER TABLE [Bugs] CHECK CONSTRAINT [FK_Bugs_Prioridades]
GO
ALTER TABLE [Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Productos] FOREIGN KEY([id_producto])
REFERENCES [Productos] ([id_producto])
GO
ALTER TABLE [Bugs] CHECK CONSTRAINT [FK_Bugs_Productos]
GO
ALTER TABLE [Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Usuarios] FOREIGN KEY([id_usuario_asignado])
REFERENCES [Usuarios] ([id_usuario])
GO
ALTER TABLE [Bugs] CHECK CONSTRAINT [FK_Bugs_Usuarios]
GO
ALTER TABLE [Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Usuarios1] FOREIGN KEY([id_usuario_responsable])
REFERENCES [Usuarios] ([id_usuario])
GO
ALTER TABLE [Bugs] CHECK CONSTRAINT [FK_Bugs_Usuarios1]
GO
ALTER TABLE [BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Bugs] FOREIGN KEY([id_bug])
REFERENCES [Bugs] ([id_bug])
GO
ALTER TABLE [BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Bugs]
GO
ALTER TABLE [BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Criticidades] FOREIGN KEY([id_criticidad])
REFERENCES [Criticidades] ([id_criticidad])
GO
ALTER TABLE [BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Criticidades]
GO
ALTER TABLE [BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Estados] FOREIGN KEY([id_estado])
REFERENCES [Estados] ([id_estado])
GO
ALTER TABLE [BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Estados]
GO
ALTER TABLE [BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Prioridades] FOREIGN KEY([id_prioridad])
REFERENCES [Prioridades] ([id_prioridad])
GO
ALTER TABLE [BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Prioridades]
GO
ALTER TABLE [BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Productos] FOREIGN KEY([id_producto])
REFERENCES [Productos] ([id_producto])
GO
ALTER TABLE [BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Productos]
GO
ALTER TABLE [BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Usuarios] FOREIGN KEY([id_usuario_responsable])
REFERENCES [Usuarios] ([id_usuario])
GO
ALTER TABLE [BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Usuarios]
GO
ALTER TABLE [BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Usuarios1] FOREIGN KEY([id_usuario_asignado])
REFERENCES [Usuarios] ([id_usuario])
GO
ALTER TABLE [BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Usuarios1]
GO
ALTER TABLE [Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Formularios] FOREIGN KEY([id_formulario])
REFERENCES [Formularios] ([id_formulario])
GO
ALTER TABLE [Permisos] CHECK CONSTRAINT [FK_Permisos_Formularios]
GO
ALTER TABLE [Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [Perfiles] ([id_perfil])
GO
ALTER TABLE [Permisos] CHECK CONSTRAINT [FK_Permisos_Perfiles]
GO
ALTER TABLE [Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [Perfiles] ([id_perfil])
GO
ALTER TABLE [Usuarios] CHECK CONSTRAINT [FK_Usuarios_Perfiles]
GO
USE [master]
GO
ALTER DATABASE [BugTracker] SET  READ_WRITE 
GO