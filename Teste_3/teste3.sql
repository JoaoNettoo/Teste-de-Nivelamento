-- Código utilizado no MySql Workbench
-- Criação da tabela para armazenar os dados do CSV
CREATE TABLE operadoras_saude (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Registro_ANS VARCHAR(20),
    CNPJ VARCHAR(18),
    Razao_social VARCHAR(255),
    Nome_Fantasia VARCHAR(255),
    Modalidade VARCHAR(100),
    Logradouro VARCHAR(255),
    Numero VARCHAR(20),
    Complemento VARCHAR(255),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    UF CHAR(2),
    CEP VARCHAR(10),
    DDD VARCHAR(3),
    Telefone VARCHAR(20),
    Fax VARCHAR(20),
    Endereco_eletronico VARCHAR(255),
    Representante VARCHAR(255),
    Cargo_Representante VARCHAR(100),
    Regiao_de_comercializacao VARCHAR(255),
    Data_Registro_ANS DATE
);

-- Importando os dados do CSV (ajustando o encoding para UTF-8)
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv' -- Foi salvo localmente nesse caminho para acesso do MySql
INTO TABLE operadoras_saude  
FIELDS TERMINATED BY ';'  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS  
(Registro_ANS, CNPJ, Razao_social, Nome_Fantasia, Modalidade, Logradouro, Numero, Complemento, Bairro, Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_eletronico, Representante, Cargo_Representante, Regiao_de_comercializacao, Data_Registro_ANS)  
SET 
    Registro_ANS = NULLIF(CAST(Registro_ANS AS UNSIGNED), ''),
    CNPJ = NULLIF(CNPJ, ''),
    Razao_social = NULLIF(Razao_social, ''),
    Nome_Fantasia = NULLIF(Nome_Fantasia, ''),
    Modalidade = NULLIF(Modalidade, ''),
    Logradouro = NULLIF(Logradouro, ''),
    Numero = NULLIF(Numero, ''),
    Complemento = NULLIF(Complemento, ''),
    Bairro = NULLIF(Bairro, ''),
    Cidade = NULLIF(Cidade, ''),
    UF = NULLIF(UF, ''),
    CEP = NULLIF(CEP, ''),
    DDD = NULLIF(DDD, ''),
    Telefone = NULLIF(Telefone, ''),
    Fax = NULLIF(Fax, ''),
    Endereco_eletronico = NULLIF(Endereco_eletronico, ''),
    Representante = NULLIF(Representante, ''),
    Cargo_Representante = NULLIF(Cargo_Representante, ''),
    Regiao_de_comercializacao = NULLIF(Regiao_de_comercializacao, ''),
    Data_Registro_ANS = STR_TO_DATE(TRIM(BOTH '"' FROM @Data_Registro_ANS), '%Y-%m-%d');
    
    -- O resultado dessa query pode ser visto na pasta "Teste_3/Prints"

    -- Criação de uma única tabela para importar os dados dos arquivos.csv de descrição das despesas das operadoras
    -- do último ano de 2024 

CREATE TABLE despesas_operadoras (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE,
    Reg_ANS BIGINT,
    Cd_Conta_Contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_Saldo_Inicial DECIMAL(15,2),
    Vl_Saldo_Final DECIMAL(15,2),
    Trimestre VARCHAR(10) -- Nova coluna para identificar o período
);

-- Importação de cada arquivo.csv, indicando o trimestre

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2024.csv' -- Foi salvo localmente nesse caminho para acesso do MySql
INTO TABLE despesas_operadoras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Data, @Reg_ANS, @Cd_Conta_Contabil, @Descricao, @Vl_Saldo_Inicial, @Vl_Saldo_Final)
SET 
    Data = STR_TO_DATE(@Data, '%Y-%m-%d'),
    Reg_ANS = NULLIF(@Reg_ANS, ''),
    Cd_Conta_Contabil = NULLIF(@Cd_Conta_Contabil, ''),
    Descricao = NULLIF(@Descricao, ''),
    Vl_Saldo_Inicial = NULLIF(REPLACE(@Vl_Saldo_Inicial, ',', '.'), ''),
    Vl_Saldo_Final = NULLIF(REPLACE(@Vl_Saldo_Final, ',', '.'), ''),
    Trimestre = '1T2024'; -- Necessário alterar para importar o trimestre


