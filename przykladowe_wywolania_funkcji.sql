SELECT * FROM prac_umiej('BHP');

SELECT * FROM prac_umiej_id('2');

delete from Uczestnik where PESEL = '65856554548'
select * from Uczestnik
select * from uczestnik_backup

select * from Umiejetnosci

EXEC DoladujPortfel 2000, '65986534215'
select * from Uczestnik

EXEC DoladujPortfel 500, 'asd'

EXEC DodajUczestnika 1, '65986534215'
select u.nazwisko, k.nazwa, g.id from grupa g join Gr_ucz on g.id = grupa join Uczestnik u on u.PESEL = uczestnik join Kurs k on kurs = k.id
select * from Gr_ucz

EXEC DodajUczestnika 1, '45457515465'
EXEC DodajUczestnika 1, 'asd'

EXEC Certyfikuj 1
select * from Certyfikat

EXEC DodajProwadzacego 1, 3
select * from Grupa
EXEC DodajProwadzacego 1, 1
EXEC DodajProwadzacego 7, 1
EXEC DodajProwadzacego 1, 7

select dbo.certyfikaty(6)
select dbo.certyfikaty(2)


EXEC DodajProwadzacego 4, 3
EXEC DodajUczestnika 1, '65986534215'