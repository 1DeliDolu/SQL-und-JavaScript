SELECT proj_id,COUNT(ma_id) FROM t_ma_proj
   GROUP BY proj_id HAVING COUNT(ma_id)>2; 