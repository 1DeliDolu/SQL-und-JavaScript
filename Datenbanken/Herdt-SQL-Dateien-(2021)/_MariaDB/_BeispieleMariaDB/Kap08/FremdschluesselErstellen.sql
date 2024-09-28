CREATE TABLE t_ma_proj
   (ma_id INTEGER NOT NULL,
    proj_id INTEGER NOT NULL,
    FOREIGN KEY (ma_id) REFERENCES t_ma (id),
    FOREIGN KEY (proj_id) REFERENCES t_proj (id));
 