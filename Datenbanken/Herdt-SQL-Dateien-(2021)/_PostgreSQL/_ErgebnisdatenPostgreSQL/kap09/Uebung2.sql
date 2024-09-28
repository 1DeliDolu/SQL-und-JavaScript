CREATE TABLE t_mess (nr serial Primary Key, wert integer); 

INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);
INSERT INTO t_mess (wert) VALUES (round(random() * 1000) +1);

SELECT COUNT(*) AS Anzahl, ROUND(AVG(wert)) AS Durchschnitt,
       MIN(wert) AS Minimum, MAX(wert) AS Maximum FROM t_mess; 