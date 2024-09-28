\c uebungen;

ALTER TABLE t_lager ADD name VARCHAR(100);

INSERT INTO t_lager (id,name,stueck,preis) VALUES(1,'Kugelschreiber',200,2.99);
INSERT INTO t_lager (id,name,stueck,preis) VALUES(2,'Ordner',123,2.50);
INSERT INTO t_lager (id,name,stueck,preis) VALUES(3,'Heftklammern',423,0.99);
INSERT INTO t_lager (id,name,stueck,preis) VALUES(4,'Bleistift',170,0.99);
INSERT INTO t_lager (id,name,stueck,preis) VALUES(5,'Umschläge B6',230,0.80);
INSERT INTO t_lager (id,name,preis) VALUES(6,'Schreibblock A4',1.99);

SELECT * FROM t_lager;

UPDATE t_lager SET stueck=270 WHERE name='Bleistift';

UPDATE t_lager SET preis=2.80 WHERE name='Ordner';

DELETE FROM t_lager WHERE name='Schreibblock A4';
