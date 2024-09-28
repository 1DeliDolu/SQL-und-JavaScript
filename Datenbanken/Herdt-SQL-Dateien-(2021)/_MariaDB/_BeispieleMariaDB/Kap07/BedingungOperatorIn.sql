SELECT * FROM t_ma WHERE ort='Berlin' OR ort='Wien' OR ort='Hamburg';
SELECT * FROM t_ma WHERE ort IN ('Berlin','Wien','Hamburg');