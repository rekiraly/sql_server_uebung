use musiker
use musiker
--1. Bitte ermitteln Sie, wie viele Titel wir pro Genre gespeichert haben. Folgende Ausgabe wird 
--erwartet. 
select genre.genre, count(*)  'count titel'
from titel
join genre on genre.g_id = titel.genre_id
group by genre.genre

--1. Bitte ermitteln Sie, wie viele Titel wir pro Genre gespeichert haben. Folgende Ausgabe wird --erwartet. 
use musiker;
select g.genre,
count(*)from titel tjoin genre g on g.g_id = t.genre_idgroup by g.genre

--2. Bitte erstellen Sie eine Auflistung, wie viele unterschiedliche Titel jeder Interpret in seinem 
--Repertoire hat. Sortieren Sie die Ausgabe bitte nach Interpret.
select i.name, count(*)from titel t
join interpret i on t.interpret_id = i.i_idgroup by i.name
--3. Bei welchen Interpreten haben wir mehr als sechs Titel gespeichert. Sortieren Sie die
--Ausgabe bitte nach Interpret.
select i.name, count(*)from titel tjoin interpret i on i.i_id = t.interpret_idgroup by i.namehaving count(*)>6;
--4. Bitte erzeugen Sie eine Liste die uns informiert, welches die jeweils ersten Auftrittstage der
--Interpreten sind und wo die Auftritte stattfinden. Sortierung bitte nach Interpret. Folgende 
--Ausgabe wird erwartet.select i.name, in_ver.datum_von, v.ort_namefrom in_verjoin veranstaltungsort v on in_ver.v_nr = v.v_idjoin interpret i on i.i_id = in_ver.i_nrorder by i.name, in_ver.datum_von
--Weiter geht es mit den Mitarbeitern
--5. Welche Familienstände sind wie häufig vertreten?
Folgende Ausgabe wird erwartet.use mitarbeiter;
select f.fam_bez, count(*)from mitarbeiter m
join familienstand f on f.f_id = m.f_idgroup by f.fam_bez
--6. Wer ist unser jüngster Mitarbeiter und in welchem Arbeitszeitmodell arbeitet der MA? Fol--gende Ausgabe wird erwartet. select top 1 ma.ma_id, ma.vorname, ma.nachname, ma.geburtsdatum, az.az_bezfrom mitarbeiter majoin arbeitszeitmodell az on ma.azm_id = az.azm_idorder by ma.geburtsdatum DESC--7. Wie viele Mitarbeiter beschaftigen wir je Abteilung? Folgende Ausgabe wird ... na Sie wissen--schonselect abt.abtbez,  count(*)from mitarbeiter majoin abteilung abt on abt.abt_id = ma.abt_idgroup by abt.abtbez
--8. In welcher/welchen Abteilungen arbeiten die meisten Mitarbeiter? select top 1 with ties abt.abtbez,  count(*)from mitarbeiter majoin abteilung abt on abt.abt_id = ma.abt_idgroup by abt.abtbezorder by count(*) DESC--9. Welche Mitarbeiter haben mehr als 2 Skills angegeben und wie viele Skills sind das? select  ma.vorname, ma.nachname, count(*) as SkillsAnzahlfrom mitarbeiter majoin ma_skills mas on mas.ma_id = ma.ma_idgroup by  ma.vorname, ma.nachnamehaving count(*) > 2order by ma.nachname
--10. Welche/r Skill/s wurde/n am häufigsten genannt?select top 1 with ties s.s_id, s.s_bez, count(*)from skills sjoin ma_skills mas on mas.s_id = s.s_idgroup by s.s_id, s.s_bezorder by count(*) DESC--11. Erstellen Sie bitte nun selbstständig eine neue Datenbank mit dem Namen manwomanDB. Im --Anhang finden Sie den SourceCode für die Erstellung der Tabellen und die Inserts.