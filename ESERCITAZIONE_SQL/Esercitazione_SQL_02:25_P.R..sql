-- Creo un Database per l'azienda Toysgroup
CREATE DATABASE Toysgroup_db;
USE Toysgroup_db;

-- Creo le entità Product, Region e Sales mettendole in relazione tra loro per l'azienda ToysGroup
CREATE TABLE Product (
    prodottoID INT PRIMARY KEY,             -- Identificativo unico del prodotto
    nome_prodotto VARCHAR(50) NOT NULL,     -- Nome del prodotto
    categoria VARCHAR(50) NOT NULL,         -- Categoria del prodotto (
    prezzo_prodotto DECIMAL(10, 2) NOT NULL,           -- Prezzo del prodotto
    categoryID INT,  -- La colonna che conterrà la foreign key
    FOREIGN KEY(categoryID) REFERENCES Category(categoryID)
);

CREATE TABLE Region (
    regioneID INT PRIMARY KEY AUTO_INCREMENT,  -- Identificativo unico della regione (con auto incremento)
    nome_regione VARCHAR(50) NOT NULL       -- Nome della regione (es. Europa, Nord America)
);

CREATE TABLE Sales (
    venditeID INT PRIMARY KEY AUTO_INCREMENT,                -- Identificativo unico della vendita
    prodottoID INT,                         -- Chiave esterna per il prodotto
    regioneID INT,                          -- Chiave esterna per la regione
    quantita INT NOT NULL,                  -- Quantità venduta
	prezzo DECIMAL(10, 2) NOT NULL,     -- Prezzo della vendita
    data_vendita DATE NOT NULL,                -- Data della vendita
    FOREIGN KEY (prodottoID) REFERENCES Product(prodottoID),  -- Relazione con la tabella Product
    FOREIGN KEY (regioneID) REFERENCES Region(regioneID)     -- Relazione con la tabella Region
);

-- Creo la tabella Categoria che tenga conto della relazione uno-a-molti tra le entità Categoria e Prodotto.
CREATE TABLE Category (
    categoryID INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL
    );
    
-- Creo la tabella State che farà riferimento alla tabella Region
CREATE TABLE State (
    statoID INT PRIMARY KEY AUTO_INCREMENT,   -- Identificativo unico dello stato
    nome_stato VARCHAR(100) NOT NULL,          -- Nome dello stato
    regioneID INT,                             -- Chiave esterna che fa riferimento alla tabella Region
    FOREIGN KEY (regioneID) REFERENCES Region(regioneID)  -- Relazione con la tabella Region
);

-- Popolo la tabella "Category"
INSERT INTO Category (nome_categoria) 
VALUES 
    ('Biciclette'),            -- Categoria per biciclette giocattolo
    ('Abbigliamento'),         -- Categoria per abbigliamento per bambini
    ('Action Figures'),        -- Categoria per figurine di azione
    ('Giochi di costruzione'), -- Categoria per giochi come LEGO
    ('Giocattoli educativi'),  -- Categoria per giochi educativi
    ('Giocattoli da esterno'), -- Categoria per giocattoli da giardino e attività all'aperto
    ('Puzzle');                -- Categoria per puzzle e giochi di logica
    
-- Popolo la tebella "Product" e inseriamo i prodotti per ciascuna delle categorie:

INSERT INTO Product (prodottoID, nome_prodotto, categoria, prezzo_prodotto, categoryID)
VALUES 
    (1, 'Bicicletta Mini', 'Biciclette', 50.00, 1),            -- Prodotto nella categoria Biciclette
    (2, 'Bicicletta Junior', 'Biciclette', 75.00, 1),            -- Prodotto nella categoria Biciclette
    (3, 'Maglietta Superhero', 'Abbigliamento', 20.00, 2),       -- Prodotto nella categoria Abbigliamento
    (4, 'Cappello Spiderman', 'Abbigliamento', 12.50, 2),        -- Prodotto nella categoria Abbigliamento
    (5, 'Spider-Man Figure', 'Action Figures', 15.00, 3),        -- Prodotto nella categoria Action Figures
    (6, 'Iron Man Figure', 'Action Figures', 18.00, 3),          -- Prodotto nella categoria Action Figures
    (7, 'Set Lego City', 'Giochi di costruzione', 45.00, 4),      -- Prodotto nella categoria Giochi di costruzione
    (8, 'Set Lego Castle', 'Giochi di costruzione', 60.00, 4),    -- Prodotto nella categoria Giochi di costruzione
    (9, 'Puzzle 1000 Pezzi', 'Puzzle', 10.00, 7),                -- Prodotto nella categoria Puzzle
    (10, 'Puzzle Mappa del Mondo', 'Puzzle', 12.00, 7),          -- Prodotto nella categoria Puzzle
    (11, 'Gioco di Matematica', 'Giocattoli educativi', 25.00, 5),-- Prodotto nella categoria Giocattoli educativi
    (12, 'Gioco di Lingue', 'Giocattoli educativi', 22.00, 5),    -- Prodotto nella categoria Giocattoli educativi
    (13, 'Pallone da calcio', 'Giocattoli da esterno', 15.00, 6), -- Prodotto nella categoria Giocattoli da esterno
    (14, 'Altalena Bambini', 'Giocattoli da esterno', 80.00, 6),  -- Prodotto nella categoria Giocattoli da esterno
    (15, 'Ciclismo Avventura', 'Biciclette', 80.00, 1);           -- Prodotto nella categoria Biciclette
    
-- Popolo la tebella "Region"
INSERT INTO Region (nome_regione)
VALUES 
    ('Europa'),              -- Regione Europa
    ('Nord America'),        -- Regione Nord America
    ('Sud America'),         -- Regione Sud America
    ('Asia'),                -- Regione Asia
    ('Africa'),              -- Regione Africa
    ('Oceania'),             -- Regione Oceania
    ('Medio Oriente');       -- Regione Medio Oriente

-- Popolo la tabella "Sales"
INSERT INTO Sales (prodottoID, regioneID, quantita, prezzo, data_vendita)
VALUES
    (1, 1, 150, 29.99, '2025-01-10'),   -- Prodotto 1, Europa, 150 unità, prezzo 29.99
    (2, 2, 250, 49.99, '2025-01-11'),   -- Prodotto 2, Nord America, 250 unità, prezzo 49.99
    (3, 3, 180, 19.99, '2025-01-12'),   -- Prodotto 3, Sud America, 180 unità, prezzo 19.99
    (4, 4, 200, 39.99, '2025-01-13'),   -- Prodotto 4, Asia, 200 unità, prezzo 39.99
    (5, 5, 220, 24.99, '2025-01-14'),   -- Prodotto 5, Africa, 220 unità, prezzo 24.99
    (6, 6, 130, 59.99, '2025-01-15'),   -- Prodotto 6, Oceania, 130 unità, prezzo 59.99
    (7, 7, 110, 79.99, '2025-01-16'),   -- Prodotto 7, Medio Oriente, 110 unità, prezzo 79.99
    (1, 1, 160, 29.99, '2025-01-17'),   -- Prodotto 1, Europa, 160 unità, prezzo 29.99
    (2, 2, 190, 49.99, '2025-01-18'),   -- Prodotto 2, Nord America, 190 unità, prezzo 49.99
    (3, 3, 170, 19.99, '2025-01-19'),   -- Prodotto 3, Sud America, 170 unità, prezzo 19.99
    (4, 4, 210, 39.99, '2025-01-20'),   -- Prodotto 4, Asia, 210 unità, prezzo 39.99
    (5, 5, 230, 24.99, '2025-01-21'),   -- Prodotto 5, Africa, 230 unità, prezzo 24.99
    (6, 6, 140, 59.99, '2025-01-22'),   -- Prodotto 6, Oceania, 140 unità, prezzo 59.99
    (7, 7, 120, 79.99, '2025-01-23'),   -- Prodotto 7, Medio Oriente, 120 unità, prezzo 79.99
    (1, 1, 155, 29.99, '2025-01-24'),   -- Prodotto 1, Europa, 155 unità, prezzo 29.99
    (2, 2, 210, 49.99, '2025-01-25'),   -- Prodotto 2, Nord America, 210 unità, prezzo 49.99
    (3, 3, 165, 19.99, '2025-01-26'),   -- Prodotto 3, Sud America, 165 unità, prezzo 19.99
    (4, 4, 215, 39.99, '2025-01-27'),   -- Prodotto 4, Asia, 215 unità, prezzo 39.99
    (5, 5, 240, 24.99, '2025-01-28'),   -- Prodotto 5, Africa, 240 unità, prezzo 24.99
    (6, 6, 150, 59.99, '2025-01-29'),   -- Prodotto 6, Oceania, 150 unità, prezzo 59.99
    (7, 7, 130, 79.99, '2025-01-30'),   -- Prodotto 7, Medio Oriente, 130 unità, prezzo 79.99
    (1, 1, 170, 29.99, '2025-02-01'),   -- Prodotto 1, Europa, 170 unità, prezzo 29.99
    (2, 2, 220, 49.99, '2025-02-02'),   -- Prodotto 2, Nord America, 220 unità, prezzo 49.99
    (3, 3, 160, 19.99, '2025-02-03'),   -- Prodotto 3, Sud America, 160 unità, prezzo 19.99
    (4, 4, 220, 39.99, '2025-02-04'),   -- Prodotto 4, Asia, 220 unità, prezzo 39.99
    (5, 5, 250, 24.99, '2025-02-05'),   -- Prodotto 5, Africa, 250 unità, prezzo 24.99
    (6, 6, 160, 59.99, '2025-02-06'),   -- Prodotto 6, Oceania, 160 unità, prezzo 59.99
    (7, 7, 140, 79.99, '2025-02-07'),   -- Prodotto 7, Medio Oriente, 140 unità, prezzo 79.99
    (1, 1, 180, 29.99, '2025-02-08'),   -- Prodotto 1, Europa, 180 unità, prezzo 29.99
    (2, 2, 240, 49.99, '2025-02-09'),   -- Prodotto 2, Nord America, 240 unità, prezzo 49.99
    (3, 3, 150, 19.99, '2025-02-10'),   -- Prodotto 3, Sud America, 150 unità, prezzo 19.99
    (4, 4, 230, 39.99, '2025-02-11'),   -- Prodotto 4, Asia, 230 unità, prezzo 39.99
    (5, 5, 260, 24.99, '2025-02-12'),   -- Prodotto 5, Africa, 260 unità, prezzo 24.99
    (6, 6, 170, 59.99, '2025-02-13'),   -- Prodotto 6, Oceania, 170 unità, prezzo 59.99
    (7, 7, 150, 79.99, '2025-02-14'),   -- Prodotto 7, Medio Oriente, 150 unità, prezzo 79.99
    (1, 1, 190, 29.99, '2025-02-15'),   -- Prodotto 1, Europa, 190 unità, prezzo 29.99
    (2, 2, 250, 49.99, '2025-02-16'),   -- Prodotto 2, Nord America, 250 unità, prezzo 49.99
    (3, 3, 180, 19.99, '2025-02-17'),   -- Prodotto 3, Sud America, 180 unità, prezzo 19.99
    (4, 4, 240, 39.99, '2025-02-18'),   -- Prodotto 4, Asia, 240 unità, prezzo 39.99
    (5, 5, 270, 24.99, '2025-02-19'),   -- Prodotto 5, Africa, 270 unità, prezzo 24.99
    (6, 6, 180, 59.99, '2025-02-20'),   -- Prodotto 6, Oceania, 180 unità, prezzo 59.99
    (7, 7, 160, 79.99, '2025-02-21'),   -- Prodotto 7, Medio Oriente, 160 unità, prezzo 79.99
    (1, 1, 200, 29.99, '2025-02-22'),   -- Prodotto 1, Europa, 200 unità, prezzo 29.99
    (2, 2, 260, 49.99, '2025-02-23'),   -- Prodotto 2, Nord America, 260 unità, prezzo 49.99
    (3, 3, 190, 19.99, '2025-02-24'),   -- Prodotto 3, Sud America, 190 unità, prezzo 19.99
    (4, 4, 250, 39.99, '2025-02-25'),   -- Prodotto 4, Asia, 250 unità, prezzo 39.99
    (5, 5, 280, 24.99, '2025-02-26'),   -- Prodotto 5, Africa, 280 unità, prezzo 24.99
    (6, 6, 190, 59.99, '2025-02-27'),   -- Prodotto 6, Oceania, 190 unità, prezzo 59.99
    (7, 7, 170, 79.99, '2025-02-28');   -- Prodotto 7, Medio Oriente, 170 unità, prezzo 79.99
    
-- Popolo la tebella "State"
INSERT INTO State (nome_stato, regioneID)
VALUES
    ('Italia', 1),              -- Stato Italia in Europa
    ('Francia', 1),             -- Stato Francia in Europa
    ('Spagna', 1),              -- Stato Spagna in Europa
    ('Germania', 1),           -- Stato Germania in Europa
    ('Stati Uniti', 2),        -- Stati Uniti in Nord America
    ('Canada', 2),             -- Canada in Nord America
    ('Messico', 2),            -- Messico in Nord America
    ('Brasile', 3),            -- Brasile in Sud America
    ('Argentina', 3),          -- Argentina in Sud America
    ('Cile', 3),               -- Cile in Sud America
    ('Cina', 4),               -- Cina in Asia
    ('India', 4),              -- India in Asia
    ('Giappone', 4),           -- Giappone in Asia
    ('Sud Africa', 5),         -- Sud Africa in Africa
    ('Nigeria', 5),            -- Nigeria in Africa
    ('Kenya', 5),              -- Kenya in Africa
    ('Australia', 6),          -- Australia in Oceania
    ('Nuova Zelanda', 6),      -- Nuova Zelanda in Oceania
    ('Emirati Arabi Uniti', 7),-- Emirati Arabi Uniti in Medio Oriente
    ('Arabia Saudita', 7),     -- Arabia Saudita in Medio Oriente
    ('Turchia', 7),            -- Turchia in Medio Oriente
    ('Egitto', 5);             -- Egitto in Africa
    
-- Controllo, per ogni tabella, se ci sono valori duplicati nelle colonne che sono state definite come chiavi primarie
   
-- Tab Product
SELECT prodottoID, COUNT(*)
FROM Product
GROUP BY prodottoID
HAVING COUNT(*) > 1;
   
-- Tab Region
SELECT regioneID, COUNT(*)
FROM Region
GROUP BY regioneID
HAVING COUNT(*) > 1;
   
-- Tab Sales
SELECT venditeID, COUNT(*)
FROM Sales
GROUP BY venditeID
HAVING COUNT(*) > 1;
    
-- Tab Category
SELECT categoryID, COUNT(*)
FROM Category
GROUP BY categoryID
HAVING COUNT(*) > 1;
    
-- Tab State
SELECT statoID, COUNT(*)
FROM State
GROUP BY venditeID
HAVING COUNT(*) > 1;

-- Elenco delle transazioni 
SELECT 
S.venditeID AS codice_documento,                 -- Codice documento della vendita
S.data_vendita,                                  -- Data della vendita
P.nome_prodotto,                                 -- Nome del prodotto
P.categoria,                                     -- Categoria del prodotto
St.nome_stato,                                   -- Nome dello stato
R.nome_regione,                                  -- Nome della regione
(DATEDIFF(CURDATE(), S.data_vendita) > 180) AS passato_180_giorni -- differenza tra le date con condizione (True se > 180 giorni)
FROM 
Sales S
JOIN 
Product P ON S.prodottoID = P.prodottoID         -- Join con la tabella Product
JOIN 
State St ON St.regioneID = S.regioneID           -- Join con la tabella State per ottenere il nome dello stato
JOIN 
Region R ON S.regioneID = R.regioneID;           -- Join con la tabella Region per ottenere il nome della regione
    
-- Calcolo la media delle vendite totali dell'anno passato, calcolo il totale venduto per ogni prodotto nel periodo di riferimento e confronto i totali venduti con la media delle vendite totali.
SELECT 
S.prodottoID, 
SUM(S.quantita) AS totale_venduto
FROM 
Sales S
WHERE 
S.data_vendita >= CURDATE() - INTERVAL 1 YEAR  -- Consideriamo solo le vendite dell'ultimo anno
GROUP BY 
S.prodottoID
HAVING 
	SUM(S.quantita) > (
    SELECT 
	AVG(quantita)  -- Calcoliamo la media delle vendite totali
	FROM 
	Sales 
	WHERE 
	data_vendita >= CURDATE() - INTERVAL 1 YEAR  -- Limite fissato all'anno scorso
    );
    
-- Elenco prodotti venduti con corrispettivo fatturato totale
SELECT 
P.nome_prodotto, 
SUM(S.quantita * S.prezzo) AS fatturato_totale
FROM 
Sales S
JOIN 
Product P ON S.prodottoID = P.prodottoID
GROUP BY 
P.nome_prodotto
ORDER BY 
P.nome_prodotto; 
    
-- fatturato totale per stato per anno ordinato per data e fatturato decrescente
SELECT 
s.nome_stato, 
YEAR(sa.data_vendita) AS anno, 
SUM(sa.quantita * sa.prezzo) AS fatturato_totale
FROM 
Sales sa
JOIN 
State s ON sa.regioneID = s.regioneID
JOIN 
Product p ON sa.prodottoID = p.prodottoID
GROUP BY 
s.nome_stato, YEAR(sa.data_vendita)
ORDER BY 
anno DESC, fatturato_totale DESC;

-- Calcolo la categoria di articoli maggiormente richiesta dla mercato
SELECT 
c.nome_categoria,
SUM(s.quantita) AS totale_vendite
FROM 
Sales s
JOIN 
Product p ON s.prodottoID = p.prodottoID
JOIN 
Category c ON p.categoryID = c.categoryID
GROUP BY 
c.nome_categoria
ORDER BY 
totale_vendite DESC;

-- Un modo per vedere quali sono i prodotti invenduti
SELECT 
p.prodottoID, 
p.nome_prodotto, 
p.categoria, 
p.prezzo_prodotto
FROM 
Product p
LEFT JOIN 
Sales s ON p.prodottoID = s.prodottoID
WHERE 
s.venditeID IS NULL;

-- Creo una vista sui prodotti per avere un quadro completo su di essi
CREATE VIEW Vista_Prodotti AS
SELECT 
p.prodottoID AS codice_prodotto,
p.nome_prodotto,
c.nome_categoria
FROM 
Product p
JOIN 
Category c ON p.categoryID = c.categoryID;

-- Creo una vista sulle informazioni geografiche
CREATE VIEW Vista_Geografica_Vendite AS
SELECT 
st.nome_stato AS stato,
r.nome_regione AS regione,
s.quantita AS quantita_venduta,
s.prezzo AS prezzo_vendita,
s.data_vendita
FROM 
Sales s
JOIN 
Product p ON s.prodottoID = p.prodottoID
JOIN 
Region r ON s.regioneID = r.regioneID
JOIN 
State st ON s.regioneID = s.regioneID;


    
    




    


    
    
    
    
    


    
    


    

    
    









