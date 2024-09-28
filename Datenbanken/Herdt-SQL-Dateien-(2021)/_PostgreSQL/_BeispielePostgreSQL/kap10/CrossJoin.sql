SELECT t_ma.vname, t_ma.name, t_ma.abtnr, t_proj.* FROM t_ma
   CROSS JOIN t_proj WHERE t_ma.ort = 'Wien'; 