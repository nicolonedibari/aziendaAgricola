CREATE DATABASE IF NOT EXISTS azienda_agricola;
USE azienda_agricola;

-- CLIENTE
CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    nickname VARCHAR(100),
    contatto VARCHAR(150)
);

-- CATEGORIA
CREATE TABLE categoria (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nomeCategoria VARCHAR(100) UNIQUE
);

-- PRODOTTO
CREATE TABLE prodotto (
    idProdotto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    tipo ENUM('fresco', 'riserva', 'confezionato'),
    unitaMisura ENUM('kg', 'pezzo', 'litro'),
    giacenza DECIMAL(10,2),
    idCategoria INT,
    FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria)
);

-- PREZZO (storico)
CREATE TABLE prezzo (
    idPrezzo INT AUTO_INCREMENT PRIMARY KEY,
    idProdotto INT,
    prezzo DECIMAL(10,2),
    dataInizio DATE,
    FOREIGN KEY (idProdotto) REFERENCES prodotto(idProdotto)
);

-- ACQUISTO
CREATE TABLE acquisto (
    idAcquisto INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    dataAcquisto DATE,
    totaleCalcolato DECIMAL(10,2),
    totalePagato DECIMAL(10,2),
    note TEXT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

-- DETTAGLIO ACQUISTO
CREATE TABLE dettaglio_acquisto (
    idDettaglio INT AUTO_INCREMENT PRIMARY KEY,
    idAcquisto INT,
    idProdotto INT,
    quantita DECIMAL(10,2),
    prezzoUnitario DECIMAL(10,2),
    FOREIGN KEY (idAcquisto) REFERENCES acquisto(idAcquisto),
    FOREIGN KEY (idProdotto) REFERENCES prodotto(idProdotto)
);

-- TRIGGER BLOCCA GIACENZA NEGATIVA
DELIMITER $$

CREATE TRIGGER check_giacenza
BEFORE UPDATE ON prodotto
FOR EACH ROW
BEGIN
    IF NEW.giacenza < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Giacenza negativa non consentita';
    END IF;
END$$

DELIMITER ;