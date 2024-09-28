SELECT m.vname, m.name, p.name, p.ende
  FROM t_ma_proj AS mp INNER JOIN t_ma AS m
  ON mp.ma_id = m.id INNER JOIN t_proj AS p ON mp.proj_id = p.id 
  ORDER BY p.name;
