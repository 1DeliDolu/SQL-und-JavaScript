--
-- T-SQL Code zur Erzeugung der Herdt Datenbank Uebungen
--

USE master;

DROP DATABASE IF EXISTS Uebungen;


CREATE DATABASE Uebungen;


USE Uebungen;

CREATE TABLE dbo.t_abt (
    id integer IDENTITY(1,1) NOT NULL,
    abteilung nvarchar(50),
    ort nvarchar(450),
);


CREATE TABLE dbo.t_artikel (
    id integer IDENTITY(1,1) NOT NULL,
    name nvarchar(100) NOT NULL,
    code nvarchar(30) NOT NULL,
    lieferant integer,
    bemerkung nvarchar(100)
);


CREATE TABLE dbo.t_lager (
    id integer NOT NULL,
    stueck integer,
    preis numeric
);


CREATE TABLE dbo.t_liefer (
    id integer IDENTITY(1,1) NOT NULL,
    name nvarchar(30),
    plz nvarchar(5),
    ort nvarchar(30),
    str nvarchar(30),
    hnr nvarchar(5)
);


CREATE TABLE dbo.t_m_p (
    ma_id integer NOT NULL,
    proj_id integer NOT NULL
);


CREATE TABLE dbo.t_ma (
    id integer IDENTITY(1,1) NOT NULL,
    name nvarchar(50) DEFAULT NULL,
    vname nvarchar(50) DEFAULT NULL,
    gebdat date,
    str nvarchar(150) DEFAULT NULL,
    hnr nvarchar(5),
    plz nvarchar(5) DEFAULT NULL,
    ort nvarchar(50) DEFAULT NULL,
    land nvarchar(4),
    abtnr integer
);


CREATE TABLE dbo.t_ma_proj (
    ma_id integer NOT NULL,
    proj_id integer NOT NULL
);


CREATE TABLE dbo.t_produkt (
    id integer IDENTITY(1,1) NOT NULL,
    name nvarchar(50),
    bemerk nvarchar(100),
    datum date
);


CREATE TABLE dbo.t_proj (
    id integer IDENTITY(1,1) NOT NULL,
    name nvarchar(50),
    beginn date,
    ende date
);


CREATE TABLE dbo.temp_t_liefer (
    id integer NOT NULL,
    name nvarchar(30),
    plz nvarchar(5),
    ort nvarchar(30),
    str nvarchar(30),
    hnr nvarchar(5)
);


SET IDENTITY_INSERT dbo.t_abt ON;

INSERT INTO dbo.t_abt (abteilung, ort, id) 
VALUES ('Einkauf', 'Frankfurt', 1),
	('Marketing', 'Berlin', 2),
	('Produktion', 'Wien', 3),
	('Controlling', 'Bern', 5),
	('F&E', 'Zürich', 6),
	('Verkauf', 'Hamburg', 7),
	('Abt_Organisation', 'Berlin', 4),
	('Personal', 'Berlin', 9);

SET IDENTITY_INSERT dbo.t_abt OFF;

SET IDENTITY_INSERT dbo.t_artikel ON;

INSERT INTO dbo.t_artikel (id, name, code, lieferant)
	VALUES (1, 'Bleistift B (10 Stück)', 3423, 1),
	(2, 'Bleistift H (10 Stück)', 3123, 1),
	(3, 'Bleisift HB (10 Stück)', 4342, 1),
	(4, 'Füllhalter P1', 4337, 1),
	(5, 'Füllhalter P', 4344, 2),
	(6, 'Füllhalter P2 Rechtshänder', 4388, 1),
	(7, 'Füllhalter P2 Linkshänder', 4377, 1),
	(8, 'Füllhalter', 4333, 2),
	(9, 'Kugelschreiber KG1', 5231, 2),
	(10, 'Kugelschreiber KG2', 5232, 2),
	(11, 'Kugelschreiber KG5', 5235, 2),
	(12, 'Kugelschreiber Edel', 5239, 3),
	(13, 'Fineliner (10 Stück)', 4155, 2);

SET IDENTITY_INSERT dbo.t_artikel OFF;

INSERT INTO dbo.t_lager (id, stueck, preis)
VALUES (23, 100, 10),
	(50, 45, 34),
	(38, 89, 35),
	(47, 46, 24),
	(22, 267, 17),
	(46, 322, 9),
	(48, 245, 4),
	(45, 156, 8),
	(33, 134, 7),
	(49, 144, 16);

SET IDENTITY_INSERT dbo.t_liefer ON;

INSERT INTO dbo.t_liefer (id, name, plz, ort, str, hnr) 
VALUES (2, 'Berger', '10115', 'Berlin', 'Blumenstr.', '3'),
	(3, 'Knapp', '21029', 'Hamburg', 'Brunnenstr.', '31'),
	(1, 'Schubert', '60320', 'Frankfurt', 'Opernstr.', '3');

