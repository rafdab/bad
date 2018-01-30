CREATE TRIGGER kurs_backup on Kurs
AFTER DELETE
AS
	IF OBJECT_ID('Umiejetnosci_pracownika', 'U') IS NULL 
		CREATE TABLE kurs_backup(
			id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
			nazwa			VARCHAR(20),
			czas_trwania	INT,
			cena			MONEY
		);
	INSERT INTO kurs_backup(nazwa, czas_trwania, cena)
		SELECT nazwa, czas_trwania, cena from deleted
GO

CREATE TRIGGER uczestnik_backup on Uczestnik
AFTER DELETE
AS
	SELECT * INTO uczestnik_backup FROM deleted
GO

CREATE TRIGGER pracownik_backup on Pracownik
AFTER DELETE
AS
	SELECT * INTO pracownik_backup FROM deleted
GO

CREATE TRIGGER cert_backup on Certyfikat
AFTER DELETE
AS
	SELECT * INTO cert_backup FROM deleted
GO