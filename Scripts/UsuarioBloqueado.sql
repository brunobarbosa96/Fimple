IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_SelecionaUsuariosBloqueados') DROP PROCEDURE [dbo].[SP_SelecionaUsuariosBloqueados]
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
		Exemplo: EXEC [dbo].[SP_SelecionaUsuariosBloqueados] 1
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







IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_BuscaUsuarioBloqueado') DROP PROCEDURE [dbo].[SP_BuscaUsuarioBloqueado]
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
		Exemplo: EXEC [dbo].[SP_BuscaUsuarioBloqueado]
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
			AND 
	END
GO