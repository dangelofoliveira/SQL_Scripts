-- Dropar Views (If Exists)
IF EXISTS
	(SELECT
		 V.name
	 FROM
		 sys.all_views AS V
	 WHERE
		 (V.type = 'V')
	 AND (V.name = 'vwClubeDaCotacao'))
DROP VIEW vwClubeDaCotacao