USE [master]
GO
/****** Object:  Database [Fimple]    Script Date: 25/09/2016 16:42:34 ******/
CREATE DATABASE [Fimple] ON  PRIMARY 
( NAME = N'Fimple', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\Fimple.mdf' , SIZE = 2240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Fimple_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\Fimple_log.LDF' , SIZE = 560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Fimple] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fimple].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fimple] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fimple] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fimple] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fimple] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fimple] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fimple] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fimple] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fimple] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fimple] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fimple] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fimple] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fimple] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fimple] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fimple] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fimple] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Fimple] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fimple] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fimple] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fimple] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fimple] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fimple] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fimple] SET RECOVERY FULL 
GO
ALTER DATABASE [Fimple] SET  MULTI_USER 
GO
ALTER DATABASE [Fimple] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fimple] SET DB_CHAINING OFF 
GO
USE [Fimple]
GO
/****** Object:  User [Admin]    Script Date: 25/09/2016 16:42:35 ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[Admin]
GO
ALTER ROLE [db_owner] ADD MEMBER [Admin]
GO
/****** Object:  Schema [Admin]    Script Date: 25/09/2016 16:42:35 ******/
CREATE SCHEMA [Admin]
GO
/****** Object:  Table [Admin].[Entidades]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[Entidades](
	[Id] [int] NOT NULL,
	[Nome] [nvarchar](255) NOT NULL,
	[Cep] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEntidade] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComentarioEvento]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComentarioEvento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEvento] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Comentario] [varchar](100) NOT NULL,
	[Data] [datetime] NOT NULL,
	[Ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComentarioPublicacao]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComentarioPublicacao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPublicacao] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Comentario] [varchar](100) NOT NULL,
	[Data] [datetime] NOT NULL,
	[Ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Conversa]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioRemetente] [int] NOT NULL,
	[IdUsuarioDestino] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Curso]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Curso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entidade]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Entidade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Cep] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Descricao] [varchar](150) NOT NULL,
	[Local] [varbinary](50) NOT NULL,
	[Data] [datetime] NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventoUsuarios]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventoUsuarios](
	[IdEvento] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEvento] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mensagem]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mensagem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdConversa] [int] NOT NULL,
	[IdUsuarioEnvio] [int] NOT NULL,
	[Mensagem] [varchar](50) NOT NULL,
	[DataEnvio] [datetime] NOT NULL,
	[DataRecebimento] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notificacao]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdEvento] [int] NULL,
	[IdComentarioEvento] [int] NULL,
	[IdPublicacao] [int] NULL,
	[IdComentarioPublicacao] [int] NULL,
	[IdCurso] [int] NULL,
	[IdEntidade] [int] NULL,
	[IdCategoria] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataVisualizacao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publicacao]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publicacao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdEntidade] [int] NULL,
	[IdCategoria] [int] NULL,
	[IdCurso] [int] NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Conteudo] [text] NOT NULL,
	[Ativa] [bit] NOT NULL,
	[Data] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NOT NULL,
	[Senha] [nvarchar](128) NOT NULL,
	[Rgm] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Sobrenome] [varchar](50) NOT NULL,
	[Apelido] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[DataNascimento] [datetime] NOT NULL,
	[Cep] [int] NULL,
	[DataCadastro] [datetime] NOT NULL,
	[DataUltimoAcesso] [datetime] NOT NULL,
	[DataInicioCurso] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioBloqueado]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioBloqueado](
	[IdUsuarioBloqueado] [int] NOT NULL,
	[IdUsuarioBloqueou] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuarioBloqueado] ASC,
	[IdUsuarioBloqueou] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VisualizacaoPublicacao]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisualizacaoPublicacao](
	[IdPublicacao] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPublicacao] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Entidade] FOREIGN KEY([IdEntidade])
REFERENCES [dbo].[Entidade] ([Id])
GO
ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_Entidade]
GO
ALTER TABLE [dbo].[ComentarioEvento]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioEvento_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([Id])
GO
ALTER TABLE [dbo].[ComentarioEvento] CHECK CONSTRAINT [FK_ComentarioEvento_Evento]
GO
ALTER TABLE [dbo].[ComentarioEvento]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioEvento_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[ComentarioEvento] CHECK CONSTRAINT [FK_ComentarioEvento_Usuario]
GO
ALTER TABLE [dbo].[ComentarioPublicacao]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioPublicacao_Publicacao] FOREIGN KEY([IdPublicacao])
REFERENCES [dbo].[Publicacao] ([Id])
GO
ALTER TABLE [dbo].[ComentarioPublicacao] CHECK CONSTRAINT [FK_ComentarioPublicacao_Publicacao]
GO
ALTER TABLE [dbo].[ComentarioPublicacao]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioPublicacao_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[ComentarioPublicacao] CHECK CONSTRAINT [FK_ComentarioPublicacao_Usuario]
GO
ALTER TABLE [dbo].[Conversa]  WITH CHECK ADD  CONSTRAINT [FK_Conversa_Usuario1] FOREIGN KEY([IdUsuarioRemetente])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Conversa] CHECK CONSTRAINT [FK_Conversa_Usuario1]
GO
ALTER TABLE [dbo].[Conversa]  WITH CHECK ADD  CONSTRAINT [FK_Conversa_Usuario2] FOREIGN KEY([IdUsuarioDestino])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Conversa] CHECK CONSTRAINT [FK_Conversa_Usuario2]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_Curso_Categoria]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Usuario]
GO
ALTER TABLE [dbo].[EventoUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_EventoUsuarios_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([Id])
GO
ALTER TABLE [dbo].[EventoUsuarios] CHECK CONSTRAINT [FK_EventoUsuarios_Evento]
GO
ALTER TABLE [dbo].[EventoUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_EventoUsuarios_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[EventoUsuarios] CHECK CONSTRAINT [FK_EventoUsuarios_Usuario]
GO
ALTER TABLE [dbo].[Mensagem]  WITH CHECK ADD  CONSTRAINT [FK_Mensagem_Conversa] FOREIGN KEY([IdConversa])
REFERENCES [dbo].[Conversa] ([Id])
GO
ALTER TABLE [dbo].[Mensagem] CHECK CONSTRAINT [FK_Mensagem_Conversa]
GO
ALTER TABLE [dbo].[Mensagem]  WITH CHECK ADD  CONSTRAINT [FK_Mensagem_Usuario] FOREIGN KEY([IdUsuarioEnvio])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Mensagem] CHECK CONSTRAINT [FK_Mensagem_Usuario]
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD  CONSTRAINT [FK_Notificacao_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Notificacao] CHECK CONSTRAINT [FK_Notificacao_Categoria]
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD  CONSTRAINT [FK_Notificacao_ComentarioEvento] FOREIGN KEY([IdComentarioEvento])
REFERENCES [dbo].[ComentarioEvento] ([Id])
GO
ALTER TABLE [dbo].[Notificacao] CHECK CONSTRAINT [FK_Notificacao_ComentarioEvento]
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD  CONSTRAINT [FK_Notificacao_ComentarioPublicacao] FOREIGN KEY([IdComentarioPublicacao])
REFERENCES [dbo].[ComentarioPublicacao] ([Id])
GO
ALTER TABLE [dbo].[Notificacao] CHECK CONSTRAINT [FK_Notificacao_ComentarioPublicacao]
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD  CONSTRAINT [FK_Notificacao_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([Id])
GO
ALTER TABLE [dbo].[Notificacao] CHECK CONSTRAINT [FK_Notificacao_Curso]
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD  CONSTRAINT [FK_Notificacao_Entidade] FOREIGN KEY([IdEntidade])
REFERENCES [dbo].[Entidade] ([Id])
GO
ALTER TABLE [dbo].[Notificacao] CHECK CONSTRAINT [FK_Notificacao_Entidade]
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD  CONSTRAINT [FK_Notificacao_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([Id])
GO
ALTER TABLE [dbo].[Notificacao] CHECK CONSTRAINT [FK_Notificacao_Evento]
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD  CONSTRAINT [FK_Notificacao_Publicacao] FOREIGN KEY([IdPublicacao])
REFERENCES [dbo].[Publicacao] ([Id])
GO
ALTER TABLE [dbo].[Notificacao] CHECK CONSTRAINT [FK_Notificacao_Publicacao]
GO
ALTER TABLE [dbo].[Notificacao]  WITH CHECK ADD  CONSTRAINT [FK_Notificacao_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Notificacao] CHECK CONSTRAINT [FK_Notificacao_Usuario]
GO
ALTER TABLE [dbo].[Publicacao]  WITH CHECK ADD  CONSTRAINT [FK_Publicacao_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Publicacao] CHECK CONSTRAINT [FK_Publicacao_Categoria]
GO
ALTER TABLE [dbo].[Publicacao]  WITH CHECK ADD  CONSTRAINT [FK_Publicacao_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([Id])
GO
ALTER TABLE [dbo].[Publicacao] CHECK CONSTRAINT [FK_Publicacao_Curso]
GO
ALTER TABLE [dbo].[Publicacao]  WITH CHECK ADD  CONSTRAINT [FK_Publicacao_Entidade] FOREIGN KEY([IdEntidade])
REFERENCES [dbo].[Entidade] ([Id])
GO
ALTER TABLE [dbo].[Publicacao] CHECK CONSTRAINT [FK_Publicacao_Entidade]
GO
ALTER TABLE [dbo].[Publicacao]  WITH CHECK ADD  CONSTRAINT [FK_Publicacao_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Publicacao] CHECK CONSTRAINT [FK_Publicacao_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Curso]
GO
ALTER TABLE [dbo].[UsuarioBloqueado]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioBloqueado_Usuario1] FOREIGN KEY([IdUsuarioBloqueado])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[UsuarioBloqueado] CHECK CONSTRAINT [FK_UsuarioBloqueado_Usuario1]
GO
ALTER TABLE [dbo].[UsuarioBloqueado]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioBloqueado_Usuario2] FOREIGN KEY([IdUsuarioBloqueou])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[UsuarioBloqueado] CHECK CONSTRAINT [FK_UsuarioBloqueado_Usuario2]
GO
ALTER TABLE [dbo].[VisualizacaoPublicacao]  WITH CHECK ADD  CONSTRAINT [FK_VisualizacaoPublicacao_Publicacao] FOREIGN KEY([IdPublicacao])
REFERENCES [dbo].[Publicacao] ([Id])
GO
ALTER TABLE [dbo].[VisualizacaoPublicacao] CHECK CONSTRAINT [FK_VisualizacaoPublicacao_Publicacao]
GO
ALTER TABLE [dbo].[VisualizacaoPublicacao]  WITH CHECK ADD  CONSTRAINT [FK_VisualizacaoPublicacao_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[VisualizacaoPublicacao] CHECK CONSTRAINT [FK_VisualizacaoPublicacao_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[SP_AtualizaPublicacao]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AtualizaPublicacao]
	@IdPublicacao	int,
	@IdUsuario		int,
	@Titulo			varchar(50),
	@Conteudo		text,
	@IdEntidade	int = NULL,
	@IdCategoria	int = NULL,
	@IdCurso		int = NULL
		
AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: Publicacao.sql
		Autor: Bruno Barbosa
		Data: 01/09/2016
		Objetivo: Atualiza uma publicacao
		Exemplo: 
				  EXEC [dbo].[SP_AtualizaPublicacao]
		
	**/

		UPDATE [dbo].[Publicacao] 
			SET IdUsuario = @IdUsuario,
				IdEntidade = @IdEntidade, 
				IdCategoria = @IdCategoria, 
				IdCurso = @IdCurso, 
				Titulo = @Titulo, 
				Conteudo = @Conteudo
			WHERE Id = @IdPublicacao

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_AtualizaUsuario]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AtualizaUsuario]
	@Id					int, 
	@IdCurso			int, 
	@Senha				nvarchar(128), 
	@Rgm				int, 
	@Nome				varchar(50), 
	@Sobrenome			varchar(50), 
	@Apelido			varchar(50) = NULL, 
	@Email				varchar(50), 
	@DataNascimento		datetime, 
	@Cep				int = NULL, 
	@DataInicioCurso	datetime
		
AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: Usuario.sql
		Autor: Bruno Barbosa
		Data: 01/09/2016
		Objetivo: Atualiza uma Usuario
		Exemplo: 
				  EXEC [dbo].[SP_AtualizaUsuario]
		
	**/

		UPDATE [dbo].[Usuario] 
			SET IdCurso				= @IdCurso, 
				Senha 				= @Senha,
				Rgm 				= @Rgm,
				Nome 				= @Nome,
				Sobrenome 			= @Sobrenome,
				Apelido 			= @Apelido,
				Email 				= @Email,
				DataNascimento 		= @DataNascimento,
				Cep 				= @Cep,
				DataUltimoAcesso 	= GETDATE(),
				DataInicioCurso		= @DataInicioCurso
			WHERE Id = @Id

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_BuscaUsuarioBloqueado]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscaUsuarioBloqueado]
@IdUsuarioBloqueou			int,
@IdUsuarioBloqueado			int

AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: UsuarioBloqueado.sql
		Autor: Douglas Karpinski
		Data: 18/09/2016
		Objetivo: Busca Usuario bloqueado
		Exemplo: EXEC [dbo].[SP_BuscaUsuarioBloqueado]1,2
	**/


	SELECT  IdUsuarioBloqueado,
			u.Nome,
			u.Sobrenome,
			u.Apelido,
			c.Nome
		FROM [dbo].[UsuarioBloqueado] ub WITH(NOLOCK)
			INNER JOIN [dbo].[Usuario] u WITH(NOLOCK)
				ON ub.IdUsuarioBloqueado = u.Id
			INNER JOIN [dbo].[Curso] c WITH(NOLOCK)
				ON u.IdCurso = c.Id
		WHERE ub.IdUsuarioBloqueou = @IdUsuarioBloqueou
			AND ub.IdUsuarioBloqueado = @IdUsuarioBloqueado
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_DeletaPublicacao]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeletaPublicacao]
	@Id	int

AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: Publicacao.sql
		Autor: Bruno Barbosa
		Data: 01/09/2016
		Objetivo: Desativa uma publicacao
		Exemplo: 
				  EXEC [dbo].[SP_DeletaPublicacao]
		
	**/

		UPDATE [dbo].[Publicacao] 
			SET Ativa = 0
			WHERE Id = @Id

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_DeletaUsuarioBloqueado]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeletaUsuarioBloqueado]
@IdUsuarioBloqueou			int,
@IdUsuarioBloqueado			int

AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: UsuarioBloqueado.sql
		Autor: Douglas Karpinski
		Data: 18/09/2016
		Objetivo: deleta Usuario bloqueado
		Exemplo: EXEC [dbo].[SP_DeletaUsuarioBloqueado]1,2
	**/


	DELETE FROM [dbo].[UsuarioBloqueado] 
		WHERE IdUsuarioBloqueado	= @IdUsuarioBloqueado
			AND IdUsuarioBloqueou	= @IdUsuarioBloqueou
			
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_InserePublicacao]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InserePublicacao]
	@IdUsuario		int,
	@Titulo			varchar(50),
	@Conteudo		text,
	@IdEntidade		int = NULL,
	@IdCategoria	int = NULL,
	@IdCurso		int = NULL

AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: Publicacao.sql
		Autor: Bruno Barbosa
		Data: 01/09/2016
		Objetivo: Insere uma publicacao
		Exemplo: 
				  EXEC [dbo].[SP_InserePublicacao] 1, 'Minha primeira publicação', 'Meu primeiro conteúdo de publicação!!!!', 1, 1, 1
		
	**/
	
		INSERT INTO [dbo].[Publicacao] (IdUsuario, IdEntidade, IdCategoria, IdCurso, Titulo, Conteudo, Ativa, Data)
			VALUES(@IdUsuario, @IdEntidade, @IdCategoria, @IdCurso, @Titulo, @Conteudo, 1, GETDATE())

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsereUsuario]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsereUsuario]
	@IdCurso			int, 
	@Senha				nvarchar(128), 
	@Rgm				int, 
	@Nome				varchar(50), 
	@Sobrenome			varchar(50), 
	@Apelido			varchar(50) = NULL, 
	@Email				varchar(50), 
	@DataNascimento		datetime, 
	@Cep				int = NULL, 
	@DataInicioCurso	datetime


AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: Usuario.sql
		Autor: Bruno Barbosa
		Data: 17/09/2016
		Objetivo: Insere um Usuario
		Exemplo: 
				  EXEC [dbo].[SP_InsereUsuario]
		
	**/
	
		INSERT INTO [dbo].[Usuario] (IdCurso, Senha, Rgm, Nome, Sobrenome, Apelido, Email, DataNascimento, Cep, DataCadastro, DataUltimoAcesso, DataInicioCurso)
			VALUES(@IdCurso, @Senha, @Rgm, @Nome, @Sobrenome, @Apelido, @Email, @DataNascimento, @Cep, GETDATE(), GETDATE(),  @DataInicioCurso)

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsereUsuarioBloqueado]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsereUsuarioBloqueado]
@IdUsuarioBloqueou			int,
@IdUsuarioBloqueado			int

AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: UsuarioBloqueado.sql
		Autor: Douglas Karpinski
		Data: 18/09/2016
		Objetivo: insere Usuario bloqueado
		Exemplo: EXEC [dbo].[SP_InsereUsuarioBloqueado]2,4
	**/


	INSERT INTO [dbo].[UsuarioBloqueado](IdUsuarioBloqueado, IdUsuarioBloqueou)
		VALUES(@IdUsuarioBloqueado, @IdUsuarioBloqueou)
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Login]
	@Email varchar(50),
	@Senha varchar(128)

AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: Login.sql
		Autor: Bruno Barbosa
		Data: 25/07/2016
		Objetivo: Verificar se login é valido e retornar dados do usuário
		Exemplo: 
				  EXEC [dbo].[SP_Login] '14012103, '14012103'
		
	**/

	SELECT Id,
		   Rgm,
		   Nome,
		   Sobrenome,
		   Apelido,
		   Email,
		   DataNascimento
		FROM [dbo].[Usuario] WITH(NOLOCK)
		WHERE (Email LIKE @Email OR CAST(Rgm AS varchar(10)) = @Email)
			AND Senha = @Senha

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_SelecionaPublicacoes]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelecionaPublicacoes]

AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: Publicacao.sql
		Autor: Bruno Barbosa
		Data: 01/09/2016
		Objetivo: Lista publicações para determinado usuário
		Exemplo: 
				  EXEC [dbo].[SP_SelecionaPublicacoes] 
		
	**/


	SELECT  p.Id,
			p.IdUsuario,
			u.Nome,
			p.Titulo,
			p.Conteudo,
			p.Data
		FROM [dbo].[Publicacao] p WITH(NOLOCK)
			INNER JOIN [dbo].[Usuario] u WITH(NOLOCK)
				ON u.Id = p.IdUsuario
		WHERE p.Ativa = 1
		ORDER BY p.Data DESC

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_SelecionaUsuario]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelecionaUsuario]
	@Id int

AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: Usuario.sql
		Autor: Bruno Barbosa
		Data: 17/09/2016
		Objetivo: Lista todos os Usuarios do sistema
		Exemplo: 
				  EXEC [dbo].[SP_SelecionaUsuario] 
		
	**/


	SELECT  Id, 
			IdCurso,
			Senha,                                                                                                                    
			Rgm,
			Nome,                                      
			Sobrenome,                                     
			Apelido,                                    
			Email,                                   
			DataNascimento,       
			Cep,
			DataCadastro,           
			DataUltimoAcesso,
			DataInicioCurso
		FROM [dbo].[Usuario] WITH(NOLOCK)
		WHERE Id = @Id

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_SelecionaUsuarios]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelecionaUsuarios]

AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: Usuario.sql
		Autor: Bruno Barbosa
		Data: 17/09/2016
		Objetivo: Lista todos os Usuarios do sistema
		Exemplo: 
				  EXEC [dbo].[SP_SelecionaUsuarios] 
		
	**/


	SELECT  Id, 
			IdCurso,
			Senha,                                                                                                                    
			Rgm,
			Nome,                                      
			Sobrenome,                                     
			Apelido,                                    
			Email,                                   
			DataNascimento,       
			Cep,
			DataCadastro,           
			DataUltimoAcesso,
			DataInicioCurso
		FROM [dbo].[Usuario] WITH(NOLOCK)

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_SelecionaUsuariosBloqueados]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelecionaUsuariosBloqueados]
	@IdUsuarioBloqueou			int

