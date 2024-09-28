--
-- T-SQL Code zur Erzeugung der Herdt Datenbank Bibliothek
--

USE master;

DROP DATABASE IF EXISTS Bibliothek;
go

CREATE DATABASE Bibliothek;
go

USE Bibliothek;

CREATE TABLE dbo.t_buecher (
    isbn nvarchar(13) NOT NULL,
    titel nvarchar(100),
    autor nvarchar(100),
    auflage integer,
    preis double precision
);


CREATE TABLE dbo.t_leser (
    nr integer IDENTITY(1,1) NOT NULL,
    name nvarchar(30),
    vname nvarchar(30),
    plz nvarchar(5),
    ort nvarchar(100),
    str nvarchar(100),
    hnr nvarchar(5)
);


CREATE TABLE dbo.t_mess (
    nr integer IDENTITY(1,1) NOT NULL,
    wert integer
);

CREATE TABLE dbo.t_verleih (
    isbn nvarchar(13) NOT NULL,
    leser integer NOT NULL,
    datum date
);

--
-- Data for Name: t_buecher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dbo.t_buecher (isbn, titel, autor, auflage, preis)
VALUES ('1-254-56649-0', 'Mein Gartenbuch', 'Bernd Blume', 2, 19.949999999999900),
	('1-234-56789-0', 'Der Baum', 'Gerd Baumann', 1, 29.949999999999900),
	('1-285-54709-0', 'Fit for Fun', 'Brigitte Schöne', 3, 21.550000000000000);

SET IDENTITY_INSERT dbo.t_leser ON;

INSERT INTO dbo.t_leser (nr, name, vname, plz, ort, str, hnr)
VALUES (2, 'Kramer', 'Birgit', '10119', 'Berlin', 'Steinstr.', '4'),
	(1, 'Husler', 'Bernd', '10115', 'Berlin', 'Waldweg', '4');

SET IDENTITY_INSERT dbo.t_leser OFF;

SET IDENTITY_INSERT dbo.t_mess ON;

INSERT INTO dbo.t_mess (nr, wert)
VALUES (1, 153),
	(2, 851),
	(3, 682),
	(4, 162),
	(5, 879),
	(6, 971),
	(7, 697),
	(8, 816),
	(9, 1),
	(10, 716),
	(11, 822),
	(12, 746);

SET IDENTITY_INSERT dbo.t_mess OFF;

INSERT INTO dbo.t_verleih (isbn, leser, datum)
VALUES ('1-285-54709-0', 2, '2018-05-27'),
	('1-254-56649-0', 1, '2018-03-01'),
	('1-234-56789-0', 1, '2018-01-25'),
	('1-285-54709-0', 2, '2018-02-27');

ALTER TABLE dbo.t_buecher
    ADD CONSTRAINT t_buecher_pkey PRIMARY KEY (isbn);

ALTER TABLE dbo.t_leser
    ADD CONSTRAINT t_leser_pkey PRIMARY KEY (nr);
	
/* nicht erwünscht wegen Aufgaben?	
ALTER TABLE dbo.t_mess
    ADD CONSTRAINT t_mess_pkey PRIMARY KEY (nr);	
*/

CREATE INDEX i_autor ON dbo.t_buecher (autor);

CREATE INDEX i_leser_ab ON dbo.t_leser (name);

CREATE INDEX i_titel ON dbo.t_buecher (titel);

CREATE INDEX i_verleih ON dbo.t_verleih (isbn, leser);

ALTER TABLE dbo.t_verleih
    ADD CONSTRAINT t_verleih_isbn_fkey FOREIGN KEY (isbn) REFERENCES dbo.t_buecher(isbn) ON DELETE CASCADE;

ALTER TABLE dbo.t_verleih
    ADD CONSTRAINT t_verleih_leser_fkey FOREIGN KEY (leser) REFERENCES dbo.t_leser(nr) ON DELETE CASCADE;


