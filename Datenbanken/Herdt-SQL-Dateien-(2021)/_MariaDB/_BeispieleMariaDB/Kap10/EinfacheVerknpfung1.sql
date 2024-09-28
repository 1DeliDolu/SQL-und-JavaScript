SELECT t_ma.vname, t_ma.name, t_ma.abtnr, t_abt.* 
  FROM t_ma, t_abt 
  WHERE t_ma.abtnr = t_abt.id LIMIT 15; 
