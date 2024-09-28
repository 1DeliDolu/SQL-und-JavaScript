CREATE DATABASE Bibliothek;
USE Bibliothek;

CREATE TABLE t_buecher 
   (isbn VARCHAR(13) NOT NULL,
   titel VARCHAR(100),
   autor VARCHAR(100),
   auflage INTEGER,
   preis FLOAT,
   PRIMARY KEY(isbn));

CREATE TABLE t_leser
   (nr INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    vname VARCHAR(30),
    gebdat DATE,
    adr VARCHAR(100),
    PRIMARY KEY(nr));

CREATE TABLE t_verleih
   (isbn VARCHAR(13) NOT NULL,
    leser INTEGER NOT NULL,
    datum DATE,
    FOREIGN KEY(isbn) REFERENCES t_buecher(isbn) ON DELETE CASCADE,
    FOREIGN KEY(leser) REFERENCES t_leser(nr) ON DELETE CASCADE);

INSERT INTO t_buecher (isbn, titel, autor, auflage, preis)
   VALUES ('1-254-56649-0', 'Mein Gartenbuch', 'Bernd Blume', 2, 19.95);
INSERT INTO t_buecher (isbn, titel, autor, auflage, preis)
   VALUES ('1-234-56789-0', 'Der Baum', 'Gerd Baumann', 1, 29.95);
INSERT INTO t_buecher (isbn, titel, autor, auflage, preis)
   VALUES ('1-285-54709-0', 'Fit for Fun', 'Brigitte Schöne', 3, 21.55);
INSERT INTO t_leser (name, vname, gebdat, adr)
   VALUES ('Schulz', 'Marko', '1987-04-17', 'Waldweg 4, 10119 Berlin');
INSERT INTO t_leser (name, vname, gebdat, adr)
   VALUES ('Kramer', 'Janette', '1986-12-23', 'Steinstr. 4, 10121 Berlin');
INSERT INTO t_verleih (isbn, leser, datum)
   VALUES ('1-254-56649-0', 1, '25.11.09');
INSERT INTO t_verleih (isbn, leser, datum)
   VALUES ('1-234-56789-0', 1, '25.11.09');
INSERT INTO t_verleih (isbn, leser, datum)
   VALUES ('1-285-54709-0', 2, '27.10.09');
INSERT INTO t_verleih (isbn, leser, datum)
   VALUES ('1-285-54709-0', 3, '29.11.09');
