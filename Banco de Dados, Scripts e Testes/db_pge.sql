CREATE SCHEMA IF NOT EXISTS bd_pge;
USE bd_pge;

-- Tabela de Procuradores
CREATE TABLE procurador (
    id_procurador INT AUTO_INCREMENT PRIMARY KEY,
    oab VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tel VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Tabela de Clientes
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tel VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Tabela de Processos
CREATE TABLE processo (
    id_processo INT AUTO_INCREMENT PRIMARY KEY,
    numero_proc VARCHAR(50) UNIQUE NOT NULL,
    orgao VARCHAR(100) NOT NULL,
    assunto VARCHAR(100) NOT NULL,
    status_proc VARCHAR(50) NOT NULL,
    data_abertura DATE NOT NULL,
    procurador_id INT NOT NULL,
    FOREIGN KEY (procurador_id) REFERENCES procurador(id_procurador)
);

-- Tabela de Documentos
CREATE TABLE documento (
    id_documento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    url_documento VARCHAR(255) NOT NULL,
    data_envio DATE NOT NULL,
    processo_id INT NOT NULL,
    FOREIGN KEY (processo_id) REFERENCES processo(id_processo)
);

-- Tabela de Prazos
CREATE TABLE prazo (
    id_prazo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    data_vencimento DATE NOT NULL,
    status_prazo VARCHAR(20) NOT NULL,
    processo_id INT NOT NULL,
    FOREIGN KEY (processo_id) REFERENCES processo(id_processo)
);

-- Tabela de Associação Processo-Cliente
CREATE TABLE processocliente (
    processo_id INT,
    cliente_id INT,
    PRIMARY KEY (processo_id, cliente_id),
    FOREIGN KEY (processo_id) REFERENCES processo(id_processo),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);
