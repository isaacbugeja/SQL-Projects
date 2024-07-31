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
    number_of_known_planets integer,
    description text,
    distance_from_earth_in_light_years integer
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
    radius_in_km numeric(38,2) NOT NULL,
    description text,
    distance_from_earth_in_light_years integer,
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
-- Name: observatory; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observatory (
    observatory_id integer NOT NULL,
    name character varying(30),
    location character varying(30),
    max_capacity integer NOT NULL
);


ALTER TABLE public.observatory OWNER TO freecodecamp;

--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observatory_observatory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observatory_observatory_id_seq OWNER TO freecodecamp;

--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observatory_observatory_id_seq OWNED BY public.observatory.observatory_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km integer NOT NULL,
    is_dwarf_planet boolean,
    has_more_than_one_moon boolean,
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
    age_in_millions_of_years integer,
    galaxy_id integer,
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
-- Name: observatory observatory_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory ALTER COLUMN observatory_id SET DEFAULT nextval('public.observatory_observatory_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 8, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 5, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 2, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 4, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 6, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.10, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.27, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.20, NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Io', 1821.60, NULL, NULL, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.80, NULL, NULL, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.10, NULL, NULL, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.30, NULL, NULL, 4);
INSERT INTO public.moon VALUES (8, 'Titan', 2574.70, NULL, NULL, 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 764.50, NULL, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Iapetus', 734.50, NULL, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Titania', 788.90, NULL, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Oberon', 761.40, NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Triton', 1353.40, NULL, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Nereid', 170.00, NULL, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Charon', 606.00, NULL, NULL, 8);
INSERT INTO public.moon VALUES (16, 'Hydra', 21.50, NULL, NULL, 8);
INSERT INTO public.moon VALUES (17, 'Dysnomia', 299.00, NULL, NULL, 9);
INSERT INTO public.moon VALUES (18, 'Namaka', 85.00, NULL, NULL, 9);
INSERT INTO public.moon VALUES (19, 'Hiʻiaka', 195.00, NULL, NULL, 10);
INSERT INTO public.moon VALUES (20, 'S/2015 (136472) 1', 79.00, NULL, NULL, 10);


--
-- Data for Name: observatory; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observatory VALUES (1, 'test', NULL, 19);
INSERT INTO public.observatory VALUES (2, 'other test', NULL, 20);
INSERT INTO public.observatory VALUES (3, 'Final test', NULL, 30);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2440, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6052, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, false, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3389, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 1188, true, true, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 1163, true, false, 2);
INSERT INTO public.planet VALUES (11, 'Haumea', 816, true, true, 3);
INSERT INTO public.planet VALUES (12, 'Makemake', 715, true, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 4850, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 200, 1, NULL);
INSERT INTO public.star VALUES (3, 'Vega', 450, 1, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 10, 1, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 10, 1, NULL);
INSERT INTO public.star VALUES (6, 'Altair', 1000, 1, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observatory_observatory_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: observatory observatory_observatory_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory
    ADD CONSTRAINT observatory_observatory_id_key UNIQUE (observatory_id);


--
-- Name: observatory observatory_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory
    ADD CONSTRAINT observatory_pkey PRIMARY KEY (observatory_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

