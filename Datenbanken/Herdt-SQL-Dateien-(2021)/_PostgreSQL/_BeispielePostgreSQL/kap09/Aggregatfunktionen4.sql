SELECT COUNT(id) AS Anzahl FROM t_lager;
SELECT COUNT(id) AS Anzahl FROM t_lager WHERE stueck > 200;
SELECT COUNT(id) AS Anzahl, COUNT(id) FILTER (WHERE stueck>200)
  AS AnzahlGrößer200 FROM t_lager;
