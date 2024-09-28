SELECT name, ort 
  FROM t_ma WHERE ort = 'Bern'
  UNION SELECT name, ort FROM t_ma_dt;

