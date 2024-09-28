SELECT name, vname, plz, ort FROM t_ma ORDER BY name, vname;

SELECT id, stueck FROM t_lager ORDER BY preis DESC;

SELECT ort AS Wohnort, COUNT(name) AS "Anzahl Mitarbeiter" FROM t_ma 
       GROUP BY ort ORDER BY ort;
 