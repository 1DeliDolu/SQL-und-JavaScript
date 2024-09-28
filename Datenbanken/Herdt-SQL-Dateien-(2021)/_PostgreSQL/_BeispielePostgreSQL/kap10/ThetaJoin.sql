SELECT t_ma.name, t_ma.vname, t_ma.gebdat, 
   t_ma_dt.name, t_ma_dt.vname, t_ma_dt.gebdat 
   FROM t_ma INNER JOIN t_ma_dt 
   ON t_ma.gebdat < t_ma_dt.gebdat LIMIT 10; 
