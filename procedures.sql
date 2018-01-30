CREATE PROCEDURE DoladujPortfel @hajs  MONEY, @PESEL VARCHAR(11) OUTPUT
AS
    BEGIN TRY
           IF EXISTS (SELECT * FROM Uczestnik
                              WHERE PESEL = @PESEL)
           BEGIN
                   UPDATE Uczestnik
				   SET portfel = portfel + @hajs
				   WHERE PESEL = @PESEL
				    
           END;
           ELSE
                  RAISERROR('Nie ma takiego uczestnika', 11, 1);
           END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS 'NUMER BLEDU',
               ERROR_MESSAGE() AS 'KOMUNIKAT';
    END CATCH;

	cREATE PROCEDURE DodajUczestnika @id INT, @PESEL VARCHAR(11) OUTPUT
AS
    BEGIN TRY
           IF EXISTS (SELECT * FROM Uczestnik
                              WHERE PESEL = @PESEL)
           BEGIN
                   IF (SELECT portfel FROM Uczestnik WHERE PESEL = @PESEL) >= (SELECT cena FROM Kurs WHERE id = @id)
				   BEGIN
						INSERT INTO Gr_ucz VALUES (@id,@PESEL);
						UPDATE Uczestnik SET portfel = portfel - (SELECT cena FROM Kurs WHERE id = @id) WHERE PESEL = @PESEL
				   END;
				   ELSE
						RAISERROR('Uzytkownik nie ma pieniazkow', 11, 1);
				    
           END;
           ELSE
                  RAISERROR('Nie ma takieu ¿ytkownika', 11, 1);
           END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS 'NUMER BLEDU',
               ERROR_MESSAGE() AS 'KOMUNIKAT';
    END CATCH;

alter PROCEDURE DodajUczestnika @id INT, @PESEL VARCHAR(11) OUTPUT
AS
    BEGIN TRY
           IF EXISTS (SELECT * FROM Uczestnik
                              WHERE PESEL = @PESEL)
           BEGIN
		   DECLARE @kurs INT
		   SET @kurs = (SELECT Kurs.id FROM (Grupa JOIN Kurs ON Grupa.kurs = Kurs.id) WHERE Grupa.id = @id)
                   IF (SELECT portfel FROM Uczestnik WHERE PESEL = @PESEL) >= (SELECT cena FROM Kurs WHERE id = @kurs)
				   BEGIN
						   IF EXISTS (SELECT * FROM Certyfikat WHERE uczestnik = @PESEL AND id = (SELECT wymagany FROM Kurs JOIN Wymagania_kurs_kurs AS T ON Kurs.id = T.id_kursu WHERE Kurs.id = @kurs))
								BEGIN
									IF EXISTS (SELECT id FROM Grupa WHERE id = @id)
									BEGIN
										INSERT INTO Gr_ucz VALUES (@id,@PESEL);
										UPDATE Uczestnik SET portfel = portfel - (SELECT cena FROM Kurs WHERE id = @id) WHERE PESEL = @PESEL
									END;
									ELSE IF EXISTS (SELECT id FROM Grupa WHERE id = @id)
									BEGIN
										RAISERROR('Dana grupa juz istnieje - inny kurs', 11, 1);
									END;
									ELSE
										RAISERROR('Dana grupa nie istnieje', 11, 1);
								END;
								ELSE
								RAISERROR('Uzytkownik nie ma wymaganych kursow', 11, 1)
				   END;
				   ELSE
						RAISERROR('Uzytkownik nie ma pieniazkow', 11, 1);	    
           END;
           ELSE
                  RAISERROR('Nie ma takieu ¿ytkownika', 11, 1);
           END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS 'NUMER BLEDU',
               ERROR_MESSAGE() AS 'KOMUNIKAT';
    END CATCH;

ALTER PROCEDURE Certyfikuj @id INT OUTPUT
AS
    BEGIN TRY
                IF EXISTS (SELECT * FROM Grupa
                              WHERE id = @id)
                BEGIN
                DECLARE @x INT
                SET @x = (SELECT kurs FROM Grupa WHERE id = @id)
                WHILE EXISTS (SELECT * From Gr_ucz
                                WHERE grupa = @id)
                        BEGIN
                            DECLARE @a VARCHAR(11)
                            SET @a = (SELECT TOP 1 uczestnik FROM Gr_ucz)
                            INSERT INTO Certyfikat VALUES
                            (GETDATE(), @x,@a)
                            DELETE FROM Gr_ucz
                            WHERE uczestnik = @a
                        END
                END
                ELSE
                    RAISERROR('Nie ma takiej grupy', 11, 1);
    END TRY      
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS 'NUMER BLEDU',
               ERROR_MESSAGE() AS 'KOMUNIKAT';
    END CATCH;
	
CREATE PROCEDURE DodajProwadzacego @gr INT, @prac INT OUTPUT
AS
    BEGIN TRY
           IF EXISTS (SELECT * FROM Pracownik
                              WHERE id = @prac)
           BEGIN
                   IF EXISTS (SELECT * FROM Grupa
                              WHERE id = @gr)
						if (select k.wymagane from kurs k join grupa g on g.kurs = k.id where g.id = @gr) in (select umiejetnosc from Umiejetnosci_pracownika where id_prac = @prac)
							UPDATE Grupa SET porwadzacy = @prac where id = @gr
						else
							RAISERROR('prowadzacy nie spelnia wymagan', 11, 1);
				   ELSE
						RAISERROR('Nie ma takiej grupy', 11, 1);
				    
           END;
           ELSE
                  RAISERROR('Nie ma takiego pracownika', 11, 1);
           END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS 'NUMER BLEDU',
               ERROR_MESSAGE() AS 'KOMUNIKAT';
    END CATCH;