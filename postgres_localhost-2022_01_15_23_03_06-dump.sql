--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

--
-- Name: gym; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE gym WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United Kingdom.1252';


ALTER DATABASE gym OWNER TO postgres;

\connect gym

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
-- Name: benches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.benches (
    id integer NOT NULL,
    type character varying(30) NOT NULL,
    id_brand integer NOT NULL
);


ALTER TABLE public.benches OWNER TO postgres;

--
-- Name: benches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.benches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.benches_id_seq OWNER TO postgres;

--
-- Name: benches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.benches_id_seq OWNED BY public.benches.id;


--
-- Name: bills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bills (
    id integer NOT NULL,
    type character varying(30) NOT NULL,
    cost integer NOT NULL,
    due_date date NOT NULL,
    paid boolean NOT NULL
);


ALTER TABLE public.bills OWNER TO postgres;

--
-- Name: bills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bills_id_seq OWNER TO postgres;

--
-- Name: bills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bills_id_seq OWNED BY public.bills.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    rating integer NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: plates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plates (
    id integer NOT NULL,
    weight integer NOT NULL,
    quantity integer NOT NULL,
    id_brand integer NOT NULL
);


ALTER TABLE public.plates OWNER TO postgres;

--
-- Name: plates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plates_id_seq OWNER TO postgres;

--
-- Name: plates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plates_id_seq OWNED BY public.plates.id;


--
-- Name: stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stations (
    id integer NOT NULL,
    type character varying(40) NOT NULL,
    id_brand integer NOT NULL
);


ALTER TABLE public.stations OWNER TO postgres;

--
-- Name: stations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stations_id_seq OWNER TO postgres;

--
-- Name: stations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stations_id_seq OWNED BY public.stations.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    "subscriptionType" character varying(40) NOT NULL,
    "subscriptionPrice" integer NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: supplement sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."supplement sales" (
    id_trainee integer NOT NULL,
    id_supplement integer NOT NULL,
    date date,
    review text
);


ALTER TABLE public."supplement sales" OWNER TO postgres;

--
-- Name: COLUMN "supplement sales".review; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."supplement sales".review IS 'left by the person who bought';


