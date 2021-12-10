--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

DROP DATABASE IF EXISTS "ArchiLogiciel";
--
-- Name: ArchiLogiciel; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "ArchiLogiciel" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';


ALTER DATABASE "ArchiLogiciel" OWNER TO postgres;

\connect "ArchiLogiciel"

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    numero_compte character varying(50) NOT NULL,
    numero_client character varying(50),
    libelle character varying(30) NOT NULL,
    solde numeric(15,2) NOT NULL,
    decouvert_autorise numeric(6,2) NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    numero_client character varying(50) NOT NULL,
    nom character varying(30) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(30) NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accounts (numero_compte, numero_client, libelle, solde, decouvert_autorise) VALUES ('2', '1', 'Livret A', 890.00, 3.00);
INSERT INTO public.accounts (numero_compte, numero_client, libelle, solde, decouvert_autorise) VALUES ('5', '2', 'compte react native plugin', 7743.00, 22.20);
INSERT INTO public.accounts (numero_compte, numero_client, libelle, solde, decouvert_autorise) VALUES ('4', '2', 'compte courant', 90.00, 90.00);
INSERT INTO public.accounts (numero_compte, numero_client, libelle, solde, decouvert_autorise) VALUES ('1', '1', 'compte courant', 3438.00, 90.00);
INSERT INTO public.accounts (numero_compte, numero_client, libelle, solde, decouvert_autorise) VALUES ('3', '1', 'compte aux iles Caïman', 50.00, 50.00);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clients (numero_client, nom, email, password) VALUES ('2', 'Nicolas', 'admin@admin.fr', 'admin');
INSERT INTO public.clients (numero_client, nom, email, password) VALUES ('1', 'Bernard', 'test@test.fr', 'test');


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (numero_compte);


--
-- Name: clients clients_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_email_key UNIQUE (email);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (numero_client);


--
-- Name: accounts fk_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_client FOREIGN KEY (numero_client) REFERENCES public.clients(numero_client);


--
-- Name: accounts numero_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT numero_client FOREIGN KEY (numero_client) REFERENCES public.clients(numero_client);


--
-- PostgreSQL database dump complete
--

