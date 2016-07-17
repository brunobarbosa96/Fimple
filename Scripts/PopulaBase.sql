USE Fimple

-- TIPO CURSO
SET IDENTITY_INSERT [dbo].[TipoCurso] ON
INSERT INTO [dbo].[TipoCurso] ([IdTipoCurso], [NomeTipoCurso]) VALUES (1, N'GRADUAÇÂO')
INSERT INTO [dbo].[TipoCurso] ([IdTipoCurso], [NomeTipoCurso]) VALUES (2, N'TÉCNICO')
INSERT INTO [dbo].[TipoCurso] ([IdTipoCurso], [NomeTipoCurso]) VALUES (3, N'PÓS GRADUAÇÂO')
INSERT INTO [dbo].[TipoCurso] ([IdTipoCurso], [NomeTipoCurso]) VALUES (4, N'EXTENÇÂO')
SET IDENTITY_INSERT [dbo].[TipoCurso] OFF

-- TIPO PUBLICACAO
SET IDENTITY_INSERT [dbo].[TipoPublicacao] ON
INSERT INTO [dbo].[TipoPublicacao] ([IdTipoPublicacao], [NomeTipoPublicacao]) VALUES (1, N'EVENTO')
INSERT INTO [dbo].[TipoPublicacao] ([IdTipoPublicacao], [NomeTipoPublicacao]) VALUES (2, N'PUBLICAÇÂO')
SET IDENTITY_INSERT [dbo].[TipoPublicacao] OFF

-- CURSO
SET IDENTITY_INSERT [dbo].[Curso] ON
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (1, 1, N'ADMINISTRAÇÃO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (2, 1, N'AGRONEGÓCIO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (3, 1, N'CIÊNCIAS CONTÁBEIS
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (4, 1, N'CIÊNCIAS ECONÔMICAS
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (5, 1, N'COMÉRCIO EXTERIOR
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (6, 1, N'DIREITO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (7, 1, N'GESTÃO COMERCIAL
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (8, 1, N'GESTÃO DE RECURSOS HUMANOS
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (9, 1, N'GESTÃO FINANCEIRA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (10, 1, N'LOGÍSTICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (11, 1, N'MARKETING
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (12, 1, N'PROCESSOS GERENCIAIS
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (13, 1, N'RELAÇÕES INTERNACIONAIS
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (14, 1, N'SEGURANÇA NO TRABALHO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (15, 1, N'CIÊNCIAS BIOLÓGICAS E DA SAÚDE
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (16, 1, N'BIOMEDICINA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (17, 1, N'CIÊNCIAS BIOLÓGICAS (Bacharelado)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (18, 1, N'CIÊNCIAS BIOLÓGICAS (Licenciatura)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (19, 1, N'EDUCAÇÃO FÍSICA (Bacharelado)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (20, 1, N'EDUCAÇÃO FÍSICA (Licenciatura)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (21, 1, N'ENFERMAGEM
 ')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (22, 1, N'ESTÉTICA E COSMÉTICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (23, 1, N'FARMÁCIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (24, 1, N'FISIOTERAPIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (25, 1, N'FONOAUDIOLOGIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (26, 1, N'GASTRONOMIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (27, 1, N'MEDICINA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (28, 1, N'MEDICINA VETERINÁRIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (29, 1, N'NUTRIÇÃO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (30, 1, N'ODONTOLOGIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (31, 1, N'PSICOLOGIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (32, 1, N'RADIOLOGIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (33, 1, N'ANÁLISE E DESENVOLVIMENTO DE SISTEMAS
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (34, 1, N'CIÊNCIA DA COMPUTAÇÃO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (35, 1, N'ENGENHARIA AGRONÔMICA (AGRONOMIA)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (36, 1, N'ENGENHARIA CIVIL
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (37, 1, N'ENGENHARIA DE PRODUÇÃO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (38, 1, N'ENGENHARIA ELÉTRICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (39, 1, N'ENGENHARIA MECÂNICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (40, 1, N'ENGENHARIA MECATRÔNICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (41, 1, N'ENGENHARIA QUÍMICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (42, 1, N'FÍSICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (43, 1, N'GESTÃO AMBIENTAL
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (44, 1, N'MANUTENÇÃO INDUSTRIAL
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (45, 1, N'MATEMÁTICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (46, 1, N'MECATRÔNICA INDUSTRIAL
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (47, 1, N'PRODUÇÃO SUCROALCOOLEIRA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (48, 1, N'QUÍMICA (Bacharelado)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (49, 1, N'QUÍMICA (Licenciatura)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (50, 1, N'SISTEMAS DE INFORMAÇÃO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (51, 1, N'SISTEMAS PARA INTERNET
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (52, 1, N'CIÊNCIAS HUMANAS E ARTES
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (53, 1, N'ARQUITETURA E URBANISMO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (54, 1, N'ARTES VISUAIS
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (55, 1, N'CIÊNCIAS SOCIAIS (LICENCIATURA)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (56, 1, N'DESIGN DE MODA (Tecnológico)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (57, 1, N'DESIGN DE PRODUTO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (58, 1, N'DESIGN GRÁFICO (Bacharelado)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (59, 1, N'DESIGN GRÁFICO (Tecnológico)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (60, 1, N'FORMAÇÃO DE PROF. EM PSICOLOGIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (61, 1, N'GEOGRAFIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (62, 1, N'HISTÓRIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (63, 1, N'JORNALISMO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (64, 1, N'LETRAS (Tradutor/Intérprete)
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (65, 1, N'LETRAS- PORTUGUÊS
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (66, 1, N'LETRAS-PORTUGUÊS E ESPANHOL
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (67, 1, N'LETRAS-PORTUGUÊS E INGLÊS
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (68, 1, N'MODA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (69, 1, N'PEDAGOGIA')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (70, 1, N'PUBLICIDADE E PROPAGANDA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (71, 1, N'SERVIÇO SOCIAL
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (72, 2, N'TÉCNICO EM AGRONEGÓCIO
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (73, 2, N'TÉCNICO EM COMPUTAÇÃO GRÁFICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (74, 2, N'TÉCNICO EM INFORMÁTICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (75, 2, N'TÉCNICO EM MECATRÔNICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (76, 2, N'TÉCNICO EM QUÍMICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (77, 2, N'TÉCNICO EM CONFEITARIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (78, 2, N'TÉCNICO EM LOGÍSTICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (79, 2, N'TÉCNICO EM ESTÉTICA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (80, 2, N'TÉCNICO EM FARMÁCIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (81, 2, N'TÉCNICO EM MASSOTERAPIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (82, 2, N'TÉCNICO EM MEIO AMBIENTE
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (83, 2, N'TÉCNICO EM PRÓTESE DENTÁRIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (84, 2, N'TÉCNICO EM RADIOLOGIA
')
INSERT INTO [dbo].[Curso] ([IdCurso], [IdTipoCurso], [Nome]) VALUES (85, 2, N'TÉCNICO EM SAÚDE BUCAL
')
SET IDENTITY_INSERT [dbo].[Curso] OFF
