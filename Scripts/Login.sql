ALTER PROCEDURE [dbo].[SP_Login]
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
				  EXEC [dbo].[SP_Login] 'brunobarbosa96@hotmail.com', '14012103'
		
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
