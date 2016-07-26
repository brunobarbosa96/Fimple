CREATE PROCEDURE [dbo].[SP_Login]
	@Login varchar(50),
	@Senha varchar(128)
AS
	BEGIN 
	
	/**
		Documenta��o:
		Arquivo Fonte: Login.sql
		Autor: Bruno Barbosa
		Data: 25/07/2016
		Objetivo: Verificar se login � valido e retornar dados do usu�rio
		Exemplo: 
				  EXEC [dbo].[SP_Login] 'brunobarbosa96@hotmail.com', '14012103'
		
	**/

	SELECT Rgm,
		   Nome,
		   Sobrenome,
		   Apelido,
		   Email,
		   DataNascimento
		FROM [dbo].[Usuario]
		WHERE (Email LIKE @Login OR CAST(Rgm AS varchar(10)) = @Login)
			AND Senha = @Senha

	END
GO


