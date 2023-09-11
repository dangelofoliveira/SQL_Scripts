-- Busca Tabelas por Nome de Coluna
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
AND	(C.name LIKE @COLUM_NAME)