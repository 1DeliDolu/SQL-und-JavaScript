DELIMITER //
CREATE PROCEDURE p_artikel_liefer ()
BEGIN
SELECT t_artikel.name , t_liefer.name
FROM t_artikel INNER JOIN t_liefer ON t_artikel.lieferant=t_liefer.id;
END //
DELIMITER ;

CALL p_artikel_liefer ();
