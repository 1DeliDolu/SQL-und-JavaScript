--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: t_abt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_abt (
    abteilung character varying(50),
    ort character varying(450),
    id integer NOT NULL
);


ALTER TABLE public.t_abt OWNER TO postgres;

--
-- Name: t_abt_id2_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_abt_id2_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_abt_id2_seq OWNER TO postgres;

--
-- Name: t_abt_id2_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_abt_id2_seq OWNED BY public.t_abt.id;


--
-- Name: t_artikel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_artikel (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(30) NOT NULL,
    lieferant integer,
    bemerkung character varying(100)
);


ALTER TABLE public.t_artikel OWNER TO postgres;

--
-- Name: t_artikel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_artikel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_artikel_id_seq OWNER TO postgres;

--
-- Name: t_artikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_artikel_id_seq OWNED BY public.t_artikel.id;


--
-- Name: t_lager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_lager (
    id integer NOT NULL,
    stueck integer,
    preis numeric
);


ALTER TABLE public.t_lager OWNER TO postgres;

--
-- Name: t_liefer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_liefer (
    id integer NOT NULL,
    name character varying(30),
    plz character varying(5),
    ort character varying(30),
    str character varying(30),
    hnr character varying(5)
);


ALTER TABLE public.t_liefer OWNER TO postgres;

--
-- Name: t_liefer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_liefer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_liefer_id_seq OWNER TO postgres;

--
-- Name: t_liefer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_liefer_id_seq OWNED BY public.t_liefer.id;


--
-- Name: t_m_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_m_p (
    ma_id integer NOT NULL,
    proj_id integer NOT NULL
);


ALTER TABLE public.t_m_p OWNER TO postgres;

--
-- Name: t_ma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_ma (
    id integer NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    vname character varying(50) DEFAULT NULL::character varying,
    str character varying(150) DEFAULT NULL::character varying,
    plz character varying(5) DEFAULT NULL::character varying,
    ort character varying(50) DEFAULT NULL::character varying,
    abtnr integer,
    hnr character varying(5),
    gebdat date,
    land character varying(4)
);


ALTER TABLE public.t_ma OWNER TO postgres;

--
-- Name: t_ma_proj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_ma_proj (
    ma_id integer NOT NULL,
    proj_id integer NOT NULL
);


ALTER TABLE public.t_ma_proj OWNER TO postgres;

--
-- Name: t_produkt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_produkt (
    id integer NOT NULL,
    name character varying(50),
    bemerk character varying(100),
    datum date
);


ALTER TABLE public.t_produkt OWNER TO postgres;

--
-- Name: t_proj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_proj (
    id integer NOT NULL,
    name character varying(50),
    beginn date,
    ende date
);


ALTER TABLE public.t_proj OWNER TO postgres;

--
-- Name: t_proj_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_proj_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_proj_id_seq OWNER TO postgres;

--
-- Name: t_proj_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_proj_id_seq OWNED BY public.t_proj.id;


--
-- Name: temp_t_liefer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_t_liefer (
    id integer NOT NULL,
    name character varying(30),
    plz character varying(5),
    ort character varying(30),
    str character varying(30),
    hnr character varying(5)
);


ALTER TABLE public.temp_t_liefer OWNER TO postgres;

--
-- Name: t_abt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_abt ALTER COLUMN id SET DEFAULT nextval('public.t_abt_id2_seq'::regclass);


--
-- Name: t_artikel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_artikel ALTER COLUMN id SET DEFAULT nextval('public.t_artikel_id_seq'::regclass);


--
-- Name: t_liefer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_liefer ALTER COLUMN id SET DEFAULT nextval('public.t_liefer_id_seq'::regclass);


--
-- Name: t_proj id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_proj ALTER COLUMN id SET DEFAULT nextval('public.t_proj_id_seq'::regclass);


--
-- Data for Name: t_abt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_abt (abteilung, ort, id) FROM stdin;
Einkauf	Frankfurt	1
Marketing	Berlin	2
Produktion	Wien	3
Controlling	Bern	5
F&E	Zürich	6
Verkauf	Hamburg	7
Abt_Organisation	Berlin	4
Personal	Berlin	9
\.


