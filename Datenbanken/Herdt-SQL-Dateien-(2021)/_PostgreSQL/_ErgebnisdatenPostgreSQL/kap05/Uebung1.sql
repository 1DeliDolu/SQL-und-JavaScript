CREATE DATABASE "testdb";
\c testdb
CREATE TABLE t_artikel 
   (id INTEGER,
   artname VARCHAR(150),
   preis FLOAT);
DROP TABLE t_artikel;
\c <WechselZuAnderreDB>
DROP DATABASE testdb;
