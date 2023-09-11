-- Traz todos os Índices do banco
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