CREATE TRIGGER t_uczestnik_backup on Uczestnik
AFTER DELETE
AS
	IF OBJECT_ID('uczestnik_backup', 'U') IS NULL 
		CREATE TABLE uczestnik_backup(
			PESEL		VARCHAR(11) PRIMARY KEY,
			imie		VARCHAR(20),
			nazwisko	VARCHAR(20),
			adres_m		VARCHAR(10),
			adres_u		VARCHAR(20),
			telefon		VARCHAR(10),
			mail		VARCHAR(20),
			portfel		MONEY DEFAULT 0,
		);
	INSERT INTO uczestnik_backup(PESEL, imie, nazwisko, adres_m, adres_u, telefon, mail, portfel)
		SELECT PESEL, imie, nazwisko, adres_m, adres_u, telefon, mail, portfel from deleted
GO

CREATE TRIGGER t_pracownik_backup on Pracownik
AFTER DELETE
AS
	IF OBJECT_ID('pracownik_backup', 'U') IS NULL 
		CREATE TABLE pracownik_backup(
			id			INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
			imie		VARCHAR(20),
			nazwisko	VARCHAR(20),
			adres_m		VARCHAR(10),
			adres_u		VARCHAR(20),
			telefon		VARCHAR(10),
			mail		VARCHAR(20),
			placa		MONEY,
		);
	INSERT INTO pracownik_backup(imie, nazwisko, adres_m, adres_u, telefon, mail, placa)
		SELECT imie, nazwisko, adres_m, adres_u, telefon, mail, placa from deleted
GO

CREATE TRIGGER t_del_skill on Umiejetnosci
INSTEAD OF DELETE
AS
     PRINT 'Uzytkownik probowal usunac wiersze z tabeli Umiejetnosci, co jest zabronione';
     SELECT * FROM deleted;
GO