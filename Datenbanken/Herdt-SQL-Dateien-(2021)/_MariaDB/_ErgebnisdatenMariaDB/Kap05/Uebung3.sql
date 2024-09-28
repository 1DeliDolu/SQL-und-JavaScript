USE Uebungen;
DROP TABLE t_person;
# Domains sind in MariaDB nicht möglich!
# Tabelle muss daher mit normalen Datentypen erstellt werden.
CREATE TABLE t_person 
   (id INTEGER NOT NULL,
    vname VARCHAR(150) NOT NULL,
    name VARCHAR(150) NOT NULL,
    strasse VARCHAR(150),
    hnr VARCHAR(5),
    plz VARCHAR(5),
    ort VARCHAR(150)); 
