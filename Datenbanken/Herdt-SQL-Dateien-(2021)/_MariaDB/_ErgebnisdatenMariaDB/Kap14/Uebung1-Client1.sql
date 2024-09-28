use Uebungen;

-- Ändern Sie bei Verwendung einer älteren MySQL Version den Tabellentyp auf InnoDB .
ALTER TABLE tabellenname TYPE=INNODB; 
--

BEGIN;
SELECT * FROM t_lager;

INSERT INTO t_lager VALUES (55,30,25, 'A5 Ordner');

COMMIT; 

