USE Uebungen;

SELECT id, stueck, preis, preis*1.19 AS Bruttopreis FROM t_lager;

SELECT stueck, COUNT(id) FROM t_lager GROUP BY stueck;

SELECT stueck, COUNT(id) FROM t_lager WHERE stueck<10 GROUP BY stueck;

SELECT stueck, COUNT(id) FROM t_lager WHERE stueck<10 GROUP BY stueck ORDER BY stueck DESC;
 