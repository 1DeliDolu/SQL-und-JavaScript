CREATE TABLE t_produkt
   (id SERIAL, name VARCHAR(50), bemerk VARCHAR(100), datum DATE,
   PRIMARY KEY (id));

INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Schraube M4', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Schraube M6', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Schraube M8', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Schraube M10', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Mutter M4', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Mutter M6', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Mutter M8', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Mutter M10', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Unterlegscheibe M4', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Unterlegscheibe M6', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Unterlegscheibe M8', 'lieferbar', '10.10.01');
INSERT INTO t_produkt (name, bemerk, datum) VALUES ('Unterlegscheibe M10', 'lieferbar', '10.10.01');

CREATE INDEX i_produkt_name ON t_produkt (name);

SELECT id, name FROM t_produkt WHERE name LIKE 'S%' ORDER BY name; 