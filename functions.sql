CREATE FUNCTION roczne_zarobki (@placa MONEY) returns MONEY
as
begin
	return @placa*12
end

CREATE FUNCTION prac_umiej (@skill VARCHAR(20)) returns table
as
	return	SELECT	p.id, p.nazwisko
			FROM	Pracownik p JOIN Umiejetnosci_pracownika on p.id = id_prac
					JOIN Umiejetnosci u on u.id = umiejetnosc
			WHERE	u.nazwa = @skill

CREATE FUNCTION prac_umiej_id (@skill INT) returns table
as
	return	SELECT	p.id, p.nazwisko
			FROM	Pracownik p JOIN Umiejetnosci_pracownika on p.id = id_prac
					JOIN Umiejetnosci u on u.id = umiejetnosc
			WHERE	u.id = @skill

CREATE FUNCTION koszty_kursow () returns table
as
	return	SELECT	g.id[ID_grupy], k.cena, (m.cena * k.czas_trwania)[Koszt_kursu]
			FROM	Grupa g JOIN Kurs k on k.id = g.kurs
					JOIN Grafik graf on g.id = graf.grupa
					JOIN Miejsce m on m.id = graf.miejsce