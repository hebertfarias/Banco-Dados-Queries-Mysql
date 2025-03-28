CREATE DATABASE IF NOT EXISTS db_hebert;

USE db_hebert;

CREATE TABLE operadoras_ans (
    registro_ans VARCHAR(10) PRIMARY KEY,
    cnpj VARCHAR(14),
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(100),
    logradouro VARCHAR(255),
    numero VARCHAR(20),
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2),
    cep VARCHAR(8),
    ddd VARCHAR(2),
    telefone VARCHAR(20),
    fax VARCHAR(20),
    endereco_eletronico VARCHAR(255),
    representante VARCHAR(255),
    cargo_representante VARCHAR(255),
    regiao_comercializacao VARCHAR(2),
    data_registro_ans DATE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE dados_governo (
    data_competencia DATE,
    reg_ans VARCHAR(10),
    cd_conta_contabil VARCHAR(20),
    descricao VARCHAR(255),
    vl_saldo_inicial DECIMAL(15,2),
    vl_saldo_final DECIMAL(15,2),
    INDEX idx_reg_ans (reg_ans),
    INDEX idx_data (data_competencia),
    INDEX idx_conta (cd_conta_contabil)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
