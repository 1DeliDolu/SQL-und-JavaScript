SELECT COUNT(isbn) FROM t_buecher;
SELECT COUNT(nr) FROM t_leser;

SELECT leser, COUNT(isbn) FROM t_verleih GROUP BY leser;

SELECT leser, COUNT(isbn) FROM t_verleih GROUP BY leser ORDER BY leser DESC;

SELECT leser, COUNT(isbn) FROM t_verleih GROUP BY leser HAVING COUNT(isbn)>1 ORDER BY leser DESC;

SELECT name, length(name) As Laenge FROM t_leser;

SELECT isbn, ceil(preis) FROM t_buecher;