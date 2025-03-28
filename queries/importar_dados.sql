LOAD DATA INFILE '/var/lib/mysql-files/Relatorio_cadop.csv'
INTO TABLE operadoras_ans
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(registro_ans, cnpj, razao_social, nome_fantasia, modalidade, 
logradouro, numero, complemento, bairro, cidade, uf, cep, ddd, 
telefone, fax, endereco_eletronico, representante, cargo_representante, 
regiao_comercializacao, @data_registro)
SET data_registro_ans = STR_TO_DATE(@data_registro, '%Y-%m-%d');

LOAD DATA INFILE '/var/lib/mysql-files/1T2023.csv'
INTO TABLE dados_governo
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, 
@vl_saldo_inicial, @vl_saldo_final)
SET
data_competencia = CASE 
    WHEN @data REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN STR_TO_DATE(@data, '%Y-%m-%d')
    WHEN @data REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@data, '%d/%m/%Y')
    ELSE NULL
END,
vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.');

LOAD DATA INFILE '/var/lib/mysql-files/2t2023.csv'
INTO TABLE dados_governo
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, 
@vl_saldo_inicial, @vl_saldo_final)
SET
data_competencia = CASE 
    WHEN @data REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN STR_TO_DATE(@data, '%Y-%m-%d')
    WHEN @data REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@data, '%d/%m/%Y')
    ELSE NULL
END,
vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.');

LOAD DATA INFILE '/var/lib/mysql-files/3T2023.csv'
INTO TABLE dados_governo
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, 
@vl_saldo_inicial, @vl_saldo_final)
SET
data_competencia = CASE 
    WHEN @data REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN STR_TO_DATE(@data, '%Y-%m-%d')
    WHEN @data REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@data, '%d/%m/%Y')
    ELSE NULL
END,
vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.');

LOAD DATA INFILE '/var/lib/mysql-files/4T2023.csv'
INTO TABLE dados_governo
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, 
@vl_saldo_inicial, @vl_saldo_final)
SET
data_competencia = CASE 
    WHEN @data REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN STR_TO_DATE(@data, '%Y-%m-%d')
    WHEN @data REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@data, '%d/%m/%Y')
    ELSE NULL
END,
vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.');

LOAD DATA INFILE '/var/lib/mysql-files/1T2024.csv'
INTO TABLE dados_governo
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, 
@vl_saldo_inicial, @vl_saldo_final)
SET
data_competencia = CASE 
    WHEN @data REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN STR_TO_DATE(@data, '%Y-%m-%d')
    WHEN @data REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@data, '%d/%m/%Y')
    ELSE NULL
END,
vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.');

LOAD DATA INFILE '/var/lib/mysql-files/2T2024.csv'
INTO TABLE dados_governo
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, 
@vl_saldo_inicial, @vl_saldo_final)
SET
data_competencia = CASE 
    WHEN @data REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN STR_TO_DATE(@data, '%Y-%m-%d')
    WHEN @data REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@data, '%d/%m/%Y')
    ELSE NULL
END,
vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.');

LOAD DATA INFILE '/var/lib/mysql-files/3T2024.csv'
INTO TABLE dados_governo
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, 
@vl_saldo_inicial, @vl_saldo_final)
SET
data_competencia = CASE 
    WHEN @data REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN STR_TO_DATE(@data, '%Y-%m-%d')
    WHEN @data REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@data, '%d/%m/%Y')
    ELSE NULL
END,
vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.');

LOAD DATA INFILE '/var/lib/mysql-files/4T2024.csv'
INTO TABLE dados_governo
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data, reg_ans, cd_conta_contabil, descricao, 
@vl_saldo_inicial, @vl_saldo_final)
SET
data_competencia = CASE 
    WHEN @data REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN STR_TO_DATE(@data, '%Y-%m-%d')
    WHEN @data REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(@data, '%d/%m/%Y')
    ELSE NULL
END,
vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.'); 