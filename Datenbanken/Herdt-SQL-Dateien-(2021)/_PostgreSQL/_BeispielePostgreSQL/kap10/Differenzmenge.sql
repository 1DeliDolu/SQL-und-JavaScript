SELECT name, ort FROM t_ma 
  EXCEPT SELECT name, ort FROM t_ma_dt;
