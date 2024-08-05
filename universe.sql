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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_light_years numeric,
    galaxy_type text,
    oldest_star_age_in_billions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_type character varying(30),
    moon_size_in_km numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_planets_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_planets_info (
    more_planets_info_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    have_moons boolean,
    number_of_moons integer
);


ALTER TABLE public.more_planets_info OWNER TO freecodecamp;

--
-- Name: more_planets_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_planets_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_planets_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_planets_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_planets_info_more_info_id_seq OWNED BY public.more_planets_info.more_planets_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    distance_to_the_star_in_million_of_km numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_type character varying(30),
    size_in_millions_of_km numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_planets_info more_planets_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_planets_info ALTER COLUMN more_planets_info_id SET DEFAULT nextval('public.more_planets_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 230000, 'Spiral', 13);
INSERT INTO public.galaxy VALUES (2, 'Messier 31', 220000, 'Spiral', 13);
INSERT INTO public.galaxy VALUES (3, 'Messier 33', 70000, 'Spiral', 12);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 20000, 'Irregular', 12);
INSERT INTO public.galaxy VALUES (5, 'Fornax Dwarf Galaxy', 2000, 'Spheroidal', 13);
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Elliptical', 2000, 'Dwarf Spheroidal', 13);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Terrestrial moon', 3474, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Irregular moon', 22.4, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Irregular moon', 12.4, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanic moon', 3643, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon', 3121, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Icy moon', 3273, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Icy moon', 4821, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Irregular moon', 270, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Irregular moon', 170, 5);
INSERT INTO public.moon VALUES (10, 'Thebe', 'Irregular moon', 100, 6);
INSERT INTO public.moon VALUES (11, 'Titan', 'Icy moon', 5151, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Icy moon', 1527, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 'Irregular moon', 1471, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 'Icy moon', 1123, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 'Icy moon', 1062, 6);
INSERT INTO public.moon VALUES (16, 'Enceladus', 'Icy moon', 504, 6);
INSERT INTO public.moon VALUES (17, 'Phoebe', 'Irregular moon', 213, 6);
INSERT INTO public.moon VALUES (18, 'Hyperion', 'Irregular moon', 270, 6);
INSERT INTO public.moon VALUES (19, 'Pandora', 'Irregular moon', 81, 6);
INSERT INTO public.moon VALUES (20, 'Prometheus', 'Irregular moon', 86, 6);


--
-- Data for Name: more_planets_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_planets_info VALUES (1, 'Mercury', 1, true, 0);
INSERT INTO public.more_planets_info VALUES (2, 'Venus', 2, false, 0);
INSERT INTO public.more_planets_info VALUES (3, 'Earth', 3, true, 1);
INSERT INTO public.more_planets_info VALUES (4, 'Mars', 4, true, 2);
INSERT INTO public.more_planets_info VALUES (5, 'Jupiter', 5, true, 95);
INSERT INTO public.more_planets_info VALUES (6, 'Saturn', 6, true, 145);
INSERT INTO public.more_planets_info VALUES (7, 'Uranus', 7, true, 27);
INSERT INTO public.more_planets_info VALUES (8, 'Neptunus', 8, true, 14);
INSERT INTO public.more_planets_info VALUES (9, 'Pluto', 9, true, 5);
INSERT INTO public.more_planets_info VALUES (10, 'Proxima Centauri B', 10, false, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in our Solar System, with a diameter of about 4.880 km. Rocky terrestrial.', false, 57.9, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Similar to earth with a diameter of about 12.104 km with extreme conditions', false, 108, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The fifth largest in out Solar System diameter of about 12.742 km. Surface is about 71% water and 29% land', true, 149.6, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Referred to as the "Red Planet", terrestrial with a core composed likely of iron, nickel, and sulfur. Its mantle an crust are mainly silicate minerals.', false, 227.9, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System, with a strong magnetic field, a Great Red Spot, and a complex system of rings and moons.', false, 778, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Famous for its extensive and prominent ring system , Saturn is the second-largest planet in our Solar System', false, 1430, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Classifed as an ice giant due to its composition of ices and gases, rather than being composed mostly of hydrogen and helium like the gas giants.', false, 2870, 1);
INSERT INTO public.planet VALUES (8, 'Neptunus', 'Classified as an ice giant, composed primarily of hydrogen and helium, with significant amounts of water', false, 4500, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Classified as an dwarf planet composed of a mixture of rock and ice. Its surface features include nitrogen ice, methane ice, and carbon monoxide ice, giving it a varied and coloful appearance.', false, 590, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Terrestrial exoplanet. It is likely Rocky', false, 7.3, 4);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'Terrestrial exoplanet. It is likely rocky', false, 63, 5);
INSERT INTO public.planet VALUES (12, 'Osiris', 'Classified as Hot Jupiter, Is a gas giant similar to Jupiter but significantly colser to its star. It has a radius about 1.38 times that of Jupiter.', false, 7, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2v', 1.39, 1);
INSERT INTO public.star VALUES (2, 'M31-SR1', 'Super Giant', 1390, 2);
INSERT INTO public.star VALUES (3, 'HDE 233517', 'Super Giant', 973, 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Red Dwarf (M-type)', 0.097, 1);
INSERT INTO public.star VALUES (5, 'Kepler-186', 'Red Dwarf (M-type)', 0.35, 1);
INSERT INTO public.star VALUES (6, 'HD 209458', 'F-type Main Sequece Star', 1.7931, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_planets_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_planets_info_more_info_id_seq', 10, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_planets_info more_planets_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_planets_info
    ADD CONSTRAINT more_planets_info_name_key UNIQUE (name);


--
-- Name: more_planets_info more_planets_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_planets_info
    ADD CONSTRAINT more_planets_info_pkey PRIMARY KEY (more_planets_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

