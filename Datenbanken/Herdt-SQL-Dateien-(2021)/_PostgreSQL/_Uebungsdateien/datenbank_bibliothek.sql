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
-- Name: t_buecher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_buecher (
    isbn character varying(13) NOT NULL,
    titel character varying(100),
    autor character varying(100),
    auflage integer,
    preis double precision
);


ALTER TABLE public.t_buecher OWNER TO postgres;

--
-- Name: t_leser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_leser (
    nr integer NOT NULL,
    name character varying(30),
    vname character varying(30),
    plz character varying(5),
    ort character varying(100),
    str character varying(100),
    hnr character varying(5)
);


ALTER TABLE public.t_leser OWNER TO postgres;

--
-- Name: t_leser_nr_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_leser_nr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_leser_nr_seq OWNER TO postgres;

--
-- Name: t_leser_nr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_leser_nr_seq OWNED BY public.t_leser.nr;


--
-- Name: t_mess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_mess (
    nr integer NOT NULL,
    wert integer
);


ALTER TABLE public.t_mess OWNER TO postgres;

--
-- Name: t_mess_nr_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_mess_nr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_mess_nr_seq OWNER TO postgres;

--
-- Name: t_mess_nr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_mess_nr_seq OWNED BY public.t_mess.nr;


--
-- Name: t_verleih; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_verleih (
    isbn character varying(13) NOT NULL,
    leser integer NOT NULL,
    datum date
);


ALTER TABLE public.t_verleih OWNER TO postgres;

--
-- Name: t_leser nr; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_leser ALTER COLUMN nr SET DEFAULT nextval('public.t_leser_nr_seq'::regclass);


--
-- Name: t_mess nr; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_mess ALTER COLUMN nr SET DEFAULT nextval('public.t_mess_nr_seq'::regclass);


--
-- Data for Name: t_buecher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_buecher (isbn, titel, autor, auflage, preis) FROM stdin;
1-254-56649-0	Mein Gartenbuch	Bernd Blume	2	19.95
1-234-56789-0	Der Baum	Gerd Baumann	1	29.95
1-285-54709-0	Fit for Fun	Brigitte Schöne	3	21.55
\.


--
-- Data for Name: t_leser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_leser (nr, name, vname, plz, ort, str, hnr) FROM stdin;
2	Kramer	Birgit	10119	Berlin	Steinstr.	4
1	Husler	Bernd	10115	Berlin	Waldweg	4
\.


--
-- Data for Name: t_mess; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_mess (nr, wert) FROM stdin;
1	153
2	851
3	682
4	162
5	879
6	971
7	697
8	816
9	1
10	716
11	822
12	746
\.


--
-- Data for Name: t_verleih; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_verleih (isbn, leser, datum) FROM stdin;
1-285-54709-0	2	2018-02-27
1-285-54709-0	2	2021-05-27
1-254-56649-0	1	2021-03-01
1-234-56789-0	1	2021-05-25
\.


--
-- Name: t_leser_nr_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_leser_nr_seq', 2, true);


--
-- Name: t_mess_nr_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_mess_nr_seq', 12, true);


--
-- Name: t_buecher t_buecher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_buecher
    ADD CONSTRAINT t_buecher_pkey PRIMARY KEY (isbn);


--
-- Name: t_leser t_leser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_leser
    ADD CONSTRAINT t_leser_pkey PRIMARY KEY (nr);


--
-- Name: i_autor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_autor ON public.t_buecher USING btree (autor);


--
-- Name: i_leser_ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_leser_ab ON public.t_leser USING btree (name);


--
-- Name: i_titel; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_titel ON public.t_buecher USING btree (titel);


--
-- Name: i_verleih; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_verleih ON public.t_verleih USING btree (isbn, leser);


--
-- Name: t_verleih t_verleih_isbn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_verleih
    ADD CONSTRAINT t_verleih_isbn_fkey FOREIGN KEY (isbn) REFERENCES public.t_buecher(isbn) ON DELETE CASCADE;


--
-- Name: t_verleih t_verleih_leser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_verleih
    ADD CONSTRAINT t_verleih_leser_fkey FOREIGN KEY (leser) REFERENCES public.t_leser(nr) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

