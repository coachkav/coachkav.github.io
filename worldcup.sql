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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 330, 4, 2, 329);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 332, 2, 0, 331);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 332, 2, 1, 330);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 331, 1, 0, 329);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 333, 3, 2, 330);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 334, 2, 0, 332);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 335, 2, 1, 331);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 336, 2, 0, 329);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 337, 2, 1, 332);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 338, 1, 0, 334);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 339, 3, 2, 331);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 340, 2, 0, 335);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 341, 2, 1, 330);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 342, 2, 1, 333);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 343, 2, 1, 336);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 344, 4, 3, 329);
INSERT INTO public.games VALUES (17, 2014, 'Final', 344, 1, 0, 345);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 335, 3, 0, 346);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 346, 1, 0, 344);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 335, 7, 1, 345);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 347, 1, 0, 346);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 331, 1, 0, 344);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 337, 2, 1, 335);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 329, 1, 0, 345);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 348, 2, 1, 335);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 336, 2, 0, 337);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 349, 2, 0, 329);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 350, 2, 1, 345);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 340, 2, 1, 346);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 351, 2, 1, 347);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 338, 1, 0, 344);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 352, 2, 1, 331);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (329, 'France');
INSERT INTO public.teams VALUES (330, 'Croatia');
INSERT INTO public.teams VALUES (331, 'Belgium');
INSERT INTO public.teams VALUES (332, 'England');
INSERT INTO public.teams VALUES (333, 'Russia');
INSERT INTO public.teams VALUES (334, 'Sweden');
INSERT INTO public.teams VALUES (335, 'Brazil');
INSERT INTO public.teams VALUES (336, 'Uruguay');
INSERT INTO public.teams VALUES (337, 'Colombia');
INSERT INTO public.teams VALUES (338, 'Switzerland');
INSERT INTO public.teams VALUES (339, 'Japan');
INSERT INTO public.teams VALUES (340, 'Mexico');
INSERT INTO public.teams VALUES (341, 'Denmark');
INSERT INTO public.teams VALUES (342, 'Spain');
INSERT INTO public.teams VALUES (343, 'Portugal');
INSERT INTO public.teams VALUES (344, 'Argentina');
INSERT INTO public.teams VALUES (345, 'Germany');
INSERT INTO public.teams VALUES (346, 'Netherlands');
INSERT INTO public.teams VALUES (347, 'Costa Rica');
INSERT INTO public.teams VALUES (348, 'Chile');
INSERT INTO public.teams VALUES (349, 'Nigeria');
INSERT INTO public.teams VALUES (350, 'Algeria');
INSERT INTO public.teams VALUES (351, 'Greece');
INSERT INTO public.teams VALUES (352, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 352, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

