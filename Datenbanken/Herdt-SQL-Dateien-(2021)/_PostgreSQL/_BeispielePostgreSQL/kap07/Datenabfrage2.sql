SELECT name, vname, plz, ort FROM t_ma_dt 
    WHERE plz LIKE '7%' AND gebdat > '1980-01-01' ORDER BY plz;
 