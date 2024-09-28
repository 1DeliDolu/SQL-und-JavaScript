CREATE TABLE produkte
 (p_id INTEGER NOT NULL, 
  name VARCHAR(50), lagernr INTEGER, anzahl INTEGER,
  PRIMARY KEY (p_id));

-- oder als Spaltenconstraint

-- CREATE TABLE produkte
-- (p_id PRIMARY KEY, 
-- name VARCHAR(50), lagernr INTEGER, anzahl INTEGER); 

