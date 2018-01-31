CREATE VIEW grafikPrac (nazwisko, nazwa_kursu, dzien, godzina, adres_m, adres_ul)
AS
	SELECT	p.nazwisko, k.nazwa, g.dzien, g.godzina, m.miasto, m.ulica
	FROM	Pracownik p
			join	Grupa gr on p.id = gr.porwadzacy
			join	Kurs k on gr.kurs = k.id
			join	Grafik g on gr.id = g.grupa
			join	Miejsce m on g.miejsce = m.id

CREATE VIEW grafikUcz (PESEL, nazwa_kursu, dzien, godzina, adres_m, adres_ul)
AS
	SELECT	p.PESEL, k.nazwa, g.dzien, g.godzina, m.miasto, m.ulica
	FROM	Uczestnik p
			join	Gr_ucz gr1 on gr1.uczestnik = p.PESEL
			join	Grupa gr on gr1.grupa = gr.id
			join	Kurs k on gr.kurs = k.id
			join	Grafik g on gr.id = g.grupa
			join	Miejsce m on g.miejsce = m.id