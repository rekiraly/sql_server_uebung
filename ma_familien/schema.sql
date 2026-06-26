drop table if exists menschlein;
drop table if exists familienstand
select * from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE


create table familienstand(
fid int identity(1,1) primary key,
fbez varchar(20)
);

create table menschlein (
id int identity(1,1),
vname varchar(50) not null,
fid int,
constraint PK_mensch primary key(id),
constraint FK_mensch_famstand 
foreign key (fid) references familienstand(fid)
);

insert into familienstand values
('Ledig'), ('Verheiratet'), ('Geschieden');

insert into menschlein values
('Lisa', 3),
('Hanni', 1),
('Eddi', 2),
('Lorenz', 2);

select * from menschlein;

select m.vname, f.fbez from menschlein m
join familienstand f on f.fid = m.fid;

select vname Vorname, fbez "Familienbestand des mitarbeiter" from menschlein 
join familienstand on familienstand.fid = menschlein.fid 
where fbez = 'Led%'; 