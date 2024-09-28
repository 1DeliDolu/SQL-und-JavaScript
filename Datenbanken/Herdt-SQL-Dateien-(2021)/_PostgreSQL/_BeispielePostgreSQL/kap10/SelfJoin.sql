SELECT a1.abteilung,a2.abteilung,a1.ort 
  FROM t_abt AS a1 
  INNER JOIN t_abt AS a2 ON a1.ort = a2.ort 
  WHERE a1.id <> a2.id;

 