SELECT m.vname, m.name, a.name
  FROM t_ma AS m LEFT OUTER JOIN t_abt AS a
  ON m.abtnr = a.id 
  ORDER BY m.name DESC LIMIT 15; 