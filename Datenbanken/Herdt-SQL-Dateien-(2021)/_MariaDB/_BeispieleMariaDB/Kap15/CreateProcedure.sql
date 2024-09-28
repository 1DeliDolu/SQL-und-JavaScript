DELIMITER //
CREATE PROCEDURE p_neuer_ma
   (name VARCHAR(50), vorname VARCHAR(50), strasse VARCHAR(150), 
    hausnr VARCHAR(5), plz VARCHAR(5), ort VARCHAR(50), land VARCHAR(4), projektname VARCHAR(50) )
BEGIN
    DECLARE mid INTEGER;
    DECLARE pid INTEGER;
    SELECT MAX(id) + 1 FROM t_ma INTO mid;
    INSERT INTO t_ma (id, name, vname, str, hnr, plz, ort, land)
        VALUES(mid, name, vorname, strasse, hausnr, plz, ort, land);
    SELECT COUNT(id) FROM t_proj WHERE t_proj.name = projektname INTO pid;
    IF (pid = 0) THEN 
       SELECT MAX(id) + 1 FROM t_proj INTO pid;
       INSERT INTO t_proj (id, name) VALUES(pid, projektname);
    ELSE
	  SELECT id FROM t_proj WHERE t_proj.name = projektname INTO pid;
    END IF;
    INSERT INTO t_ma_proj (ma_id, proj_id)
       VALUES(mid, pid);
END //

DELIMITER ;

CALL p_neuer_ma
   ('Herold', 'Frank', 'Waldstr.', '24', '10115', 'Berlin', 'D', 'Kundenumfrage');
CALL p_neuer_ma
   ('Teschau', 'Ines', '', '','1210', 'Wien', 'AT', 'Kundenumfrage');
