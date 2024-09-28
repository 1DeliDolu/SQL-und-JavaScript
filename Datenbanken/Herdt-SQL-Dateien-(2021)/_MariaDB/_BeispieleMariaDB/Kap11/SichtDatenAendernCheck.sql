CREATE VIEW v_ma_abt1 AS 
  SELECT * FROM t_ma WHERE abtnr = 1
  WITH CHECK OPTION;

INSERT INTO v_ma_abt1
  (id, name, vname, abtnr) VALUES(103, 'Funke', 'Franziska', 2);

INSERT INTO v_ma_abt1
  (id, name, vname, abtnr) VALUES(103, 'Funke', 'Franziska', 1);
 