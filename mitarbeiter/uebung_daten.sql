--use musiker; 
use mitarbeiter;

--6. Lassen Sie den Nachnamen; den Vornamen und das Arbeitszeitmodell jedes 
--mitarbeiters ausgeben- Sortiert nach Arbeitszeitmodell

select m.nname Nachname, m.vname Vorname, a.az_bez Bezeichen from  mitarbeiter m
join arbeitszeitmodell a on a.modell_code = m.azm_id
order by a.az_bez, m.nname, m.vname;


--7. Nun bitte nachname, vorname und geburtsdatum 
--aller ledigen mitarbeiter im homeoffice

select m.nname, m.vname, m.gebdatum, a.az_bez
from mitarbeiter m
join arbeitszeitmodell a on a.modell_code=m.azm_id
join familienstand f on f.f_id=m.f_id
where a.az_bez='homeoffice' and f.fam_bez='ledig';
--where a.modell_code='ho' and f.fam_bez='ledig';