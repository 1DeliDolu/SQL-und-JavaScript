SELECT * FROM t_ma_proj;

SELECT COUNT(ma_id) FROM t_ma_proj;

SELECT proj_id,COUNT(ma_id) FROM t_ma_proj 
   GROUP BY proj_id;
