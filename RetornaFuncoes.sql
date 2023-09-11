-- Trazer as funções criadas no banco
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