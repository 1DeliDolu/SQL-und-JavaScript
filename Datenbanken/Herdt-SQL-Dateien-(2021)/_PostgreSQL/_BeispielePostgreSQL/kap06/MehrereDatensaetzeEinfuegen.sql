INSERT INTO  t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land) 
   VALUES ('Meier', 'Susann', 'Hauptweg.', '4', '60385', 'Frankfurt', 
           '1972-04-21', 'D');
INSERT INTO  t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land) 
   VALUES ('Brauer', 'Claudia', 'Bahnhofstr.', '156', '60386', 'Frankfurt', 
           '1971-04-28', 'D');
INSERT INTO  t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land)
   VALUES ('Yildiz', 'Umit', 'Universitätsstr.', '24', '60322', 'Frankfurt', 
           '1964-08-29', 'D');
INSERT INTO  t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land)
   VALUES ('Backhaus', 'Sebastian', 'Heidestr.', '150', '60385', 'Frankfurt', 
           '1949-08-14', 'D');

CREATE TABLE t_ma_frankfurt
   (id SERIAL, name VARCHAR(50), vname VARCHAR(50),
    str VARCHAR(150), hnr VARCHAR(5), plz VARCHAR(5), ort VARCHAR(50), 
    gebdat DATE, land varchar(4),
    PRIMARY KEY(id));

INSERT INTO t_ma_frankfurt (name, vname, str, hnr, plz, ort, gebdat, land) 
   SELECT name, vname, str, hnr, plz, ort, gebdat, land
      FROM t_ma_dt WHERE ort = 'Frankfurt';
