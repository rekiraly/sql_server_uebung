--DROP TABLE mitarbeiter;
--DROP TABLE abteilung;
--DROP TABLE arbeitszeitmodell;
--DROP TABLE familienstand;

CREATE TABLE abteilung (
abtnr INT IDENTITY(1,1) PRIMARY KEY,
abtbez VARCHAR(100)
);

CREATE TABLE arbeitszeitmodell (
modell_code CHAR(2) PRIMARY KEY,
az_bez VARCHAR(50)
);

CREATE TABLE familienstand (
f_id INT IDENTITY(1,1) PRIMARY KEY,
fam_bez VARCHAR(50)
);

CREATE TABLE mitarbeiter (
ma_id INT IDENTITY(1,1),
nname VARCHAR (100),
vname VARCHAR (100),
str_hsnr VARCHAR (100),
plz VARCHAR (5),
ort VARCHAR(50),
gebdatum DATE,
f_id INT,
abt_nr INT,
azm_id CHAR(2),
CONSTRAINT PK_mitarbeieter PRIMARY KEY (ma_id),
CONSTRAINT FK_ma_fam_f_id FOREIGN KEY (f_id) REFERENCES familienstand(f_id), 
CONSTRAINT FK_ma_azm_azm_id FOREIGN KEY (azm_id) REFERENCES arbeitszeitmodell(modell_code),
CONSTRAINT FK_ma_abt_abt_nr FOREIGN KEY (abt_nr) REFERENCES abteilung(abtnr)
);
create table skills (
s_id int identity(1,1) primary key,
s_bez varchar(100) not null
);

create table ma_skills (
ma_id int,
s_id int,
constraint pk_maskilss primary key (ma_id, s_id),
--primary key (ma_id, s_id),
foreign key (ma_id) references mitarbeiter (ma_id),
foreign key (s_id) references skills (s_id)
);

--select * from mitarbeiter;

create table ma(
nname varchar(100), 
geb_date date
);

insert into ma (geb_date, nname)
select gebdatum,vname  from mitarbeiter; 

select ma.nname Nachname, ma.vname Vorname, abt.abtbez Bezeichnung from mitarbeiter ma
join abteilung abt on abt.abtnr=ma.abt_nr 

select ma.vname Vorname, ma.nname Nachname, abt.abtbez Abteilung, azm.az_bez
from mitarbeiter ma
join abteilung abt on abt.abtnr=ma.abt_nr
join arbeitszeitmodell azm on azm.modell_code=ma.azm_id
where (abt.abtbez='Marketing' or abt.abtbez ='IT') and azm.modell_code='vz'
--order by ma.nname ;
order by abt.abtbez DESC;