--
-- Data for Name: t_artikel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_artikel (id, name, code, lieferant, bemerkung) FROM stdin;
1	Bleistift B (10 Stück)	3423	1	\N
2	Bleistift H (10 Stück)	3123	1	\N
3	Bleisift HB (10 Stück)	4342	1	\N
4	Füllhalter P1	4337	1	\N
5	Füllhalter P	4344	2	\N
6	Füllhalter P2 Rechtshänder	4388	1	\N
7	Füllhalter P2 Linkshänder	4377	1	\N
8	Füllhalter	4333	2	\N
9	Kugelschreiber KG1	5231	2	\N
10	Kugelschreiber KG2	5232	2	\N
11	Kugelschreiber KG5	5235	2	\N
12	Kugelschreiber Edel	5239	3	\N
13	Fineliner (10 Stück)	4155	2	\N
\.


--
-- Data for Name: t_lager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_lager (id, stueck, preis) FROM stdin;
23	100	10
50	45	34
38	89	35
47	46	24
22	267	17
46	322	9
48	245	4
45	156	8
33	134	7
49	144	16
\.


--
-- Data for Name: t_liefer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_liefer (id, name, plz, ort, str, hnr) FROM stdin;
2	Berger	10115	Berlin	Blumenstr.	3
3	Knapp	21029	Hamburg	Brunnenstr.	31
1	Schubert	60320	Frankfurt	Opernstr.	3
\.


--
-- Data for Name: t_m_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_m_p (ma_id, proj_id) FROM stdin;
2	1
5	1
8	1
11	1
36	4
48	4
\.


