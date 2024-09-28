-- Stellen Sie sicher, dass der Tabellentyp InnoDB ist.

USE Uebungen;

BEGIN;

DELETE FROM t_ma WHERE ort='Berlin';

SELECT * FROM t_ma WHERE ort='Berlin';

ROLLBACK;
 
SELECT * FROM t_ma WHERE ort='Berlin';