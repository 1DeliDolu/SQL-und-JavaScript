SELECT t_leser.vname, t_leser.name, t_verleih.isbn FROM t_leser, t_verleih 
WHERE t_leser.nr = t_verleih.leser;

SELECT t_leser.vname, t_leser.name, t_verleih.isbn FROM t_leser, t_verleih 
WHERE t_leser.nr = t_verleih.leser ORDER BY t_leser.name,t_leser.vname;

SELECT t_leser.vname, t_leser.name, t_verleih.isbn FROM t_leser 
INNER JOIN t_verleih ON t_leser.nr = t_verleih.leser 
ORDER BY t_leser.name,t_leser.vname;

SELECT t_leser.vname, t_leser.name, t_verleih.isbn, t_buecher.titel FROM t_leser 
INNER JOIN t_verleih ON t_leser.nr = t_verleih.leser 
INNER JOIN t_buecher ON t_verleih.isbn = t_buecher.isbn
ORDER BY t_leser.name,t_leser.vname;