SET IDENTITY_INSERT dbo.t_liefer OFF;

INSERT INTO dbo.t_m_p (ma_id, proj_id) 
VALUES (2, 1),
	(5, 1),
	(8, 1),
	(11, 1),
	(36, 4),
	(48, 4);

SET IDENTITY_INSERT dbo.t_ma ON;

INSERT INTO  dbo.t_ma (id, name, vname, str, plz, ort, abtnr, hnr, gebdat, land) 
VALUES (1, 'Baumann', 'Lilly', 'Tannenstr.', '21029', 'Hamburg', 6, '49', '1993-02-07', 'D'),
	(2, 'Bayerle', 'Uschi', 'Buchenweg', '8000', 'Zürich', 7, '48', '1976-06-05', 'CH'),
	(3, 'Berger', 'Sebastian', 'Zentralplatz', '60323', 'Frankfurt', 1, '43', '1986-05-15', 'D'),
	(5, 'Kirsch', 'Karin', 'Albert-Schweitzer-Str.', '1080', 'Wien', 4, '47', '1988-05-24', 'AT'),
	(6, 'Bergstein', 'Roland', 'Waldstr.', '21029', 'Hamburg', 3, '16', '1988-09-07', 'D'),
	(7, 'Luxemburg', 'Johann', 'Brunnenweg', '22159', 'Hamburg', 3, '78', '1985-02-03', 'D'),
	(8, 'Ülkü', 'Dilara', 'Lessingstr.', '10179', 'Berlin', 5, '12', '1995-04-15', 'D'),
	(11, 'Mannschatz', 'Annabell', 'Bahnhofstr.', '60388', 'Framkfurt', 1, '12', '1967-07-06', 'D'),
	(12, 'Nöller', 'Erwin', 'Industriestr.', '21129', 'Hamburg', 3, '4', '1980-05-04', 'D'),
	(13, 'Brio', 'Constantin', 'Hauptstr.', '3005', 'Bern', 6, '54', '1977-04-21', 'CH'),
	(14, 'Eppel', 'Andreas', 'Schillerstr.', '1060', 'Wien', 4, '9', '1979-02-06', 'AT'),
	(15, 'Classmann', 'Andrea', 'Buchenweg', '8000', 'Zürich', 7, '1', '1985-02-02', 'CH'),
	(16, 'Glahn', 'Stefanie', 'Ratsstr.', '1080', 'Wien', 4, '1', '1978-05-02', 'AT'),
	(17, 'Döring', 'Laura', 'Hafenweg', '22111', 'Hamburg', 3, '87', '1969-03-01', 'D'),
	(18, 'Marlin', 'Peter', 'ethestr.', '22159', 'Hamburg', 3, '9', '1973-04-21', 'D'),
	(19, 'Seeau', 'Andrea', 'ethestr.', '10247', 'Berlin', 2, '125', '1976-11-16', 'D'),
	(20, 'Klotz', 'Siglinde', 'Mittelstr.', '1120', 'Wien', 4, '75', '1971-01-01', 'AT'),
	(21, 'Stern', 'Hanna', 'Leibnizstr.', '10247', 'Berlin', 2, '23', '1973-03-17', 'D'),
	(22, 'Meier', 'Kerstin', 'Nordstr.', '1120', 'Wien', 4, '6', '1966-12-27', 'AT'),
	(23, 'Wolff', 'Gudrun', 'Hauptstr.', '8038', 'Zürich', 7, '32', '1982-08-16', 'CH'),
	(24, 'Schuster', 'Gabriele', 'Maienweg', '22297', 'Hamburg', 3, '89', '1969-01-14', 'D'),
	(25, 'Bläuel', 'Stefan', 'Rathausplatz', '10119', 'Berlin', 5, '1', '1977-07-05', 'D'),
	(26, 'Ebert', 'Jan', 'Wasserturmstr.', '10119', 'Berlin', 5, '44', '1989-09-02', 'D'),
	(27, 'Meyer', 'Matthias', 'Schulstr.', '8038', 'Zürich', 6, '6', '1972-05-23', 'CH'),
	(28, 'Walther', 'Steve', 'Siedlungsweg', '3005', 'Bern', 6, '12', '1986-03-24', 'CH'),
	(29, 'Meyer', 'Peter', 'Am Ring', '60594', 'Frankfurt', 1, '6', '1974-08-13', 'D'),
	(30, 'Bäumer', 'Paul', 'Keplerstr.', '10115', 'Berlin', 5, '49', '1988-04-30', 'D'),
	(31, 'Bonkowski', 'Hubert', 'Albert-Schweitzer-Str.', '22111', 'Hamburg', 3, '92', '1974-03-14', 'D'),
	(32, 'Eichenau', 'Maria', 'Alte Dorfstr.', '10119', 'Berlin', 2, '65', '1987-05-15', 'D'),
	(33, 'Guth', 'Stephan', 'Zentralplatz', '10179', 'Berlin', 2, '67', '1975-12-06', 'D'),
	(34, 'Berger', 'Sonja', 'Hauptstr.', '21029', 'Hamburg', 3, '37', '1967-09-08', 'D'),
	(35, 'Conolly', 'Sean', 'ethestr.', '8008', 'Zürich', 7, '21', '1976-04-26', 'CH'),
	(36, 'Klapp', 'Frank', 'Buchenweg', '22159', 'Hamburg', 3, '46', '1978-06-12', 'D'),
	(37, 'Murnau', 'Anna', 'ethestr.', '1120', 'Wien', 4, '78', '1990-02-06', 'AT'),
	(38, 'Untergärtner', 'Tobias', 'Ringstr.', '21129', 'Hamburg', 3, '26', '1973-02-06', 'D'),
	(39, 'Beyersdörfer', 'Ute', 'Ringstr.', '10115', 'Berlin', 5, '87', '1985-08-12', 'D'),
	(40, 'Elser', 'Stefano', 'Bahnhofstr.', '22111', 'Hamburg', 3, '20', '1982-06-23', 'D'),
	(41, 'Kron-Köppers', 'Tina', 'Schillerstr.', '10179', 'Berlin', 2, '53', '1975-11-06', 'D'),
	(42, 'Stifter', 'Ansgar', 'Alte Gasse', '1210', 'Wien', 3, '21', '1980-05-05', 'AT'),
	(43, 'Mahn', 'Detlev', 'ethestr.', '1120', 'Wien', 4, '27', '1973-06-12', 'AT'),
	(44, 'Zielecki', 'Norbert', 'Kleiststr.', '21129', 'Hamburg', 3, '32', '1972-07-23', 'D'),
	(45, 'Blücher', 'Barbara', 'Tannenstr.', '8000', 'Zürich', 3, '45', '1995-01-26', 'CH'),
	(46, 'Färber', 'Liane', 'ethestr.', '8008', 'Zürich', 7, '23', '1968-01-14', 'CH'),
	(47, 'Holt', 'Sören', 'Eisenbahnstr.', '1080', 'Wien', 4, '23', '1980-12-23', 'AT'),
	(48, 'Loster-Schneider', 'Elena', 'Schulstr.', '22159', 'Hamburg', 3, '57', '1976-12-21', 'D'),
	(49, 'Maier', 'Frank', 'Mittelstr.', '60320', 'Frankfurt', 1, '37', '1978-01-12', 'D'),
	(50, 'Otterstädter', 'Charlotte', 'Baumschulenweg', '1210', 'Wien', 4, '7', '1978-08-12', 'AT'),
	(51, 'Seiler', 'Jacqueline', 'Kantonsstr.', '3001', 'Bern', 5, '14', '1987-03-04', 'CH'),
	(52, 'Schmadtke', 'Chris', 'Friedensplatz', '60388', 'Frankfurt', 1, '99', '1973-07-08', 'D'),
	(53, 'Segebrecht', 'Annemarie', 'Taunusweg', '60594', 'Frankfurt', 1, '5', '1971-07-11', 'D'),
	(54, 'Trieschmann', 'Lars', 'Eisenbahnstr..', '8038', 'Zürich', 3, '58', '1977-04-06', 'CH'),
	(55, 'Unterwegner', 'Daniel', 'Zentralplatz', '1210', 'Wien', 4, '45', '1991-09-05', 'AT'),
	(56, 'Brauer', 'Sophie', 'Albert-Schweitzer-Str.', '60320', 'Frankfurt', 1, '48', '1981-06-13', 'D'),
	(57, 'Carstedt', 'Sabine', 'ethestr.', '60323', 'Frankfurt', 1, '46', '1969-08-12', 'D'),
	(58, 'Eberspächer', 'Gerlinde', 'Bahnhofstr.', '8008', 'Zürich', 7, '45', '1994-03-23', 'CH'),
	(59, 'Dröger', 'Maria', 'Ringstr.', '1060', 'Wien', 4, '53', '1981-06-27', 'AT'),
	(60, 'Schwönsdorf', 'Lisa', 'Bahnhofstr.', '1210', 'Wien', 4, '1', '1981-11-15', 'AT'),
	(61, 'Fiedler', 'Klaus', 'Schillerstr.', '60388', 'Frankfurt', 6, '3', '1969-03-01', 'D'),
	(62, 'Holzhäußer', 'Björn', 'Schillerstr.', '8039', 'Zürich', NULL, '47', '1976-03-24', 'CH'),
	(63, 'Ahrens', 'Enzo', 'Neugasse', '1060', 'Wien', 4, '62', '1969-05-05', 'AT'),
	(64, 'Fuchs', 'Peter', 'Martinplatz', '22397', 'Hamburg', 3, '70', '1968-08-11', 'D'),
	(65, 'Manz', 'Frieder', 'Hauptstr.', '1120', 'Wien', 4, '89', '1988-02-03', 'AT'),
	(66, 'Hallenbacher', 'Roger', 'Schillerstr.', '22397', 'Hamburg', 3, '29', '1990-05-02', 'D'),
	(67, 'Möller', 'Jonas', 'Am Kirchhof', '22111', 'Hamburg', 3, '23', '1978-09-19', 'D'),
	(68, 'Frawley', 'Lukas', 'Schwedenstr.', '22397', 'Hamburg', 3, '21', '1979-09-09', 'D'),
	(69, 'Dorff', 'Sebastian', 'Turmstr.', '1060', 'Wien', 4, '23', '1971-12-23', 'AT');

