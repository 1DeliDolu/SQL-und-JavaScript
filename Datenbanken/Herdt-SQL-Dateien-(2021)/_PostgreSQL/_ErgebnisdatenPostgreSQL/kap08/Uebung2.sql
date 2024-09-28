
CREATE INDEX i_autor ON t_buecher (autor);

SELECT * FROM t_buecher WHERE autor LIKE 'B%';

CREATE INDEX i_titel ON t_buecher (titel);

SELECT * FROM t_buecher ORDER BY titel;

CREATE INDEX i_verleih ON t_verleih (isbn, leser);

SELECT * FROM t_verleih ORDER BY isbn, leser;


--CREATE DESC INDEX i_leser_ab ON t_leser (name);   Diese Anweisung wird in PostgreSQL nicht unterstützt

--SHOW INDEX;                                       Befehl gibt es in PostgreSQL nicht 

-- DROP INDEX i_leser_ab;                                                                           

