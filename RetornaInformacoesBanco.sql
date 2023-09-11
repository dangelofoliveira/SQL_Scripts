-- Retorna Informações do Banco
SELECT
    CAST(SERVERPROPERTY(N'Servername') AS SYSNAME) AS Servername
  , SERVERPROPERTY(N'Edition') AS Edition
  , SERVERPROPERTY(N'BuildClrVersion') AS BuildVersion
  , SERVERPROPERTY(N'Collation') AS Collation
  , SERVERPROPERTY(N'InstanceDefaultDataPath') AS InstanceDefaultDataPath
  , SERVERPROPERTY(N'InstanceDefaultLogPath') AS InstanceDefaultLogPath
  , SERVERPROPERTY(N'InstanceDefaultBackupPath') AS InstanceDefaultBackupPath