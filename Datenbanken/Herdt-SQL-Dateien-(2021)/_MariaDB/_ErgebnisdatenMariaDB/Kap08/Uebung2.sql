USE Bibliothek;

CREATE INDEX i_autor ON t_buecher (autor);

SELECT * FROM t_buecher WHERE autor LIKE 'B%';

CREATE INDEX i_titel ON t_buecher (titel);

SELECT * FROM t_buecher ORDER BY titel;

CREATE INDEX i_verleih ON t_verleih (isbn, leser);

SELECT * FROM t_verleih ORDER BY isbn, leser;

--      absteigender Index ist in MySQL nicht möglich, Schlüsselwort wird vom System ignoriert

CREATE INDEX i_leser_ab ON t_leser (name DESC);   

SHOW INDEX FROM t_leser;                                       

DROP INDEX i_leser_ab ON t_leser;                            
                                                  

