--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_test; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users_test (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users_test OWNER TO freecodecamp;

--
-- Name: users_test_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_test_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_test_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_test_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_test_user_id_seq OWNED BY public.users_test.user_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_test user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_test ALTER COLUMN user_id SET DEFAULT nextval('public.users_test_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (23, 'django13', 2, 5);
INSERT INTO public.users VALUES (22, 'ginger23', 2, 10);
INSERT INTO public.users VALUES (25, 'user_1724445709780', 2, 176);
INSERT INTO public.users VALUES (24, 'user_1724445709781', 5, 41);
INSERT INTO public.users VALUES (27, 'user_1724445847820', 2, 76);
INSERT INTO public.users VALUES (26, 'user_1724445847821', 5, 68);
INSERT INTO public.users VALUES (29, 'user_1724445877742', 2, 36);
INSERT INTO public.users VALUES (28, 'user_1724445877743', 5, 155);
INSERT INTO public.users VALUES (31, 'user_1724445895290', 2, 543);
INSERT INTO public.users VALUES (30, 'user_1724445895291', 5, 7);


--
-- Data for Name: users_test; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users_test VALUES (11, 'user_1724444491827', 7, 7);
INSERT INTO public.users_test VALUES (2, 'user_1724442116954', NULL, 7);
INSERT INTO public.users_test VALUES (3, 'user_1724442116953', NULL, 7);
INSERT INTO public.users_test VALUES (1, 'Labc', 9, 7);
INSERT INTO public.users_test VALUES (4, 'Diegopolc', NULL, 7);
INSERT INTO public.users_test VALUES (5, 'diamarcan', 1, 7);
INSERT INTO public.users_test VALUES (7, 'user_1724443623407', 2, 7);
INSERT INTO public.users_test VALUES (6, 'user_1724443623408', 5, 7);
INSERT INTO public.users_test VALUES (9, 'user_1724443715324', 2, 7);
INSERT INTO public.users_test VALUES (8, 'user_1724443715325', 5, 7);
INSERT INTO public.users_test VALUES (10, 'user_1724444491828', 5, 7);
INSERT INTO public.users_test VALUES (12, 'user_1724444526595', 7, 8);
INSERT INTO public.users_test VALUES (14, 'user_1724444569735', 7, 8);
INSERT INTO public.users_test VALUES (13, 'user_1724444526594', 7, 8);
INSERT INTO public.users_test VALUES (15, 'user_1724444569734', 7, 8);


--
-- Name: users_test_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_test_user_id_seq', 15, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 31, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_test users_test_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_test
    ADD CONSTRAINT users_test_pkey PRIMARY KEY (user_id);


--
-- Name: users_test users_test_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_test
    ADD CONSTRAINT users_test_username_key UNIQUE (username);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

