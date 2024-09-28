\c uebungen;
DROP TABLE t_person;
CREATE DOMAIN namen AS VARCHAR(150) NOT NULL;
CREATE TABLE t_person 
   (id INTEGER NOT NULL,
    vname namen,
    name namen,
    strasse VARCHAR(150),
    hnr VARCHAR(5),
    plz VARCHAR(5),
    ort VARCHAR(150));
