-- uczestnik
INSERT INTO Uczestnik VALUES ('65856554548', 'Adam', 'Wachowiak', 'Poznañ', 'Miodowa 13', '678475867', 'adam@poczta.pl', 0);
INSERT INTO Uczestnik VALUES ('45457515465', 'Mikita', 'Kowalski', 'Poznañ', 'Ró¿ana 32', '658457659', 'mikita@poczta.pl', 0);
INSERT INTO Uczestnik VALUES ('65986534215', 'Anna', 'Adamczak', 'G³ogów', 'Wiœlana 3', '548659548', 'ania@poczta.pl', 0);
INSERT INTO Uczestnik VALUES ('65946568542', 'Rafaela', 'Stanis³awowicz', 'Poznañ', 'Umultowska 63', '659875316', 'rafaela@poczta.pl', 0);
INSERT INTO Uczestnik VALUES ('32656421542', 'Bogdan', 'Rogowiecki', 'Poznañ', 'D³uga 993', '754875465', 'bogdan@poczta.pl', 0);

-- pracownik
INSERT INTO Pracownik VALUES ('Antoni', 'Wa³ecki', 'Poznañ', 'Pod³u¿na 4', '658565452', 'antoni@firma.pl', 2000);
INSERT INTO Pracownik VALUES ('Piotr', 'Rolla', 'Poznañ', 'Krzywa 11', '568569985', 'piotr@firma.pl', 3500);
INSERT INTO Pracownik VALUES ('Joanna', 'Wsad', 'Poznañ', 'Niebieska 3/5', '788556985', 'joanna@firma.pl', 3250);
INSERT INTO Pracownik VALUES ('Karol', 'Kowalewski', 'Poznañ', 'Niebieska 11/4', '564885699', 'karol@firma.pl', 2900);

--umiejêtnoœci
INSERT INTO Umiejetnosci VALUES ('BHP');
INSERT INTO Umiejetnosci VALUES ('Pierwsza pomoc');
INSERT INTO Umiejetnosci VALUES ('AM');
INSERT INTO Umiejetnosci VALUES ('A1');
INSERT INTO Umiejetnosci VALUES ('A2');
INSERT INTO Umiejetnosci VALUES ('A');
INSERT INTO Umiejetnosci VALUES ('B1');
INSERT INTO Umiejetnosci VALUES ('B');
INSERT INTO Umiejetnosci VALUES ('C1');
INSERT INTO Umiejetnosci VALUES ('C');
INSERT INTO Umiejetnosci VALUES ('D1');
INSERT INTO Umiejetnosci VALUES ('D');
INSERT INTO Umiejetnosci VALUES ('BE');
INSERT INTO Umiejetnosci VALUES ('C1E');
INSERT INTO Umiejetnosci VALUES ('CE');
INSERT INTO Umiejetnosci VALUES ('D1E');
INSERT INTO Umiejetnosci VALUES ('DE');
INSERT INTO Umiejetnosci VALUES ('T');

--Kurs
INSERT INTO Kurs VALUES ('Kat. AM', 2, 200, 3);
INSERT INTO Kurs VALUES ('Kat. A1', 2, 300, 4);
INSERT INTO Kurs VALUES ('Kat. A2', 4, 700, 5);
INSERT INTO Kurs VALUES ('Kat. A', 8, 1200, 6);
INSERT INTO Kurs VALUES ('Kat. B1', 3, 500, 7);
INSERT INTO Kurs VALUES ('Kat. B', 4, 900, 8);
INSERT INTO Kurs VALUES ('Kat. C1', 8, 1800, 9);
INSERT INTO Kurs VALUES ('Kat. C', 16, 3500, 10);
INSERT INTO Kurs VALUES ('Kat. D1', 14, 3000, 11);
INSERT INTO Kurs VALUES ('Kat. D', 20, 6000, 12);
INSERT INTO Kurs VALUES ('Kat. BE', 1, 200, 13);
INSERT INTO Kurs VALUES ('Kat. C1E', 2, 650, 14);
INSERT INTO Kurs VALUES ('Kat. CE', 3, 1000, 15);
INSERT INTO Kurs VALUES ('Kat. D1E', 4, 1000, 16);
INSERT INTO Kurs VALUES ('Kat. DE', 4, 1500, 17);
INSERT INTO Kurs VALUES ('Kat. T', 4, 650, 18);

-- miejsce
INSERT INTO Miejsce VALUES ('Poznañ', 'Kwiatowa 18', 200);
INSERT INTO Miejsce VALUES ('Poznañ', 'M³yñska 35', 350);

-- grupa
INSERT INTO Grupa VALUES ('2018-02-15', 6, 2);
INSERT INTO Grupa VALUES ('2018-02-01', 4, 4);
INSERT INTO Grupa VALUES ('2018-02-06', 8, 1);

-- grafik (automatyczne tworzenie)

-- umiejêtnoœci pracowników
INSERT INTO Umiejetnosci_pracownika VALUES (1, 1);
INSERT INTO Umiejetnosci_pracownika VALUES (1, 2);
INSERT INTO Umiejetnosci_pracownika VALUES (1, 3);
INSERT INTO Umiejetnosci_pracownika VALUES (1, 10);
INSERT INTO Umiejetnosci_pracownika VALUES (1, 5);
INSERT INTO Umiejetnosci_pracownika VALUES (2, 7);
INSERT INTO Umiejetnosci_pracownika VALUES (2, 8);
INSERT INTO Umiejetnosci_pracownika VALUES (2, 6);
INSERT INTO Umiejetnosci_pracownika VALUES (2, 1);
INSERT INTO Umiejetnosci_pracownika VALUES (2, 13);
INSERT INTO Umiejetnosci_pracownika VALUES (3, 5);
INSERT INTO Umiejetnosci_pracownika VALUES (3, 6);
INSERT INTO Umiejetnosci_pracownika VALUES (3, 8);
INSERT INTO Umiejetnosci_pracownika VALUES (3, 9);
INSERT INTO Umiejetnosci_pracownika VALUES (3, 2);
INSERT INTO Umiejetnosci_pracownika VALUES (4, 1);
INSERT INTO Umiejetnosci_pracownika VALUES (4, 4);
INSERT INTO Umiejetnosci_pracownika VALUES (4, 5);
INSERT INTO Umiejetnosci_pracownika VALUES (4, 6);
INSERT INTO Umiejetnosci_pracownika VALUES (4, 11);

--wymagania kurs - kurs
INSERT INTO Wymagania_kurs_kurs VALUES (3, 2);
INSERT INTO Wymagania_kurs_kurs VALUES (4, 3);
INSERT INTO Wymagania_kurs_kurs VALUES (8, 7);
INSERT INTO Wymagania_kurs_kurs VALUES (11, 6);
INSERT INTO Wymagania_kurs_kurs VALUES (12, 7);
INSERT INTO Wymagania_kurs_kurs VALUES (13, 8);
INSERT INTO Wymagania_kurs_kurs VALUES (14, 9);
INSERT INTO Wymagania_kurs_kurs VALUES (15, 10);