-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass_in_suns numeric NOT NULL,
    description text,
    age_in_millions_of_years integer,
    is_accreting boolean
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    galaxy_type character varying(50),
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    planet_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric,
    star_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 4000000, 'Supermassive black hole at the center of the Milky Way', 13600, true);
INSERT INTO public.black_hole VALUES (2, 'Cygnus X-1', 15, 'Stellar-mass black hole in the constellation Cygnus', 6000, true);
INSERT INTO public.black_hole VALUES (3, 'M87*', 6500000000, 'Supermassive black hole at the center of galaxy M87', 15000, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy', 'Spiral', 10000, 2500000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in the Local Group', 'Spiral', 12000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Giant elliptical galaxy', 'Elliptical', 15000, 53000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Classic spiral galaxy', 'Spiral', 12000, 23000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Unusual spiral galaxy', 'Spiral', 11000, 29000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'Earth''s only natural satellite', 4530, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars''s larger moon', 4500, 54600000, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars''s smaller moon', 4500, 54600000, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'One of Jupiter''s Galilean moons', 4500, 588000000, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 'Another Galilean moon with a potential ocean', 4500, 588000000, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system', 4500, 588000000, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered moon of Jupiter', 4500, 588000000, 4);
INSERT INTO public.moon VALUES (8, 'Leda', 'A small Jovian moon', 4500, 588000000, 4);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Another Jovian moon', 4500, 588000000, 4);
INSERT INTO public.moon VALUES (10, 'Thebe', 'Innermost Jovian moon', 4500, 588000000, 4);
INSERT INTO public.moon VALUES (11, 'Metis', 'A moon of Jupiter', 4500, 588000000, 4);
INSERT INTO public.moon VALUES (12, 'Adrastea', 'Another moon of Jupiter', 4500, 588000000, 4);
INSERT INTO public.moon VALUES (13, 'Amalthea', 'A moon of Jupiter', 4500, 588000000, 4);
INSERT INTO public.moon VALUES (14, 'Titan', 'Largest moon of Saturn', 4500, 1200000000, 4);
INSERT INTO public.moon VALUES (15, 'Enceladus', 'Moon of Saturn', 4500, 1200000000, 4);
INSERT INTO public.moon VALUES (16, 'Mimas', 'Moon of Saturn', 4500, 1200000000, 4);
INSERT INTO public.moon VALUES (17, 'Triton', 'Moon of Neptune', 4500, 4500000000, 4);
INSERT INTO public.moon VALUES (18, 'Oberon', 'Moon of Uranus', 4500, 2800000000, 4);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'Moon of Uranus', 4500, 2800000000, 4);
INSERT INTO public.moon VALUES (20, 'Ariel', 'Moon of Uranus', 4500, 2800000000, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun', true, true, 0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The Red Planet', false, true, 54.6, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Second planet from the Sun', false, true, 41.4, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Largest planet in our solar system', false, true, 588, 1);
INSERT INTO public.planet VALUES (5, 'Kepler-186f', 'First Earth-sized planet found', false, true, 4900000, 2);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 'Exoplanet orbiting Proxima Centauri', false, true, 4246000, 2);
INSERT INTO public.planet VALUES (7, 'Sirius b', 'White dwarf companion', false, true, 860000, 3);
INSERT INTO public.planet VALUES (8, 'Sirius c', 'Another companion', false, true, 870000, 3);
INSERT INTO public.planet VALUES (9, 'Alpha Andromedae b', 'Hypothetical planet', false, true, 970000, 4);
INSERT INTO public.planet VALUES (10, 'Alpha Andromedae c', 'Another hypothetical planet', false, true, 980000, 4);
INSERT INTO public.planet VALUES (11, 'Alpheratz b', 'Planet around Alpheratz', false, true, 1000000, 5);
INSERT INTO public.planet VALUES (12, 'Vega b', 'Exoplanet orbiting Vega', false, true, 250000, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The center of our solar system', true, 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star to the Sun', true, 4850, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Brightest star in the night sky', true, 240, 1);
INSERT INTO public.star VALUES (4, 'Alpha Andromedae', 'Brightest star in Andromeda', true, 60, 2);
INSERT INTO public.star VALUES (5, 'Alpheratz', 'Binary star system', true, 120, 2);
INSERT INTO public.star VALUES (6, 'Vega', 'A-type main-sequence star', true, 455, 1);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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

