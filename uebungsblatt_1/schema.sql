 --DROP TABLE Mitarbeiter;
 --DROP TABLE Abteilung;
 --DROP TABLE Arbeitszeitmodell;
 --DROP TABLE Familienstand;

CREATE TABLE Familienstand
(f_id INT IDENTITY(1,1) PRIMARY KEY,
fam_bez VARCHAR(50),
);

--INSERT INTO Familienstand (fam_bez) VALUES

--('ledig'),
--('verheiratet'),
--('geschieden'),
--('verwitwet'),
--('eingetr. Lebensgemeinschaft');

--SELECT * FROM Familienstand;


CREATE TABLE Arbeitszeitmodell
(azm_id CHAR(2) PRIMARY KEY,
az_bez VARCHAR(20),
);

CREATE TABLE Abteilung
(abt_id INT IDENTITY(1,1) PRIMARY KEY,
abtbez VARCHAR(20),
);

--INSERT INTO Abteilung (abtbez) VALUES
--('Personal'),
--('Vertrieb'),
--('Marketing'),
--('Buchhaltung'),
--('IT'),
--('Entwicklung'),
--('Produktion'),
--('Einkauf'),
--('Logistik'),
--('Verwaltung');

SELECT * FROM Abteilung;


CREATE TABLE Mitarbeiter
( ma_id INT IDENTITY(1,1),
vorname VARCHAR(100),
nachname VARCHAR(100),
str_hsnr VARCHAR(100),
plz CHAR(5),
ort VARCHAR(50),
geburtsdatum DATE,
f_id INT,
abt_id INT,
azm_id CHAR(2),
CONSTRAINT PK_mitarbeiter PRIMARY KEY (ma_id),
CONSTRAINT FK_ma_fam_f_id FOREIGN KEY (f_id) REFERENCES familienstand(f_id),
CONSTRAINT FK_ma_azm_azm_id FOREIGN KEY (azm_id) REFERENCES arbeitszeitmodell(azm_id),
CONSTRAINT FK_ma_abt_abt_id FOREIGN KEY (abt_id) REFERENCES abteilung(abt_id)
--FOREIGN KEY (f_id) REFERENCES Familienstand(f_id),
--FOREIGN KEY (azm_id) REFERENCES Arbeitszeitmodell(azm_id),
--FOREIGN KEY (abt_id) REFERENCES Abteilung(abt_id),
);

SELECT * FROM Mitarbeiter;


