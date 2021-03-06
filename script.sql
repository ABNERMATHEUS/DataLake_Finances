USE [finances]
GO
/****** Object:  Table [dbo].[Carteira]    Script Date: 30/10/2021 00:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carteira](
	[IdCarteira] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](145) NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Carteira] PRIMARY KEY CLUSTERED 
(
	[IdCarteira] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormaPagamento]    Script Date: 30/10/2021 00:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormaPagamento](
	[IdFormaPagamento] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](145) NOT NULL,
 CONSTRAINT [PK_FormaPagamento] PRIMARY KEY CLUSTERED 
(
	[IdFormaPagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Investimento]    Script Date: 30/10/2021 00:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investimento](
	[IdInvestimento] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
	[NomeTipoInvestimento] [varchar](145) NOT NULL,
	[IdCarteira] [int] NOT NULL,
 CONSTRAINT [PK_Investimento] PRIMARY KEY CLUSTERED 
(
	[IdInvestimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagar]    Script Date: 30/10/2021 00:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagar](
	[IdPagar] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
	[Data] [datetime] NOT NULL,
	[Pago] [tinyint] NOT NULL,
	[Valor] [money] NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
	[IdCarteira] [int] NOT NULL,
	[IdFormaPagamento] [int] NOT NULL,
 CONSTRAINT [PK_Pagar] PRIMARY KEY CLUSTERED 
(
	[IdPagar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poupanca]    Script Date: 30/10/2021 00:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poupanca](
	[IdPoupanca] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[IdInvestimento] [int] NOT NULL,
 CONSTRAINT [PK_Poupanca] PRIMARY KEY CLUSTERED 
(
	[IdPoupanca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrevidenciaPrivada]    Script Date: 30/10/2021 00:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrevidenciaPrivada](
	[IdPrevidencia] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[DataAplicacao] [datetime] NOT NULL,
	[Valor] [money] NOT NULL,
	[IdInvestimento] [int] NOT NULL,
 CONSTRAINT [PK_PrevidenciaPrivada] PRIMARY KEY CLUSTERED 
(
	[IdPrevidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receber]    Script Date: 30/10/2021 00:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receber](
	[IdReceber] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](145) NOT NULL,
	[Valor] [money] NOT NULL,
	[Recebido] [tinyint] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Categoria] [varchar](145) NOT NULL,
	[IdCarteira] [int] NOT NULL,
 CONSTRAINT [PK_Receber] PRIMARY KEY CLUSTERED 
(
	[IdReceber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relatorio]    Script Date: 30/10/2021 00:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relatorio](
	[IdRelatorio] [int] IDENTITY(1,1) NOT NULL,
	[TipoRelatorio] [varchar](145) NOT NULL,
	[DataGeracao] [datetime] NOT NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_Relatorio] PRIMARY KEY CLUSTERED 
(
	[IdRelatorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RendaVariavel]    Script Date: 30/10/2021 00:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RendaVariavel](
	[IdVariavel] [int] IDENTITY(1,1) NOT NULL,
	[Papel] [varchar](50) NOT NULL,
	[ValorAplicado] [money] NOT NULL,
	[Unidades] [int] NOT NULL,
	[DataAplicacao] [datetime] NOT NULL,
	[IdInvestimento] [int] NOT NULL,
 CONSTRAINT [PK_RendaVariavel] PRIMARY KEY CLUSTERED 
(
	[IdVariavel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/10/2021 00:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](145) NOT NULL,
	[Sobrenome] [varchar](145) NOT NULL,
	[Email] [varchar](145) NOT NULL,
	[Senha] [varchar](145) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carteira]  WITH CHECK ADD  CONSTRAINT [FK_Carteira_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Carteira] CHECK CONSTRAINT [FK_Carteira_Usuario]
GO
ALTER TABLE [dbo].[Investimento]  WITH CHECK ADD  CONSTRAINT [FK_Investimento_Carteira] FOREIGN KEY([IdCarteira])
REFERENCES [dbo].[Carteira] ([IdCarteira])
GO
ALTER TABLE [dbo].[Investimento] CHECK CONSTRAINT [FK_Investimento_Carteira]
GO
ALTER TABLE [dbo].[Pagar]  WITH CHECK ADD  CONSTRAINT [FK_Pagar_Carteira] FOREIGN KEY([IdCarteira])
REFERENCES [dbo].[Carteira] ([IdCarteira])
GO
ALTER TABLE [dbo].[Pagar] CHECK CONSTRAINT [FK_Pagar_Carteira]
GO
ALTER TABLE [dbo].[Pagar]  WITH CHECK ADD  CONSTRAINT [FK_Pagar_FormaPagamento] FOREIGN KEY([IdFormaPagamento])
REFERENCES [dbo].[FormaPagamento] ([IdFormaPagamento])
GO
ALTER TABLE [dbo].[Pagar] CHECK CONSTRAINT [FK_Pagar_FormaPagamento]
GO
ALTER TABLE [dbo].[Poupanca]  WITH CHECK ADD  CONSTRAINT [FK_Poupanca_Investimento] FOREIGN KEY([IdInvestimento])
REFERENCES [dbo].[Investimento] ([IdInvestimento])
GO
ALTER TABLE [dbo].[Poupanca] CHECK CONSTRAINT [FK_Poupanca_Investimento]
GO
ALTER TABLE [dbo].[PrevidenciaPrivada]  WITH CHECK ADD  CONSTRAINT [FK_PrevidenciaPrivada_Investimento] FOREIGN KEY([IdInvestimento])
REFERENCES [dbo].[Investimento] ([IdInvestimento])
GO
ALTER TABLE [dbo].[PrevidenciaPrivada] CHECK CONSTRAINT [FK_PrevidenciaPrivada_Investimento]
GO
ALTER TABLE [dbo].[Receber]  WITH CHECK ADD  CONSTRAINT [FK_Receber_Carteira] FOREIGN KEY([IdCarteira])
REFERENCES [dbo].[Carteira] ([IdCarteira])
GO
ALTER TABLE [dbo].[Receber] CHECK CONSTRAINT [FK_Receber_Carteira]
GO
ALTER TABLE [dbo].[Relatorio]  WITH CHECK ADD  CONSTRAINT [FK_Relatorio_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Relatorio] CHECK CONSTRAINT [FK_Relatorio_Usuario]
GO
ALTER TABLE [dbo].[RendaVariavel]  WITH CHECK ADD  CONSTRAINT [FK_RendaVariavel_Investimento] FOREIGN KEY([IdInvestimento])
REFERENCES [dbo].[Investimento] ([IdInvestimento])
GO
ALTER TABLE [dbo].[RendaVariavel] CHECK CONSTRAINT [FK_RendaVariavel_Investimento]
GO
