USE uebungen;

DELIMITER //
CREATE TRIGGER trig_summe_artikel_update AFTER UPDATE
  ON t_lager FOR EACH ROW BEGIN
     DECLARE summe_stueck INTEGER;
    DECLARE summe_preis FLOAT;
        
	SELECT SUM(stueck), SUM(preis) FROM t_lager 
       INTO summe_stueck, summe_preis;
     DELETE FROM t_summe_lager;
     INSERT INTO t_summe_lager VALUES(summe_stueck, summe_preis);
    END; //
DELIMITER ;

SELECT * FROM t_summe_lager;
UPDATE t_lager SET stueck = 200, preis = 21 WHERE id = 51;
SELECT * FROM t_summe_lager;

-- Ueberpruefung mit SELECT-Anweisung:
SELECT SUM(stueck), SUM(preis) FROM t_lager;

DELIMITER //
CREATE TRIGGER trig_summe_artikel_delete  AFTER DELETE
  ON t_lager FOR EACH ROW BEGIN
    DECLARE summe_stueck INTEGER;
    DECLARE summe_preis FLOAT;
     SELECT SUM(stueck), SUM(preis) FROM t_lager 
       INTO summe_stueck, summe_preis;
     DELETE FROM t_summe_lager;
     INSERT INTO t_summe_lager VALUES(summe_stueck, summe_preis);
    END; //

DELIMITER ;

SELECT * FROM t_summe_lager;
UPDATE t_lager SET stueck = 0 WHERE id = 51;
DELETE FROM t_lager WHERE id = 51;
SELECT * FROM t_summe_lager;