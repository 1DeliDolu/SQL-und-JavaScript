SELECT name, ort 
  FROM t_ma WHERE ort = 'Wien'
  UNION SELECT name, ort FROM t_ma_dt;