--
-- Name: supplements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplements (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    id_brand integer NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.supplements OWNER TO postgres;

--
-- Name: supplements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplements_id_seq OWNER TO postgres;

--
-- Name: supplements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplements_id_seq OWNED BY public.supplements.id;


--
-- Name: trainees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainees (
    id integer NOT NULL,
    trainee_name text NOT NULL,
    age integer NOT NULL,
    weight integer NOT NULL,
    id_trainer integer,
    id_subscription integer NOT NULL,
    subscription_due_date date,
    gym_password character varying NOT NULL
);


ALTER TABLE public.trainees OWNER TO postgres;

--
-- Name: trainees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trainees_id_seq OWNER TO postgres;

--
-- Name: trainees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainees_id_seq OWNED BY public.trainees.id;


--
-- Name: trainers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainers (
    id integer NOT NULL,
    "trainerName" character varying(30) NOT NULL,
    age integer NOT NULL,
    wage integer NOT NULL,
    experience integer NOT NULL,
    routine text
);


ALTER TABLE public.trainers OWNER TO postgres;

--
-- Name: COLUMN trainers.experience; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.trainers.experience IS 'in years';


--
-- Name: trainers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trainers_id_seq OWNER TO postgres;

--
-- Name: trainers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainers_id_seq OWNED BY public.trainers.id;


--
-- Name: benches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benches ALTER COLUMN id SET DEFAULT nextval('public.benches_id_seq'::regclass);


--
-- Name: bills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills ALTER COLUMN id SET DEFAULT nextval('public.bills_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: plates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plates ALTER COLUMN id SET DEFAULT nextval('public.plates_id_seq'::regclass);


--
-- Name: stations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations ALTER COLUMN id SET DEFAULT nextval('public.stations_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: supplements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplements ALTER COLUMN id SET DEFAULT nextval('public.supplements_id_seq'::regclass);


--
-- Name: trainees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainees ALTER COLUMN id SET DEFAULT nextval('public.trainees_id_seq'::regclass);


--
-- Name: trainers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainers ALTER COLUMN id SET DEFAULT nextval('public.trainers_id_seq'::regclass);


--
-- Data for Name: benches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.benches (id, type, id_brand) FROM stdin;
1	flat	2
4	olympic height	3
2	flat	5
3	adjustable height	1
5	abdominal	3
6	folding weight	10
7	preacher curl	9
8	abdominal	6
\.


--
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bills (id, type, cost, due_date, paid) FROM stdin;
1	electricty	400	2022-01-31	f
2	rent	1000	2022-01-25	t
3	water	200	2022-01-28	f
4	heat	900	2022-01-30	t
5	suppliers	12000	2022-01-05	t
6	installments	800	2022-01-22	f
7	cable	50	2022-01-26	t
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, rating) FROM stdin;
1	Total Gym FIT	5
2	Mirror	2
3	NordicTrack	4
4	BowFlex	3
5	ProForm	3
6	Octane	5
7	Rogue Fitness	5
8	Pro Nutrition	4
9	Technologym	2
10	Echelon	1
\.


--
-- Data for Name: plates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plates (id, weight, quantity, id_brand) FROM stdin;
1	5	10	2
2	10	8	3
3	25	9	9
4	50	6	3
5	30	9	3
6	10	4	1
7	100	2	5
8	70	5	2
9	25	2	7
\.


--
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stations (id, type, id_brand) FROM stdin;
1	dual chest shoulder press	3
2	ab&back	5
3	adductor&abductor	6
4	arm curl&extension	2
5	leg&calf press	7
6	chest press&pulldown	3
7	rear delt	4
8	hack squat	5
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, "subscriptionType", "subscriptionPrice") FROM stdin;
1	dayly	8
2	monthly (20 intrances)	40
3	monthly (full access)	50
4	3-months full access	120
\.


--
-- Data for Name: supplement sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."supplement sales" (id_trainee, id_supplement, date, review) FROM stdin;
1	1	2022-01-04	Excellent
2	3	2022-01-01	Best so far
4	2	2022-01-03	Not so great
4	4	2022-01-04	Can't understand the hype
6	5	2022-01-01	Very useful
4	5	2021-01-08	\N
2	2	2021-01-11	Okay
4	4	2021-01-14	Could be better
5	7	2022-01-02	Satisfied
7	4	2021-04-07	\N
8	7	2021-01-21	\N
2	8	2021-06-22	Perfect for me
4	1	2021-04-10	Usless
\.


--
-- Data for Name: supplements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplements (id, name, id_brand, price) FROM stdin;
1	Beta-Alanine	2	30
2	Caffeine	2	20
3	Creatine	3	50
4	Carbohydrates	3	50
5	Protein	7	80
6	BCAAs	3	40
7	Chocolate milk	3	20
8	Electrolytes	2	35
9	Protein bars	3	10
10	Strawberry shake	2	15
11	Banana shake	2	15
\.


--
-- Data for Name: trainees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainees (id, trainee_name, age, weight, id_trainer, id_subscription, subscription_due_date, gym_password) FROM stdin;
4	Iuliu Violeta	55	80	4	2	2022-01-21	123
5	Raul Remus	19	88	1	4	2022-01-31	123
2	Teodora Raul	30	49	1	2	2022-01-20	123
3	Mirela Beatrice	29	60	3	1	2022-01-26	123
8	Ruxandra Iolanda	22	40	1	4	2022-01-27	123
6	Iacob Sabina	34	55	3	1	2022-01-25	123
7	Corneliu Viorel	55	100	3	3	2022-01-27	123
1	Marina Eva	22	50	2	3	2022-01-26	123
10	alex	12	22	\N	3	\N	123alex
20	abc	33	88	\N	1	\N	abc
13	asdfg	22	66	\N	1	\N	sdf234
14	ssfgdhf	34	56	\N	1	\N	3rte4rt
15	3re	56	78	\N	1	\N	234
21		34	56	\N	1	\N	123
9	mihai	55	61	1	1	\N	123
\.


--
-- Data for Name: trainers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainers (id, "trainerName", age, wage, experience, routine) FROM stdin;
1	Jucan Rares	20	2000	2	1 Bench press; 2 Triceps dip; 3 Incline dumbbell press; 4 Incline dumbbell flye; 5 Triceps extension
4	Codrut Mihail	30	4500	5	1 Overhead press; 2 Rack pull; 3 Seated dumbbell press; 4 Lateral raise; 5 Reverse flye
3	Virgiliu Gavril	45	5000	20	1 Back squat; 2 Good morning; 3 Hip thrust; 4 Incline dumbbell press; 5 Incline dumbbell flye
2	Miron Cristina	25	4000	5	1 Pull-up; 2 Bent-over row; 3 Chin-up; 4 Standing biceps curl; 5 Seated incline curl
7	Sara Loredana	22	2300	3	dumbbell bent over rows; dumbbell fly; one-arm dumbbell rows; pushups; dumbbell pullovers   
5	Ilie Victor	30	4000	4	dumbbell squats; standing shoulder press; dumbbell lunge;dumbbell upright rows;  Romanian dumbbell deadlift   
6	Stela Adela	20	2000	1	lateral raises; seated calf raises; crunches with legs elevated; dumbbell bench press or floor press  
\.


--
-- Name: benches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.benches_id_seq', 8, true);


--
-- Name: bills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bills_id_seq', 7, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 10, true);


--
-- Name: plates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plates_id_seq', 9, true);


--
-- Name: stations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stations_id_seq', 8, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 4, true);


--
-- Name: supplements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplements_id_seq', 11, true);


--
-- Name: trainees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainees_id_seq', 21, true);


--
-- Name: trainers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainers_id_seq', 7, true);


--
-- Name: benches benches_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benches
    ADD CONSTRAINT benches_pk PRIMARY KEY (id);


--
-- Name: bills bills_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pk PRIMARY KEY (id);


--
-- Name: brands brands_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pk PRIMARY KEY (id);


--
-- Name: plates plates_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plates
    ADD CONSTRAINT plates_pk PRIMARY KEY (id);


--
-- Name: stations stations_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pk PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pk PRIMARY KEY (id);


--
-- Name: supplements supplements_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplements
    ADD CONSTRAINT supplements_pk PRIMARY KEY (id);


--
-- Name: trainees trainees_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainees
    ADD CONSTRAINT trainees_pk PRIMARY KEY (id);


--
-- Name: trainers trainers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainers
    ADD CONSTRAINT trainers_pk PRIMARY KEY (id);


--
-- Name: benches_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX benches_id_uindex ON public.benches USING btree (id);


--
-- Name: bills_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX bills_id_uindex ON public.bills USING btree (id);


--
-- Name: brands_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX brands_id_uindex ON public.brands USING btree (id);


--
-- Name: plates_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX plates_id_uindex ON public.plates USING btree (id);


--
-- Name: stations_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX stations_id_uindex ON public.stations USING btree (id);


--
-- Name: subscriptions_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX subscriptions_id_uindex ON public.subscriptions USING btree (id);


--
-- Name: supplements_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX supplements_id_uindex ON public.supplements USING btree (id);


--
-- Name: trainees_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX trainees_id_uindex ON public.trainees USING btree (id);


--
-- Name: trainees_trainee_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX trainees_trainee_name_uindex ON public.trainees USING btree (trainee_name);


--
-- Name: trainers_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX trainers_id_uindex ON public.trainers USING btree (id);


--
-- Name: benches benches_brands_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benches
    ADD CONSTRAINT benches_brands_id_fk FOREIGN KEY (id_brand) REFERENCES public.brands(id);


--
-- Name: plates plates_brands_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plates
    ADD CONSTRAINT plates_brands_id_fk FOREIGN KEY (id_brand) REFERENCES public.brands(id);


--
-- Name: stations stations_brands_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_brands_id_fk FOREIGN KEY (id_brand) REFERENCES public.brands(id);


--
-- Name: supplement sales supplement sales_supplements_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."supplement sales"
    ADD CONSTRAINT "supplement sales_supplements_id_fk" FOREIGN KEY (id_supplement) REFERENCES public.supplements(id);


--
-- Name: supplement sales supplement sales_trainees_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."supplement sales"
    ADD CONSTRAINT "supplement sales_trainees_id_fk" FOREIGN KEY (id_trainee) REFERENCES public.trainees(id);


--
-- Name: supplements supplements_brands_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplements
    ADD CONSTRAINT supplements_brands_id_fk FOREIGN KEY (id_brand) REFERENCES public.brands(id);


--
-- Name: trainees trainees_subscriptions_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainees
    ADD CONSTRAINT trainees_subscriptions_id_fk FOREIGN KEY (id_subscription) REFERENCES public.subscriptions(id);


--
-- Name: trainees trainees_trainers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainees
    ADD CONSTRAINT trainees_trainers_id_fk FOREIGN KEY (id_trainer) REFERENCES public.trainers(id);


--
-- PostgreSQL database dump complete
--

