use musiker

--1. Welche Interpreten enthalten an beliebiger Stelle ein e und enden auf s
--2. Welche Titel wurden bereits in Vegas oder Fuerth gespielt, 
--sortieren Sie bitte nach Titel aufsteigend
--3. Welche Titel enthalten kein a
--4. Kontrollieren Sie, wann Adele und/oder Miles Davis nach dem 30.06.2026 gebucht sind

--1
select * from interpret i
where i.name like '%e%s';
--2
select distinct t.titel, vort.ort_name from  titel t 
join  interpret i on t.interpret_id= i.i_id
join in_ver on in_ver.i_nr = i.i_id
join veranstaltungsort vort on vort.v_id = in_ver.v_nr
where vort.ort_name in ('Vegas' , 'Fuerth')
and in_ver.datum_bis < getdate()
order by t.titel;

--3
select t.titel from  titel t 
where t.titel not like '%a%';
--4
set dateformat ymd;
select i.name, in_ver.datum_von, in_ver.datum_bis
from interpret i 
join in_ver on in_ver.i_nr=i.i_id
where i.name in ('Adele', 'Miles Davis') 
and in_ver.datum_bis>'2026-06-30';


select getdate() Datum
select year(getdate());
select format(getdate(), 'dd MM yyyy') as Heute

select datename(year, getdate()) Jahr, 
datename(month, getdate()) Monat,
datename(day, getdate()) Tag,
datename(week, getdate()) Woche,
datename(weekday, getdate()) Wochentag,
datename(dayofyear, getdate()) Jahrestag,
datename(minute, getdate()) Minute,
datename(second, getdate()) Secunde,
datename(millisecond, getdate()) Milli,
datename(MICROSECOND, getdate()) Mikro,
datename(NANOSECOND, getdate()) Nano;

select 
datepart(year, getdate()) Jahr; 