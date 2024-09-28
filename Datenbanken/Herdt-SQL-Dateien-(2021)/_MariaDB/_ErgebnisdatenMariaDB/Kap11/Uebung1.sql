USE Uebungen;

CREATE VIEW v_ma_berlin AS
   SELECT id, name, vname, abtnr, str, hnr, ort, plz FROM t_ma WHERE ort='Berlin';

SELECT * FROM v_ma_berlin ORDER BY name, vname;
SELECT * FROM v_ma_berlin ORDER BY abtnr;

DROP VIEW v_ma_berlin;

CREATE VIEW v_ma_berlin AS
   SELECT id, name, vname, abtnr, str, hnr, ort, plz FROM t_ma WHERE ort='Berlin' 
   WITH CHECK OPTION;

INSERT INTO v_ma_berlin (id, vname, name, str, ort, plz) 
   VALUES(140,'Helene','Weigelt','Südstr. 6a','Berlin','10114');

UPDATE v_ma_berlin SET ort='Potsdam' WHERE id=104;