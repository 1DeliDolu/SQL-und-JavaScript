INSERT INTO t_ma_dt (id, name,vname,str,hnr,plz,ort,gebdat, land)
   VALUES(70, 'Haas','Martina','Blumenweg', '23','63067','Offenbach','1972-06-01', 'D');
INSERT INTO t_ma_dt (id, name,vname,str,hnr,plz,ort,gebdat, land)
   VALUES(71, 'Richter','Carsten','Frankfurter Str.', '16','63067','Offenbach','1982-10-18', 'D');
INSERT INTO t_ma_dt (id, name,vname,str,hnr,plz,ort,gebdat, land)
   VALUES(72, 'Seiler','Janine','Goethestr.', '61','63067','Offenbach','1990-11-11', 'D');
INSERT INTO t_ma_dt (id, name,vname,str,hnr,plz,ort,gebdat, land)
   VALUES(73, 'Hartmann','Jochen','Berliner Str.', '23','60528','Frankfurt','1979-03-25', 'D');
INSERT INTO t_ma_dt (id, name,vname,str,hnr,plz,ort,gebdat, land)
   VALUES(74, 'Goldbach','Martin','Frankfurter Str.', '6','60529','Frankfurt','1981-07-06', 'D');
INSERT INTO t_ma_dt (id, name,vname,str,hnr,plz,ort,gebdat, land)
   VALUES(75, 'Naumann','Norbert','Goethestr.', '161','60594','Frankfurt','1972-11-06', 'D');


INSERT INTO t_ma_frankfurt (id,name,vname,str,hnr,plz,ort,gebdat, land)
   SELECT id,name,vname,str,hnr,plz,ort,gebdat, land
      FROM t_ma_dt WHERE ort='Frankfurt' OR ort='Offenbach';

(Achtung, wenn zuvor eine Abfrage ausgeführt wurde, in der bereits Datensätze 
aus der Tabelle t_ma_dt übernommen wurden, kommt es zu einer Fehlermeldung, da 
die bereits übernommenen Daten einen Konflikt mit der Einzigartigkeit des Primärkeys 
auslösen.)


SELECT * FROM t_ma_frankfurt;

UPDATE t_ma_frankfurt SET ort='Frankfurt/Main' WHERE ort='Frankfurt';
