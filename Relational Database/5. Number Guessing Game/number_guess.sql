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
-- Name: guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guess (
    username character varying(25) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.guess OWNER TO freecodecamp;

--
-- Data for Name: guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guess VALUES ('user_1657917961438', 0, NULL);
INSERT INTO public.guess VALUES ('user_1657917961437', 0, NULL);
INSERT INTO public.guess VALUES ('user_1657921529426', 2, 861);
INSERT INTO public.guess VALUES ('user_1657921529427', 5, 110);
INSERT INTO public.guess VALUES ('user_1657921361569', 2, 503);
INSERT INTO public.guess VALUES ('user_1657920679511', 2, 535);
INSERT INTO public.guess VALUES ('user_1657921361570', 5, 133);
INSERT INTO public.guess VALUES ('user_1657920679512', 5, 11);
INSERT INTO public.guess VALUES ('user_1657921926734', 2, 895);
INSERT INTO public.guess VALUES ('user_1657921623248', 2, 201);
INSERT INTO public.guess VALUES ('user_1657920761035', 2, 183);
INSERT INTO public.guess VALUES ('user_1657921377176', 2, 326);
INSERT INTO public.guess VALUES ('user_1657921926735', 5, 104);
INSERT INTO public.guess VALUES ('user_1657921623249', 5, 1000);
INSERT INTO public.guess VALUES ('user_1657920761036', 5, 461);
INSERT INTO public.guess VALUES ('user_1657921377177', 5, 132);
INSERT INTO public.guess VALUES ('user_1657920865505', 2, 139);
INSERT INTO public.guess VALUES ('user_1657920865506', 5, 180);
INSERT INTO public.guess VALUES ('user_1657921430530', 2, 108);
INSERT INTO public.guess VALUES ('user_1657921634388', 2, 223);
INSERT INTO public.guess VALUES ('user_1657921430531', 5, 153);
INSERT INTO public.guess VALUES ('user_1657921005130', 2, 663);
INSERT INTO public.guess VALUES ('user_1657921634389', 5, 411);
INSERT INTO public.guess VALUES ('user_1657921005131', 5, 232);
INSERT INTO public.guess VALUES ('user_1657921461257', 2, 45);
INSERT INTO public.guess VALUES ('user_1657921461258', 5, 40);
INSERT INTO public.guess VALUES ('user_1657921696737', 2, 433);
INSERT INTO public.guess VALUES ('user_1657921502105', 2, 504);
INSERT INTO public.guess VALUES ('user_1657921696738', 5, 145);
INSERT INTO public.guess VALUES ('user_1657921502106', 5, 171);
INSERT INTO public.guess VALUES ('user_1657921758019', 2, 709);
INSERT INTO public.guess VALUES ('user_1657921758020', 5, 297);
INSERT INTO public.guess VALUES ('user_1657921767477', 2, 558);
INSERT INTO public.guess VALUES ('user_1657921767478', 5, 208);


--
-- Name: guess guess_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess
    ADD CONSTRAINT guess_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

