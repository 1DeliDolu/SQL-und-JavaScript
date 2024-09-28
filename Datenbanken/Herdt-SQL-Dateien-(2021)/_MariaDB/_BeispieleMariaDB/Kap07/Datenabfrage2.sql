SELECT name, vname, plz, ort FROM t_ma_dt 
    WHERE plz LIKE '6%' AND gebdat > "1975-01-01" ORDER BY plz;
 