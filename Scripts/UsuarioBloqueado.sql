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







IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_InsereUsuarioBloqueado') DROP PROCEDURE [dbo].[SP_InsereUsuarioBloqueado]
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





IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_DeletaUsuarioBloqueado') DROP PROCEDURE [dbo].[SP_DeletaUsuarioBloqueado]
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




