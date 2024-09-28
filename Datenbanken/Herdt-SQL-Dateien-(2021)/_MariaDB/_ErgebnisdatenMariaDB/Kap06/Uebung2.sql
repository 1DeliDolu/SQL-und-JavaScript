USE Uebungen;

INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Haas','Martina','Blumenweg Str.', '23','63065','Offenbach',"1972-06-01", "D");
INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Richter','Carsten','Frankfurter Str.', '16','63065','Offenbach',"1982-10-18", "D");
INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Seiler','Janine','Goethestr.', '61','63067','Offenbach',"1990-11-11", "D");
INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Hartmann','Jochen','Berliner Str.', '23','60528','Frankfurt',"1979-03-25", "D");
INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Goldbach','Martin','Frankfurter Str.', '6','60529','Frankfurt',"1981-07-06", "D");
INSERT INTO t_ma_dt (name,vname,str,hnr,plz,ort,gebdat,land)
   VALUES('Naumann','Norbert','Goethestr.', '161','60594','Frankfurt',"1972-11-06", "D");

INSERT INTO t_ma_frankfurt (name,vname,str,hnr,plz,ort,gebdat,land) 
   SELECT name,vname,str,hnr,plz,ort,gebdat,land
      FROM t_ma_dt WHERE ort='Frankfurt' OR ort='Offenbach';

SELECT * FROM t_ma_frankfurt;

UPDATE t_ma_frankfurt SET ort='Frankfurt/Main' WHERE ort='Frankfurt';
