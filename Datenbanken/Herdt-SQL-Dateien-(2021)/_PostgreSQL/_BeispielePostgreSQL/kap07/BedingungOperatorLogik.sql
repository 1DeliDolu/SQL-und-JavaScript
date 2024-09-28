SELECT * FROM t_ma WHERE name LIKE 'M%' AND ort<>'Wien';
SELECT * FROM t_ma WHERE name LIKE 'M%' AND (ort = 'Frankfurt' OR ort = 'Wien');
SELECT * FROM t_ma WHERE NOT (name LIKE 'M%');
 