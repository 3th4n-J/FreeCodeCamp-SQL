--
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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    gravity_strength numeric(4,1),
    interesting_fact text,
    inhabitable boolean,
    visible_by_eye boolean,
    space_code character varying(20) NOT NULL
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
    age_in_millions_of_years integer,
    distance_from_earth integer,
    gravity_strength numeric(4,1),
    interesting_fact text,
    inhabitable boolean,
    visible_by_eye boolean,
    planet_id integer NOT NULL,
    space_code character varying(20) NOT NULL
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
    age_in_millions_of_years integer,
    distance_from_earth integer,
    gravity_strength numeric(4,1),
    interesting_fact text,
    inhabitable boolean,
    visible_by_eye boolean,
    star_id integer NOT NULL,
    space_code character varying(20) NOT NULL
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
    age_in_millions_of_years integer,
    distance_from_earth integer,
    gravity_strength numeric(4,1),
    interesting_fact text,
    inhabitable boolean,
    visible_by_eye boolean,
    galaxy_id integer NOT NULL,
    space_code character varying(20) NOT NULL
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
-- Name: travel_log; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.travel_log (
    travel_log_id integer NOT NULL,
    name character varying(60) NOT NULL,
    trip_distance integer NOT NULL,
    fuel_required integer NOT NULL,
    avg_temp numeric(5,1),
    capitan_present boolean,
    debrief_given boolean,
    other_notes text,
    travel_code character varying(20) NOT NULL
);


ALTER TABLE public.travel_log OWNER TO freecodecamp;

--
-- Name: travel_log_travel_log_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.travel_log_travel_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.travel_log_travel_log_id_seq OWNER TO freecodecamp;

