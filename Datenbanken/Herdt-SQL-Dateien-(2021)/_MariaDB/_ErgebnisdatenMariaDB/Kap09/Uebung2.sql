CREATE TABLE t_mess (nr integer NOT NULL AUTO_INCREMENT, wert integer, PRIMARY KEY(nr)); 

INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(rand() * 1000) +1);

SELECT COUNT(*) AS Anzahl, ROUND(AVG(wert)) AS Durchschnitt,
       MIN(wert) AS Minimum, MAX(wert) AS Maximum FROM t_mess; 