SET IDENTITY_INSERT dbo.t_ma OFF;

INSERT INTO  dbo.t_ma_proj (ma_id, proj_id) 
VALUES (2, 1),
	(5, 1),
	(8, 1),
	(11, 1),
	(36, 4),
	(48, 4);

SET IDENTITY_INSERT dbo.t_produkt ON;

INSERT INTO dbo.t_produkt (id, name, bemerk, datum) 
VALUES (1, 'Schraube M4', 'lieferbar', '2018-03-01'),
	(3, 'Schraube M8', 'lieferbar', '2018-03-01'),
	(4, 'Schraube M10', 'lieferbar', '2018-02-01'),
	(5, 'Mutter M4', 'lieferbar', '2017-12-01'),
	(6, 'Mutter M6', 'lieferbar', '2018-01-05'),
	(8, 'Mutter M10', 'lieferbar', '2017-11-10'),
	(11, 'Unterlegscheibe M8', 'lieferbar', '2017-12-12'),
	(12, 'Unterlegscheibe M10', 'lieferbar', '2018-01-10'),
	(10, 'Unterlegscheibe M6', 'lieferbar', '2018-02-07'),
	(7, 'Mutter M8', 'lieferbar', '2017-12-09'),
	(2, 'Schraube M6', 'lieferbar', '2018-01-09'),
	(9, 'Unterlegscheibe M4', 'lieferbar', '2018-03-05');

