\c Uebungen;

SELECT vname, name FROM t_ma LIMIT 15;

SELECT vname, name, plz, ort FROM t_ma LIMIT 15;

SELECT vname AS Vorname, name AS Familienname, plz AS Postleitzahl, ort As Wohnort 
   FROM t_ma LIMIT 15;

SELECT vname AS Vorname, name AS Familienname, plz AS Postleitzahl, ort As Wohnort 
   FROM t_ma 
   WHERE ort IN ('Hamburg','Berlin') AND gebdat < '1970-01-01'  
   ORDER BY name 
   LIMIT 15;
