create database destino_livre;
use destino_livre;

CREATE TABLE Cliente (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Contato (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100),
    nome VARCHAR(100),
    mensagem TEXT,
    telefone VARCHAR(15),
    cliente_id INTEGER,
    FOREIGN KEY (cliente_id) REFERENCES Cliente (id)
);

CREATE TABLE Reserva (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    data_reserva DATE NOT NULL,
    status_reserva VARCHAR(50) NOT NULL,
    numero_pessoas INTEGER NOT NULL,
    data_partida DATE NOT NULL,
    cliente_id INTEGER,
    FOREIGN KEY (cliente_id) REFERENCES Cliente (id)
);

CREATE TABLE Pagamento (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status_pagamento VARCHAR(50) NOT NULL,
    reserva_id INTEGER,
    FOREIGN KEY (reserva_id) REFERENCES Reserva (id)
);

CREATE TABLE Pacote (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    duracao INTEGER NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    descricao TEXT,
    reserva_id INTEGER,
    FOREIGN KEY (reserva_id) REFERENCES Reserva (id)
);

CREATE TABLE Destino (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE pacote_destino (
    pacote_id INTEGER,
    destino_id INTEGER,
    PRIMARY KEY (pacote_id, destino_id),
    FOREIGN KEY (pacote_id) REFERENCES Pacote (id),
    FOREIGN KEY (destino_id) REFERENCES Destino (id)
);