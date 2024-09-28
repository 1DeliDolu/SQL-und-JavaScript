ALTER TABLE t_lager
   ADD artikel VARCHAR(20) DEFAULT 'unbekannt';
ALTER TABLE t_ma_abt
   ADD PRIMARY KEY (id);
ALTER TABLE t_lager
   ADD CONSTRAINT ppruef CHECK (preis > 0);
ALTER TABLE t_lager
   DROP wert;
 