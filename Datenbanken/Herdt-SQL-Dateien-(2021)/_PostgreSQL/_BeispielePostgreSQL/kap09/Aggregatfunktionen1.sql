SELECT COUNT(id) AS Anzahl, AVG(preis) AS "Preis Durchschnitt",
  MIN(preis) AS "Preis Minimum", MAX(preis) AS "Preis Maximum" FROM t_lager;

SELECT COUNT(id) AS Anzahl, AVG(preis) AS "Preis Durchschnitt" FROM t_lager
   WHERE stueck > 100;


  