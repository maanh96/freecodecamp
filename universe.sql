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
    name character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric,
    age_in_million_years integer,
    galaxy_types integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: random; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.random (
    random_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.random OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'a', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'b', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'c', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'd', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'e', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'f', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'a', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'b', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'c', 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'd', 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'e', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'f', 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'aa', 1, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'bb', 2, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'cc', 3, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'dd', 4, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'ee', 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'ff', 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'aaa', 7, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'bbb', 8, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'ccc', 9, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'ddd', 10, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'eee', 11, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'fff', 12, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'aaaa', 1, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'bbbb', 2, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'a', 1, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'b', 2, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'c', 3, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'd', 4, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'e', 5, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'f', 6, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'aa', 1, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'bb', 2, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'cc', 3, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'dd', 4, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'ee', 5, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'ff', 6, NULL, NULL);


--
-- Data for Name: random; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.random VALUES (1, 'a', NULL);
INSERT INTO public.random VALUES (2, 'b', NULL);
INSERT INTO public.random VALUES (3, 'c', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'b', 2, NULL, NULL);
INSERT INTO public.star VALUES (3, 'c', 3, NULL, NULL);
INSERT INTO public.star VALUES (4, 'd', 4, NULL, NULL);
INSERT INTO public.star VALUES (5, 'e', 5, NULL, NULL);
INSERT INTO public.star VALUES (6, 'f', 6, NULL, NULL);


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
-- Name: random random_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.random
    ADD CONSTRAINT random_pkey PRIMARY KEY (random_id);


--
-- Name: random random_random_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.random
    ADD CONSTRAINT random_random_id_key UNIQUE (random_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

