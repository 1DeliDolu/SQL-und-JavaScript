CREATE TABLE t_ma_abt
   (id INTEGER NOT NULL,
    abtname VARCHAR(25) DEFAULT 'Produktion',
    ma_nr INTEGER,
    CONSTRAINT mpruef CHECK(ma_nr > 1));
 