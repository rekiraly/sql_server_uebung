use musiker
--1. Bitte ermitteln Sie, wie viele Titel wir pro Genre gespeichert haben. Folgende Ausgabe wird 
--erwartet. 
select titel.titel, count(titel.titel) 
from genre
join titel on genre.g_id = titel.genre_id
group by titel.titel, genre.genre