CREATE TABLE Categoria (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) UNIQUE
);

CREATE TABLE Prodotto (
    idProdotto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    tipo VARCHAR(20),
    unitaMisura VARCHAR(10),
    idCategoria INT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

CREATE TABLE Prezzo (
    idPrezzo INT AUTO_INCREMENT PRIMARY KEY,
    prezzoUnitario DECIMAL(10,2),
    dataInizioValidita DATE,
    idProdotto INT,
    FOREIGN KEY (idProdotto) REFERENCES Prodotto(idProdotto)
);

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    nickname VARCHAR(50),
    telefono VARCHAR(20),
    email VARCHAR(50)
);

CREATE TABLE Luogo (
    idLuogo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    indirizzo VARCHAR(100)
);

CREATE TABLE Acquisto (
    idAcquisto INT AUTO_INCREMENT PRIMARY KEY,
    dataAcquisto DATE,
    totaleCalcolato DECIMAL(10,2),
    totalePagato DECIMAL(10,2),
    note TEXT,
    idCliente INT,
    idLuogo INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idLuogo) REFERENCES Luogo(idLuogo)
);

CREATE TABLE Dettaglio_Acquisto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idAcquisto INT,
    idProdotto INT,
    quantita DECIMAL(10,2),
    prezzoApplicato DECIMAL(10,2),
    omaggio BOOLEAN,
    FOREIGN KEY (idAcquisto) REFERENCES Acquisto(idAcquisto),
    FOREIGN KEY (idProdotto) REFERENCES Prodotto(idProdotto)
);