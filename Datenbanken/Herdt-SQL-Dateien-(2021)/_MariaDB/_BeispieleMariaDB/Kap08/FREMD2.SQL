ALter TABLE t_ma_proj
   ADD FOREIGN KEY (mitarbeiter_id) REFERENCES t_mitarbeiter (id) ON DELETE CASCADE,
   ADD FOREIGN KEY (projekt_id) REFERENCES t_projekte (id) ON DELETE CASCADE);
INSERT INTO t_mitarbeiter_projekte (mitarbeiter_id,projekt_id) VALUES(2,1);
INSERT INTO t_mitarbeiter_projekte (mitarbeiter_id,projekt_id) VALUES(5,1);
INSERT INTO t_mitarbeiter_projekte (mitarbeiter_id,projekt_id) VALUES(8,1);
INSERT INTO t_mitarbeiter_projekte (mitarbeiter_id,projekt_id) VALUES(11,1);
INSERT INTO t_mitarbeiter_projekte (mitarbeiter_id,projekt_id) VALUES(14,2);
INSERT INTO t_mitarbeiter_projekte (mitarbeiter_id,projekt_id) VALUES(18,2);
DELETE FROM t_projekte WHERE id=2; 
