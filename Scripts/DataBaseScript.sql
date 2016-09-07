USE [Fimple]
GO

/****** Object: Table [dbo].[Usuario] Script Date: 16/07/2016 22:15:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Entidade] (
    [Id]   INT          IDENTITY (1, 1) NOT NULL,
    [Nome] VARCHAR (50) NOT NULL,
    [Cep]  INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Categoria] (
    [Id]         INT          IDENTITY (1, 1) NOT NULL,
    [IdEntidade] INT          NOT NULL,
    [Nome]       VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Categoria_Entidade] FOREIGN KEY ([IdEntidade]) REFERENCES [dbo].[Entidade] ([Id])
);

CREATE TABLE [dbo].[Curso] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [IdCategoria] INT          NOT NULL,
    [Nome]        VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Curso_Categoria] FOREIGN KEY ([IdCategoria]) REFERENCES [dbo].[Categoria] ([Id])
);

CREATE TABLE [dbo].[Usuario] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [IdCurso]          INT            NOT NULL,
    [Senha]            NVARCHAR (128) NOT NULL,
    [Rgm]              INT            NOT NULL,
    [Nome]             VARCHAR (50)   NOT NULL,
    [Sobrenome]        VARCHAR (50)   NOT NULL,
    [Apelido]          VARCHAR (50)   NULL,
    [Email]            VARCHAR (50)   NOT NULL,
    [DataNascimento]   DATETIME       NOT NULL,
    [Cep]              INT            NULL,
    [DataCadastro]     DATETIME       NOT NULL,
    [DataUltimoAcesso] DATETIME       NOT NULL,
    [DataInicioCurso]  DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Usuario_Curso] FOREIGN KEY ([IdCurso]) REFERENCES [dbo].[Curso] ([Id])
);

CREATE TABLE [dbo].[Notificacao] (
    [Id]                     INT      IDENTITY (1, 1) NOT NULL,
    [IdUsuario]              INT      NULL,
    [IdEvento]               INT      NULL,
    [IdComentarioEvento]     INT      NULL,
    [IdPublicacao]           INT      NULL,
    [IdComentarioPublicacao] INT      NULL,
    [IdCurso]                INT      NULL,
    [IdEntidade]             INT      NULL,
    [IdCategoria]            INT      NULL,
    [DataCadastro]           DATETIME NOT NULL,
    [DataVisualizacao]       DATETIME NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Notificacao_Evento] FOREIGN KEY ([IdEvento]) REFERENCES [dbo].[Evento] ([Id]),
    CONSTRAINT [FK_Notificacao_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [FK_Notificacao_ComentarioEvento] FOREIGN KEY ([IdComentarioEvento]) REFERENCES [dbo].[ComentarioEvento] ([Id]),
    CONSTRAINT [FK_Notificacao_Publicacao] FOREIGN KEY ([IdPublicacao]) REFERENCES [dbo].[Publicacao] ([Id]),
    CONSTRAINT [FK_Notificacao_ComentarioPublicacao] FOREIGN KEY ([IdComentarioPublicacao]) REFERENCES [dbo].[ComentarioPublicacao] ([Id]),
    CONSTRAINT [FK_Notificacao_Entidade] FOREIGN KEY ([IdEntidade]) REFERENCES [dbo].[Entidade] ([Id]),
    CONSTRAINT [FK_Notificacao_Curso] FOREIGN KEY ([IdCurso]) REFERENCES [dbo].[Curso] ([Id]),
    CONSTRAINT [FK_Notificacao_Categoria] FOREIGN KEY ([IdCategoria]) REFERENCES [dbo].[Categoria] ([Id])
);

CREATE TABLE [dbo].[Publicacao] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [IdUsuario]   INT          NOT NULL,
    [IdEntidade]  INT          NULL,
    [IdCategoria] INT          NULL,
    [IdCurso]     INT          NULL,
    [Titulo]      VARCHAR (50) NOT NULL,
    [Conteudo]    TEXT         NOT NULL,
    [Ativa]       BIT          NOT NULL,
    [Data]        DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Publicacao_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [FK_Publicacao_Entidade] FOREIGN KEY ([Id]) REFERENCES [dbo].[Entidade] ([Id]),
    CONSTRAINT [FK_Publicacao_Categoria] FOREIGN KEY ([IdCategoria]) REFERENCES [dbo].[Categoria] ([Id]),
    CONSTRAINT [FK_Publicacao_Curso] FOREIGN KEY ([IdCurso]) REFERENCES [dbo].[Curso] ([Id])
);

CREATE TABLE [dbo].[ComentarioPublicacao] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [IdPublicacao] INT           NOT NULL,
    [IdUsuario]    INT           NOT NULL,
    [Comentario]   VARCHAR (100) NOT NULL,
    [Data]         DATETIME      NOT NULL,
    [Ativo]        BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ComentarioPublicacao_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [FK_ComentarioPublicacao_Publicacao] FOREIGN KEY ([IdPublicacao]) REFERENCES [dbo].[Publicacao] ([Id])
);

CREATE TABLE [dbo].[VisualizacaoPublicacao] (
    [IdPublicacao] INT      NOT NULL,
    [IdUsuario]    INT      NOT NULL,
    [Data]         DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([IdPublicacao] ASC, [IdUsuario] ASC),
    CONSTRAINT [FK_VisualizacaoPublicacao_Publicacao] FOREIGN KEY ([IdPublicacao]) REFERENCES [dbo].[Publicacao] ([Id]),
    CONSTRAINT [FK_VisualizacaoPublicacao_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id])
);

CREATE TABLE [dbo].[Evento] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [IdUsuario]    INT            NOT NULL,
    [Descricao]    VARCHAR (150)  NOT NULL,
    [Local]        VARBINARY (50) NOT NULL,
    [Data]         DATETIME       NOT NULL,
    [DataCadastro] DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Evento_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id])
);

CREATE TABLE [dbo].[ComentarioEvento] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [IdEvento]   INT           NOT NULL,
    [IdUsuario]  INT           NOT NULL,
    [Comentario] VARCHAR (100) NOT NULL,
    [Data]       DATETIME      NOT NULL,
    [Ativo]      BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ComentarioEvento_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [FK_ComentarioEvento_Evento] FOREIGN KEY ([IdEvento]) REFERENCES [dbo].[Evento] ([Id])
);

CREATE TABLE [dbo].[EventoUsuarios] (
    [IdEvento]  INT NOT NULL,
    [IdUsuario] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([IdEvento] ASC, [IdUsuario] ASC),
    CONSTRAINT [FK_EventoUsuarios_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [FK_EventoUsuarios_Evento] FOREIGN KEY ([IdEvento]) REFERENCES [dbo].[Evento] ([Id])
);

CREATE TABLE [dbo].[Conversa] (
    [Id]                 INT      IDENTITY (1, 1) NOT NULL,
    [IdUsuarioRemetente] INT      NOT NULL,
    [IdUsuarioDestino]   INT      NOT NULL,
    [Data]               DATETIME NOT NULL,
    [Ativo]              BIT      NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Conversa_Usuario1] FOREIGN KEY ([IdUsuarioRemetente]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [FK_Conversa_Usuario2] FOREIGN KEY ([IdUsuarioDestino]) REFERENCES [dbo].[Usuario] ([Id])
);

CREATE TABLE [dbo].[Mensagem] (
    [Id]              INT          IDENTITY (1, 1) NOT NULL,
    [IdConversa]      INT          NOT NULL,
    [IdUsuarioEnvio]  INT          NOT NULL,
    [Mensagem]        VARCHAR (50) NOT NULL,
    [DataEnvio]       DATETIME     NOT NULL,
    [DataRecebimento] DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Mensagem_Conversa] FOREIGN KEY ([IdConversa]) REFERENCES [dbo].[Conversa] ([Id]),
    CONSTRAINT [FK_Mensagem_Usuario] FOREIGN KEY ([IdUsuarioEnvio]) REFERENCES [dbo].[Usuario] ([Id])
);

CREATE TABLE [dbo].[UsuarioBloqueado] (
    [IdUsuarioBloqueado] INT NOT NULL,
    [IdUsuarioBloqueou]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([IdUsuarioBloqueado] ASC, [IdUsuarioBloqueou] ASC),
    CONSTRAINT [FK_UsuarioBloqueado_Usuario1] FOREIGN KEY ([IdUsuarioBloqueado]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [FK_UsuarioBloqueado_Usuario2] FOREIGN KEY ([IdUsuarioBloqueou]) REFERENCES [dbo].[Usuario] ([Id])
);



