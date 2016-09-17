IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_SelecionaPublicacoes') 
DROP PROCEDURE [dbo].[SP_SelecionaPublicacoes]
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
		Paramtros: 
					@IdUsuario = Id do Usuario logado
					@IdPublicacao = Id da primeira ou ultima publicação já carregada
					@Recentes = 0 - Mais antigos (Se for a primeira vez passar 0)
									 1 - Mais recentes									 
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


IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_InserePublicacao') 
DROP PROCEDURE [dbo].[SP_InserePublicacao]
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


IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_AtualizaPublicacao') 
DROP PROCEDURE [dbo].[SP_AtualizaPublicacao]
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


IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_DeletaPublicacao') 
DROP PROCEDURE [dbo].[SP_DeletaPublicacao]
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