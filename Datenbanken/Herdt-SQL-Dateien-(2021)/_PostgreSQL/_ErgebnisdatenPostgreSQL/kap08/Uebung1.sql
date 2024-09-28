CREATE DATABASE Bibliothek;

CREATE TABLE t_buecher 
   (isbn VARCHAR(13) NOT NULL,
   titel VARCHAR(100),
   autor VARCHAR(100),
   auflage INTEGER,
   preis FLOAT,
   PRIMARY KEY(isbn));

CREATE TABLE t_leser
   (nr SERIAL,
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
   VALUES ('Hauer', 'Bernd', '17.04.1987', 'Waldweg 4, 11019 Berlin');
INSERT INTO t_leser (name, vname, gebdat, adr)
   VALUES ('Kramer', 'Birgit', '23.12.1969', 'Steinstr. 4, 11015 Berlin');
INSERT INTO t_verleih (isbn, leser, datum)
   VALUES ('1-254-56649-0', 1, '25.04.15');
INSERT INTO t_verleih (isbn, leser, datum)
   VALUES ('1-234-56789-0', 1, '25.05.15');
INSERT INTO t_verleih (isbn, leser, datum)
   VALUES ('1-285-54709-0', 2, '27.05.15');
INSERT INTO t_verleih (isbn, leser, datum)
   VALUES ('1-285-54709-0', 2, '29.05.15');
