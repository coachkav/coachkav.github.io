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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_guess integer NOT NULL,
    user_id integer
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(20) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 255, 17);
INSERT INTO public.games VALUES (2, 186, 17);
INSERT INTO public.games VALUES (3, 755, 18);
INSERT INTO public.games VALUES (4, 6, 18);
INSERT INTO public.games VALUES (5, 634, 17);
INSERT INTO public.games VALUES (6, 441, 17);
INSERT INTO public.games VALUES (7, 224, 17);
INSERT INTO public.games VALUES (8, 934, 19);
INSERT INTO public.games VALUES (9, 935, 19);
INSERT INTO public.games VALUES (10, 777, 20);
INSERT INTO public.games VALUES (11, 494, 20);
INSERT INTO public.games VALUES (12, 241, 19);
INSERT INTO public.games VALUES (13, 629, 19);
INSERT INTO public.games VALUES (14, 857, 19);
INSERT INTO public.games VALUES (15, 643, 21);
INSERT INTO public.games VALUES (16, 908, 21);
INSERT INTO public.games VALUES (17, 848, 22);
INSERT INTO public.games VALUES (18, 488, 22);
INSERT INTO public.games VALUES (19, 901, 21);
INSERT INTO public.games VALUES (20, 36, 21);
INSERT INTO public.games VALUES (21, 988, 21);
INSERT INTO public.games VALUES (22, 289, 23);
INSERT INTO public.games VALUES (23, 210, 23);
INSERT INTO public.games VALUES (24, 569, 24);
INSERT INTO public.games VALUES (25, 712, 24);
INSERT INTO public.games VALUES (26, 166, 23);
INSERT INTO public.games VALUES (27, 100, 23);
INSERT INTO public.games VALUES (28, 63, 23);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'x');
INSERT INTO public.users VALUES (2, 's');
INSERT INTO public.users VALUES (3, 'user_1650915896583');
INSERT INTO public.users VALUES (4, 'user_1650915896582');
INSERT INTO public.users VALUES (5, 'user_1650916158381');
INSERT INTO public.users VALUES (6, 'user_1650916158380');
INSERT INTO public.users VALUES (7, 'user_1650916233105');
INSERT INTO public.users VALUES (8, 'user_1650916233104');
INSERT INTO public.users VALUES (9, 'user_1650916448920');
INSERT INTO public.users VALUES (10, 'user_1650916448919');
INSERT INTO public.users VALUES (11, 'user_1650916471607');
INSERT INTO public.users VALUES (12, 'user_1650916471606');
INSERT INTO public.users VALUES (13, 'user_1650916512768');
INSERT INTO public.users VALUES (14, 'user_1650916512767');
INSERT INTO public.users VALUES (15, 'user_1650916529049');
INSERT INTO public.users VALUES (16, 'user_1650916529048');
INSERT INTO public.users VALUES (17, 'user_1650917153392');
INSERT INTO public.users VALUES (18, 'user_1650917153391');
INSERT INTO public.users VALUES (19, 'user_1650917306187');
INSERT INTO public.users VALUES (20, 'user_1650917306186');
INSERT INTO public.users VALUES (21, 'user_1650917320195');
INSERT INTO public.users VALUES (22, 'user_1650917320194');
INSERT INTO public.users VALUES (23, 'user_1650917340201');
INSERT INTO public.users VALUES (24, 'user_1650917340200');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 28, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 24, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

