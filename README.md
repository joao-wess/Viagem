# Projeto: Agência de Viagens "Destino Livre"

Este projeto consiste no desenvolvimento de um site para uma agência de viagens fictícia, com foco na interface visual e na modelagem do banco de dados.

---

## 📌 Sumário
1. [Descrição do Projeto](#-descrição-do-projeto)
2. [Funcionalidades](#-funcionalidades)
3. [Tecnologias Utilizadas](#-tecnologias-utilizadas)
4. [Modelagem do Banco de Dados](#-modelagem-do-banco-de-dados)
5. [Como Executar o Projeto](#-como-executar-o-projeto)
6. [Autor](#-autor)

---

## 🚀 Descrição do Projeto
O projeto simula o site de uma agência de viagens, com uma página inicial atraente e responsiva. Além disso, foi desenvolvida a modelagem do banco de dados para suportar as funcionalidades do sistema.

---

## ⚙️ Funcionalidades
- Página inicial com destinos populares e pacotes promocionais.
- Formulário de contato para solicitação de orçamentos.
- Modelagem do banco de dados para gerenciar clientes, reservas, pacotes e pagamentos.

---

## 🛠️ Tecnologias Utilizadas
- **Front-end:** HTML, CSS, Bootstrap.
- **Banco de Dados:** Modelagem em MySQL (diagramas e script SQL).
- **Ferramentas:** BRModelo, Workbench.

---

## 🗄️ Modelagem do Banco de Dados

### Diagrama Conceitual (DER)
![Diagrama Conceitual](https://github.com/user-attachments/assets/c09c7b10-7ba7-48ac-9ec4-f5c6e36a1234)

### Diagrama Lógico
![Diagrama Lógico](https://github.com/user-attachments/assets/aa980196-b621-4ae2-96c7-d06f81c1b855)

### Diagrama Físico
![Diagrama Físico](https://github.com/user-attachments/assets/03326bed-e2b9-4ad6-a4d2-4f5768060fbc)

### Script SQL
```sql
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
