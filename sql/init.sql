CREATE TABLE Categoria (
idCategoria INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50)
);

CREATE TABLE Prodotto (
idProdotto INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
tipo VARCHAR(20),
unitaMisura VARCHAR(10),
giacenza DECIMAL(10,2),
idCategoria INT
);

CREATE TABLE Cliente (
idCliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
nickname VARCHAR(50),
telefono VARCHAR(20),
email VARCHAR(50)
);

CREATE TABLE Prezzo (
idPrezzo INT AUTO_INCREMENT PRIMARY KEY,
prezzoUnitario DECIMAL(10,2),
dataInizioValidita DATE,
idProdotto INT
);

CREATE TABLE Acquisto (
idAcquisto INT AUTO_INCREMENT PRIMARY KEY,
dataAcquisto DATE,
totaleCalcolato DECIMAL(10,2),
totalePagato DECIMAL(10,2),
idCliente INT
);

CREATE TABLE Dettaglio_Acquisto (
id INT AUTO_INCREMENT PRIMARY KEY,
idAcquisto INT,
idProdotto INT,
quantita DECIMAL(10,2),
prezzoApplicato DECIMAL(10,2)
);
