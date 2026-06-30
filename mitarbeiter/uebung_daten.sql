--use musiker; 
use mitarbeiter;

--6. Lassen Sie den Nachnamen; den Vornamen und das Arbeitszeitmodell jedes 
--mitarbeiters ausgeben- Sortiert nach Arbeitszeitmodell

select ma.nname, ma.vname, arbeitszeitmodell.az_bez
from mitarbeiter ma 
join arbeitszeitmodell on arbeitszeitmodell.modell_code = ma.azm_id
order by arbeitszeitmodell.az_bez DESC 


select m.nname Nachname, m.vname Vorname, a.az_bez Bezeichen 
from  mitarbeiter m
join arbeitszeitmodell a on a.modell_code = m.azm_id
order by a.az_bez, m.nname, m.vname;


--7. Nun bitte nachname, vorname und geburtsdatum 
--aller ledigen mitarbeiter im homeoffice

select m.nname, m.vname, m.gebdatum, f.fam_bez
from mitarbeiter m 
join familienstand f on f.f_id = m.f_id
join arbeitszeitmodell a on a.modell_code = m.azm_id
where f.fam_bez = 'ledig' and a.az_bez  = 'Homeoffice'



select m.nname, m.vname, m.gebdatum, a.az_bez
from mitarbeiter m
join arbeitszeitmodell a on a.modell_code=m.azm_id
join familienstand f on f.f_id=m.f_id
where a.az_bez='homeoffice' and f.fam_bez='ledig';
--where a.modell_code='ho' and f.fam_bez='ledig';

--8. lassen sie alle nachnamen der mitarbeiter ausgeben, 
--samt der Abteilung in welche Sie arbeiten
--Sortiert nach abtbez, nname und vname. Gerne mit hübschen überschriften

Select ma.ma_id, ma.nname Nachname, ma.vname Vorname, ab.abtbez Abteilung
from mitarbeiter ma
join abteilung ab on ab.abtnr=ma.abt_nr
order by ab.abtbez, ma.nname, ma.vname;

--select * from abteilung

--9 wie oben, aber ner von den Mitarbeitern
--die in Teilzeit arbeiten

Select ma.ma_id, ma.nname Nachname, ma.vname Vorname, ab.abtbez Abteilung
from mitarbeiter ma
join abteilung ab on ab.abtnr=ma.abt_nr
join arbeitszeitmodell ar on ar.modell_code=ma.azm_id
where ar.az_bez='Teilzeit'
order by ab.abtbez, ma.nname, ma.vname;

--10 als letztes nun bitte eine auflistung der 
--ledigen Mitarbeiter(Vorname, nachname) aus Nürnberg

Select ma.ma_id, ma.nname Nachname, ma.vname Vorname, ab.abtbez Abteilung
from mitarbeiter ma
join abteilung ab on ab.abtnr=ma.abt_nr
join arbeitszeitmodell ar on ar.modell_code=ma.azm_id
join familienstand fam on fam.f_id=ma.f_id
where ar.az_bez='Teilzeit' and ma.ort='Nuernberg' and fam.fam_bez='ledig'
order by ab.abtbez, ma.nname, ma.vname;






