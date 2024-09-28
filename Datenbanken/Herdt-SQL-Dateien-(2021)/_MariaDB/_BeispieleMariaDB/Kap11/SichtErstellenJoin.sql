CREATE VIEW v_ma_proj
   (MitarbeiterNr,Mitarbeitername,ProjektNr,Projektname) AS
   SELECT m.id,m.name,p.id,p.name FROM t_ma_proj mp
   INNER JOIN t_ma m ON mp.ma_id = m.id INNER JOIN
   t_proj p ON mp.proj_id = p.id;

SELECT * FROM v_ma_proj WHERE ProjektNr = 1; 

