CREATE TABLE t_artikel
  (id INTEGER NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL, code VARCHAR(30) NOT NULL,
   lieferant INTEGER, bemerkung VARCHAR(100),
   PRIMARY KEY(id),
   UNIQUE namecodeindex (name, code));