--
-- Data for Name: t_ma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_ma (id, name, vname, str, plz, ort, abtnr, hnr, gebdat, land) FROM stdin;
2	Baumann	Lilly	Tannenstr.	21029	Hamburg	6	49	1993-02-07	D
5	Bayerle	Uschi	Buchenweg	8000	Zürich	7	48	1976-06-05	CH
6	Berger	Sebastian	Zentralplatz	60323	Frankfurt	1	43	1986-05-15	D
7	Kirsch	Karin	Albert-Schweitzer-Str.	1080	Wien	4	47	1988-05-24	AT
8	Bergstein	Roland	Waldstr.	21029	Hamburg	3	16	1988-09-07	D
12	Luxemburg	Johann	Brunnenweg	22159	Hamburg	3	78	1985-02-03	D
13	Ülkü	Dilara	Lessingstr.	10179	Berlin	5	12	1995-04-15	D
14	Mannschatz	Annabell	Bahnhofstr.	60388	Framkfurt	1	12	1967-07-06	D
15	Nöller	Erwin	Industriestr.	21129	Hamburg	3	4	1980-05-04	D
16	Brio	Constantin	Hauptstr.	3005	Bern	6	54	1977-04-21	CH
17	Eppel	Andreas	Schillerstr.	1060	Wien	4	9	1979-02-06	AT
18	Classmann	Andrea	Buchenweg	8000	Zürich	7	1	1985-02-02	CH
19	Glahn	Stefanie	Ratsstr.	1080	Wien	4	1	1978-05-02	AT
21	Döring	Laura	Hafenweg	22111	Hamburg	3	87	1969-03-01	D
22	Margolin	Peter	Goethestr.	22159	Hamburg	3	9	1973-04-21	D
23	Seeau	Andrea	Goethestr.	10247	Berlin	2	125	1976-11-16	D
24	Klotz	Siglinde	Mittelstr.	1120	Wien	4	75	1971-01-01	AT
25	Stern	Hanna	Leibnizstr.	10247	Berlin	2	23	1973-03-17	D
26	Meier	Kerstin	Nordstr.	1120	Wien	4	6	1966-12-27	AT
27	Wolff	Gudrun	Hauptstr.	8038	Zürich	7	32	1982-08-16	CH
29	Schuster	Gabriele	Maienweg	22297	Hamburg	3	89	1969-01-14	D
30	Bläuel	Stefan	Rathausplatz	10119	Berlin	5	1	1977-07-05	D
31	Ebert	Jan	Wasserturmstr.	10119	Berlin	5	44	1989-09-02	D
34	Meyer	Matthias	Schulstr.	8038	Zürich	6	6	1972-05-23	CH
35	Walther	Steve	Siedlungsweg	3005	Bern	6	12	1986-03-24	CH
36	Meyer	Peter	Am Ring	60594	Frankfurt	1	6	1974-08-13	D
37	Bäumer	Paul	Keplerstr.	10115	Berlin	5	49	1988-04-30	D
39	Bonkowski	Hubert	Albert-Schweitzer-Str.	22111	Hamburg	3	92	1974-03-14	D
40	Eichenau	Maria	Alte Dorfstr.	10119	Berlin	2	65	1987-05-15	D
41	Guth	Stephan	Zentralplatz	10179	Berlin	2	67	1975-12-06	D
42	Berger	Sonja	Hauptstr.	21029	Hamburg	3	37	1967-09-08	D
43	Conolly	Sean	Goethestr.	8008	Zürich	7	21	1976-04-26	CH
44	Klapp	Frank	Buchenweg	22159	Hamburg	3	46	1978-06-12	D
45	Murnau	Anna	Goethestr.	1120	Wien	4	78	1990-02-06	AT
46	Untergärtner	Tobias	Ringstr.	21129	Hamburg	3	26	1973-02-06	D
47	Beyersdörfer	Ute	Ringstr.	10115	Berlin	5	87	1985-08-12	D
48	Elser	Stefano	Bahnhofstr.	22111	Hamburg	3	20	1982-06-23	D
50	Kron-Köppers	Tina	Schillerstr.	10179	Berlin	2	53	1975-11-06	D
51	Stifter	Ansgar	Alte Gasse	1210	Wien	3	21	1980-05-05	AT
52	Mahn	Detlev	Goethestr.	1120	Wien	4	27	1973-06-12	AT
53	Zielecki	Norbert	Kleiststr.	21129	Hamburg	3	32	1972-07-23	D
54	Blücher	Barbara	Tannenstr.	8000	Zürich	3	45	1995-01-26	CH
55	Färber	Liane	Goethestr.	8008	Zürich	7	23	1968-01-14	CH
56	Holt	Sören	Eisenbahnstr.	1080	Wien	4	23	1980-12-23	AT
57	Loster-Schneider	Elena	Schulstr.	22159	Hamburg	3	57	1976-12-21	D
58	Maier	Frank	Mittelstr.	60320	Frankfurt	1	37	1978-01-12	D
60	Otterstädter	Charlotte	Baumschulenweg	1210	Wien	4	7	1978-08-12	AT
61	Seiler	Jacqueline	Kantonsstr.	3001	Bern	5	14	1987-03-04	CH
62	Schmadtke	Chris	Friedensplatz	60388	Frankfurt	1	99	1973-07-08	D
63	Segebrecht	Annemarie	Taunusweg	60594	Frankfurt	1	5	1971-07-11	D
64	Trieschmann	Lars	Eisenbahnstr..	8038	Zürich	3	58	1977-04-06	CH
65	Unterwegner	Daniel	Zentralplatz	1210	Wien	4	45	1991-09-05	AT
66	Brauer	Sophie	Albert-Schweitzer-Str.	60320	Frankfurt	1	48	1981-06-13	D
67	Carstedt	Sabine	Goethestr.	60323	Frankfurt	1	46	1969-08-12	D
68	Eberspächer	Gerlinde	Bahnhofstr.	8008	Zürich	7	45	1994-03-23	CH
49	Dröger	Maria	Ringstr.	1060	Wien	4	53	1981-06-27	AT
11	Schwönsdorf	Lisa	Bahnhofstr.	1210	Wien	4	1	1981-11-15	AT
20	Fiedler	Klaus	Schillerstr.	60388	Frankfurt	6	3	1969-03-01	D
33	Holzhäußer	Björn	Schillerstr.	8039	Zürich	\N	47	1976-03-24	CH
28	Ahrens	Enzo	Neugasse	1060	Wien	4	62	1969-05-05	AT
1	Fuchs	Peter	Martinplatz	22397	Hamburg	3	70	1968-08-11	D
59	Manz	Frieder	Hauptstr.	1120	Wien	4	89	1988-02-03	AT
32	Hallenbacher	Roger	Schillerstr.	22397	Hamburg	3	29	1990-05-02	D
38	Möller	Jonas	Am Kirchhof	22111	Hamburg	3	23	1978-09-19	D
69	Frawley	Lukas	Schwedenstr.	22397	Hamburg	3	21	1979-09-09	D
3	Dorff	Sebastian	Turmstr.	1060	Wien	4	23	1971-12-23	AT
\.


