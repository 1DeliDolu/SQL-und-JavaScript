SELECT * FROM t_ma WHERE name LIKE 'M%' AND ort<>'Krefeld';
SELECT * FROM t_ma WHERE name LIKE 'M%' AND (ort = 'Berlin' OR ort = 'Leipzig');
SELECT * FROM t_ma WHERE NOT (name LIKE 'M%');
 