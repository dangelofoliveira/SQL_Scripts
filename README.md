# SQL_Scripts (SQL SERVER)
### Scripts em SQL para agilizar os processos no dia a dia

### Abaixo segue a lista com todos os scripts:

### Obs.: Eu anexei todos os arquivos individualmente como .sql para facilitar o download e importação para o SQL Server

### Ps.: Todos os scripts foram criados e testados em SQL SERVER Versão 11.0.2100.60


### Trazer as funções criadas no banco
SELECT
    name
  , DEFINITION
  , type_desc
FROM
    sys.sql_modules m
INNER JOIN sys.objects o
    ON m.object_id = o.object_id
WHERE
    (type_desc LIKE '%function%')
AND (name LIKE '%margem%')


### Traz todos os Índices do banco
SELECT
    b.name nm_tabela
  , c.name nm_coluna
  , d.name nm_index
FROM
    sys.tables b
INNER JOIN sys.columns c
    ON c.object_id = b.object_id
INNER JOIN sys.indexes d
   ON d.object_id = b.object_id
WHERE
   (d.name IS NOT NULL)


### Busca Tabelas por Nome de Coluna
DECLARE @COLUM_NAME AS VARCHAR(30) = '%NCM%'
SELECT
    T.name AS Table_Name
  , C.name AS Column_Name
FROM
    sys.columns AS C
INNER JOIN sys.tables AS T
    ON C.object_id = T.object_id
WHERE
    (T.type = 'U')
AND (C.name LIKE @COLUM_NAME)


### Busca as Colunas da Tabela Pesquisada
DECLARE @TABLE_NAME AS VARCHAR(50) = '%SuperProdutoVendaLoja'
SELECT
    T.name AS nomeTabela
  , C.name AS Colunas
FROM
    sys.tables AS T
INNER JOIN sys.columns AS C
    ON C.object_id = T.object_id
WHERE
    T.name LIKE @TABLE_NAME


### Localizar Foreign Key
SELECT
    rc.*
FROM
    INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS rc
LEFT OUTER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU1
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
WHERE
    (KCU1.TABLE_NAME = 'tbGestaoCobrancaBoletoOcorrencia')
AND (rc.CONSTRAINT_NAME = 'FK_tbGestaoCobrancaBoletoOcorrencia_tbGestaoCobrancaBoletoOcorrenciaTipo')


### Retorna Informações do Banco
SELECT
    SERVERPROPERTY(N'Servername') AS Servername
  , SERVERPROPERTY(N'Edition') AS Edition
  , SERVERPROPERTY(N'ProductVersion') AS ProductVersion
  , SERVERPROPERTY(N'BuildClrVersion') AS BuildVersion
  , SERVERPROPERTY(N'Collation') AS Collation
  , SERVERPROPERTY(N'InstanceDefaultDataPath') AS InstanceDefaultDataPath
  , SERVERPROPERTY(N'InstanceDefaultLogPath') AS InstanceDefaultLogPath
  , SERVERPROPERTY(N'InstanceDefaultBackupPath') AS InstanceDefaultBackupPath


### Desabilitar/Habilitar Foreign Key
ALTER TABLE tbPessoaJuridica --Nome da Tabela
NOCHECK CONSTRAINT FK__tbEmpresaFilial__tbPessoaJuridica --Nome da Foreign Key

ALTER TABLE tbPessoaJuridica --Nome da Tabela
CHECK CONSTRAINT FK__tbEmpresaFilial__tbPessoaJuridica --Nome da Foreign Key


### Dropar Views (If Exists)
IF EXISTS
	(SELECT
	     V.name
	 FROM
	     sys.all_views AS V
	 WHERE
	     (V.type = 'V')
	 AND (V.name = 'vwClubeDaCotacao'))
DROP VIEW vwClubeDaCotacao


### Traz os nomes das colunas com os tipos
SELECT
    C.name AS nmColuna
  , TYPE_NAME(C.user_type_id) AS TipoDados
  , 'dtb.Columns.Add("' + C.name + '", GetType(' + 
	CASE TYPE_NAME(C.user_type_id) 
	WHEN 'tinyint' THEN 'Byte'
	WHEN 'int' THEN 'Integer'
	WHEN 'bigint' THEN 'Long'
	WHEN 'char' THEN 'String'
	WHEN 'varchar' THEN 'String'
	WHEN 'datetime' THEN 'Date'
	WHEN 'money' THEN 'Decimal'
	WHEN 'bit' THEN 'Boolean'
	WHEN 'uniqueidentifier' THEN 'Guid'
	END + '))' AS TextoConcatenado
FROM
    sys.tables AS T
INNER JOIN sys.columns AS C
    ON T.object_id = C.object_id
WHERE
    T.name = 'tbContaParcelaExcluida'

