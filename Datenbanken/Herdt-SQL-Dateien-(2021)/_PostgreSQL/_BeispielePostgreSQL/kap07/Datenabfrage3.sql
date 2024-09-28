SELECT name AS "Familienname", vname AS "Vorname", plz AS "Postleitzahl", 
   gebdat AS "Geburtsdatum" FROM t_ma_dt 
   WHERE gebdat < '1980-01-01';

 