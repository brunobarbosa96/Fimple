ALTER PROCEDURE [dbo].[SP_SelExemploUsuarios]
	
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

ALTER PROCEDURE [dbo].[SP_SelExemploUsuariosId]
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

ALTER PROCEDURE [dbo].[SP_SelExemploUsuariosNome]
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
