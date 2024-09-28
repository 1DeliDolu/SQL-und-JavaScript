USE Uebungen;
CREATE TABLE t_person
   (id INTEGER NOT NULL,
    vname VARCHAR(150) NOT NULL,
    name VARCHAR(150) NOT NULL);
ALTER TABLE t_person ADD beschaeftigt_seit DATE;
ALTER TABLE t_person DROP beschaeftigt_seit;
 