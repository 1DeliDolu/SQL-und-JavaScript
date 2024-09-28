
CREATE VIEW v_ma_berlin_proj AS
   SELECT m.id, m.name, m.vname, m.abtnr, m.str, m.ort, m.plz, mp.proj_id 
   FROM t_ma m INNER JOIN t_ma_proj mp ON m.id=mp.ma_id WHERE m.ort='Berlin';

SELECT * FROM v_ma_berlin_proj;

SELECT * FROM v_ma_berlin_proj WHERE proj_id=2;

SELECT COUNT(mp.ma_id) FROM t_ma m INNER JOIN t_ma_proj mp ON m.id=mp.ma_id 
   WHERE m.ort='Berlin' AND mp.proj_id=2;

SELECT COUNT(id) FROM v_ma_berlin_proj WHERE proj_id=2;