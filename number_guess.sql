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

DROP DATABASE number_guess_info;
--
-- Name: number_guess_info; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess_info WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess_info OWNER TO freecodecamp;

\connect number_guess_info

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    num_guesses integer,
    username character varying(22)
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.info (
    username character varying(22) NOT NULL,
    best_score integer
);


ALTER TABLE public.info OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (10, 773, 'user_1737471299824');
INSERT INTO public.games VALUES (11, 509, 'user_1737471299824');
INSERT INTO public.games VALUES (12, 222, 'user_1737471299823');
INSERT INTO public.games VALUES (13, 166, 'user_1737471299823');
INSERT INTO public.games VALUES (14, 274, 'user_1737471299824');
INSERT INTO public.games VALUES (15, 920, 'user_1737471299824');
INSERT INTO public.games VALUES (16, 826, 'user_1737471299824');
INSERT INTO public.games VALUES (17, 770, 'user_1737471452511');
INSERT INTO public.games VALUES (18, 640, 'user_1737471452511');
INSERT INTO public.games VALUES (19, 809, 'user_1737471452510');
INSERT INTO public.games VALUES (20, 901, 'user_1737471452510');
INSERT INTO public.games VALUES (21, 148, 'user_1737471452511');
INSERT INTO public.games VALUES (22, 196, 'user_1737471452511');
INSERT INTO public.games VALUES (23, 950, 'user_1737471452511');


--
-- Data for Name: info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.info VALUES ('me', 4);
INSERT INTO public.info VALUES ('asdf', 3);
INSERT INTO public.info VALUES ('user_1737471155537', 576);
INSERT INTO public.info VALUES ('user_1737471155538', 171);
INSERT INTO public.info VALUES ('user_1737471299823', 166);
INSERT INTO public.info VALUES ('user_1737471299824', 274);
INSERT INTO public.info VALUES ('user_1737471452510', 809);
INSERT INTO public.info VALUES ('user_1737471452511', 148);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 23, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: info info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_pkey PRIMARY KEY (username);


--
-- Name: games games_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_fkey FOREIGN KEY (username) REFERENCES public.info(username);


--
-- PostgreSQL database dump complete
--