--
-- Name: travel_log_travel_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.travel_log_travel_log_id_seq OWNED BY public.travel_log.travel_log_id;


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
-- Name: travel_log travel_log_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.travel_log ALTER COLUMN travel_log_id SET DEFAULT nextval('public.travel_log_travel_log_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, 1.0, 'Our home galaxy containing Earth.', true, true, 'GAL-MW-01');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, 1.2, 'On a collision course with the Milky Way.', false, true, 'GAL-AND-02');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 2730000, 0.8, 'The third-largest member of the Local Group.', false, true, 'GAL-TRI-03');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 13200, 28000000, 2.5, 'Has an unusually large central bulge.', false, false, 'GAL-SOM-04');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 400, 23000000, 1.5, 'The first galaxy classified as spiral.', false, false, 'GAL-WHP-05');
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 13000, 17000000, 1.1, 'Has a spectacular dark band of absorbing dust.', false, false, 'GAL-BKE-06');
INSERT INTO public.galaxy VALUES (7, 'Bodes Galaxy', 13400, 12000000, 1.3, 'Contains a supermassive black hole.', false, false, 'GAL-BOD-07');
INSERT INTO public.galaxy VALUES (8, 'Cigar Galaxy', 13000, 12000000, 1.4, 'Famous for its high rate of star formation.', false, false, 'GAL-CIG-08');
INSERT INTO public.galaxy VALUES (9, 'Cartwheel', 13100, 500000000, 3.0, 'Formed by a violent galactic collision.', false, false, 'GAL-CRT-09');
INSERT INTO public.galaxy VALUES (10, 'Large Magellanic Cloud', 13000, 163000, 0.5, 'A satellite galaxy orbiting the Milky Way.', false, true, 'GAL-LMC-10');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 4500, 0, 0.2, 'The only celestial body besides Earth visited by humans.', false, true, 3, 'MON-LUN-01');
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 78, 0.0, 'Orbits Mars so closely that it will eventually crash into it.', false, false, 4, 'MON-PHO-02');
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 78, 0.0, 'The smaller and outermost of the two Martian moons.', false, false, 4, 'MON-DEI-03');
INSERT INTO public.moon VALUES (4, 'Io', 4500, 628, 0.2, 'The most volcanically active body in the solar system.', false, false, 5, 'MON-IOO-04');
INSERT INTO public.moon VALUES (5, 'Europa', 4500, 628, 0.1, 'Has a subsurface liquid water ocean under a thick ice crust.', false, false, 5, 'MON-EUR-05');
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, 628, 0.1, 'The largest moon in our solar system, bigger than Mercury.', false, false, 5, 'MON-GAN-06');
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, 628, 0.1, 'The most heavily cratered object in our solar system.', false, false, 5, 'MON-CAL-07');
INSERT INTO public.moon VALUES (8, 'Mimas', 4500, 1277, 0.0, 'Resembles the Death Star due to a massive impact crater.', false, false, 6, 'MON-MIM-08');
INSERT INTO public.moon VALUES (9, 'Enceladus', 4500, 1277, 0.0, 'Shoots plumes of icy water into space from its south pole.', false, false, 6, 'MON-ENC-09');
INSERT INTO public.moon VALUES (10, 'Tethys', 4500, 1277, 0.0, 'Composed almost entirely of water ice with a giant trench.', false, false, 6, 'MON-TET-10');
INSERT INTO public.moon VALUES (11, 'Dione', 4500, 1277, 0.0, 'Features bright cliffs created by tectonic fracturing.', false, false, 6, 'MON-DIO-11');
INSERT INTO public.moon VALUES (12, 'Rhea', 4500, 1277, 0.0, 'The second-largest moon of Saturn, highly cratered.', false, false, 6, 'MON-RHE-12');
INSERT INTO public.moon VALUES (13, 'Titan', 4500, 1277, 0.1, 'Has a dense nitrogen atmosphere and liquid methane lakes.', false, false, 6, 'MON-TIT-13');
INSERT INTO public.moon VALUES (14, 'Hyperion', 4500, 1277, 0.0, 'A highly irregular, sponge-like chaotic rotator.', false, false, 6, 'MON-HYP-14');
INSERT INTO public.moon VALUES (15, 'Iapetus', 4500, 1277, 0.0, 'Famous for its two-toned coloration and equatorial ridge.', false, false, 6, 'MON-IAP-15');
INSERT INTO public.moon VALUES (16, 'Sirius Minor Alpha', 200, 8, 0.1, 'A small captured asteroid orbiting the primary giant.', false, false, 7, 'MON-SIR-16');
INSERT INTO public.moon VALUES (17, 'Sirius Minor Beta', 200, 8, 0.2, 'Rich in rare crystalline minerals on its dark side.', false, false, 7, 'MON-SIR-17');
INSERT INTO public.moon VALUES (18, 'Dog Shard', 210, 8, 0.0, 'A fragment left over from a planetary collision.', false, false, 8, 'MON-DOG-18');
INSERT INTO public.moon VALUES (19, 'Aeon Fragment', 4, 642, 0.0, 'A volatile debris moon rapidly losing mass near its star.', false, false, 9, 'MON-AEO-19');
INSERT INTO public.moon VALUES (20, 'Alpha Shield', 190, 97, 0.3, 'Acts as a gravitational anchor for Alpha Rock.', false, false, 10, 'MON-ALP-20');
INSERT INTO public.moon VALUES (21, 'Echo Spark', 1400, 64, 0.1, 'Glows softly due to ionized atmospheric gasses.', false, false, 11, 'MON-ECH-21');
INSERT INTO public.moon VALUES (22, 'Sombrero Ring Moon', 4700, 28000000, 0.4, 'Shepherds a small, dusty ring system around the planet.', false, false, 12, 'MON-SOM-22');
INSERT INTO public.moon VALUES (23, 'Watcher Pebble', 10, 23000000, 0.0, 'A tiny, loosely bound pile of dust and ice gravel.', false, false, 13, 'MON-WHP-23');
INSERT INTO public.moon VALUES (24, 'Sentinel Ice', 7200, 12000000, 0.2, 'Completely covered in solid nitrogen glaciers.', false, false, 14, 'MON-BOD-24');
INSERT INTO public.moon VALUES (25, 'Sanduleak Core', 32, 163000, 0.5, 'A rocky, high-density moon swept up by a giant planet.', false, false, 15, 'MON-SAN-25');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, 91, 0.4, 'The smallest planet and closest to our Sun.', false, true, 1, 'PLN-MER-01');
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 41, 0.9, 'Has a runaway greenhouse effect and extreme heat.', false, true, 1, 'PLN-VEN-02');
INSERT INTO public.planet VALUES (3, 'Earth', 4540, 0, 1.0, 'Our home planet and the only one known to harbor life.', true, true, 1, 'PLN-EAR-03');
INSERT INTO public.planet VALUES (4, 'Mars', 4500, 78, 0.4, 'Known as the Red Planet due to iron oxide on its surface.', false, true, 1, 'PLN-MAR-04');
INSERT INTO public.planet VALUES (5, 'Jupiter', 4600, 628, 2.5, 'The largest planet in our solar system with a giant red storm.', false, true, 1, 'PLN-JUP-05');
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, 1277, 1.1, 'Famous for its extensive and beautiful ring system.', false, true, 1, 'PLN-SAT-06');
INSERT INTO public.planet VALUES (7, 'Sirius Prime', 200, 8, 1.8, 'A massive gas giant orbiting close to Sirius A.', false, false, 2, 'PLN-SIR-07');
INSERT INTO public.planet VALUES (8, 'Dog Star Minor', 220, 8, 0.6, 'A rocky planet with a heavily cratered surface.', false, false, 2, 'PLN-SIR-08');
INSERT INTO public.planet VALUES (9, 'Aeon', 5, 642, 0.2, 'A fast-forming planet surviving near the dying Betelgeuse.', false, false, 3, 'PLN-BET-09');
INSERT INTO public.planet VALUES (10, 'Alpha Rock', 200, 97, 1.2, 'Locked in a synchronous orbit with its primary star.', false, false, 4, 'PLN-AND-10');
INSERT INTO public.planet VALUES (11, 'Trianguli Echo', 1500, 64, 0.8, 'Reflects a strange golden hue across its atmosphere.', false, false, 5, 'PLN-TRI-11');
INSERT INTO public.planet VALUES (12, 'Sombrero Outpost', 4800, 28000000, 3.2, 'Experiencing extreme tidal forces from its dense sun.', false, false, 6, 'PLN-SOM-12');
INSERT INTO public.planet VALUES (13, 'Whirlpool Watcher', 12, 23000000, 0.1, 'A fragile asteroid-like planet in a young system.', false, false, 7, 'PLN-WHP-13');
INSERT INTO public.planet VALUES (14, 'Bodes Sentinel', 7500, 12000000, 1.5, 'An ancient world with heavily frozen methane oceans.', false, false, 9, 'PLN-BOD-14');
INSERT INTO public.planet VALUES (15, 'Sanduleak Guard', 35, 163000, 2.1, 'A high-gravity exoplanet on the fringe of the cloud.', false, false, 10, 'PLN-SAN-15');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 4600, 0, 28.0, 'Accounts for 99.86% of the solar system mass.', false, true, 1, 'STR-SUN-01');
INSERT INTO public.star VALUES (2, 'Sirius A', 242, 8, 56.2, 'The brightest star in Earth night sky.', false, true, 1, 'STR-SIR-02');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8, 642, 0.1, 'A red supergiant expected to go supernova soon.', false, true, 1, 'STR-BET-03');
INSERT INTO public.star VALUES (4, 'Andromedae Alpha', 240, 97, 10.5, 'The brightest star in Andromeda constellation.', false, true, 2, 'STR-AND-04');
INSERT INTO public.star VALUES (5, 'Trianguli Alpha', 1600, 64, 4.2, 'A spectroscopic binary star system.', false, true, 3, 'STR-TRI-05');
INSERT INTO public.star VALUES (6, 'Sombrero Core Star', 5000, 28000000, 99.9, 'A massive star near the galactic nucleus.', false, false, 4, 'STR-SOM-06');
INSERT INTO public.star VALUES (7, 'Whirlpool Supergiant', 15, 23000000, 85.0, 'Bright blue variable star in a spiral arm.', false, false, 5, 'STR-WHP-07');
INSERT INTO public.star VALUES (8, 'Black Eye Giant', 6000, 17000000, 12.4, 'Located within the dark dust band region.', false, false, 6, 'STR-BKE-08');
INSERT INTO public.star VALUES (9, 'Bodes Primary', 8000, 12000000, 18.1, 'A highly stable main sequence star.', false, false, 7, 'STR-BOD-09');
INSERT INTO public.star VALUES (10, 'Sanduleak', 40, 163000, 75.0, 'The progenitor star of the SN 1987A supernova.', false, false, 10, 'STR-SAN-10');


