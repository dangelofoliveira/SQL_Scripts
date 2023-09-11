-- Busca as Colunas da Tabela Pesquisada
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