SELECT m.vname, m.name, m.abtnr, a.* 
  FROM t_ma AS m, t_abt AS a 
  WHERE m.abtnr=a.id;
