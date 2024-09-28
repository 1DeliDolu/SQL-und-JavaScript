SELECT name AS "Familienname", vname AS "Vorname", plz AS "Postleitzahl", 
   gebdat AS "Geburtsdatum" FROM t_ma_dt 
   WHERE gebdat < "1975-01-01";

 