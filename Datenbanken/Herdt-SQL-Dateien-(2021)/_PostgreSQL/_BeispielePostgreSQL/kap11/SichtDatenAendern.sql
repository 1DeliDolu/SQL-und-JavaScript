CREATE VIEW v_ma_abt AS 
   SELECT id,vname,name,abtnr FROM t_ma;

UPDATE v_ma_abt SET abtnr=2 WHERE abtnr IS NULL;

INSERT INTO v_ma_abt (id, name, vname, abtnr)
   VALUES(102, 'Melzer', 'Martin', 1);
 