SET IDENTITY_INSERT dbo.t_produkt OFF;

SET IDENTITY_INSERT dbo.t_proj ON;

INSERT INTO dbo.t_proj (id, name, beginn, ende) 
VALUES (1,'Buchprojekt', '2014-11-01', '2015-05-20'),
	(2,'Renovierung Pausenraum', '2015-02-01', '2015-05-28'),
	(6,'Anlegen eines Pflichtenheftes', '2015-02-10', '2015-04-21'),
	(4,'Kundenumfrage', '2015-03-01', '2015-06-30');

SET IDENTITY_INSERT dbo.t_proj OFF;


INSERT INTO dbo.temp_t_liefer (id, name, plz, ort, str, hnr) 
VALUES (2, 'Berger', '10115', 'Berlin', 'Blumenstr.', '3'),
	(3, 'Knapp', '21029', 'Hamburg', 'Brunnenstr.', '31'),
	(1, 'Schubert', '60320', 'Frankfurt', 'Opernstr.', '3');



ALTER TABLE dbo.t_abt
    ADD CONSTRAINT t_abt_pkey PRIMARY KEY (id);

ALTER TABLE dbo.t_artikel
    ADD CONSTRAINT t_artikel_name_key UNIQUE (name, code);

ALTER TABLE dbo.t_artikel
    ADD CONSTRAINT t_artikel_pkey PRIMARY KEY (id);

ALTER TABLE dbo.t_lager
    ADD CONSTRAINT t_lager_pkey PRIMARY KEY (id);

ALTER TABLE dbo.t_ma
    ADD CONSTRAINT t_ma_pkey PRIMARY KEY (id);

ALTER TABLE dbo.t_produkt
    ADD CONSTRAINT t_produkt_pkey PRIMARY KEY (id);

ALTER TABLE dbo.t_proj
    ADD CONSTRAINT t_proj_pkey PRIMARY KEY (id);


CREATE INDEX i_produkt_name ON dbo.t_produkt(name);


ALTER TABLE dbo.t_ma_proj
    ADD CONSTRAINT t_ma_proj_ma_id_fkey FOREIGN KEY (ma_id) REFERENCES dbo.t_ma(id) ON DELETE CASCADE;

ALTER TABLE dbo.t_ma_proj
    ADD CONSTRAINT t_ma_proj_proj_id_fkey FOREIGN KEY (proj_id) REFERENCES dbo.t_proj(id) ON DELETE CASCADE;