--
-- Data for Name: t_ma_proj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_ma_proj (ma_id, proj_id) FROM stdin;
2	1
5	1
8	1
11	1
36	4
48	4
\.


--
-- Data for Name: t_produkt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_produkt (id, name, bemerk, datum) FROM stdin;
1	Schraube M4	lieferbar	2021-03-01
3	Schraube M8	lieferbar	2021-03-01
4	Schraube M10	lieferbar	2021-02-01
5	Mutter M4	lieferbar	2020-12-01
6	Mutter M6	lieferbar	2021-01-05
8	Mutter M10	lieferbar	2020-11-10
11	Unterlegscheibe M8	lieferbar	2020-12-12
12	Unterlegscheibe M10	lieferbar	2021-01-10
10	Unterlegscheibe M6	lieferbar	2021-02-07
7	Mutter M8	lieferbar	2020-12-09
2	Schraube M6	lieferbar	2021-01-09
9	Unterlegscheibe M4	lieferbar	2021-03-05
\.


--
-- Data for Name: t_proj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_proj (id, name, beginn, ende) FROM stdin;
1	Buchprojekt	2020-11-01	2021-08-20
2	Renovierung Pausenraum	2021-02-01	2022-05-28
6	Anlegen eines Pflichtenheftes	2021-02-10	2021-09-21
4	Kundenumfrage	2021-03-01	2015-06-30
\.


--
-- Data for Name: temp_t_liefer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_t_liefer (id, name, plz, ort, str, hnr) FROM stdin;
2	Berger	10115	Berlin	Blumenstr.	3
3	Knapp	21029	Hamburg	Brunnenstr.	31
1	Schubert	60320	Frankfurt	Opernstr.	3
\.


--
-- Name: t_abt_id2_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_abt_id2_seq', 9, true);


--
-- Name: t_artikel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_artikel_id_seq', 13, true);


--
-- Name: t_liefer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_liefer_id_seq', 3, true);


--
-- Name: t_proj_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_proj_id_seq', 6, true);


--
-- Name: t_abt t_abt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_abt
    ADD CONSTRAINT t_abt_pkey PRIMARY KEY (id);


--
-- Name: t_artikel t_artikel_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_artikel
    ADD CONSTRAINT t_artikel_name_key UNIQUE (name, code);


--
-- Name: t_artikel t_artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_artikel
    ADD CONSTRAINT t_artikel_pkey PRIMARY KEY (id);


--
-- Name: t_lager t_lager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_lager
    ADD CONSTRAINT t_lager_pkey PRIMARY KEY (id);


--
-- Name: t_ma t_ma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ma
    ADD CONSTRAINT t_ma_pkey PRIMARY KEY (id);


--
-- Name: t_produkt t_produkt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_produkt
    ADD CONSTRAINT t_produkt_pkey PRIMARY KEY (id);


--
-- Name: t_proj t_proj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_proj
    ADD CONSTRAINT t_proj_pkey PRIMARY KEY (id);


--
-- Name: i_produkt_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_produkt_name ON public.t_produkt USING btree (name);


--
-- Name: t_ma_proj t_ma_proj_ma_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ma_proj
    ADD CONSTRAINT t_ma_proj_ma_id_fkey FOREIGN KEY (ma_id) REFERENCES public.t_ma(id) ON DELETE CASCADE;


--
-- Name: t_ma_proj t_ma_proj_proj_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ma_proj
    ADD CONSTRAINT t_ma_proj_proj_id_fkey FOREIGN KEY (proj_id) REFERENCES public.t_proj(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

