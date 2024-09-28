USE uebungen;

DELIMITER //
CREATE PROCEDURE p_artikel_hinzufuegen (artikelnummer INTEGER, stueckzahl INTEGER, preis FLOAT)
BEGIN
   DECLARE aid INTEGER;
   SELECT COUNT(id) FROM t_lager WHERE id=artikelnummer INTO aid;
   IF (aid=1) THEN 
      UPDATE t_lager SET stueck = stueckzahl, preis = preis WHERE id = artikelnummer;
   ELSE 
      INSERT INTO t_lager (id, stueck, preis) VALUES (artikelnummer, stueckzahl, preis);
   END IF;
END //

DELIMITER ;

CALL p_artikel_hinzufuegen(100,210,12.50);
CALL p_artikel_hinzufuegen(50,220,2.90);