--
-- Data for Name: travel_log; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.travel_log VALUES (1, 'Alpha Centauri Run', 4300, 150, 25.4, true, true, 'Routine supply run completed without incident.', 'LOG-AC-01');
INSERT INTO public.travel_log VALUES (2, 'Sol Extraction', 12000, 480, 550.2, true, false, 'Extreme solar radiation encountered near the star core.', 'LOG-SOL-02');
INSERT INTO public.travel_log VALUES (3, 'Andromeda Survey', 85000, 3200, -180.5, false, true, 'Automated drone mapping of outer galactic rim.', 'LOG-AND-03');
INSERT INTO public.travel_log VALUES (4, 'Sombrero Fast Track', 3400, 110, 42.1, true, true, 'Utilized gravitational slingshot around primary planet.', 'LOG-SOM-04');
INSERT INTO public.travel_log VALUES (5, 'Orion Nebula Probe', 15000, 610, 120.8, true, false, 'Collected dense gas samples for environmental analysis.', 'LOG-ORI-05');
INSERT INTO public.travel_log VALUES (6, 'Milky Way Transit', 9800, 390, 15.0, false, false, 'Cargo transfer fleet route; autopilot engaged.', 'LOG-MW-06');
INSERT INTO public.travel_log VALUES (7, 'Triangulum Deep Dive', 64000, 2450, -220.3, true, true, 'Crew debrief noted minor anomalies in spatial drive.', 'LOG-TRI-07');
INSERT INTO public.travel_log VALUES (8, 'Black Eye Patrol', 7200, 280, -10.5, true, true, 'Border security mapping alongside local sector guards.', 'LOG-BKE-08');
INSERT INTO public.travel_log VALUES (9, 'Cigar Fleet Jump', 19500, 830, 95.6, false, true, 'Fitted with advanced shields to cross high-dust zones.', 'LOG-CIG-09');
INSERT INTO public.travel_log VALUES (10, 'Magellanic Gateway', 54000, 1980, 5.2, true, false, 'Established standard communication link with outpost.', 'LOG-MAG-10');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: travel_log_travel_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.travel_log_travel_log_id_seq', 10, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_space_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_space_code_key UNIQUE (space_code);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_space_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_space_code_key UNIQUE (space_code);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_space_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_space_code_key UNIQUE (space_code);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_space_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_space_code_key UNIQUE (space_code);


--
-- Name: travel_log travel_log_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.travel_log
    ADD CONSTRAINT travel_log_pkey PRIMARY KEY (travel_log_id);


--
-- Name: travel_log travel_log_travel_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.travel_log
    ADD CONSTRAINT travel_log_travel_code_key UNIQUE (travel_code);


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

