-- DROP
IF OBJECT_ID('Wymagania_kurs_kurs', 'U') IS NOT NULL 
	DROP TABLE Wymagania_kurs_kurs;
	
IF OBJECT_ID('Wymagania_kurs_pracownik', 'U') IS NOT NULL 
	DROP TABLE Wymagania_kurs_pracownik;
	
IF OBJECT_ID('Umiejetnosci_pracownika', 'U') IS NOT NULL 
	DROP TABLE Umiejetnosci_pracownika;
	
IF OBJECT_ID('Gr_ucz', 'U') IS NOT NULL 
	DROP TABLE Gr_ucz;
	
IF OBJECT_ID('Gr_prac', 'U') IS NOT NULL 
	DROP TABLE Gr_prac;
	
IF OBJECT_ID('Certyfikat', 'U') IS NOT NULL 
	DROP TABLE Certyfikat;
	
IF OBJECT_ID('Grafik', 'U') IS NOT NULL 
	DROP TABLE Grafik;
	
IF OBJECT_ID('Grupa', 'U') IS NOT NULL 
	DROP TABLE Grupa;
	
IF OBJECT_ID('Umiejetnosci', 'U') IS NOT NULL 
	DROP TABLE Umiejetnosci;
	
IF OBJECT_ID('Miejsce', 'U') IS NOT NULL 
	DROP TABLE Miejsce;
	
IF OBJECT_ID('Pracownik', 'U') IS NOT NULL 
	DROP TABLE Pracownik;
	
IF OBJECT_ID('Kurs', 'U') IS NOT NULL 
	DROP TABLE Kurs;

IF OBJECT_ID('Uczestnik', 'U') IS NOT NULL 
	DROP TABLE Uczestnik;

-- CREATE
CREATE TABLE Uczestnik(
	PESEL		VARCHAR(11) PRIMARY KEY,
	imie		VARCHAR(20),
	nazwisko	VARCHAR(20),
	adres_m		VARCHAR(10),
	adres_u		VARCHAR(20),
	telefon		VARCHAR(10),
	mail		VARCHAR(20),
	portfel		MONEY,
	CONSTRAINT ck_ucz_tel CHECK (telefon like '[0-9]%')
);

CREATE TABLE Pracownik(
	id			INT NOT NULL PRIMARY KEY,
	imie		VARCHAR(20),
	nazwisko	VARCHAR(20),
	adres_m		VARCHAR(10),
	adres_u		VARCHAR(20),
	telefon		VARCHAR(10),
	mail		VARCHAR(20),
	placa		MONEY,
	CONSTRAINT ck_prac_tel CHECK (telefon like '[0-9]%')
);

CREATE TABLE Umiejetnosci(
	id		INT NOT NULL PRIMARY KEY,
	nazwa	VARCHAR(20)
);

CREATE TABLE Kurs(
	id				INT NOT NULL PRIMARY KEY,
	nazwa			VARCHAR(20),
	czas_trwania	INT,
	cena			MONEY
);

CREATE TABLE Certyfikat(
	id			INT NOT NULL PRIMARY KEY,
	data_wyst	DATE,
	kurs		INT REFERENCES Kurs(id),
	uczestnik	VARCHAR(11) REFERENCES Uczestnik(PESEL)
);

CREATE TABLE Miejsce(
	id		INT NOT NULL PRIMARY KEY,
	miasto	VARCHAR(10),
	ulica	VARCHAR(20),
	cena	MONEY
);

CREATE TABLE Grupa(
	id			INT NOT NULL PRIMARY KEY,
	data_rozp	DATE,
	kurs		INT REFERENCES Kurs(id)
);

CREATE TABLE Grafik(
	id		INT NOT NULL PRIMARY KEY,
	dzien	DATE,
	godzina	TIME,
	miejsce	INT REFERENCES Miejsce(id),
	grupa	INT REFERENCES Grupa(id),
);

-- wymagania do uczesniczenia w kursie (wymagania co do uczestnika)
CREATE TABLE Wymagania_kurs_kurs(
	id_kursu	INT REFERENCES Kurs(id),
	wymagany	INT REFERENCES Kurs(id)
);

-- wymagane umiejêtnoœci do prowadzenia kursu (wymagania co do pracownika)
CREATE TABLE Wymagania_kurs_pracownik(
	id_kursu	INT REFERENCES Kurs(id),
	umiejetnosc	INT REFERENCES Umiejetnosci(id)
);

-- lista umiejêtnoœæi konkretnych pracowników
CREATE TABLE Umiejetnosci_pracownika(
	id_prac		INT REFERENCES Pracownik(id),
	umiejetnosc	INT REFERENCES Umiejetnosci(id)
);

-- uczestnicy w grupie
CREATE TABLE Gr_ucz(
	grupa		INT REFERENCES Grupa(id),
	uczestnik	VARCHAR(11) REFERENCES Uczestnik(PESEL)
);

-- prowadz¹cy grupê
CREATE TABLE Gr_prac(
	grupa		INT REFERENCES Grupa(id),
	pracownik	INT REFERENCES Pracownik(id)
);