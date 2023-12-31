USE [master]
GO
/****** Object:  Database [Drausiotemp2]    Script Date: 23/11/2023 09:20:15 ******/
CREATE DATABASE [Drausiotemp2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Drausiotemp2', FILENAME = N'E:\Programas\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Drausiotemp2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Drausiotemp2_log', FILENAME = N'E:\Programas\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Drausiotemp2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Drausiotemp2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Drausiotemp2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Drausiotemp2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Drausiotemp2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Drausiotemp2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Drausiotemp2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Drausiotemp2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Drausiotemp2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Drausiotemp2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Drausiotemp2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Drausiotemp2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Drausiotemp2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Drausiotemp2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Drausiotemp2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Drausiotemp2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Drausiotemp2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Drausiotemp2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Drausiotemp2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Drausiotemp2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Drausiotemp2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Drausiotemp2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Drausiotemp2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Drausiotemp2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Drausiotemp2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Drausiotemp2] SET RECOVERY FULL 
GO
ALTER DATABASE [Drausiotemp2] SET  MULTI_USER 
GO
ALTER DATABASE [Drausiotemp2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Drausiotemp2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Drausiotemp2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Drausiotemp2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Drausiotemp2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Drausiotemp2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Drausiotemp2', N'ON'
GO
ALTER DATABASE [Drausiotemp2] SET QUERY_STORE = OFF
GO
USE [Drausiotemp2]
GO
/****** Object:  Table [dbo].[tblPessoa]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPessoa](
	[IDPessoa] [int] IDENTITY(1,1) NOT NULL,
	[IDPessoaTipo] [int] NOT NULL,
 CONSTRAINT [PK_tblPessoa] PRIMARY KEY CLUSTERED 
(
	[IDPessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPessoaTipo]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPessoaTipo](
	[IDPessoaTipo] [int] NOT NULL,
	[Descricao] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblPessoaTipo] PRIMARY KEY CLUSTERED 
(
	[IDPessoaTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPessoaFisica]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPessoaFisica](
	[IDPessoaFisica] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[CPF] [varchar](11) NOT NULL,
	[RG] [varchar](20) NULL,
	[DataNascimento] [date] NOT NULL,
 CONSTRAINT [PK_tblPessoaFisica] PRIMARY KEY CLUSTERED 
(
	[IDPessoaFisica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPessoaJuridica]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPessoaJuridica](
	[IDPessoaJuridica] [int] NOT NULL,
	[NomeFantasia] [varchar](50) NOT NULL,
	[RazaoSocial] [varchar](50) NOT NULL,
	[CNPJ] [varchar](14) NOT NULL,
	[InscricaoEstadual] [varchar](20) NULL,
	[DataFundacao] [date] NOT NULL,
 CONSTRAINT [PK_tblPessoaJuridica] PRIMARY KEY CLUSTERED 
(
	[IDPessoaJuridica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[uvwPessoaFisicaJuridica]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvwPessoaFisicaJuridica]

AS
	SELECT
		tblPessoa.IDPessoa,
		tblPessoa.IDPessoaTipo,
		tblPessoaTipo.Descricao as DescricaoTipo,
		CASE
			WHEN tblPessoa.IDPessoaTipo = 1 THEN tblPessoaFisica.CPF
			ELSE tblPessoaJuridica.CNPJ
		END AS CpfCnpj,
		CASE
			WHEN tblPessoa.IDPessoaTipo = 1 THEN tblPessoaFisica.Nome
			ELSE tblPessoaJuridica.NomeFantasia
		END AS Nome
	FROM
		tblPessoa
	JOIN
		tblPessoaTipo ON tblPessoa.IDPessoaTipo = tblPessoaTipo.IDPessoaTipo
	LEFT JOIN
		tblPessoaFisica ON tblPessoa.IDPessoa = tblPessoaFisica.IDPessoaFisica
	LEFT JOIN
	tblPessoaJuridica ON tblPessoa.IDPessoa = tblPessoaJuridica.IDPessoaJuridica
GO
/****** Object:  Table [dbo].[tblCliente]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCliente](
	[IDPessoaCliente] [int] NOT NULL,
 CONSTRAINT [PK_tblCliente] PRIMARY KEY CLUSTERED 
(
	[IDPessoaCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstoque]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstoque](
	[IDPessoaFilial] [int] NOT NULL,
	[IDProduto] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
 CONSTRAINT [PK_tblEstoque] PRIMARY KEY CLUSTERED 
(
	[IDPessoaFilial] ASC,
	[IDProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstoqueMovimentado]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstoqueMovimentado](
	[IDEstoqueMovimentado] [int] IDENTITY(1,1) NOT NULL,
	[IDPessoaFilial] [int] NOT NULL,
	[IDProduto] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[EntrouSaiu] [char](1) NOT NULL,
 CONSTRAINT [PK_tblEstoqueMovimentado] PRIMARY KEY CLUSTERED 
(
	[IDEstoqueMovimentado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstoqueReservado]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstoqueReservado](
	[IDPessoaFilial] [int] NOT NULL,
	[IDProduto] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
 CONSTRAINT [PK_tblEstoqueReservado] PRIMARY KEY CLUSTERED 
(
	[IDPessoaFilial] ASC,
	[IDProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFilial]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFilial](
	[IDPessoaFilial] [int] NOT NULL,
 CONSTRAINT [PK_tblFilial] PRIMARY KEY CLUSTERED 
(
	[IDPessoaFilial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFornecedor]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFornecedor](
	[IDPessoaFornecedor] [int] NOT NULL,
 CONSTRAINT [PK_tblFornecedor] PRIMARY KEY CLUSTERED 
(
	[IDPessoaFornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOperacao]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOperacao](
	[IDOperacao] [int] NOT NULL,
	[Descricao] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblOperacao] PRIMARY KEY CLUSTERED 
(
	[IDOperacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPedido]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedido](
	[IDPedido] [int] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[IDOperacao] [int] NOT NULL,
	[IDSituacao] [int] NOT NULL,
	[IDPessoaEmitente] [int] NOT NULL,
	[IDPessoaDestinatario] [int] NOT NULL,
 CONSTRAINT [PK_tblPedido] PRIMARY KEY CLUSTERED 
(
	[IDPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPedidoItem]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedidoItem](
	[IDPedido] [int] NOT NULL,
	[IDProduto] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[ValorUnitario] [decimal](18, 2) NOT NULL,
	[PercentualDesconto] [decimal](5, 2) NOT NULL,
	[ValorDesconto] [decimal](18, 2) NOT NULL,
	[ValorTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tblPedidoItem] PRIMARY KEY CLUSTERED 
(
	[IDPedido] ASC,
	[IDProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPreco]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPreco](
	[IDProduto] [int] NOT NULL,
	[Preco] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tblPreco] PRIMARY KEY CLUSTERED 
(
	[IDProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduto]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduto](
	[IDProduto] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblProduto] PRIMARY KEY CLUSTERED 
(
	[IDProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSituacao]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSituacao](
	[IDSituacao] [int] NOT NULL,
	[Descricao] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblSituacao] PRIMARY KEY CLUSTERED 
(
	[IDSituacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblPessoaJuridicaCnpj]    Script Date: 23/11/2023 09:20:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblPessoaJuridicaCnpj] ON [dbo].[tblPessoaJuridica]
(
	[CNPJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPedido] ADD  CONSTRAINT [DF_tblPedido_DataHora]  DEFAULT (getdate()) FOR [DataHora]
GO
ALTER TABLE [dbo].[tblCliente]  WITH CHECK ADD  CONSTRAINT [FK_tblCliente_tblPessoa] FOREIGN KEY([IDPessoaCliente])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblCliente] CHECK CONSTRAINT [FK_tblCliente_tblPessoa]
GO
ALTER TABLE [dbo].[tblEstoque]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoque_tblFilial] FOREIGN KEY([IDPessoaFilial])
REFERENCES [dbo].[tblFilial] ([IDPessoaFilial])
GO
ALTER TABLE [dbo].[tblEstoque] CHECK CONSTRAINT [FK_tblEstoque_tblFilial]
GO
ALTER TABLE [dbo].[tblEstoque]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoque_tblProduto] FOREIGN KEY([IDProduto])
REFERENCES [dbo].[tblProduto] ([IDProduto])
GO
ALTER TABLE [dbo].[tblEstoque] CHECK CONSTRAINT [FK_tblEstoque_tblProduto]
GO
ALTER TABLE [dbo].[tblEstoqueMovimentado]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoqueMovimentado_tblFilial] FOREIGN KEY([IDPessoaFilial])
REFERENCES [dbo].[tblFilial] ([IDPessoaFilial])
GO
ALTER TABLE [dbo].[tblEstoqueMovimentado] CHECK CONSTRAINT [FK_tblEstoqueMovimentado_tblFilial]
GO
ALTER TABLE [dbo].[tblEstoqueMovimentado]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoqueMovimentado_tblProduto] FOREIGN KEY([IDProduto])
REFERENCES [dbo].[tblProduto] ([IDProduto])
GO
ALTER TABLE [dbo].[tblEstoqueMovimentado] CHECK CONSTRAINT [FK_tblEstoqueMovimentado_tblProduto]
GO
ALTER TABLE [dbo].[tblEstoqueReservado]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoqueReservado_tblEstoque] FOREIGN KEY([IDPessoaFilial], [IDProduto])
REFERENCES [dbo].[tblEstoque] ([IDPessoaFilial], [IDProduto])
GO
ALTER TABLE [dbo].[tblEstoqueReservado] CHECK CONSTRAINT [FK_tblEstoqueReservado_tblEstoque]
GO
ALTER TABLE [dbo].[tblFilial]  WITH CHECK ADD  CONSTRAINT [FK_tblFilial_tblPessoa] FOREIGN KEY([IDPessoaFilial])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblFilial] CHECK CONSTRAINT [FK_tblFilial_tblPessoa]
GO
ALTER TABLE [dbo].[tblFornecedor]  WITH CHECK ADD  CONSTRAINT [FK_tblFornecedor_tblPessoa] FOREIGN KEY([IDPessoaFornecedor])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblFornecedor] CHECK CONSTRAINT [FK_tblFornecedor_tblPessoa]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblOperacao] FOREIGN KEY([IDOperacao])
REFERENCES [dbo].[tblOperacao] ([IDOperacao])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblOperacao]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblPessoa_Destinatario] FOREIGN KEY([IDPessoaDestinatario])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblPessoa_Destinatario]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblPessoa_Emitente] FOREIGN KEY([IDPessoaEmitente])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblPessoa_Emitente]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblSituacao] FOREIGN KEY([IDSituacao])
REFERENCES [dbo].[tblSituacao] ([IDSituacao])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblSituacao]
GO
ALTER TABLE [dbo].[tblPedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_tblPedidoItem_tblPedido] FOREIGN KEY([IDPedido])
REFERENCES [dbo].[tblPedido] ([IDPedido])
GO
ALTER TABLE [dbo].[tblPedidoItem] CHECK CONSTRAINT [FK_tblPedidoItem_tblPedido]
GO
ALTER TABLE [dbo].[tblPedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_tblPedidoItem_tblProduto] FOREIGN KEY([IDProduto])
REFERENCES [dbo].[tblProduto] ([IDProduto])
GO
ALTER TABLE [dbo].[tblPedidoItem] CHECK CONSTRAINT [FK_tblPedidoItem_tblProduto]
GO
ALTER TABLE [dbo].[tblPessoa]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoa_tblPessoaTipo] FOREIGN KEY([IDPessoaTipo])
REFERENCES [dbo].[tblPessoaTipo] ([IDPessoaTipo])
GO
ALTER TABLE [dbo].[tblPessoa] CHECK CONSTRAINT [FK_tblPessoa_tblPessoaTipo]
GO
ALTER TABLE [dbo].[tblPessoaFisica]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoaFisica_tblPessoa] FOREIGN KEY([IDPessoaFisica])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblPessoaFisica] CHECK CONSTRAINT [FK_tblPessoaFisica_tblPessoa]
GO
ALTER TABLE [dbo].[tblPessoaJuridica]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoaJuridica_tblPessoa] FOREIGN KEY([IDPessoaJuridica])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblPessoaJuridica] CHECK CONSTRAINT [FK_tblPessoaJuridica_tblPessoa]
GO
ALTER TABLE [dbo].[tblPreco]  WITH CHECK ADD  CONSTRAINT [FK_tblPreco_tblProduto] FOREIGN KEY([IDProduto])
REFERENCES [dbo].[tblProduto] ([IDProduto])
GO
ALTER TABLE [dbo].[tblPreco] CHECK CONSTRAINT [FK_tblPreco_tblProduto]
GO
/****** Object:  StoredProcedure [dbo].[uspClienteConsultarPorCodigoNome]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteConsultarPorCodigoNome]
	@IDPessoaCliente INT = NULL,
	@Nome VARCHAR(50) = NULL
AS
BEGIN
	
	SELECT
		cli.IDPessoaCliente,
		pes.CpfCnpj,
		pes.Nome,
		pes.IDPessoaTipo,
		pes.DescricaoTipo
	FROM
		tblCliente AS cli
	JOIN
		uvwPessoaFisicaJuridica AS pes ON cli.IDPessoaCliente = pes.IDPessoa
	WHERE
		(@IDPessoaCliente IS NULL OR cli.IDPessoaCliente = @IDPessoaCliente)AND
		(@Nome IS NULL OR pes.Nome LIKE '%' + @Nome + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[uspClienteInserir]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteInserir]
	@IDPessoaCliente AS INT
AS
BEGIN
--EXCECAO (TRY/CATCH)
--TRANSACAO
	BEGIN TRY
			BEGIN TRAN 
				
				--Nao deixar inserir um cliente ja existente
				IF(EXISTS (SELECT @IDPessoaCliente FROM tblCliente WHERE IDPessoaCliente = @IDPessoaCliente))
					RAISERROR ('Cliente ja existe', 14,1);
				--Inserir o cliente
				INSERT INTO tblCliente
					(
						IDPessoaCliente
					)
				VALUES
					(
						@IDPessoaCliente
					);

				SELECT @IDPessoaCliente AS Retorno;

			COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspEstoqueConsultar]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEstoqueConsultar]
	@IDPessoaFilial INT,
	@IDProduto INT
AS
BEGIN
	
	SELECT
		est.IDPessoaFilial,
		fil.Nome AS NomeFilial,
		fil.CpfCnpj AS CpfCnpjFilial,
		fil.DescricaoTipo AS TipoFilial,
		est.IDProduto,
		pro.Descricao AS DescricaoProduto,
		est.Quantidade
	FROM
		tblEstoque AS est
	JOIN
		uvwPessoaFisicaJuridica AS fil ON est.IDPessoaFilial = fil.IDPessoa
	JOIN
		tblProduto AS pro ON est.IDProduto = pro.IDProduto
	WHERE
		est.IDPessoaFilial = @IDPessoaFilial AND pro.IDProduto = @IDProduto


END
GO
/****** Object:  StoredProcedure [dbo].[uspEstoqueDisponivelConsultar]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEstoqueDisponivelConsultar]
	@IDPessoaFilial INT,
	@IDProduto INT
AS
BEGIN
	
	DECLARE
		@NomeFilial VARCHAR(50),
		@CpfCnpj VARCHAR(14),
		@TipoFilial VARCHAR(50),
		@DescricaoProduto VARCHAR(100),
		@Estoque INT,
		@EstoqueReservado INT,
		@EstoqueDisponivel INT

	SET @NomeFilial = ( SELECT Nome FROM uvwPessoaFisicaJuridica WHERE IDPessoa = @IDPessoaFilial);

	SET @CpfCnpj = ( SELECT CpfCnpj FROM uvwPessoaFisicaJuridica WHERE IDPessoa = @IDPessoaFilial);

	SET @TipoFilial = (SELECT DescricaoTipo FROM uvwPessoaFisicaJuridica WHERE IDPessoa = @IDPessoaFilial);

	SET @DescricaoProduto = (SELECT Descricao FROM tblProduto WHERE IDProduto = @IDProduto);

	SET @Estoque = (SELECT Quantidade FROM tblEstoque WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto);

	SET @EstoqueReservado = (SELECT Quantidade FROM tblEstoqueReservado WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto);

	SET @EstoqueDisponivel = COALESCE(@Estoque,0) - COALESCE (@EstoqueReservado,0);

	SELECT
		@IDPessoaFilial AS IDPessoaFilial,
		@IDProduto AS IDProduto,
		@NomeFilial AS NomeFilial,
		@CpfCnpj AS CpfCnpj,
		@TipoFilial AS TipoFilial,
		@DescricaoProduto AS DescricaoProduto,
		@Estoque AS Estoque,
		@EstoqueReservado AS EstoqueReservado,
		@EstoqueDisponivel AS EstoqueDisponivel


END
GO
/****** Object:  StoredProcedure [dbo].[uspEstoqueManter]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEstoqueManter]
	@IDPessoaFilial AS INT,
	@IDProduto AS INT,
	@Quantidade AS INT
AS
BEGIN
--EXCECAO (TRY/CATCH)
--TRANSACAO
	BEGIN TRY
			BEGIN TRAN
			
				--Se existir, altera, senao insere
				IF(EXISTS(SELECT IDProduto FROM tblEstoque WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto))

				BEGIN
					--ALTERAR
					UPDATE tblEstoque
					SET Quantidade = Quantidade + @Quantidade
					WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto

				END
				ELSE
				BEGIN
					--INSERIR
					INSERT INTO tblEstoque (IDPessoaFilial, IDProduto, Quantidade)
					VALUES (@IDPessoaFilial, @IDProduto, @Quantidade)
				END

				--MOVIMENTACAO DE ESTOQUE
				DECLARE @EntrouSaiu CHAR(1);
				
				IF (@Quantidade < 0)
					SET @EntrouSaiu = 'S';
				ELSE 
					SET @EntrouSaiu ='E';

				INSERT INTO tblEstoqueMovimentado (IDPessoaFilial, IDProduto, Quantidade, DataHora, EntrouSaiu)
				VALUES
				(@IDPessoaFilial, @IDProduto, @Quantidade, GETDATE(), @EntrouSaiu)

				--FIM DA MOVIMENTACAO

				SELECT @IDProduto AS Retorno;

			COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspEstoqueReservadoConsultar]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEstoqueReservadoConsultar]
	@IDPessoaFilial INT,
	@IDProduto INT
AS
BEGIN
	
	SELECT
		estRes.IDPessoaFilial,
		fil.Nome AS NomeFilial,
		fil.CpfCnpj AS CpfCnpjFilial,
		fil.DescricaoTipo AS TipoFilial,
		estRes.IDProduto,
		pro.Descricao AS DescricaoProduto,
		estRes.Quantidade
	FROM
		tblEstoqueReservado AS estRes
	JOIN
		uvwPessoaFisicaJuridica AS fil ON estRes.IDPessoaFilial = fil.IDPessoa
	JOIN
		tblProduto AS pro ON estRes.IDProduto = pro.IDProduto
	WHERE
		estRes.IDPessoaFilial = @IDPessoaFilial AND pro.IDProduto = @IDProduto


END
GO
/****** Object:  StoredProcedure [dbo].[uspEstoqueReservadoManter]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEstoqueReservadoManter]
	@IDPessoaFilial AS INT,
	@IDProduto AS INT,
	@Quantidade AS INT
AS
BEGIN
--EXCECAO (TRY/CATCH)
--TRANSACAO
	BEGIN TRY
			BEGIN TRAN
			
				--Se existir, altera, senao insere
				IF(EXISTS(SELECT IDProduto FROM tblEstoqueReservado WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto))

				BEGIN
					--UPDATE
					UPDATE tblEstoqueReservado
					SET Quantidade = Quantidade + @Quantidade
					WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto

				END
				ELSE
				BEGIN
					--INSERT
					INSERT INTO tblEstoqueReservado (IDPessoaFilial, IDProduto, Quantidade)
					VALUES (@IDPessoaFilial, @IDProduto, @Quantidade)
				END

				SELECT @IDProduto AS Retorno;

			COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspFilialConsultarPorCodigo]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspFilialConsultarPorCodigo]
	@IDPessoaFilial AS INT
AS
BEGIN
	
	SELECT
		fil.IDPessoaFilial,
		pes.CpfCnpj,
		pes.Nome,
		pes.IDPessoaTipo,
		pes.DescricaoTipo
	FROM
		tblFilial AS fil
	JOIN
		uvwPessoaFisicaJuridica AS pes ON fil.IDPessoaFilial = pes.IDPessoa
	WHERE
		fil.IDPessoaFilial = @IDPessoaFilial


END
GO
/****** Object:  StoredProcedure [dbo].[uspFilialConsultarPorNome]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspFilialConsultarPorNome]
	@Nome VARCHAR(50)
AS
BEGIN
	
	SELECT
		fil.IDPessoaFilial,
		pes.CpfCnpj,
		pes.Nome,
		pes.IDPessoaTipo,
		pes.DescricaoTipo
	FROM
		tblFilial AS fil
	JOIN
		uvwPessoaFisicaJuridica AS pes ON fil.IDPessoaFilial = pes.IDPessoa
	WHERE
		pes.Nome LIKE '%' + @Nome + '%'


END
GO
/****** Object:  StoredProcedure [dbo].[uspFilialInserir]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspFilialInserir]
	@IDPessoaFilial AS INT
AS
BEGIN
--EXCECAO (TRY/CATCH)
--TRANSACAO
	BEGIN TRY
			BEGIN TRAN 
				
				--Nao deixar inserir pessoa que ja e filial 
				IF(EXISTS (SELECT @IDPessoaFilial FROM tblFilial WHERE IDPessoaFilial = @IDPessoaFilial))
					RAISERROR ('Filial ja existe', 14,1);
				--Inserir a Filial
				INSERT INTO tblFilial
					(
						IDPessoaFilial
					)
				VALUES
					(
						@IDPessoaFilial
					);

				SELECT @IDPessoaFilial AS Retorno;

			COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[uspFornecedorConsultarPorCodigoNome]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspFornecedorConsultarPorCodigoNome]
	@IDPessoaFornecedor INT = NULL,
	@Nome VARCHAR(50) = NULL
AS
BEGIN
	
	IF(@IDPessoaFornecedor IS NOT NULL)
	BEGIN
		SELECT
			forn.IDPessoaFornecedor,
			pes.CpfCnpj,
			pes.Nome,
			pes.IDPessoaTipo,
			pes.DescricaoTipo
		FROM
			tblFornecedor AS forn
		JOIN 
			uvwPessoaFisicaJuridica AS pes ON forn.IDPessoaFornecedor = pes.IDPessoa
		WHERE
			forn.IDPessoaFornecedor = @IDPessoaFornecedor
	END
	ELSE IF(@Nome IS NOT NULL)
	BEGIN
		SELECT
			forn.IDPessoaFornecedor,
			pes.CpfCnpj,
			pes.Nome,
			pes.IDPessoaTipo,
			pes.DescricaoTipo
		FROM
			tblFornecedor AS forn
		JOIN 
			uvwPessoaFisicaJuridica AS pes ON forn.IDPessoaFornecedor = pes.IDPessoa
		WHERE
			pes.Nome LIKE '%' + @Nome + '%'
	END



END
GO
/****** Object:  StoredProcedure [dbo].[uspFornecedorInserir]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspFornecedorInserir]
	@IDPessoaFornecedor AS INT
AS
BEGIN
--EXCECAO (TRY/CATCH)
--TRANSACAO
	BEGIN TRY
			BEGIN TRAN 
				
				--Nao deixar inserir uma filial ja existente
				IF(EXISTS (SELECT @IDPessoaFornecedor FROM tblFornecedor WHERE IDPessoaFornecedor = @IDPessoaFornecedor))
					RAISERROR ('Fornecedor ja existe', 14,1);
				--Inserir o fornecedor
				INSERT INTO tblFornecedor
					(
						IDPessoaFornecedor
					)
				VALUES
					(
						@IDPessoaFornecedor
					);

				SELECT @IDPessoaFornecedor AS Retorno;

			COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspPedidoConsultarPorData]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPedidoConsultarPorData]
	@DataInicial DATE,
	@DataFinal DATE
	
AS
BEGIN
	
	SELECT
		ped.IDPedido,
		ped.DataHora,
		ped.IDOperacao,
		ope.Descricao as DescOperacao,
		ped.IDSituacao,
		sit.Descricao as DescSituacao,
		ped.IDPessoaEmitente,
		emit.Nome as NomeEmitente,
		ped.IDPessoaDestinatario,
		dest.Nome as NomeDestinatario

	FROM
		tblPedido AS ped
	JOIN
		tblOperacao AS ope ON ped.IDOperacao = ped.IDOperacao
	JOIN
		tblSituacao AS sit ON ped.IDSituacao = sit.IDSituacao
	Join
		uvwPessoaFisicaJuridica AS emit ON ped.IDPessoaEmitente = emit.IDPessoa
	Join
		uvwPessoaFisicaJuridica AS dest ON ped.IDPessoaDestinatario = dest.IDPessoa
	WHERE
		CAST(ped.DataHora AS DATE) BETWEEN @DataInicial AND @DataFinal


END
GO
/****** Object:  StoredProcedure [dbo].[uspPedidoInserir]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPedidoInserir]
	@IDOperacao AS INT,
	@IDSituacao AS INT,
	@IDPessoaEmitente AS INT,
	@IDPessoaDestinatario AS INT
	
AS
BEGIN
--EXCECAO (TRY/CATCH)
--TRANSACAO
	BEGIN TRY
			BEGIN TRAN 

				INSERT INTO tblPedido
				(DataHora, IDOperacao, IDSituacao, IDPessoaEmitente, IDPessoaDestinatario)
				VALUES
				(GETDATE(), @IDOperacao, @IDSituacao, @IDPessoaEmitente, @IDPessoaDestinatario)

				SELECT @@IDENTITY AS Retorno;

			COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspPedidoItemConsultar]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPedidoItemConsultar]
	@IDPedido INT
	
AS
BEGIN
	
	SELECT
		pedIte.IDPedido,
		pedIte.IDProduto,
		pro.Descricao as DescProduto,
		pedIte.Quantidade,
		pedIte.ValorUnitario,
		pedIte.PercentualDesconto,
		pedIte.ValorDesconto,
		pedIte.ValorTotal
	FROM
		tblPedidoItem as pedIte
	JOIN
		tblProduto as pro on pedIte.IDProduto = pro.IDProduto
	
	WHERE
		pedIte.IDPedido = @IDPedido


END
GO
/****** Object:  StoredProcedure [dbo].[uspPedidoItemInserir]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPedidoItemInserir]
	@IDPedido AS INT,
	@IDProduto AS INT,
	@Quantidade AS INT,
	@ValorUnitario AS DECIMAL(18,2),
	@PercentualDesconto AS DECIMAL(5,2),
	@ValorDesconto AS DECIMAL(18,2),
	@ValorTotal AS DECIMAL(18,2)
AS
BEGIN
--EXCECAO (TRY/CATCH)
--TRANSACAO
	BEGIN TRY
			BEGIN TRAN

				IF(EXISTS(SELECT IDProduto FROM tblPedidoItem WHERE IDPedido = @IDPedido AND IDProduto = @IDProduto))
				BEGIN
					RAISERROR('Esse produto ja esta no pedido.', 14,1);
				END

				INSERT INTO tblPedidoItem
				(IDPedido, IDProduto, Quantidade, ValorUnitario, PercentualDesconto, ValorDesconto, ValorTotal)
				VALUES
				(@IDPedido, @IDProduto, @Quantidade, @ValorUnitario, @PercentualDesconto, @ValorDesconto, @ValorTotal)

				SELECT @IDProduto AS Retorno;

			COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspPessoaFisicaInserir]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspPessoaFisicaInserir]
@Nome AS VARCHAR(50),
@CPF AS VARCHAR (11),
@RG AS VARCHAR (20),
@DataNascimento AS DATE
AS
BEGIN
--EXCECAO (TRY/CATCH)
--TRANSACAO
	BEGIN TRY
		BEGIN TRAN 
		
		IF(EXISTS (SELECT IDPessoaFisica FROM tblPessoaFisica WHERE CPF = @CPF))
			RAISERROR ('CPF ja existe', 14,1);

		DECLARE @IDPessoa AS INT;

		--1 Inserir na tabela tblPessoa
		INSERT INTO tblPessoa (IDPessoaTipo)
		VALUES (1);

		SET @IDPessoa = @@IDENTITY;

		--2 Inserir na tabela tblPessoaFisica
		INSERT INTO tblPessoaFisica (IDPessoaFisica, Nome, CPF, RG, DataNascimento)
		VALUES (@IDPessoa, @Nome, @CPF, @RG, @DataNascimento);

		SELECT @IDPessoa AS Retorno;

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspPessoaJuridicaInserir]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPessoaJuridicaInserir]
	@NomeFantasia AS VARCHAR(50),
	@RazaoSocial AS VARCHAR (50),
	@CNPJ AS VARCHAR (14),
	@InscricaoEstadual AS VARCHAR (20),
	@DataFundacao AS DATE
AS
BEGIN
--EXCECAO (TRY/CATCH)
--TRANSACAO
	BEGIN TRY
		BEGIN TRAN 
		--Nao deixar inserir CNPJ repetido
		IF(EXISTS (SELECT IDPessoaJuridica FROM tblPessoaJuridica WHERE CNPJ = @CNPJ))
			RAISERROR ('CNPJ ja existe', 14,1);

		--1 Inserir na tabela tblPessoa
		INSERT INTO tblPessoa (IDPessoaTipo)
		VALUES (2);

		DECLARE @IDPessoa AS INT;
		SET @IDPessoa = @@IDENTITY;

		--2 Inserir na tabela tblPessoaJuridica
		INSERT INTO tblPessoaJuridica

			(
				IDPessoaJuridica,
				NomeFantasia,
				RazaoSocial,
				CNPJ,
				InscricaoEstadual,
				DataFundacao
			)

		VALUES

			(
				@IDPessoa,
				@NomeFantasia,
				@RazaoSocial,
				@CNPJ,
				@InscricaoEstadual,
				@DataFundacao
			);

		SELECT @IDPessoa AS Retorno;

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspProdutoConsultarPorCodigoDescricao]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspProdutoConsultarPorCodigoDescricao]
	@IDProduto INT = NULL,
	@Descricao VARCHAR(100) = NULL
AS
BEGIN
	
	IF(@IDProduto IS NOT NULL)
	BEGIN
		
		SELECT
			tblProduto.IDProduto,
			tblProduto.Descricao
		FROM
			tblProduto
		WHERE
			tblProduto.IDProduto = @IDProduto

	END
	ELSE IF(@Descricao IS NOT NULL)
	BEGIN
		
		SELECT
			tblProduto.IDProduto,
			tblProduto.Descricao
		FROM
			tblProduto
		WHERE
			tblProduto.Descricao LIKE '%' + @Descricao +'%'

	END


END
GO
/****** Object:  StoredProcedure [dbo].[uspProdutoInserir]    Script Date: 23/11/2023 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspProdutoInserir]

	@Descricao AS VARCHAR(100)
AS
BEGIN
--EXCECAO (TRY/CATCH)
--TRANSACAO
	BEGIN TRY
			BEGIN TRAN 
				
				
				IF(EXISTS (SELECT IDProduto FROM tblProduto WHERE Descricao = @Descricao))
					RAISERROR ('Produto ja existe com essa descricao', 14,1);
				
				INSERT INTO tblProduto
					(
						Descricao
					)
				VALUES
					(					
						@Descricao
					);

				SELECT @@IDENTITY AS Retorno;

			COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [Drausiotemp2] SET  READ_WRITE 
GO
