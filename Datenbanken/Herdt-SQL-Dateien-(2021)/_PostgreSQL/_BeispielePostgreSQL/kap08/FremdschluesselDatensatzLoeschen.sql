DROP TABLE t_ma_proj;

CREATE TABLE t_ma_proj
 (ma_id INTEGER NOT NULL, 
  proj_id INTEGER NOT NULL,
  FOREIGN KEY (ma_id) REFERENCES t_ma (id) ON DELETE CASCADE,
  FOREIGN KEY (proj_id) REFERENCES t_proj (id) ON DELETE CASCADE);

INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(2, 1);
INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(5, 1);
INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(8, 1);
INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(11, 1);
INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(14, 6);
INSERT INTO t_ma_proj (ma_id, proj_id) VALUES(18, 6);

DELETE FROM t_proj WHERE id = 6;
