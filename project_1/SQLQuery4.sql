--Bitte
select * from interpret;

select * into kuenstler from interpret;
select name into kuenstler_2 from interpret;

select column_name, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='interpret';


create table kuenstlerlername (
k_namen varchar(50)
);

insert into kuenstlerlername
select name from interpret;
select * from kuenstlerlername;

--3. Bitte löschen Sie aus der Tabelle kuenstler die Person mit der i_id 6
select name k_namen into kuenstlernamen_2 from interpret;
select * from Kuenstlernamen_2;
delete from kuenstler where i_id = 6; --für Test
select * from kuenstler;
--nun muss 'adele' weg
delete from kuenstler where name = 'adele';
select * from kuenstlerlername;


truncate table kuenstlerlername;
delete kuenstlerlername;
select * from kuenstlerlername

--6. Und nun ganz weg mit der Tabelle kuenstlernamen

drop table kuenstlerlername;
drop table if exists kuenstlerlername;

select * from kuenstlernamen_2;

--7. Als letztes löschen Sie bitte nun auch die Tabelle kuenstler komplett.
--Nicht nur den Inhalt , sondern die ganze Tabelle

drop table if exists kuenstler;
drop table if exists kuenstler_2;

select * from INFORMATION_SCHEMA.TABLES
drop table if exists kuenstlernamen_2;

