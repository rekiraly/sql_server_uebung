use ma_famillienstand

select * from menschlein m
join familienstand f on f.fid=m.fid;
--1)
select fid from menschlein
where vname='Eddi'
--2)
select vname from menschlein
where fid=2;
--3)
select vname from menschlein m 
where m.fid =
(select fid from menschlein
where vname = 'Eddi') and vname != 'Eddi'


use musiker

--wer  bedingt das gleiche Genre wie Coldplay?
select distinct t.genre_id 
from interpret i
join titel t on t.interpret_id=i.i_id
where i.name='Coldplay'

--2)
select i.name
from interpret i
join titel t on t.interpret_id=i.i_id
where t.genre_id=2;

--select genre from genre
--where genre.g_id = 2

select distinct i.name
from interpret i
join titel t on t.interpret_id=i.i_id
where t.genre_id=
(select distinct t.genre_id 
from interpret i
join titel t on t.interpret_id=i.i_id
where i.name='Coldplay'
);
--update titel set titel.genre_id = 8 where titel.titel = 'Numb'
--was passiert mit Linkin Park
select distinct t.genre_id 
from interpret i
join titel t on t.interpret_id=i.i_id
where i.name='Linkin Park'
--select * from genre

select distinct i.name
from interpret i
join titel t on t.interpret_id=i.i_id
where t.genre_id in
(select distinct t.genre_id 
from interpret i
join titel t on t.interpret_id=i.i_id
where i.name='Linkin Park'
);

use mitarbeiter

--6.Wer ist unser Jungster Mitarbeiter und in welchem Arbeitszeitmodell arbeitet der MA?
--6.1 jungste definieren
select max(m.gebdatum)
from mitarbeiter m

--6.2 ma mit den gleichem geburtsdatum
select vname, nname, gebdatum, azm.az_bez
from mitarbeiter ma
join arbeitszeitmodell azm on azm.modell_code=ma.azm_id
where gebdatum ='1998-02-18'

--6.3 subselect
select vname, nname, gebdatum, azm.az_bez
from mitarbeiter ma
join arbeitszeitmodell azm on azm.modell_code=ma.azm_id
where gebdatum =
(select max(m.gebdatum)
from mitarbeiter m)


--17.Welche interesse wurde am häufigsten genannt intnr, inttext anzahl
use manwomanDB
----nur mit count--------

select top 1 with ties i.intnr, count(*) 'Anzahl Nennung'
from tl3_manwoman mw
join tl3_mw_interessen imw on imw.mwnr = mw.mwnr
join tl3_interessen i on i.intnr = imw.intnr
group by i.intnr, i.inttext
order by count(*) desc
------------------------------------

-------------- von lehrer mit select------
select i.intnr, i.inttext, count(*)
from tl3_interessen i
join tl3_mw_interessen mwi on mwi.intnr = i.intnr
group by i.intnr, i.inttext
having count(*) =
(
select max(temp.Anzahl) from
(select mwi.intnr, count(*) Anzahl
from tl3_mw_interessen mwi
group by mwi.intnr) temp
)
--------------------
--18 whelcher mitarbeiter whont an dem ort
--an dem die meisten ma zu hause sind
use mitarbeiter

select top 1 with ties ma.ort, count(*) Anzahl
from mitarbeiter ma 
/*where ma.azm_id = 'ho'*/
group by ma.ort
order by Anzahl desc
--------------antwort------------------
select ma.nname, ma.vname
from mitarbeiter ma
where ma.ort in 
(
select top 1 with ties ma.ort
from mitarbeiter ma 
/*where ma.azm_id = 'ho'*/
group by ma.ort
order by count(*) desc
) ;
--------------------2 möglichkeit ???-------------
select temp.ort from (select ma.ort, count(*) Anzahl
from mitarbeiter ma 
/*where ma.azm_id = 'ho'*/
group by ma.ort
having Anzahl = max(count(*))
)temp


--19--------- herausfinden welche ma in den mitarbeitersstärksten abteilung arbeiten
select ma.nname, ma.vname, ma.abt_nr
from mitarbeiter ma
where ma.abt_nr in (
select top 1 with ties ma.abt_nr --, count(*) zahl_MA
from mitarbeiter ma
group by ma.abt_nr
order by count(*) desc
) order by ma.abt_nr

-----------------
select top 3 with ties ma.abt_nr, count(*) anzahl_ma
from mitarbeiter ma
group by ma.abt_nr
order by count(*) desc

--20 Nun welche ma verfügen über die kentnisse,
--weclhe 3 am wenigsten verbreitet sind?
 select ma.nname, skills.s_bez, ma_skills.s_id 
 from mitarbeiter ma
 join ma_skills on ma_skills.ma_id=ma.ma_id
 join skills on skills.s_id=ma_skills.s_id
 where ma_skills.s_id 
 in (
 select top 3 with ties  sm.s_id--, count(*) 'freq'
 from ma_skills sm
 group by sm.s_id
 order by count(*) 
 ) order by ma.nname 



--
 select top 3 with ties  sm.s_id--, count(*) 'freq'
 from ma_skills sm
 group by sm.s_id
 order by count(*) 













