CREATE TABLE t_ma_dt
   (id SERIAL NOT NULL,
    name VARCHAR(50), vname VARCHAR(50), str VARCHAR(150), hnr VARCHAR(5),
    plz VARCHAR(5), ort VARCHAR(50), gebdat DATE, land varchar(4),
    PRIMARY KEY(id));
INSERT INTO t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land)
    VALUES ('Illner', 'Markus', 'Goetheweg Str.', '55', '70173', 'Stuttgart', '1976-12-23', 'D');
INSERT INTO t_ma_dt (name, vname, str, hnr, plz, ort, gebdat, land)
    VALUES ('Schubert', 'Steve', 'Albert-Schweitzer-Str.', '10', '70174', 'Stuttgart', '1982-02-15', 'D');
INSERT INTO t_ma_dt (name, vname) 
    VALUES ('Sattke', 'Beatrice');

