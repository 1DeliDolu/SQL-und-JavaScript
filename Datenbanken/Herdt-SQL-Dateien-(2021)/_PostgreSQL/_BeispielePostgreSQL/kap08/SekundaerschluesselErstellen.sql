CREATE TABLE t_artikel
  (id SERIAL,
   name VARCHAR(100) NOT NULL, code VARCHAR(30) NOT NULL,
   lieferant INTEGER, bemerkung VARCHAR(100),
   PRIMARY KEY(id),
   UNIQUE (name, code));