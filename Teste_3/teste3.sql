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
LOAD DATA INFILE 'C:/Users/Joao Neto/Documents/Teste-de-Nivelamento/Teste_3/Relatorio_cadop.csv' 
INTO TABLE operadoras_saude
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(@Registro_ANS, @CNPJ, @Razao_social, @Nome_Fantasia, @Modalidade, @Logradouro, @Numero, @Complemento, @Bairro, @Cidade, @UF, @CEP, @DDD, @Telefone, @Fax, @Endereco_eletronico, @Representante, @Cargo_Representante, @Regiao_de_comercializacao, @Data_Registro_ANS)
SET 
    Registro_ANS = NULLIF(@Registro_ANS, ''),
    CNPJ = NULLIF(@CNPJ, ''),
    Razao_social = NULLIF(@Razao_social, ''),
    Nome_Fantasia = NULLIF(@Nome_Fantasia, ''),
    Modalidade = NULLIF(@Modalidade, ''),
    Logradouro = NULLIF(@Logradouro, ''),
    Numero = NULLIF(@Numero, ''),
    Complemento = NULLIF(@Complemento, ''),
    Bairro = NULLIF(@Bairro, ''),
    Cidade = NULLIF(@Cidade, ''),
    UF = NULLIF(@UF, ''),
    CEP = NULLIF(@CEP, ''),
    DDD = NULLIF(@DDD, ''),
    Telefone = NULLIF(@Telefone, ''),
    Fax = NULLIF(@Fax, ''),
    Endereco_eletronico = NULLIF(@Endereco_eletronico, ''),
    Representante = NULLIF(@Representante, ''),
    Cargo_Representante = NULLIF(@Cargo_Representante, ''),
    Regiao_de_comercializacao = NULLIF(@Regiao_de_comercializacao, ''),
    Data_Registro_ANS = STR_TO_DATE(@Data_Registro_ANS, '%d/%m/%Y');
