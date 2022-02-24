--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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
-- Name: crypto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crypto (
    id integer NOT NULL,
    name text
);


--
-- Name: crypto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crypto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crypto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crypto_id_seq OWNED BY public.crypto.id;


--
-- Name: historical_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.historical_data (
    "Date" character varying(10),
    "Open" real,
    "High" real,
    "Low" real,
    "Close" real,
    "Volume" double precision,
    "MarketCap" double precision,
    currency integer,
    id integer NOT NULL
);


--
-- Name: historical_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.historical_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: historical_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.historical_data_id_seq OWNED BY public.historical_data.id;


--
-- Name: crypto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crypto ALTER COLUMN id SET DEFAULT nextval('public.crypto_id_seq'::regclass);


--
-- Name: historical_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.historical_data ALTER COLUMN id SET DEFAULT nextval('public.historical_data_id_seq'::regclass);


--
-- Name: crypto crypto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crypto
    ADD CONSTRAINT crypto_pkey PRIMARY KEY (id);


--
-- Name: historical_data historical_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.historical_data
    ADD CONSTRAINT historical_data_pkey PRIMARY KEY (id);


--
-- Name: historical_data fk_crypto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.historical_data
    ADD CONSTRAINT fk_crypto FOREIGN KEY (currency) REFERENCES public.crypto(id);


--
-- PostgreSQL database dump complete
--

