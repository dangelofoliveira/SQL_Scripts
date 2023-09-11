-- Traz os nomes das colunas com os tipos
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