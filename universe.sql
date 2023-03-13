--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    age_in_million_years numeric(3,1),
    description text,
    size_in_light_years integer NOT NULL
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
    planet_id integer,
    description text,
    mass integer NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    number_of_moons integer,
    description text,
    has_life boolean,
    has_moon boolean
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
-- Name: solarsystems; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solarsystems (
    solarsystems_id integer NOT NULL,
    name character varying(30),
    planet_number integer,
    star_id integer NOT NULL
);


ALTER TABLE public.solarsystems OWNER TO freecodecamp;

--
-- Name: solarsystems_solarsystem_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solarsystems_solarsystem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solarsystems_solarsystem_id_seq OWNER TO freecodecamp;

--
-- Name: solarsystems_solarsystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solarsystems_solarsystem_id_seq OWNED BY public.solarsystems.solarsystems_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    number_of_planets integer,
    description text
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solarsystems solarsystems_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solarsystems ALTER COLUMN solarsystems_id SET DEFAULT nextval('public.solarsystems_solarsystem_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 4.5, NULL, 1);
INSERT INTO public.galaxy VALUES (2, 'antennae', 4.5, NULL, 1);
INSERT INTO public.galaxy VALUES (3, 'backward', 4.5, NULL, 1);
INSERT INTO public.galaxy VALUES (4, 'Blackeye', 4.5, NULL, 1);
INSERT INTO public.galaxy VALUES (5, 'Bode', 4.5, NULL, 1);
INSERT INTO public.galaxy VALUES (6, 'Milky way', 4.5, NULL, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon1', 1, NULL, 1);
INSERT INTO public.moon VALUES (2, 'moon2', 1, NULL, 1);
INSERT INTO public.moon VALUES (3, 'moon3', 1, NULL, 1);
INSERT INTO public.moon VALUES (4, 'moon4', 1, NULL, 1);
INSERT INTO public.moon VALUES (5, 'moon5', 1, NULL, 1);
INSERT INTO public.moon VALUES (6, 'Moon1', 2, NULL, 1);
INSERT INTO public.moon VALUES (7, 'moon2', 2, NULL, 1);
INSERT INTO public.moon VALUES (8, 'moon3', 2, NULL, 1);
INSERT INTO public.moon VALUES (9, 'moon4', 2, NULL, 1);
INSERT INTO public.moon VALUES (10, 'moon5', 2, NULL, 1);
INSERT INTO public.moon VALUES (11, 'Moon1', 3, NULL, 1);
INSERT INTO public.moon VALUES (12, 'moon2', 3, NULL, 1);
INSERT INTO public.moon VALUES (13, 'moon3', 3, NULL, 1);
INSERT INTO public.moon VALUES (14, 'moon4', 3, NULL, 1);
INSERT INTO public.moon VALUES (15, 'moon5', 3, NULL, 1);
INSERT INTO public.moon VALUES (16, 'Moon1', 4, NULL, 1);
INSERT INTO public.moon VALUES (17, 'moon2', 4, NULL, 1);
INSERT INTO public.moon VALUES (18, 'moon3', 4, NULL, 1);
INSERT INTO public.moon VALUES (19, 'moon4', 4, NULL, 1);
INSERT INTO public.moon VALUES (20, 'moon5', 4, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'PLN1', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'PLN2', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'PLN3', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'PLN4', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'PLN5', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'PLN6', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'PLN1', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'PLN2', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'PLN3', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'PLN4', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'PLN5', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'PLN6', 2, NULL, NULL, NULL, NULL);


--
-- Data for Name: solarsystems; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solarsystems VALUES (1, 'PUDU', NULL, 1);
INSERT INTO public.solarsystems VALUES (2, 'SAPO', NULL, 2);
INSERT INTO public.solarsystems VALUES (3, 'TRUFA', NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'ALPHA', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'BETA', 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'GAMMA', 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'DELTA', 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'OMICRON', 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'LAMBDA', 1, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solarsystems_solarsystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solarsystems_solarsystem_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: solarsystems solarsystems_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solarsystems
    ADD CONSTRAINT solarsystems_pkey PRIMARY KEY (solarsystems_id);


--
-- Name: solarsystems solarsystems_solarsystem_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solarsystems
    ADD CONSTRAINT solarsystems_solarsystem_id_key UNIQUE (solarsystems_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: solarsystems solarsystems_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solarsystems
    ADD CONSTRAINT solarsystems_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