AS
	BEGIN 
	
	/**
		Documentação:
		Arquivo Fonte: UsuarioBloqueado.sql
		Autor: Douglas Karpinski
		Data: 18/09/2016
		Objetivo: Lista todos os Usuarios bloqueados do sistema
		Exemplo: EXEC [dbo].[SP_SelecionaUsuariosBloqueados] 2
	**/


	SELECT  ub.IdUsuarioBloqueado,
			u.Nome,
			u.Sobrenome,
			u.Apelido,
			c.Nome
		FROM [dbo].[UsuarioBloqueado] ub  WITH(NOLOCK)
			INNER JOIN [dbo].[Usuario] u WITH(NOLOCK)
				ON ub.IdUsuarioBloqueado = u.Id
			INNER JOIN [dbo].[Curso] c WITH(NOLOCK)
				ON u.IdCurso = c.Id
		WHERE ub.IdUsuarioBloqueou = @IdUsuarioBloqueou	

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_SelExemploUsuarios]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelExemploUsuarios]
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: ArquivoFonte.sql
	Objetivo..........: Objetivo
	Autor.............: Bruno Barbosa
 	Data..............: 14/07/2016
	Ex................: EXEC [dbo].[SP_SelUsuarios]
	*/

	BEGIN
		
		CREATE TABLE #Usuario (id int,
					   name varchar(50),
					   birth datetime)

		INSERT INTO #Usuario (id, name, birth)
			VALUES (1, 'Bruno Barbosa', '1996-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (2, 'Mariazinha', '1980-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (3, 'Zézinho', '1990-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (4, 'Thayná', '1995-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (5, 'Ana', '2000-03-28')

		SELECT * FROM #Usuario 
	
	DROP TABLE #Usuario
		
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_SelExemploUsuariosId]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SelExemploUsuariosId]
	@id int

	AS

	/*
	Documentação
	Arquivo Fonte.....: ArquivoFonte.sql
	Objetivo..........: Objetivo
	Autor.............: Bruno Barbosa
 	Data..............: 14/07/2016
	Ex................: EXEC [dbo].[SP_SelUsuariosId] 1
	*/

	BEGIN
		
		CREATE TABLE #Usuario (id int,
					   name varchar(50),
					   birth datetime)

		INSERT INTO #Usuario (id, name, birth)
			VALUES (1, 'Bruno Barbosa', '1996-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (2, 'Mariazinha', '1980-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (3, 'Zézinho', '1990-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (4, 'Thayná', '1995-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (5, 'Ana', '2000-03-28')

		SELECT * FROM #Usuario WHERE id = @id
		
		DROP TABLE #Usuario

	END

GO
/****** Object:  StoredProcedure [dbo].[SP_SelExemploUsuariosNome]    Script Date: 25/09/2016 16:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SelExemploUsuariosNome]
	@name varchar(50)

	AS

	/*
	Documentação
	Arquivo Fonte.....: ArquivoFonte.sql
	Objetivo..........: Objetivo
	Autor.............: Bruno Barbosa
 	Data..............: 14/07/2016
	Ex................: EXEC [dbo].[SP_SelUsuariosNome] 'maria' 
	*/

	BEGIN
		
		CREATE TABLE #Usuario (id int,
					   name varchar(50),
					   birth datetime)

		INSERT INTO #Usuario (id, name, birth)
			VALUES (1, 'Bruno Barbosa', '1996-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (2, 'Mariazinha', '1980-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (3, 'Zézinho', '1990-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (4, 'Thayná', '1995-03-28')
	
		INSERT INTO #Usuario (id, name, birth)
			VALUES (5, 'Ana', '2000-03-28')

		SELECT TOP 1 * FROM #Usuario WHERE name LIKE '%' + @name + '%'
		
		DROP TABLE #Usuario

	END

GO
USE [master]
GO
ALTER DATABASE [Fimple] SET  READ_WRITE 
GO
