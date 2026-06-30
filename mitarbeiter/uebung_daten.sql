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







----------------------------HAUSAUFGABE----------------------------------------

--6. Welche Mitarbeiter aus dem PLZ-Bereich 90402 bis 90491 arbeiten im HomeOffice?
select ma.nname, ma.vname, ma.plz
from mitarbeiter ma
join arbeitszeitmodell ar on ma.azm_id=ar.modell_code
where ma.plz >= '90402' and ma.plz<= '90491' and ar.modell_code='ho' ;

--7. -Wir sind im Bereich 90402. Suchen Sie uns bitte den oder die Mitarbeiter heraus, die ebenfalls
--in dem PLZ-Bereich wohnen. Uns interessiert hier, der Nachname, der Vorname, die
--Straße und Hausnummer
select ma.nname, ma.vname, ma.str_hsnr
from mitarbeiter ma
where ma.plz='90402'

-- 8. Bitte erzeugen Sie eine Ausgabe aller Mitarbeiter die nach 1974 geboren wurden
select ma.nname, ma.vname, ma.gebdatum
from mitarbeiter ma
where year(ma.gebdatum)>=1974;

--9. Nun bitte eine Ausgabe aller Mitarbeiter die nicht im HomeOffice arbeiten
select ma.nname, ma.vname, ar.az_bez
from mitarbeiter ma
join arbeitszeitmodell ar on ma.azm_id=ar.modell_code
where ar.modell_code not like 'ho'

-- 10. Bitte erzeugen Sie folgende Ausgabe für alle Mitarbeiter
select ma.nname Nachname, ma.vname Vorname,
abt.abtbez Abteilung, ar.az_bez Arbeitszeitmodell,
ma.gebdatum Geburtsdatum, ma.str_hsnr "Straße und Hausnummer",
ma.plz PLZ, ma.ort Wohnort
from mitarbeiter ma
join abteilung abt on abt.abtnr=ma.abt_nr
join arbeitszeitmodell ar on ma.azm_id=ar.modell_code
--------------------------------------------------------------------------





