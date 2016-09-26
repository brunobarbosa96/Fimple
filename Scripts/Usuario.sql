IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_SelecionaUsuarios') DROP PROCEDURE [dbo].[SP_SelecionaUsuarios]
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


IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_SelecionaUsuario') DROP PROCEDURE [dbo].[SP_SelecionaUsuario]
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
				  EXEC [dbo].[SP_SelecionaUsuario]  2 
		
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


IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_InsereUsuario') DROP PROCEDURE [dbo].[SP_InsereUsuario]
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

		SELECT SCOPE_IDENTITY() AS Id

	END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE name like 'SP_AtualizaUsuario') DROP PROCEDURE [dbo].[SP_AtualizaUsuario]
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
