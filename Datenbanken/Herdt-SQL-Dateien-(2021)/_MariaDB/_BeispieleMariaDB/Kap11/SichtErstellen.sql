CREATE VIEW v_ma_abt1 AS
   SELECT abtnr, vname, name FROM t_ma WHERE abtnr = 1;

SELECT * FROM v_ma_abt1; 

