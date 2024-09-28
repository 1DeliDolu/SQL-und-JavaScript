USE uebungen;

CREATE TABLE t_summe_lager
  (summe_stueck INTEGER,
   summe_preis FLOAT);

DELIMITER //
CREATE TRIGGER trig_summe_artikel AFTER INSERT
  ON t_lager FOR EACH ROW BEGIN
    DECLARE summe_stueck INTEGER;
    DECLARE summe_preis FLOAT;
    
     SELECT SUM(stueck), SUM(preis) FROM t_lager 
       INTO summe_stueck, summe_preis;
     DELETE FROM t_summe_lager;
     INSERT INTO t_summe_lager VALUES(summe_stueck, summe_preis);
END //
DELIMITER ;

SELECT * FROM t_summe_lager;
INSERT INTO t_lager (id, stueck, preis)
   VALUES(56,10, 200);
SELECT * FROM t_summe_lager;
