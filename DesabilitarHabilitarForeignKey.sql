-- Desabilitar/Habilitar Foreign Key
ALTER TABLE tbPessoaJuridica --Nome da Tabela
NOCHECK CONSTRAINT FK__tbEmpresaFilial__tbPessoaJuridica --Nome da Foreign Key

ALTER TABLE tbPessoaJuridica --Nome da Tabela
CHECK CONSTRAINT FK__tbEmpresaFilial__tbPessoaJuridica --Nome da Foreign Key