USE [Fimple]
GO

/****** Object: Table [dbo].[Usuario] Script Date: 16/07/2016 22:15:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- USUARIO
CREATE TABLE [dbo].[Usuario] (
    [IdUsuario]      INT            IDENTITY (1, 1) NOT NULL,
    [Senha]          NVARCHAR (128) NOT NULL,
    [Rgm]            INT            NOT NULL,
    [Nome]           VARCHAR (50)   NOT NULL,
    [Sobrenome]      VARCHAR (50)   NOT NULL,
    [Apelido]        VARCHAR (50)   NULL,
    [Email]          VARCHAR (50)   NOT NULL,
    [DataNascimento] DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([IdUsuario] ASC)
);

-- CURSO
CREATE TABLE [dbo].[Curso] (
    [IdCurso]     INT          IDENTITY (1, 1) NOT NULL,
    [IdTipoCurso] INT          DEFAULT ((1)) NOT NULL,
    [Nome]        VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdCurso] ASC),
    CONSTRAINT [FK_Curso_TipoCurso] FOREIGN KEY ([IdTipoCurso]) REFERENCES [dbo].[TipoCurso] ([IdTipoCurso])
);

-- USUARIO CURSO
CREATE TABLE [dbo].[UsuarioCurso] (
    [IdUsuarioCurso] INT      IDENTITY (1, 1) NOT NULL,
    [IdUsuario]      INT      NOT NULL,
    [IdCurso]        INT      NOT NULL,
    [DataInicio]     DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([IdUsuarioCurso] ASC),
    CONSTRAINT [FK_UsuarioCurso_Curso] FOREIGN KEY ([IdCurso]) REFERENCES [dbo].[Curso] ([IdCurso]),
    CONSTRAINT [FK_UsuarioCurso_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([IdUsuario])
);

-- CONVERSA
CREATE TABLE [dbo].[Conversa] (
    [IdConversa]         INT      IDENTITY (1, 1) NOT NULL,
    [IdUsuarioRemetente] INT      NOT NULL,
    [IdUsuarioDestino]   INT      NOT NULL,
    [Ativa]              BIT      DEFAULT ((1)) NOT NULL,
    [DataCriacao]        DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([IdConversa] ASC),
    CONSTRAINT [FK_Conversa_UsuarioRemetente] FOREIGN KEY ([IdUsuarioRemetente]) REFERENCES [dbo].[Usuario] ([IdUsuario]),
    CONSTRAINT [FK_Conversa_UsuarioDestino] FOREIGN KEY ([IdUsuarioDestino]) REFERENCES [dbo].[Usuario] ([IdUsuario])
);


-- MENSAGEM
CREATE TABLE [dbo].[Mensagem] (
    [IdMensagem]      INT      IDENTITY (1, 1) NOT NULL,
    [IdConversa]      INT      NOT NULL,
    [Mensagem]        TEXT     NOT NULL,
    [DataEnvio]       DATETIME NOT NULL,
    [DataRecebimento] DATETIME NULL,
    PRIMARY KEY CLUSTERED ([IdMensagem] ASC),
    CONSTRAINT [FK_Mensagem_Conversa] FOREIGN KEY ([IdConversa]) REFERENCES [dbo].[Conversa] ([IdConversa])
);

-- NOTIFICACAO
CREATE TABLE [dbo].[Notificacao] (
    [IdNotificacao]         INT          IDENTITY (1, 1) NOT NULL,
    [IdUsuarioNotificacao]  INT          NOT NULL,
    [Notificacao]           VARCHAR (50) NOT NULL,
    [DataNotificacao]       DATETIME     NOT NULL,
    [DataUsuarioNotificado] DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([IdNotificacao] ASC),
    CONSTRAINT [FK_Notificacao_Usuario] FOREIGN KEY ([IdUsuarioNotificacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
);

-- PUBLICACAO
CREATE TABLE [dbo].[Publicacao] (
    [IdPublicacao]     INT          IDENTITY (1, 1) NOT NULL,
    [IdCurso]          INT          NULL,
    [IdTipoPublicacao] INT          NOT NULL,
    [IdUsuarioCriacao] INT          NOT NULL,
    [Titulo]           VARCHAR (50) NOT NULL,
    [Conteudo]         TEXT         NOT NULL,
    [Ativa]            BIT          DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdPublicacao] ASC),
    CONSTRAINT [FK_Publicacao_TipoPublicacao] FOREIGN KEY ([IdTipoPublicacao]) REFERENCES [dbo].[TipoPublicacao] ([IdTipoPublicacao]),
    CONSTRAINT [FK_Publicacao_Curso] FOREIGN KEY ([IdCurso]) REFERENCES [dbo].[Curso] ([IdCurso]),
    CONSTRAINT [FK_Publicacao_Usuario] FOREIGN KEY ([IdUsuarioCriacao]) REFERENCES [dbo].[Usuario] ([IdUsuario])
);

-- TIPO CURSO
CREATE TABLE [dbo].[TipoCurso] (
    [IdTipoCurso]   INT          IDENTITY (1, 1) NOT NULL,
    [NomeTipoCurso] VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdTipoCurso] ASC)
);

-- TIPO PUBLICACAO
CREATE TABLE [dbo].[TipoPublicacao] (
    [IdTipoPublicacao]   INT          IDENTITY (1, 1) NOT NULL,
    [NomeTipoPublicacao] VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdTipoPublicacao] ASC)
);



