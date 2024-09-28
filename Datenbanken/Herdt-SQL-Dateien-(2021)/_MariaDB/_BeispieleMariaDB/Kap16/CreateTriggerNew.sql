USE uebungen;

DELIMITER //
CREATE TRIGGER trig_liefer_nr BEFORE INSERT
  ON t_liefer FOR EACH ROW BEGIN
    DECLARE lid INTEGER;
    IF (NEW.id = 0) THEN 
      SELECT MAX(id)+1 FROM t_liefer INTO lid;
      SET NEW.id = lid;
    END IF;
  END //

DELIMITER ;

INSERT  INTO t_liefer (name, str, hnr, plz, ort )
	VALUES ("Walter", "Hauptstr.", "6", "60320", "Frankfurt");

SELECT * FROM t_liefer;

