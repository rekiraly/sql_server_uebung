--alle ids, vornamen und Familienstandbezeichnung der Personen,
--bei denen als Familienstandbezeichnung geschieden eingetragen wurde
select m.id, m.vname, f.fbez 
from menschlein m
join familienstand f on f.fid=m.id
where f.fbez = 'geschieden';

--alle ids, vorname und familienstandbezeichnungen der Person die nicht ledig sind

select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on f.fid=m.fid
where f.fbez!='ledig'
--where f.fbez<>'ledig'


select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on f.fid=m.fid
where f.fbez!='geschieden'
--where f.fbez<>'ledig'

--alle ids, vorname und familienstandbezeichnungen der Person, 
--bei denen die Familienstands-id gleich 1 ist

select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on f.fid=m.fid
where f.fid=1;


--alle ids, vorname und familienstandbezeichnungen der Person, 
--bei denen die Familienstands-id ungleich 1 ist
select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on f.fid=m.fid
where f.fid !=1;

--alle ids, vorname und familienstandbezeichnungen der Person, 
--bei denen die Familienstands-id kleine jder gleich 3 ist
select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on f.fid=m.fid
where f.fid <=3;

alter table familienstand
alter column fbez varchar(50);


select * from menschlein;
--insert into familienstand values ('verwitwet'),
--('eingetr. Lebensgemeinschaft')
--insert into menschlein values 
--('Charlie',3), ('Laura',5),
--('Melanie',1),
--('Jack',1), 
--('Daniel',1),
--('Martha',null),
--('Harry',null)

--alle datensetze der tabelle menschlein
--bei denen die id zwieschen (2 und 7 jewals.) inkl. ist

select m.id, m.vname 
from menschlein m
--join familienstand f on f.fid=m.fid
where m.id between 2 and 7;

----alle ids, vorname und familienstand und familienstandbezeichnungen der Person, 
--bei denen die Familienstands-id nicht zwischen 2 und 4 liegt

select m.id, m.vname , m.fid, f.fbez
from menschlein m
left join familienstand f on f.fid=m.fid
where m.fid not between 2 and 4 or f.fid is NULL;

--Alle Menschen ohne Famillienstand
select m.vname, m.fid
from menschlein m
where m.fid is null

--Alle Menschen mit Famillienstand
select m.vname, m.fid
from menschlein m
where m.fid is not null

--alle Menschen mit dem 2. buchstabe 'a' und danach genau 3 Buchstabe

select * from menschlein m
where m.vname like'_a___';

--Alle Menshen mit dem 2. Buchstabe 'a'
select * from menschlein m
where m.vname like'_a%';

--insert into menschlein values ('Alex',3)
-- insert into menschlein values ('Klara',1)
--insert into menschlein values ('Maren',4)

--insert into menschlein values ('Jan',2)

select * from menschlein where id like ('1_');

--Alle Menschen mit dem id<10, aber mit like operator
select * from menschlein
where id like '_';

--Alle Menschen mit dem id<10, aber mit not like operator
select * from menschlein
where id not like '__%';

--Alle Menschen die Lorenz, Jack oder Harry
select * from menschlein
where vname in ( 'Lorenz', 'Jack', 'Harry');
--where vname like 'Lorenz' or  vname like 'Jack' or vname like  'Harry';

select * from menschlein
where vname not in ( 'Lorenz', 'Jack', 'Harry');

--Alle Menschen mit id nicht 5, 7, 11 oder 23
select * from menschlein m
where m.id not in (5, 7, 11, 23)



