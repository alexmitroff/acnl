--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO acnl;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO acnl;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO acnl;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO acnl;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO acnl;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO acnl;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO acnl;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO acnl;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO acnl;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO acnl;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO acnl;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO acnl;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: creatures.rarity; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public."creatures.rarity" (
    id integer NOT NULL,
    level integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    color character varying(100),
    CONSTRAINT "creatures.rarity_level_check" CHECK ((level >= 0))
);


ALTER TABLE public."creatures.rarity" OWNER TO acnl;

--
-- Name: creatures.rarity_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public."creatures.rarity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."creatures.rarity_id_seq" OWNER TO acnl;

--
-- Name: creatures.rarity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public."creatures.rarity_id_seq" OWNED BY public."creatures.rarity".id;


--
-- Name: creatures_bug; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.creatures_bug (
    creature_ptr_id integer NOT NULL,
    bug_type_id integer
);


ALTER TABLE public.creatures_bug OWNER TO acnl;

--
-- Name: creatures_bugtype; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.creatures_bugtype (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.creatures_bugtype OWNER TO acnl;

--
-- Name: creatures_bugtype_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.creatures_bugtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creatures_bugtype_id_seq OWNER TO acnl;

--
-- Name: creatures_bugtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.creatures_bugtype_id_seq OWNED BY public.creatures_bugtype.id;


--
-- Name: creatures_creature; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.creatures_creature (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    slug character varying(50) NOT NULL,
    "position" integer NOT NULL,
    picture character varying(100) NOT NULL,
    price integer NOT NULL,
    inhabit character varying(100) NOT NULL,
    is_island boolean NOT NULL,
    time_appearance time without time zone NOT NULL,
    time_disappearance time without time zone NOT NULL,
    polymorphic_ctype_id integer,
    rarity_id integer NOT NULL,
    section_id integer NOT NULL
);


ALTER TABLE public.creatures_creature OWNER TO acnl;

--
-- Name: creatures_creature_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.creatures_creature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creatures_creature_id_seq OWNER TO acnl;

--
-- Name: creatures_creature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.creatures_creature_id_seq OWNED BY public.creatures_creature.id;


--
-- Name: creatures_creature_months; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.creatures_creature_months (
    id integer NOT NULL,
    creature_id integer NOT NULL,
    month_id integer NOT NULL
);


ALTER TABLE public.creatures_creature_months OWNER TO acnl;

--
-- Name: creatures_creature_months_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.creatures_creature_months_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creatures_creature_months_id_seq OWNER TO acnl;

--
-- Name: creatures_creature_months_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.creatures_creature_months_id_seq OWNED BY public.creatures_creature_months.id;


--
-- Name: creatures_deepsea; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.creatures_deepsea (
    creature_ptr_id integer NOT NULL,
    shadow_id integer NOT NULL
);


ALTER TABLE public.creatures_deepsea OWNER TO acnl;

--
-- Name: creatures_fish; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.creatures_fish (
    creature_ptr_id integer NOT NULL,
    shadow_id integer NOT NULL
);


ALTER TABLE public.creatures_fish OWNER TO acnl;

--
-- Name: creatures_section; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.creatures_section (
    id integer NOT NULL,
    pos integer NOT NULL,
    show boolean NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    "desc" text NOT NULL
);


ALTER TABLE public.creatures_section OWNER TO acnl;

--
-- Name: creatures_section_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.creatures_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creatures_section_id_seq OWNER TO acnl;

--
-- Name: creatures_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.creatures_section_id_seq OWNED BY public.creatures_section.id;


--
-- Name: creatures_shadow; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.creatures_shadow (
    id integer NOT NULL,
    size integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    picture character varying(100),
    CONSTRAINT creatures_shadow_size_check CHECK ((size >= 0))
);


ALTER TABLE public.creatures_shadow OWNER TO acnl;

--
-- Name: creatures_shadow_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.creatures_shadow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creatures_shadow_id_seq OWNER TO acnl;

--
-- Name: creatures_shadow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.creatures_shadow_id_seq OWNED BY public.creatures_shadow.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO acnl;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO acnl;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO acnl;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO acnl;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO acnl;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO acnl;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO acnl;

--
-- Name: encyclopedia_month; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.encyclopedia_month (
    id integer NOT NULL,
    pos integer NOT NULL,
    name character varying(10) NOT NULL,
    season_id integer
);


ALTER TABLE public.encyclopedia_month OWNER TO acnl;

--
-- Name: encyclopedia_month_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.encyclopedia_month_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encyclopedia_month_id_seq OWNER TO acnl;

--
-- Name: encyclopedia_month_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.encyclopedia_month_id_seq OWNED BY public.encyclopedia_month.id;


--
-- Name: encyclopedia_season; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.encyclopedia_season (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    slug character varying(50) NOT NULL,
    color character varying(100)
);


ALTER TABLE public.encyclopedia_season OWNER TO acnl;

--
-- Name: encyclopedia_season_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.encyclopedia_season_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encyclopedia_season_id_seq OWNER TO acnl;

--
-- Name: encyclopedia_season_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.encyclopedia_season_id_seq OWNED BY public.encyclopedia_season.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: creatures.rarity id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public."creatures.rarity" ALTER COLUMN id SET DEFAULT nextval('public."creatures.rarity_id_seq"'::regclass);


--
-- Name: creatures_bugtype id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_bugtype ALTER COLUMN id SET DEFAULT nextval('public.creatures_bugtype_id_seq'::regclass);


--
-- Name: creatures_creature id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature ALTER COLUMN id SET DEFAULT nextval('public.creatures_creature_id_seq'::regclass);


--
-- Name: creatures_creature_months id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature_months ALTER COLUMN id SET DEFAULT nextval('public.creatures_creature_months_id_seq'::regclass);


--
-- Name: creatures_section id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_section ALTER COLUMN id SET DEFAULT nextval('public.creatures_section_id_seq'::regclass);


--
-- Name: creatures_shadow id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_shadow ALTER COLUMN id SET DEFAULT nextval('public.creatures_shadow_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: encyclopedia_month id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_month ALTER COLUMN id SET DEFAULT nextval('public.encyclopedia_month_id_seq'::regclass);


--
-- Name: encyclopedia_season id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_season ALTER COLUMN id SET DEFAULT nextval('public.encyclopedia_season_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add section	7	add_section
20	Can change section	7	change_section
21	Can delete section	7	delete_section
22	Can add month	8	add_month
23	Can change month	8	change_month
24	Can delete month	8	delete_month
25	Can add unit	9	add_unit
26	Can change unit	9	change_unit
27	Can delete unit	9	delete_unit
28	Can view log entry	1	view_logentry
29	Can view permission	2	view_permission
30	Can view group	3	view_group
31	Can view user	4	view_user
32	Can view content type	5	view_contenttype
33	Can view session	6	view_session
34	Can view month	8	view_month
35	Can view section	7	view_section
36	Can view unit	9	view_unit
37	Can add creature	10	add_creature
38	Can change creature	10	change_creature
39	Can delete creature	10	delete_creature
40	Can view creature	10	view_creature
41	Can add shadow	11	add_shadow
42	Can change shadow	11	change_shadow
43	Can delete shadow	11	delete_shadow
44	Can view shadow	11	view_shadow
45	Can add fish	12	add_fish
46	Can change fish	12	change_fish
47	Can delete fish	12	delete_fish
48	Can view fish	12	view_fish
49	Can add section	13	add_section
50	Can change section	13	change_section
51	Can delete section	13	delete_section
52	Can view section	13	view_section
53	Can add bug	14	add_bug
54	Can change bug	14	change_bug
55	Can delete bug	14	delete_bug
56	Can view bug	14	view_bug
57	Can add rarity level	15	add_rarity
58	Can change rarity level	15	change_rarity
59	Can delete rarity level	15	delete_rarity
60	Can view rarity level	15	view_rarity
61	Can add bug type	16	add_bugtype
62	Can change bug type	16	change_bugtype
63	Can delete bug type	16	delete_bugtype
64	Can view bug type	16	view_bugtype
65	Can add deep sea	17	add_deepsea
66	Can change deep sea	17	change_deepsea
67	Can delete deep sea	17	delete_deepsea
68	Can view deep sea	17	view_deepsea
69	Can add season	18	add_season
70	Can change season	18	change_season
71	Can delete season	18	delete_season
72	Can view season	18	view_season
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$15000$IyRRQlqYfPmF$5khZQhqo+TnNZSzo3FRue1koFHvQ9i0PqMhhMp+0P6E=	2015-12-02 19:10:34.966415+03	f	roscoe				t	t	2015-02-05 12:37:53+03
1	pbkdf2_sha256$15000$lP883YGbiqrU$Y4YtyB3qkZ6zrxihG+yi6EYnWCwe1EfxONs+b5ilykU=	2016-01-10 01:04:23.720705+03	t	aka_alarm			alarm-1@yandex.ru	t	t	2015-02-05 12:32:08.426821+03
3	pbkdf2_sha256$150000$YFFPijRPyz6g$P4FQ71LSS9tBt/iCUYIi0Rcyvbhe7yR6y14RgAEfn6k=	2019-09-26 13:03:45.968109+03	t	alex				t	t	2019-09-26 13:03:40.572887+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
7	2	19
8	2	20
9	2	21
10	2	25
11	2	26
12	2	27
\.


--
-- Data for Name: creatures.rarity; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public."creatures.rarity" (id, level, name, slug, color) FROM stdin;
1	1	Very Common	very-common	0,0%,62%
2	2	Common	common	132,52%,38%
3	3	Rare	rare	51,100%,48%
4	4	Vary Rare	vary-rare	5,80%,57%
\.


--
-- Data for Name: creatures_bug; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.creatures_bug (creature_ptr_id, bug_type_id) FROM stdin;
1	\N
2	\N
3	\N
4	\N
5	\N
6	\N
7	\N
8	\N
9	\N
10	\N
11	\N
12	\N
13	\N
14	\N
15	\N
17	\N
18	\N
19	\N
20	\N
21	\N
22	\N
23	\N
24	\N
25	\N
26	\N
27	\N
28	\N
29	\N
30	\N
31	\N
32	\N
33	\N
34	\N
35	\N
36	\N
37	\N
38	\N
39	\N
40	\N
41	\N
42	\N
43	\N
44	\N
45	\N
46	\N
47	\N
48	\N
49	\N
50	\N
51	\N
52	\N
53	\N
54	\N
55	\N
56	\N
57	\N
58	\N
59	\N
60	\N
61	\N
62	\N
63	\N
64	\N
65	\N
66	\N
67	\N
68	\N
69	\N
70	\N
71	\N
72	\N
16	\N
\.


--
-- Data for Name: creatures_bugtype; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.creatures_bugtype (id, slug, name) FROM stdin;
\.


--
-- Data for Name: creatures_creature; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.creatures_creature (id, name, description, slug, "position", picture, price, inhabit, is_island, time_appearance, time_disappearance, polymorphic_ctype_id, rarity_id, section_id) FROM stdin;
1	Common Butterfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	common-butterfly	1	units/Common_Butterfly_nl.png	90	Flying near flowers 	f	04:00:00	19:00:00	14	2	1
2	Yellow Butterfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	yellow-butterfly	2	units/Yellow_Butterfly_nl.png	90	Flying near flowers 	f	06:00:00	16:00:00	14	2	1
3	Tiger Butterfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	tiger-butterfly	3	units/Tiger_Butterfly_nl.png	160	Flying near flowers 	f	08:00:00	19:00:00	14	3	1
4	Peacock Butterfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	peacock-butterfly	4	units/peacock_butterfly_nl.png	220	Flying near flowers	f	04:00:00	19:00:00	14	3	1
5	Monarch Butterfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	monarch-butterfly	5	units/Monarch_butterfly_nl.png	140	Flying 	f	09:00:00	17:00:00	14	1	1
6	Emperor Butterfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	emperor-butterfly	6	units/emperor.jpg	2500	Flying	f	20:00:00	06:00:00	14	3	1
7	Agrias Butterfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	agrias-butterfly	7	units/arigas.jpg	3000	Flying	f	08:00:00	17:00:00	14	3	1
8	Raja Brooke Butterfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	raja-brooke-butterfly	8	units/raja.jpg	2500	Flying	f	08:00:00	17:00:00	14	3	1
9	Birdwing Butterfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	birdwing-butterfly	9	units/birdwing.jpg	4000	Flying	f	08:00:00	17:00:00	14	3	1
10	Moth	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	moth	10	units/moth.jpg	60	Near lights	f	19:00:00	04:00:00	14	2	1
11	Oak Silk Moth	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	oak-silk-moth	11	units/osmoth.jpg	1200	On trees	f	19:00:00	04:00:00	14	3	1
12	Honeybee	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	honeybee	12	units/honeybee.jpg	100	Near flowers	f	08:00:00	17:00:00	14	1	1
13	Bee	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	bee	13	units/bee.jpg	2500	When trees are shaken	f	00:00:00	00:00:00	14	1	1
83	Crawfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	crawfish	111	units/crawfish.jpg	200	Pond 	f	00:00:00	00:00:00	12	2	2
14	Long-headed Locust	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	long-headed-locust	14	units/llocust.jpg	200	On the ground	f	08:00:00	19:00:00	14	2	1
15	Migratory Locust	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	migratory-locust	15	units/mlocust.jpg	600	On the ground	f	08:00:00	19:00:00	14	3	1
17	Mantis	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	mantis	17	units/mantis.jpg	430	On flowers	f	08:00:00	17:00:00	14	2	1
18	Orchid Mantis	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	orchid-mantis	18	units/omantis.jpg	2400	On white flowers	f	08:00:00	17:00:00	14	3	1
19	Large Brown Cicada	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	large-brown-cicada	19	units/lbcicada.jpg	200	On trees	f	08:00:00	17:00:00	14	1	1
20	Robust Cicada	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	robust-cicada	20	units/rcicada.jpg	300	On trees	f	08:00:00	17:00:00	14	1	1
21	Giant Cicada	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	giant-cicada	21	units/gcicada.jpg	500	On trees	f	08:00:00	17:00:00	14	3	1
22	Walker Cada	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	walker-cada	22	units/wcicada.jpg	400	On trees	f	08:00:00	17:00:00	14	3	1
23	Evening Cicada	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	evening-cicada	23	units/ecicada.jpg	550	On trees	f	16:00:00	19:00:00	14	1	1
24	Cicada Shell	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	cicada-shell	24	units/cshell.jpg	100	On trees	f	00:00:00	00:00:00	14	2	1
25	Lantern Fly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	lantern-fly	25	units/lfly.jpg	1800	On trees	f	16:00:00	08:00:00	14	3	1
26	Red Dragonfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	red-dragonfly	26	units/rdragon.jpg	80	Flying	f	08:00:00	19:00:00	14	1	1
84	Soft-Shelled Turtle	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	soft-shelled-turtle	112	units/softshelledturtle.jpg	3750	River	f	16:00:00	09:00:00	12	3	2
27	Darner Dragonfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	darner-dragonfly	27	units/ddragon.jpg	200	Flying	f	08:00:00	17:00:00	14	2	1
28	Banded Dragonfly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	banded-dragonfly	28	units/bdragon.jpg	4500	Flying	f	08:00:00	17:00:00	14	3	1
29	Giant Petaltail	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	giant-petaltail	29	units/gpetaltail.jpg	8000	Flying	f	16:00:00	19:00:00	14	4	1
30	Ant	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	ant	30	units/ant.jpg	80	Dropped Candy, Spoiled Turnips, Rotten Fruit 	f	00:00:00	00:00:00	14	2	1
31	Pondskater	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	pondskater	31	units/pondskater.jpg	130	On water	f	08:00:00	19:00:00	14	3	1
32	Diving Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	diving-beetle	32	units/dbeetle.jpg	800	In freshwater	f	08:00:00	17:00:00	14	3	1
33	Stinkbug	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	stinkbug	33	units/stinkbug.jpg	120	On trees	f	00:00:00	00:00:00	14	1	1
34	Snail	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	snail	34	units/snail.jpg	250	When raining. On flowers, on flowering bushes (Hibiscus Bushes).	f	00:00:00	00:00:00	14	3	1
35	Cricket	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	cricket	35	units/cricket.jpg	130	Ground	f	17:00:00	08:00:00	14	2	1
36	Bell Cricket	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	bell-cricket	36	units/bcricket.jpg	430	On the ground	f	17:00:00	05:00:00	14	3	1
37	Grasshopper	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	grasshopper	37	units/grasshopper.jpg	400	On the ground	f	08:00:00	17:00:00	14	2	1
38	Mole Cricket	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	mole-cricket	38	units/mole.jpg	280	Underground	f	00:00:00	00:00:00	14	3	1
39	Walking Leaf	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	walking-leaf	39	units/wleaf.jpg	600	On the ground	f	08:00:00	17:00:00	14	3	1
85	Tadpole	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	tadpole	113	units/tadpole.jpg	100	Pond	f	00:00:00	00:00:00	12	3	2
40	Walkingstick	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	walkingstick	40	units/wstick.jpg	600	On trees	f	04:00:00	19:00:00	14	1	1
41	Bagworm	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	bagworm	41	units/bugworm.jpg	300	When trees are shaken	f	00:00:00	00:00:00	14	3	1
42	Spotted Ladybug	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	spotted-ladybug	42	units/ladybug.jpg	200	On flowers	f	08:00:00	17:00:00	14	2	1
43	Violin Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	violin-beetle	43	units/violin.jpg	260	On tree stumps	f	04:00:00	17:00:00	14	3	1
44	Longhorn Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	longhorn-beetle	44	units/longhorn.jpg	260	On tree stumps	f	23:00:00	19:00:00	14	3	1
45	Tiger Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	tiger-beetle	45	units/tiger.jpg	1500	On the ground	f	08:00:00	19:00:00	14	1	1
46	Dung Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	dung-beetle	46	units/dung.jpg	800	Rolling snowballs	f	17:00:00	08:00:00	14	2	1
47	Wharf Roach	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	wharf-roach	47	units/roach.jpg	200	On the beach	f	00:00:00	00:00:00	14	2	1
48	Hermit Crab	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	hermit-crab	48	units/crab.jpg	1000	On the beach (Tortimer Island)	f	00:00:00	00:00:00	14	3	1
49	Firefly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	firefly	49	units/firefly.jpg	300	Near freshwater	f	19:00:00	04:00:00	14	1	1
50	Fruit Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	fruit-beetle	50	units/fruit.jpg	100	On trees	f	00:00:00	00:00:00	14	1	1
51	Scarab Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	scarab-beetle	51	units/scarab.jpg	6000	On trees	t	23:00:00	08:00:00	14	3	1
52	Jewel Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	jewel-beetle	52	units/jewel.jpg	2400	On trees	f	08:00:00	16:00:00	14	3	1
86	Frog	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	frog	114	units/frog.jpg	120	Pond 	f	00:00:00	00:00:00	12	2	2
53	Miyama Stag Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	miyama-stag-beetle	53	units/mstag.jpg	1000	On trees	t	00:00:00	00:00:00	14	2	1
54	Saw Stag Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	saw-stag-beetle	54	units/sstag.jpg	2000	On trees	t	00:00:00	00:00:00	14	3	1
55	Giant Stag Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	giant-stag-beetle	55	units/giantstagbeetle.jpg	10000	On trees	t	23:00:00	08:00:00	14	3	1
56	Rainbow Stag Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	rainbow-stag-beetle	56	units/rstag.jpg	10000	On trees	t	17:00:00	08:00:00	14	3	1
57	Cyclommatus	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	cyclommatus	57	units/cstag.jpg	8000	On palm trees	t	23:00:00	08:00:00	14	2	1
58	Golden Stag	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	golden-stag	58	units/gstag.jpg	12000	On palm trees	t	23:00:00	08:00:00	14	4	1
59	Dynastid Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	dynastid-beetle	59	units/hd.jpg	1350	On trees	t	17:00:00	08:00:00	14	3	1
60	Atlas Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	atlas-beetle	60	units/ha.jpg	8000	On palm trees	t	23:00:00	08:00:00	14	3	1
61	Elephant Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	elephant-beetle	61	units/he.jpg	8000	On palm trees	t	23:00:00	08:00:00	14	4	1
62	Hercules Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	hercules-beetle	62	units/hh.jpg	12000	On palm trees	t	23:00:00	08:00:00	14	4	1
63	Goliath Beetle	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	goliath-beetle	63	units/goliah.jpg	6000	On palm trees	t	23:00:00	08:00:00	14	3	1
64	Flea	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	flea	64	units/flea.jpg	70	On villagers	f	00:00:00	00:00:00	14	3	1
65	Pill Bug	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	pill-bug	65	units/pillbug.jpg	250	Under rocks	f	00:00:00	00:00:00	14	3	1
87	Freshwater Goby	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	freshwater-goby	115	units/freshwatergoby.jpg	300	River	f	16:00:00	09:00:00	12	3	2
66	Mosquito	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	mosquito	66	units/mosquito.jpg	130	Flying	f	17:00:00	04:00:00	14	2	1
67	Fly	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	fly	67	units/fly.jpg	80	Rafflesia, Trash, and Spoiled turnips 	f	00:00:00	00:00:00	14	2	1
68	House Centipede	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	house-centipede	68	units/hc.jpg	250	Under rocks	f	19:00:00	08:00:00	14	2	1
69	Centipede	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	centipede	69	units/centipade.jpg	300	Under rocks	f	16:00:00	23:00:00	14	3	1
70	Spider	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	spider	70	units/spider.jpg	300	When trees are shaken	f	23:00:00	16:00:00	14	1	1
71	Tarantula	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	tarantula	71	units/tarantula.jpg	8000	On the ground	f	23:00:00	04:00:00	14	4	1
72	Scorpion	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 	scorpion	72	units/scorpion.jpg	8000	On the ground	f	19:00:00	04:00:00	14	3	1
73	Bitterling	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	bitterling	101	units/bitterling.jpg	900	River	f	00:00:00	00:00:00	12	1	2
74	Pale Chub	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	pale-chub	102	units/palechub.jpg	200	River	f	09:00:00	16:00:00	12	3	2
75	Crucian Carp	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	crucian-carp	103	units/cruciancarp.jpg	120	River	f	00:00:00	00:00:00	12	1	2
76	Dace	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	dace	104	units/dace.jpg	200	River	f	16:00:00	09:00:00	12	1	2
77	Barbel Steed	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	barbel-steed	105	units/barbelsteed.jpg	200	River	f	00:00:00	00:00:00	12	2	2
78	Carp	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	carp	106	units/carp.jpg	300	River	f	00:00:00	00:00:00	12	1	2
79	Koi	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	koi	107	units/koi.jpg	4000	River	f	16:00:00	09:00:00	12	3	2
80	Goldfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	goldfish	108	units/goldfish.jpg	1300	River	f	00:00:00	00:00:00	12	3	2
81	Popeyed Goldfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	popeyed-goldfish	109	units/popeyedgoldfish.jpg	1300	River	f	09:00:00	16:00:00	12	3	2
82	Killifish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	killifish	110	units/killifish.jpg	300	Pond 	f	00:00:00	00:00:00	12	3	2
88	Loach	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	loach	116	units/loach.jpg	300	River	f	00:00:00	00:00:00	12	2	2
89	Catfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	catfish	117	units/catfish.jpg	800	Lake	f	16:00:00	09:00:00	12	1	2
90	Eel	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	eel	118	units/eel.jpg	2000	River 	f	16:00:00	09:00:00	12	1	2
91	Giant Snakehead	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	giant-snakehead	119	units/giantsnakehead.jpg	5500	Lake	f	09:00:00	16:00:00	12	3	2
92	Bluegill	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	bluegill	120	units/bluegill.jpg	120	River 	f	09:00:00	16:00:00	12	3	2
93	Yellow Perch	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	yellow-perch	121	units/yellowperch.jpg	240	River	f	00:00:00	00:00:00	12	1	2
94	Black Bass	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	black-bass	122	units/blackbass.jpg	300	River	f	00:00:00	00:00:00	12	2	2
95	Pike	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	pike	123	units/pike.jpg	1800	River	f	04:00:00	21:00:00	12	3	2
96	Pond Smelt	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	pond-smelt	124	units/pondsmelt.jpg	300	River	f	00:00:00	00:00:00	12	2	2
97	Sweetfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	sweetfish	125	units/sweetfish.jpg	900	River	f	00:00:00	00:00:00	12	1	2
98	Cherry Salmon	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	cherry-salmon	126	units/cherrysalmon.jpg	1000	River	f	00:00:00	00:00:00	12	3	2
99	Char	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	char	127	units/char.jpg	3800	Waterfall 	f	16:00:00	21:00:00	12	3	2
100	Rainbow Trout	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	rainbow-trout	128	units/rainbowtrout.jpg	800	River	f	00:00:00	00:00:00	12	1	2
101	Stringfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	stringfish	129	units/stringfish.jpg	15000	River	f	16:00:00	09:00:00	12	4	2
102	Salmon	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	salmon	130	units/salmon.jpg	700	Waterfall	f	00:00:00	00:00:00	12	2	2
103	King Salmon	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	king-salmon	131	units/kingsalmon.jpg	1800	Waterfall	f	00:00:00	00:00:00	12	3	2
104	Mitten Crab	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	mitten-crab	132	units/mittencrab.jpg	2000	River	f	16:00:00	09:00:00	12	3	2
105	Guppy	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	guppy	133	units/guppy.jpg	100	River	f	09:00:00	16:00:00	12	3	2
106	Nibble Fish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	nibble-fish	134	units/nibblefish.jpg	1500	River	f	09:00:00	16:00:00	12	3	2
107	Angelfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	angelfish	135	units/angelfish.jpg	3000	River	f	16:00:00	09:00:00	12	3	2
108	Neon Tetra	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	neon-tetra	136	units/neontetra.jpg	500	River	f	09:00:00	16:00:00	12	3	2
109	Piranha	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	piranha	137	units/piranha.jpg	2500	River	f	09:00:00	04:00:00	12	3	2
110	Arowana	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	arowana	138	units/arowana.jpg	10000	River	f	16:00:00	09:00:00	12	3	2
111	Dorado	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	dorado	139	units/dorado.jpg	15000	River	f	16:00:00	09:00:00	12	4	2
112	Gar	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	gar	140	units/gar.jpg	6000	Lake	f	16:00:00	09:00:00	12	3	2
113	Arapaima	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	arapaima	141	units/arapaima.jpg	10000	River	f	16:00:00	09:00:00	12	3	2
114	Saddled Bichir	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	saddled-bichir	141	units/saddledbichir.jpg	4000	River	f	21:00:00	04:00:00	12	3	2
115	Sea Butterfly	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	sea-butterfly	143	units/seabutterfly.jpg	1000	Ocean	f	00:00:00	00:00:00	12	3	2
116	Seahorse	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	seahorse	144	units/seahorse.jpg	1100	Ocean	t	00:00:00	00:00:00	12	3	2
117	Clownfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	clownfish	145	units/clownfish.jpg	650	Ocean	t	00:00:00	00:00:00	12	3	2
118	Surgeonfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	surgeonfish	146	units/surgeonfish.jpg	1000	Ocean	t	00:00:00	00:00:00	12	3	2
119	Butterfly Fish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	butterfly-fish	147	units/butterflyfish.jpg	1000	Ocean	f	00:00:00	00:00:00	12	3	2
120	Napoleonfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	napoleonfish	148	units/napoleon.jpg	10000	Ocean	t	04:00:00	21:00:00	12	3	2
121	Zebra Turkeyfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	zebra-turkeyfish	149	units/zebraturkeyfish.jpg	400	Ocean	t	00:00:00	00:00:00	12	1	2
122	Blowfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	blowfish	150	units/blowfish_7ohU3Lc.jpg	125	Ocean	f	21:00:00	04:00:00	12	3	2
123	Puffer Fish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	puffer-fish	151	units/pufferfish.jpg	240	Ocean	f	21:00:00	04:00:00	12	3	2
124	Horse Mackerel	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	horse-mackerel	152	units/horsemackerel.jpg	150	Ocean	t	00:00:00	00:00:00	12	2	2
125	Barred Knifejaw	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	barred-knifejaw	153	units/barredknifejaw.jpg	5000	Ocean	t	00:00:00	00:00:00	12	3	2
126	Sea Bass	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	sea-bass	154	units/seabass.jpg	200	Ocean	t	00:00:00	00:00:00	12	1	2
127	Red Snapper	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	red-snapper	155	units/redsnapper.jpg	3000	Ocean	t	00:00:00	00:00:00	12	3	2
128	Dab	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	dab	156	units/dab.jpg	300	Ocean	f	00:00:00	00:00:00	12	1	2
152	Ear Shell	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	ear-shell	208	units/earshell.jpg	300	Ocean	t	16:00:00	09:00:00	17	3	3
129	Olive Flounder	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	olive-flounder	157	units/oliveflounder.jpg	800	Ocean	f	00:00:00	00:00:00	12	3	2
130	Squid	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	squid	158	units/squid.jpg	400	Ocean	t	00:00:00	00:00:00	12	3	2
131	Moray Eel	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	moray-eel	159	units/morayeel.jpg	2000	Ocean	t	00:00:00	00:00:00	12	3	2
132	Ribbon Eel	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	ribbon-eel	160	units/ribboneel.jpg	600	Island	t	00:00:00	00:00:00	12	3	2
133	Football Fish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	football-fish	161	units/footballfish.jpg	2500	Ocean	f	16:00:00	09:00:00	12	3	2
134	Tuna	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	tuna	162	units/tuna.jpg	7000	Ocean	f	00:00:00	00:00:00	12	3	2
135	Blue Marlin	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	blue-marlin	163	units/bluemarlin.jpg	10000	Ocean	t	00:00:00	00:00:00	12	3	2
136	Giant Trevally	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	giant-trevally	164	units/gianttrevally.jpg	4500	Island	t	00:00:00	00:00:00	12	3	2
137	Ray	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	ray	165	units/ray.jpg	3000	Ocean	t	04:00:00	21:00:00	12	3	2
138	Ocean Sunfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	ocean-sunfish	166	units/oceansunfish.jpg	4000	Ocean	t	04:00:00	21:00:00	12	3	2
139	Hammerhead Shark	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	hammerhead-shark	167	units/hammerheadshark.jpg	8000	Ocean	t	16:00:00	09:00:00	12	3	2
140	Shark	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	shark	168	units/shark.jpg	15000	Ocean	t	16:00:00	09:00:00	12	3	2
141	Saw Shark	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	saw-shark	169	units/sawshark.jpg	12000	Ocean	t	16:00:00	09:00:00	12	3	2
142	Whale Shark	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	whale-shark	170	units/whaleshark.png	13000	Island	t	00:00:00	00:00:00	12	3	2
143	Oarfish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	oarfish	171	units/oarfish.png	9000	Ocean	f	00:00:00	00:00:00	12	3	2
144	Coelacanth	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.	coelacanth	172	units/coelacanth.jpg	15000	Ocean (Rain/Snow)	t	16:00:00	09:00:00	12	4	2
145	Seaweed	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	seaweed	201	units/seaweed.jpg	200	Ocean	t	00:00:00	00:00:00	17	2	3
146	Sea Grapes	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	sea-grapes	202	units/seagrapes.jpg	100	Ocean	t	00:00:00	00:00:00	17	2	3
147	Sea Urchin	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	sea-urchin	203	units/seaurchin.jpg	800	Ocean	t	00:00:00	00:00:00	17	2	3
148	Acorn Barnacle	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	acorn-barnacle	204	units/acornbarnacle.jpg	200	Ocean	t	00:00:00	00:00:00	17	2	3
149	Oyster	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	oyster	205	units/oyster.jpg	400	Ocean	f	00:00:00	00:00:00	17	3	3
150	Turban Shell	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	turban-shell	206	units/turbanshell.png	300	Ocean	f	16:00:00	09:00:00	17	3	3
151	Abalone	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	abalone	207	units/abalone.jpg	100	Ocean	t	16:00:00	09:00:00	17	3	3
153	Clam	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	clam	209	units/clam.jpg	400	Ocean	f	00:00:00	00:00:00	17	3	3
154	Pearl Oyster	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	pearl-oyster	210	units/pearloyster.jpg	1600	Ocean	f	00:00:00	00:00:00	17	3	3
155	Scallop	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	scallop	211	units/scallop.jpg	1000	Ocean	t	00:00:00	00:00:00	17	4	3
156	Sea Anemone	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	sea-anemone	212	units/seaanemone.jpg	100	Ocean	t	00:00:00	00:00:00	17	2	3
157	Sea Star	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	sea-star	213	units/seastar.jpg	100	Ocean	t	00:00:00	00:00:00	17	2	3
158	Sea Cucumber	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	sea-cucumber	214	units/seacucumber.jpg	150	Ocean	f	00:00:00	00:00:00	17	2	3
159	Sea Slug	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	sea-slug	215	units/seaslug.jpg	200	Ocean	t	00:00:00	00:00:00	17	2	3
160	Flatworm	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	flatworm	216	units/flatworm.jpg	200	Ocean	t	16:00:00	09:00:00	17	3	3
161	Mantis Shrimp	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	mantis-shrimp	217	units/mantisshrimp.jpg	1250	Ocean	t	16:00:00	09:00:00	17	3	3
162	Sweet Shrimp	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	sweet-shrimp	218	units/sweetshrimp.jpg	650	Ocean	f	16:00:00	09:00:00	17	3	3
163	Tiger Prawn	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	tiger-prawn	219	units/tigerprawn.jpg	1600	Ocean	t	00:00:00	00:00:00	17	3	3
164	Spiny Lobster	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	spiny-lobster	220	units/spinylobster.jpg	3000	Ocean	f	21:00:00	04:00:00	17	4	3
165	Lobster	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	lobster	221	units/lobster.jpg	2500	Ocean	t	00:00:00	00:00:00	17	3	3
166	Snow Crab	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	snow-crab	222	units/snowcrab.jpg	4000	Ocean	f	00:00:00	00:00:00	17	3	3
167	Horsehair Crab	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	horsehair-crab	223	units/horsehaircrab.jpg	4000	Ocean	f	00:00:00	00:00:00	17	3	3
168	Red King Crab	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	red-king-crab	224	units/redkingcrab.jpg	6000	Ocean	f	00:00:00	00:00:00	17	3	3
169	Spider Crab	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	spider-crab	225	units/spidercrab.jpg	10000	Ocean	f	00:00:00	00:00:00	17	4	3
170	Octopus	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	octopus	226	units/octopus.jpg	1000	Ocean	t	00:00:00	00:00:00	17	3	3
171	Spotted Garden Eel	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	spotted-garden-eel	227	units/spottedgardeneel.jpg	600	Ocean	t	00:00:00	00:00:00	17	2	3
172	Chambered Nautilus	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	chambered-nautilus	228	units/chamberednautilus.jpg	900	Ocean	t	00:00:00	00:00:00	17	3	3
173	Horseshoe Crab	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	horseshoe-crab	229	units/horseshoecrab.jpg	1500	Ocean	f	21:00:00	04:00:00	17	3	3
174	Giant Isopod	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 	giant-isopod	230	units/giantisopod.jpg	9000	Ocean	t	00:00:00	00:00:00	17	3	3
16	Rice Grass­hopper	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter.	rice-grasshopper	16	units/rhopper.jpg	400	On the ground	f	08:00:00	19:00:00	14	3	1
\.


--
-- Data for Name: creatures_creature_months; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.creatures_creature_months (id, creature_id, month_id) FROM stdin;
1	1	3
2	1	4
3	1	5
4	1	6
5	1	9
6	2	3
7	2	4
8	2	5
9	2	6
10	2	9
11	3	3
12	3	4
13	3	5
14	3	6
15	3	7
16	3	8
17	3	9
18	4	3
19	4	4
20	4	5
21	4	6
22	4	7
23	4	8
24	4	9
25	5	9
26	5	10
27	5	11
28	6	8
29	6	9
30	6	6
31	6	7
32	7	8
33	7	9
34	7	6
35	7	7
36	8	5
37	8	6
38	8	7
39	8	8
40	8	9
41	9	3
42	9	4
43	9	5
44	9	6
45	9	7
46	9	8
47	9	9
48	10	5
49	10	6
50	10	7
51	10	8
52	10	9
53	11	8
54	11	9
55	11	6
56	11	7
57	12	3
58	12	4
59	12	5
60	12	6
61	12	7
62	13	1
63	13	2
64	13	3
65	13	4
66	13	5
67	13	6
68	13	7
69	13	8
70	13	9
71	13	10
72	13	11
73	13	12
74	14	5
75	14	6
76	14	7
77	14	8
78	14	9
79	14	10
80	14	11
81	15	8
82	15	9
83	15	10
84	15	11
85	16	8
86	16	9
87	17	4
88	17	5
89	17	6
90	17	7
91	17	8
92	17	9
93	17	10
94	17	11
95	18	4
96	18	5
97	18	6
98	18	7
99	18	8
100	18	9
101	18	10
102	18	11
103	19	8
104	19	7
105	20	8
106	20	7
107	21	8
108	21	7
109	22	8
110	22	9
111	22	7
112	23	8
113	23	7
114	24	8
115	24	7
116	25	8
117	25	9
118	25	6
119	25	7
120	26	9
121	26	10
122	26	11
123	27	8
124	27	6
125	27	7
126	28	8
127	28	7
128	29	8
129	29	9
130	29	10
131	30	1
132	30	2
133	30	3
134	30	4
135	30	5
136	30	6
137	30	7
138	30	8
139	30	9
140	30	10
141	30	11
142	30	12
143	31	5
144	31	6
145	31	7
146	31	8
147	31	9
148	32	5
149	32	6
150	32	7
151	32	8
152	32	9
153	33	4
154	33	5
155	33	6
156	33	7
157	33	8
158	33	9
159	33	10
160	34	4
161	34	5
162	34	6
163	34	7
164	34	8
165	34	9
166	35	9
167	35	10
168	35	11
169	36	9
170	36	10
171	37	8
172	37	9
173	38	1
174	38	2
175	38	3
176	38	4
177	38	5
178	38	11
179	38	12
180	39	8
181	39	9
182	39	7
183	40	7
184	40	8
185	40	9
186	40	10
187	40	11
188	41	1
189	41	2
190	41	10
191	41	11
192	41	12
193	42	3
194	42	4
195	42	5
196	42	6
197	42	8
198	42	9
199	42	10
200	43	9
201	43	10
202	43	11
203	44	8
204	44	6
205	44	7
206	45	3
207	45	4
208	45	5
209	45	6
210	45	7
211	45	8
212	45	9
213	45	10
214	46	1
215	46	2
216	46	12
217	47	1
218	47	2
219	47	3
220	47	4
221	47	5
222	47	6
223	47	7
224	47	8
225	47	9
226	47	10
227	47	11
228	47	12
229	48	1
230	48	2
231	48	3
232	48	4
233	48	5
234	48	6
235	48	7
236	48	8
237	48	9
238	48	10
239	48	11
240	48	12
241	49	6
242	50	8
243	50	9
244	50	7
245	51	8
246	51	7
247	52	8
248	52	7
249	53	8
250	53	7
251	54	8
252	54	7
253	55	8
254	55	7
255	56	8
256	56	9
257	56	6
258	56	7
259	57	8
260	57	7
261	58	8
262	58	7
263	59	8
264	59	7
265	60	8
266	60	6
267	60	7
268	61	8
269	61	6
270	61	7
271	62	8
272	62	7
273	63	8
274	63	9
275	63	6
276	63	7
277	64	3
278	64	4
279	64	5
280	64	6
281	64	7
282	64	8
283	64	9
284	64	10
285	64	11
286	65	1
287	65	2
288	65	3
289	65	4
290	65	5
291	65	6
292	65	7
293	65	8
294	65	9
295	65	10
296	65	11
297	65	12
298	66	8
299	66	9
300	66	6
301	66	7
302	67	1
303	67	2
304	67	3
305	67	4
306	67	5
307	67	6
308	67	7
309	67	8
310	67	9
311	67	10
312	67	11
313	67	12
314	68	8
315	68	9
316	68	10
317	69	1
318	69	2
319	69	6
320	69	7
321	69	8
322	69	9
323	69	10
324	69	11
325	69	12
326	70	3
327	70	4
328	70	5
329	70	6
330	70	7
331	70	8
332	70	9
333	70	10
334	71	8
335	71	6
336	71	7
337	72	8
338	72	9
339	72	7
340	73	1
341	73	2
342	73	11
343	73	12
344	74	1
345	74	2
346	74	3
347	74	4
348	74	5
349	74	6
350	74	7
351	74	8
352	74	9
353	74	10
354	74	11
355	74	12
356	75	1
357	75	2
358	75	3
359	75	4
360	75	5
361	75	6
362	75	7
363	75	8
364	75	9
365	75	10
366	75	11
367	75	12
368	76	1
369	76	2
370	76	3
371	76	4
372	76	5
373	76	6
374	76	7
375	76	8
376	76	9
377	76	10
378	76	11
379	76	12
380	77	1
381	77	2
382	77	3
383	77	4
384	77	5
385	77	6
386	77	7
387	77	8
388	77	9
389	77	10
390	77	11
391	77	12
392	78	1
393	78	2
394	78	3
395	78	4
396	78	5
397	78	6
398	78	7
399	78	8
400	78	9
401	78	10
402	78	11
403	78	12
404	79	1
405	79	2
406	79	3
407	79	4
408	79	5
409	79	6
410	79	7
411	79	8
412	79	9
413	79	10
414	79	11
415	79	12
416	80	1
417	80	2
418	80	3
419	80	4
420	80	5
421	80	6
422	80	7
423	80	8
424	80	9
425	80	10
426	80	11
427	80	12
428	81	1
429	81	2
430	81	3
431	81	4
432	81	5
433	81	6
434	81	7
435	81	8
436	81	9
437	81	10
438	81	11
439	81	12
440	82	4
441	82	5
442	82	6
443	82	7
444	82	8
445	83	4
446	83	5
447	83	6
448	83	7
449	83	8
450	83	9
451	84	8
452	84	9
453	84	6
454	84	7
455	85	3
456	85	4
457	85	5
458	85	6
459	85	7
460	86	8
461	86	5
462	86	6
463	86	7
464	87	1
465	87	2
466	87	3
467	87	4
468	87	5
469	87	6
470	87	7
471	87	8
472	87	9
473	87	10
474	87	11
475	87	12
476	88	3
477	88	4
478	88	5
479	89	5
480	89	6
481	89	7
482	89	8
483	89	9
484	89	10
485	90	8
486	90	9
487	90	6
488	90	7
489	91	8
490	91	6
491	91	7
492	92	1
493	92	2
494	92	3
495	92	4
496	92	5
497	92	6
498	92	7
499	92	8
500	92	9
501	92	10
502	92	11
503	92	12
504	93	1
505	93	2
506	93	3
507	93	10
508	93	11
509	93	12
510	94	1
511	94	2
512	94	3
513	94	4
514	94	5
515	94	6
516	94	7
517	94	8
518	94	9
519	94	10
520	94	11
521	94	12
522	95	9
523	95	10
524	95	11
525	95	12
526	96	1
527	96	2
528	96	12
529	97	8
530	97	9
531	97	10
532	97	7
533	98	3
534	98	4
535	98	5
536	98	6
537	98	9
538	98	10
539	98	11
540	99	3
541	99	4
542	99	5
543	99	6
544	99	9
545	99	10
546	99	11
547	100	3
548	100	4
549	100	5
550	100	6
551	100	9
552	100	10
553	100	11
554	101	1
555	101	2
556	101	12
557	102	9
558	103	9
559	104	9
560	104	10
561	104	11
562	105	4
563	105	5
564	105	6
565	105	7
566	105	8
567	105	9
568	105	10
569	105	11
570	106	5
571	106	6
572	106	7
573	106	8
574	106	9
575	107	5
576	107	6
577	107	7
578	107	8
579	107	9
580	107	10
581	108	4
582	108	5
583	108	6
584	108	7
585	108	8
586	108	9
587	108	10
588	109	8
589	109	9
590	109	6
591	109	7
592	110	8
593	110	9
594	110	6
595	110	7
596	111	8
597	111	9
598	111	6
599	111	7
600	112	8
601	112	9
602	112	6
603	112	7
604	113	8
605	113	9
606	113	7
607	114	8
608	114	9
609	114	6
610	114	7
611	115	1
612	115	2
613	115	12
614	116	4
615	116	5
616	116	6
617	116	7
618	116	8
619	116	9
620	116	10
621	116	11
622	117	4
623	117	5
624	117	6
625	117	7
626	117	8
627	117	9
628	118	4
629	118	5
630	118	6
631	118	7
632	118	8
633	118	9
634	118	12
635	119	4
636	119	5
637	119	6
638	119	7
639	119	8
640	119	9
641	120	8
642	120	7
643	121	4
644	121	5
645	121	6
646	121	7
647	121	8
648	121	9
649	121	10
650	121	11
651	122	1
652	122	2
653	122	11
654	122	12
655	123	8
656	123	9
657	123	6
658	123	7
659	124	1
660	124	2
661	124	3
662	124	4
663	124	5
664	124	6
665	124	7
666	124	8
667	124	9
668	124	10
669	124	11
670	124	12
671	125	3
672	125	4
673	125	5
674	125	6
675	125	7
676	125	8
677	125	9
678	125	10
679	125	11
680	126	1
681	126	2
682	126	3
683	126	4
684	126	5
685	126	6
686	126	7
687	126	8
688	126	9
689	126	10
690	126	11
691	126	12
692	127	1
693	127	2
694	127	3
695	127	4
696	127	5
697	127	6
698	127	7
699	127	8
700	127	9
701	127	10
702	127	11
703	127	12
704	128	1
705	128	2
706	128	3
707	128	4
708	128	10
709	128	11
710	128	12
711	129	1
712	129	2
713	129	3
714	129	4
715	129	5
716	129	6
717	129	7
718	129	8
719	129	9
720	129	10
721	129	11
722	129	12
723	130	1
724	130	2
725	130	3
726	130	4
727	130	5
728	130	6
729	130	7
730	130	8
731	130	12
732	131	6
733	131	7
734	131	8
735	131	9
736	131	10
737	132	1
738	132	2
739	132	3
740	132	4
741	132	5
742	132	6
743	132	7
744	132	8
745	132	9
746	132	10
747	132	11
748	132	12
749	133	1
750	133	2
751	133	3
752	133	11
753	133	12
754	134	1
755	134	2
756	134	3
757	134	11
758	134	12
759	135	8
760	135	9
761	135	6
762	135	7
763	136	1
764	136	2
765	136	3
766	136	4
767	136	5
768	136	6
769	136	7
770	136	8
771	136	9
772	136	10
773	136	11
774	136	12
775	137	6
776	137	7
777	137	8
778	137	9
779	137	10
780	137	11
781	138	8
782	138	9
783	138	6
784	138	7
785	139	5
786	139	6
787	139	7
788	139	8
789	139	9
790	140	5
791	140	6
792	140	7
793	140	8
794	140	9
795	141	5
796	141	6
797	141	7
798	141	8
799	141	9
800	142	1
801	142	2
802	142	3
803	142	4
804	142	5
805	142	6
806	142	7
807	142	8
808	142	9
809	142	10
810	142	11
811	142	12
812	143	1
813	143	2
814	143	3
815	143	4
816	143	5
817	143	12
818	144	1
819	144	2
820	144	3
821	144	4
822	144	5
823	144	6
824	144	7
825	144	8
826	144	9
827	144	10
828	144	11
829	144	12
830	145	1
831	145	2
832	145	3
833	145	4
834	145	5
835	145	6
836	145	7
837	145	11
838	145	12
839	146	8
840	146	9
841	146	6
842	146	7
843	147	5
844	147	6
845	147	7
846	147	8
847	147	9
848	148	1
849	148	2
850	148	3
851	148	4
852	148	5
853	148	6
854	148	7
855	148	8
856	148	9
857	148	10
858	148	11
859	148	12
860	149	1
861	149	2
862	149	9
863	149	10
864	149	11
865	149	12
866	150	1
867	150	2
868	150	3
869	150	4
870	150	5
871	150	8
872	150	9
873	150	10
874	150	11
875	150	12
876	151	1
877	151	2
878	151	3
879	151	4
880	151	5
881	151	6
882	151	7
883	151	8
884	151	9
885	151	10
886	151	11
887	151	12
888	152	1
889	152	2
890	152	3
891	152	4
892	152	5
893	152	6
894	152	7
895	152	8
896	152	9
897	152	10
898	152	11
899	152	12
900	153	1
901	153	2
902	153	3
903	153	4
904	153	9
905	153	10
906	153	11
907	153	12
908	154	1
909	154	2
910	154	3
911	154	4
912	154	5
913	154	6
914	154	7
915	154	8
916	154	9
917	154	10
918	154	11
919	154	12
920	155	1
921	155	2
922	155	3
923	155	4
924	155	5
925	155	6
926	155	7
927	155	8
928	155	9
929	155	10
930	155	11
931	155	12
932	156	1
933	156	2
934	156	3
935	156	4
936	156	5
937	156	6
938	156	7
939	156	8
940	156	9
941	156	10
942	156	11
943	156	12
944	157	1
945	157	2
946	157	3
947	157	4
948	157	5
949	157	6
950	157	7
951	157	8
952	157	9
953	157	10
954	157	11
955	157	12
956	158	1
957	158	2
958	158	3
959	158	4
960	158	11
961	158	12
962	159	1
963	159	2
964	159	3
965	159	4
966	159	5
967	159	6
968	159	7
969	159	8
970	159	9
971	159	10
972	159	11
973	159	12
974	160	8
975	160	9
976	160	6
977	160	7
978	161	1
979	161	2
980	161	3
981	161	4
982	161	5
983	161	6
984	161	7
985	161	8
986	161	9
987	161	10
988	161	11
989	161	12
990	162	1
991	162	2
992	162	9
993	162	10
994	162	11
995	162	12
996	163	8
997	163	9
998	163	6
999	163	7
1000	164	9
1001	164	10
1002	164	11
1003	164	12
1004	165	1
1005	165	2
1006	165	3
1007	165	4
1008	165	5
1009	165	6
1010	165	7
1011	165	8
1012	165	9
1013	165	10
1014	165	11
1015	165	12
1016	166	1
1017	166	2
1018	166	3
1019	166	4
1020	166	11
1021	166	12
1022	167	1
1023	167	2
1024	167	3
1025	167	4
1026	167	11
1027	167	12
1028	168	1
1029	168	2
1030	168	3
1031	168	11
1032	168	12
1033	169	3
1034	169	4
1035	170	1
1036	170	3
1037	170	4
1038	170	5
1039	170	6
1040	170	7
1041	170	9
1042	170	10
1043	170	11
1044	170	12
1045	171	1
1046	171	2
1047	171	3
1048	171	4
1049	171	5
1050	171	6
1051	171	7
1052	171	8
1053	171	9
1054	171	10
1055	171	11
1056	171	12
1057	172	1
1058	172	2
1059	172	3
1060	172	4
1061	172	5
1062	172	6
1063	172	7
1064	172	8
1065	172	9
1066	172	10
1067	172	11
1068	172	12
1069	173	8
1070	173	9
1071	173	7
1072	174	1
1073	174	2
1074	174	3
1075	174	4
1076	174	5
1077	174	6
1078	174	7
1079	174	8
1080	174	9
1081	174	10
1082	174	11
1083	174	12
\.


--
-- Data for Name: creatures_deepsea; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.creatures_deepsea (creature_ptr_id, shadow_id) FROM stdin;
145	5
146	3
147	3
148	2
149	3
150	3
151	4
152	3
153	3
154	3
155	4
156	4
157	3
158	4
159	3
160	3
161	3
162	3
163	3
164	5
165	5
166	5
167	4
168	5
169	6
170	4
171	3
172	4
173	4
174	4
\.


--
-- Data for Name: creatures_fish; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.creatures_fish (creature_ptr_id, shadow_id) FROM stdin;
73	2
74	2
75	3
76	4
77	4
78	5
79	5
80	2
81	2
82	2
83	3
84	4
85	2
86	2
87	3
88	3
89	5
90	1
91	6
92	3
93	4
94	5
95	6
96	3
97	4
98	4
99	4
100	5
101	7
102	6
103	7
104	3
105	2
106	2
107	3
108	2
109	3
110	5
111	6
112	6
113	7
114	6
115	2
116	2
117	2
118	3
119	3
120	7
121	4
122	4
123	4
124	3
125	4
126	6
127	4
128	4
129	5
130	4
131	6
132	1
133	5
134	7
135	7
136	6
137	6
138	8
139	8
140	8
141	8
142	8
143	7
144	7
\.


--
-- Data for Name: creatures_section; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.creatures_section (id, pos, show, slug, name, "desc") FROM stdin;
1	0	t	bugs	Bugs	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 
2	2	t	fish	Fish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.
3	3	t	deep-sea-creatures	Deep sea creatures	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 
\.


--
-- Data for Name: creatures_shadow; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.creatures_shadow (id, size, slug, name, picture) FROM stdin;
1	0	narrow	Narrow	
2	1	1	1	
3	2	2	2	
4	3	3	3	
5	4	4	4	
6	5	5	5	
7	6	6	6	
8	7	fin	Fin	
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2015-02-05 12:33:47.841266+03	1	January	1		8	1
2	2015-02-05 12:34:01.319588+03	2	February	1		8	1
3	2015-02-05 12:34:13.471512+03	3	March	1		8	1
4	2015-02-05 12:34:23.211153+03	4	April	1		8	1
5	2015-02-05 12:34:34.498147+03	5	May	1		8	1
6	2015-02-05 12:34:47.183773+03	6	June	1		8	1
7	2015-02-05 12:34:59.208582+03	7	July	1		8	1
8	2015-02-05 12:36:12.728577+03	8	August	1		8	1
9	2015-02-05 12:36:21.998036+03	9	September	1		8	1
10	2015-02-05 12:36:30.312594+03	10	October	1		8	1
11	2015-02-05 12:36:42.32746+03	11	November	1		8	1
12	2015-02-05 12:36:54.014836+03	12	December	1		8	1
13	2015-02-05 12:37:53.733846+03	2	roscoe	1		4	1
14	2015-02-05 12:39:41.658417+03	2	roscoe	2	Changed user_permissions.	4	1
15	2015-02-05 16:48:23.657349+03	2	roscoe	2	Changed is_staff.	4	1
16	2015-02-05 16:52:48.628637+03	1	Bugs	1		7	2
17	2015-02-05 17:03:24.099486+03	1	Common Butterfly	1		9	2
18	2015-02-05 18:31:48.399119+03	2	Yellow Butterfly	1		9	2
19	2015-02-05 19:35:55.540325+03	3	Tiger Butterfly	1		9	1
20	2015-02-05 19:47:27.340117+03	4	Peacock Butterfly	1		9	1
21	2015-02-05 19:47:52.134721+03	4	Peacock Butterfly	2	Changed rarity.	9	1
22	2015-02-05 19:53:34.145871+03	5	Monarch Butterfly	1		9	1
23	2015-02-05 21:06:38.520613+03	6	Emperor butterfly	1		9	2
24	2015-02-05 21:06:54.337392+03	6	Emperor Butterfly	2	Changed name.	9	2
25	2015-02-05 21:11:32.301398+03	7	Agrias Butterfly	1		9	2
26	2015-02-05 21:15:02.532961+03	8	Raja Brooke Butterfly	1		9	2
27	2015-02-05 21:17:41.94943+03	9	Birdwing Butterfly	1		9	2
28	2015-02-05 21:21:29.659881+03	10	Moth	1		9	2
29	2015-02-05 21:24:20.376791+03	11	Oak Silk Moth	1		9	2
30	2015-02-05 21:26:45.725153+03	12	Honeybee	1		9	2
31	2015-02-05 21:31:29.652221+03	13	Bee	1		9	2
32	2015-02-05 21:34:57.558507+03	14	Long-headed Locust	1		9	2
33	2015-02-05 21:37:10.174681+03	15	Migratory Locust	1		9	2
34	2015-02-05 21:39:29.676235+03	16	Rice Grass­hopper	1		9	2
35	2015-02-05 21:41:45.867664+03	17	Mantis	1		9	2
36	2015-02-05 21:43:55.445341+03	18	Orchid Mantis	1		9	2
37	2015-02-05 21:46:34.582142+03	19	Large Brown Cicada	1		9	2
38	2015-02-05 21:48:29.210953+03	20	Robust Cicada	1		9	2
39	2015-02-05 22:02:16.429379+03	21	Giant Cicada	1		9	2
40	2015-02-05 22:11:32.746105+03	22	Walker Cada	1		9	2
41	2015-02-05 22:14:14.131552+03	23	Evening Cicada	1		9	2
42	2015-02-05 22:19:14.497422+03	24	Cicada Shell	1		9	2
43	2015-02-05 22:21:18.096291+03	25	Lantern Fly	1		9	2
44	2015-02-05 22:23:35.607044+03	26	Red Dragonfly	1		9	2
45	2015-02-05 22:35:35.376479+03	27	Darner Dragonfly	1		9	2
46	2015-02-05 22:38:07.042421+03	28	Banded Dragonfly	1		9	2
47	2015-02-05 22:40:36.544927+03	29	Giant Petaltail	1		9	2
48	2015-02-05 22:45:43.185751+03	30	Ant	1		9	2
49	2015-02-05 22:49:11.562258+03	31	Pondskater	1		9	2
50	2015-02-05 22:52:28.432305+03	32	Diving Beetle	1		9	2
51	2015-02-05 22:57:32.141675+03	33	Stinkbug	1		9	2
52	2015-02-05 23:01:03.568978+03	34	Snail	1		9	2
53	2015-02-05 23:04:31.565347+03	35	Cricket	1		9	2
54	2015-02-05 23:07:34.298793+03	36	Bell Cricket	1		9	2
55	2015-02-05 23:10:50.576406+03	37	Grasshopper	1		9	2
56	2015-02-05 23:11:04.639608+03	35	Cricket	2	Changed str_time and end_time.	9	2
57	2015-02-05 23:13:55.813188+03	38	Mole Cricket	1		9	2
58	2015-02-05 23:16:04.537395+03	39	Walking Leaf	1		9	2
59	2015-02-05 23:18:40.448595+03	40	Walkingstick	1		9	2
60	2015-02-05 23:21:38.916493+03	41	Bagworm	1		9	2
61	2015-02-05 23:24:25.044851+03	42	Spotted Ladybug	1		9	2
62	2015-02-07 16:29:11.762483+03	2	Fish	1		7	2
63	2015-02-07 18:00:23.744482+03	43	Violin Beetle	1		9	2
64	2015-02-07 18:00:54.054642+03	44	Bitterling	1		9	1
65	2015-02-07 18:05:22.289225+03	45	Longhorn Beetle	1		9	2
66	2015-02-07 18:05:46.04987+03	46	Pale Chub	1		9	1
67	2015-02-07 18:07:12.191987+03	47	Tiger Beetle	1		9	2
68	2015-02-07 18:10:14.026783+03	48	Crucian Carp	1		9	1
69	2015-02-07 18:10:58.546691+03	49	Dung Beetle	1		9	2
70	2015-02-07 18:12:33.787985+03	50	Wharf Roach	1		9	2
71	2015-02-07 18:13:24.448187+03	51	Dace	1		9	1
72	2015-02-07 18:14:54.587768+03	52	Hermit Crab	1		9	2
73	2015-02-07 18:18:09.416809+03	53	Firefly	1		9	2
74	2015-02-07 18:19:51.374652+03	54	Fruit Beetle	1		9	2
75	2015-02-07 23:52:00.83125+03	55	Barbel Steed	1		9	1
76	2015-02-07 23:56:33.337279+03	56	Carp	1		9	1
77	2015-02-07 23:58:47.07087+03	57	Koi	1		9	1
78	2015-02-08 00:02:47.375563+03	58	Goldfish	1		9	1
79	2015-02-08 00:05:48.661117+03	59	Popeyed Goldfish	1		9	1
80	2015-02-08 00:06:23.461598+03	2	Fishs	2	Changed name.	7	1
81	2015-02-08 00:06:30.074595+03	2	Fishes	2	Changed name.	7	1
82	2015-02-08 00:06:46.242114+03	2	Fish	2	Changed name.	7	1
83	2015-02-08 23:15:36.77361+03	60	Scarab Beetle	1		9	2
84	2015-02-08 23:19:03.33317+03	61	Jewel Beetle	1		9	2
85	2015-02-08 23:23:33.159769+03	62	Miyama Stag Beetle	1		9	2
86	2015-02-08 23:27:12.064763+03	63	Saw Stag Beetle	1		9	2
87	2015-02-08 23:30:14.894167+03	64	Giant Stag Beetle	1		9	2
88	2015-02-08 23:32:04.455541+03	65	Rainbow Stag Beetle	1		9	2
89	2015-02-08 23:34:26.258122+03	66	Cyclommatus	1		9	2
90	2015-02-08 23:36:51.963827+03	67	Golden Stag	1		9	2
91	2015-02-08 23:39:19.955836+03	68	Dynastid Beetle	1		9	2
92	2015-02-08 23:41:45.441251+03	69	Atlas Beetle	1		9	2
93	2015-02-08 23:43:57.365997+03	70	Elephant Beetle	1		9	2
94	2015-02-08 23:46:42.968592+03	71	Hercules Beetle	1		9	2
95	2015-02-08 23:49:59.476663+03	72	Goliath Beetle	1		9	2
96	2015-02-08 23:51:52.27077+03	73	Flea	1		9	2
97	2015-02-08 23:54:23.853248+03	74	Pill Bug	1		9	2
98	2015-02-08 23:56:11.107481+03	75	Mosquito	1		9	2
99	2015-02-08 23:58:25.726811+03	76	Fly	1		9	2
100	2015-02-09 00:00:10.692262+03	77	House Centipede	1		9	2
101	2015-02-09 00:02:16.475739+03	78	Centipede	1		9	2
102	2015-02-09 00:05:26.541685+03	79	Spider	1		9	2
103	2015-02-09 00:09:12.949608+03	80	Tarantula	1		9	2
104	2015-02-09 00:11:43.73264+03	81	Scorpion	1		9	2
105	2015-02-09 15:38:37.009465+03	76	Fly	2	Changed pic.	9	1
106	2015-02-11 20:21:14.310779+03	82	Killifish	1		9	1
107	2015-02-11 20:24:26.732713+03	83	Clownfish	1		9	1
108	2015-02-11 20:25:56.522531+03	83	Clownfish	2	Changed pos.	9	1
109	2015-02-11 20:29:12.077104+03	84	Crawfish	1		9	1
110	2015-02-11 20:29:36.557614+03	84	Crawfish	2	Changed rarity.	9	1
111	2015-02-11 20:33:40.145085+03	85	Soft-Shelled Turtle	1		9	1
112	2015-02-11 20:36:44.017642+03	86	Tadpole	1		9	1
113	2015-02-11 20:40:18.416736+03	87	Frog	1		9	1
114	2015-02-11 20:42:24.618102+03	88	Freshwater Goby	1		9	1
115	2015-02-13 12:56:01.29359+03	89	Loach	1		9	1
116	2015-02-13 13:06:13.788442+03	90	Catfish	1		9	1
117	2015-02-13 13:11:10.07952+03	91	Eel	1		9	1
118	2015-02-13 13:16:21.366574+03	92	Giant Snakehead	1		9	1
119	2015-02-13 13:32:33.467766+03	93	Bluegill	1		9	1
120	2015-02-13 13:39:22.543314+03	94	Yellow Perch	1		9	1
121	2015-02-13 13:46:51.989402+03	95	Black Bass	1		9	1
122	2015-02-13 13:51:47.694332+03	96	Pike	1		9	1
123	2015-02-13 14:04:27.871395+03	97	Pond Smelt	1		9	1
124	2015-02-13 14:05:22.712574+03	97	Pond Smelt	2	Changed rarity.	9	1
125	2015-02-13 15:02:31.457477+03	91	Eel	2	Changed shadow.	9	1
126	2015-02-13 15:09:05.817576+03	91	Eel	2	Changed shadow.	9	1
127	2015-02-13 15:11:02.130267+03	91	Eel	2	Changed shadow.	9	1
128	2015-02-13 15:35:43.664348+03	98	Sweetfish	1		9	1
129	2015-02-13 17:33:22.687628+03	99	Cherry Salmon	1		9	1
130	2015-02-13 17:37:20.54988+03	100	Char	1		9	1
131	2015-02-13 18:56:03.594988+03	101	Rainbow Trout	1		9	1
132	2015-02-13 19:14:09.191862+03	102	Stringfish	1		9	1
133	2015-02-13 19:18:58.186347+03	103	Salmon	1		9	1
134	2015-02-13 19:25:50.9304+03	104	King Salmon	1		9	1
135	2015-02-13 19:26:12.860091+03	104	King Salmon	2	Changed rarity.	9	1
136	2015-02-13 19:31:57.774588+03	105	Mitten Crab	1		9	1
137	2015-02-13 19:34:38.708849+03	106	Guppy	1		9	1
138	2015-02-13 19:37:54.105359+03	107	Nibble Fish	1		9	1
139	2015-02-13 19:42:27.612165+03	108	Angelfish	1		9	1
140	2015-02-13 19:50:56.33832+03	109	Neon Tetra	1		9	1
141	2015-02-13 19:57:21.63836+03	110	Piranha	1		9	1
142	2015-02-13 20:01:51.45556+03	111	Arowana	1		9	1
143	2015-02-13 20:09:13.299516+03	112	Dorado	1		9	1
144	2015-02-13 20:14:26.843036+03	113	Gar	1		9	1
145	2015-02-13 20:18:30.493293+03	114	Arapaima	1		9	1
146	2015-02-13 20:26:48.260202+03	115	Saddled Bichir	1		9	1
147	2015-02-13 20:35:27.853208+03	116	Sea Butterfly	1		9	1
148	2015-02-13 20:39:00.28451+03	117	Seahorse	1		9	1
149	2015-02-13 20:43:15.176856+03	118	Surgeonfish	1		9	1
150	2015-02-13 20:58:31.040335+03	119	Butterfly Fish	1		9	1
151	2015-02-13 21:03:52.521739+03	120	Napoleonfish	1		9	1
152	2015-02-13 21:04:38.408798+03	119	Butterfly Fish	2	Changed rarity.	9	1
153	2015-02-13 21:25:38.686609+03	121	Zebra Turkeyfish	1		9	1
154	2015-02-14 16:03:57.605537+03	3	Deep sea creatures	1		7	1
155	2015-02-15 10:36:31.576663+03	123	Blowfish	1		9	1
156	2015-02-15 10:46:04.251914+03	124	Puffer Fish	1		9	1
157	2015-02-15 10:51:44.527222+03	125	Horse Mackerel	1		9	1
158	2015-02-15 10:54:26.368193+03	126	Barred Knifejaw	1		9	1
159	2015-02-15 10:57:02.436559+03	127	Sea Bass	1		9	1
160	2015-02-15 10:59:46.852326+03	128	Red Snapper	1		9	1
161	2015-02-15 11:02:32.669676+03	129	Dab	1		9	1
162	2015-02-15 11:04:46.387828+03	130	Olive Flounder	1		9	1
163	2015-02-15 11:08:00.72503+03	131	Squid	1		9	1
164	2015-02-15 11:12:56.460763+03	132	Moray Eel	1		9	1
165	2015-02-15 11:16:51.760596+03	133	Ribbon Eel	1		9	1
166	2015-02-15 11:21:16.861549+03	134	Football Fish	1		9	1
167	2015-02-15 11:24:29.956984+03	135	Tuna	1		9	1
168	2015-02-15 11:27:20.719043+03	136	Blue Marlin	1		9	1
169	2015-02-15 11:29:48.059725+03	137	Giant Trevally	1		9	1
170	2015-02-15 11:31:03.652195+03	137	Giant Trevally	2	Changed rarity.	9	1
171	2015-02-15 11:33:43.973566+03	138	Ray	1		9	1
172	2015-02-15 11:36:43.405204+03	139	Ocean Sunfish	1		9	1
173	2015-02-15 11:41:32.932133+03	140	Hammerhead Shark	1		9	1
174	2015-02-15 11:43:54.177123+03	141	Shark	1		9	1
175	2015-02-15 11:47:40.390282+03	142	Saw Shark	1		9	1
176	2015-02-15 11:49:53.019468+03	143	Whale Shark	1		9	1
177	2015-02-15 11:54:19.709042+03	144	Oarfish	1		9	1
178	2015-02-15 11:57:22.544776+03	145	Coelacanth	1		9	1
179	2015-02-15 11:57:56.949325+03	143	Whale Shark	2	Changed rarity and price.	9	1
180	2015-02-15 16:18:34.698909+03	146	Seaweed	1		9	1
181	2015-02-15 16:23:24.68393+03	147	Sea grapes	1		9	1
182	2015-02-15 16:41:24.293129+03	148	Sea urchin	1		9	1
183	2015-02-15 16:41:44.301299+03	147	Sea Grapes	2	Changed name.	9	1
184	2015-02-15 16:41:53.503757+03	148	Sea Urchin	2	Changed name.	9	1
185	2015-02-15 16:49:15.231697+03	149	Acorn Barnacle	1		9	1
186	2015-02-15 16:49:38.304318+03	149	Acorn Barnacle	2	Changed pos.	9	1
187	2015-02-15 17:49:08.299721+03	150	Oyster	1		9	1
188	2015-02-15 17:49:22.894122+03	150	Oyster	2	Changed rarity.	9	1
189	2015-02-15 18:48:15.481478+03	151	Turban Shell	1		9	1
190	2015-02-15 18:51:57.702444+03	152	Abalone	1		9	1
191	2015-02-15 18:55:10.869385+03	153	Ear Shell	1		9	1
192	2015-02-15 18:58:15.224718+03	154	Clam	1		9	1
193	2015-02-16 00:26:15.79728+03	155	Pearl Oyster	1		9	1
194	2015-02-16 00:26:44.715809+03	155	Pearl Oyster	2	Changed rarity.	9	1
195	2015-02-16 00:33:58.081305+03	156	Scallop	1		9	1
196	2015-02-16 00:37:46.680479+03	157	Sea Anemone	1		9	1
197	2015-02-16 10:27:18.282683+03	158	Sea Star	1		9	1
198	2015-02-16 10:39:05.974054+03	159	Sea Cucumber	1		9	1
199	2015-02-16 10:39:32.162997+03	159	Sea Cucumber	2	Changed rarity.	9	1
200	2015-02-16 13:38:29.617554+03	160	Sea Slug	1		9	1
201	2015-02-16 13:40:17.309032+03	161	Flatworm	1		9	1
202	2015-02-16 13:42:36.127026+03	162	Mantis Shrimp	1		9	1
203	2015-02-16 13:45:01.915365+03	163	Sweet Shrimp	1		9	1
204	2015-02-16 13:47:07.83689+03	164	Tiger prawn	1		9	1
205	2015-02-16 13:50:28.093913+03	165	Spiny Lobster	1		9	1
206	2015-02-16 13:52:58.993111+03	166	Lobster	1		9	1
207	2015-02-16 13:55:13.833333+03	167	Snow Crab	1		9	1
208	2015-02-16 13:59:19.530702+03	168	Horsehair Crab	1		9	1
209	2015-02-16 14:00:43.332572+03	169	Red King Crab	1		9	1
210	2015-02-16 14:03:33.995273+03	170	Spider Crab	1		9	1
211	2015-02-16 14:05:42.09986+03	171	Octopus	1		9	1
212	2015-02-16 14:07:31.325347+03	172	Spotted Garden Eel	1		9	1
213	2015-02-16 14:09:28.488626+03	173	Chambered Nautilus	1		9	1
214	2015-02-16 14:09:45.29105+03	173	Chambered Nautilus	2	Changed rarity.	9	1
215	2015-02-16 14:12:24.815675+03	174	Horseshoe Crab	1		9	1
216	2015-02-16 14:14:37.947957+03	175	Giant Isopod	1		9	1
217	2015-02-16 14:15:31.486287+03	164	Tiger Prawn	2	Changed name.	9	1
218	2015-02-16 14:15:46.833598+03	150	Oyster	2	Changed island.	9	1
219	2015-02-16 14:15:55.971723+03	151	Turban Shell	2	Changed island.	9	1
220	2015-02-16 14:16:10.675754+03	154	Clam	2	Changed island.	9	1
221	2015-02-16 14:16:45.705114+03	155	Pearl Oyster	2	Changed island.	9	1
222	2015-02-16 14:18:46.934344+03	156	Scallop	2	Changed island.	9	1
223	2015-02-16 14:19:15.180714+03	159	Sea Cucumber	2	Changed island.	9	1
224	2015-02-16 14:19:34.090022+03	163	Sweet Shrimp	2	Changed island.	9	1
225	2015-02-16 14:19:58.785353+03	156	Scallop	2	Changed island.	9	1
226	2015-02-16 14:20:54.867458+03	165	Spiny Lobster	2	Changed rarity.	9	1
227	2015-02-16 14:21:21.42123+03	156	Scallop	2	Changed rarity.	9	1
228	2015-02-16 14:21:48.770976+03	170	Spider Crab	2	Changed rarity.	9	1
229	2015-02-16 14:30:25.777065+03	64	Giant Stag Beetle	2	Changed pic.	9	1
230	2015-03-03 12:05:15.848779+03	89	Loach	2	Changed pic.	9	1
231	2015-04-02 01:17:52.902307+03	171	Octopus	2	Changed price.	9	1
232	2019-09-27 17:02:36.721452+03	16	Bug object (16)	2	[{"changed": {"fields": ["description", "slug"]}}]	14	3
233	2019-09-27 18:36:29.945367+03	4	Autumn	2	[{"changed": {"fields": ["color"]}}]	18	3
234	2019-09-27 18:36:53.465264+03	2	Spring	2	[{"changed": {"fields": ["color"]}}]	18	3
235	2019-09-27 18:37:41.386187+03	1	Winter	2	[{"changed": {"fields": ["color"]}}]	18	3
236	2019-09-27 18:38:18.778211+03	3	Summer	2	[{"changed": {"fields": ["color"]}}]	18	3
237	2019-09-27 18:38:33.410317+03	4	Autumn	2	[{"changed": {"fields": ["color"]}}]	18	3
238	2019-09-27 19:01:24.945199+03	1	Very Common	2	[{"changed": {"fields": ["color"]}}]	15	3
239	2019-09-27 19:01:27.992713+03	1	Very Common	2	[]	15	3
240	2019-09-27 19:01:44.794666+03	2	Common	2	[{"changed": {"fields": ["color"]}}]	15	3
241	2019-09-27 19:02:04.479639+03	3	Rare	2	[{"changed": {"fields": ["color"]}}]	15	3
242	2019-09-27 19:02:20.58579+03	4	Vary Rare	2	[{"changed": {"fields": ["color"]}}]	15	3
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	encyclopedia	section
8	encyclopedia	month
9	encyclopedia	unit
10	creatures	creature
11	creatures	shadow
12	creatures	fish
13	creatures	section
14	creatures	bug
15	creatures	rarity
16	creatures	bugtype
17	creatures	deepsea
18	encyclopedia	season
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-02-05 12:19:30.954412+03
2	auth	0001_initial	2015-02-05 12:19:31.541207+03
3	admin	0001_initial	2015-02-05 12:19:31.656356+03
4	sessions	0001_initial	2015-02-05 12:19:31.701056+03
5	encyclopedia	0001_initial	2015-02-05 12:27:36.111252+03
6	encyclopedia	0002_auto_20150207_1820	2015-02-07 18:20:38.64178+03
7	encyclopedia	0003_auto_20150215_1035	2015-02-15 10:36:15.807646+03
8	admin	0002_logentry_remove_auto_add	2019-09-24 15:38:03.343272+03
9	admin	0003_logentry_add_action_flag_choices	2019-09-24 15:38:03.380957+03
10	contenttypes	0002_remove_content_type_name	2019-09-24 15:38:03.410793+03
11	auth	0002_alter_permission_name_max_length	2019-09-24 15:38:03.419033+03
12	auth	0003_alter_user_email_max_length	2019-09-24 15:38:03.432281+03
13	auth	0004_alter_user_username_opts	2019-09-24 15:38:03.442599+03
14	auth	0005_alter_user_last_login_null	2019-09-24 15:38:03.453344+03
15	auth	0006_require_contenttypes_0002	2019-09-24 15:38:03.458815+03
16	auth	0007_alter_validators_add_error_messages	2019-09-24 15:38:03.478973+03
17	auth	0008_alter_user_username_max_length	2019-09-24 15:38:03.539928+03
18	auth	0009_alter_user_last_name_max_length	2019-09-24 15:38:03.570546+03
19	auth	0010_alter_group_name_max_length	2019-09-24 15:38:03.588482+03
20	auth	0011_update_proxy_permissions	2019-09-24 15:38:03.604025+03
21	creatures	0001_initial	2019-09-27 12:53:20.195499+03
22	encyclopedia	0002_auto_20190927_1736	2019-09-27 17:36:59.928038+03
23	encyclopedia	0003_auto_20190927_1800	2019-09-27 18:09:02.039695+03
24	encyclopedia	0004_auto_20190927_1811	2019-09-27 18:27:08.577347+03
25	encyclopedia	0005_remove_month_season_old	2019-09-27 18:32:37.620271+03
26	encyclopedia	0006_auto_20191004_1618	2019-10-04 16:19:02.270501+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
rnzlwonb3br9r1zh67xwvk8t5d5s8k87	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-06 12:33:26.587536+03
s662bjqcq2842h4exmvu00ezst7zakut	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-06 19:31:11.615724+03
968c0msci3t1yklxhcnvjghfngyg1btb	MTlkZDI2YzRhOGVjOTNkNjlhZGE1OTJhMmRkYWE5OWQ1NmUzNjRhYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNmMGJlMTM5NjU5OGMwZDk1ODAxOTRmZDM5MGFiODNjMzI2ZDE0NjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-02-06 20:57:11.095081+03
k95pmemekip21v2cz571y0eb5e40b9gn	MTlkZDI2YzRhOGVjOTNkNjlhZGE1OTJhMmRkYWE5OWQ1NmUzNjRhYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNmMGJlMTM5NjU5OGMwZDk1ODAxOTRmZDM5MGFiODNjMzI2ZDE0NjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-02-08 16:27:09.65185+03
rv0pnejt0vooc7lnad0fwsr54ihyma4g	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-08 17:56:52.213162+03
jm01z5r6ft6lbrbrbnx1q19y358jkq2u	MTlkZDI2YzRhOGVjOTNkNjlhZGE1OTJhMmRkYWE5OWQ1NmUzNjRhYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNmMGJlMTM5NjU5OGMwZDk1ODAxOTRmZDM5MGFiODNjMzI2ZDE0NjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-02-09 23:12:35.176004+03
3zazc2kqrx9dfyggk4up5om2389rhuzm	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-10 15:37:28.137858+03
ufku5ncpm6pozn2bi4pjuk0jss3udolg	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-12 20:15:14.254641+03
bw62mhmohrde0xfi8a3tzdetaiqpubiq	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-14 12:01:31.161219+03
7xirl8w70jvdjmevy8pkkf9iww25h38w	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-15 15:44:15.073845+03
42wll7f1uk05v61s4exd8qedgxtkpobt	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-16 16:16:13.373367+03
hqykddqeriboxfa5327wlut3w5oidqn5	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-03-04 11:59:23.853757+03
9o83c82zf54w2uhxj4o2lbcxvxwngenp	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-04-03 01:17:31.906849+03
so3bw267z9wj0rvkntwxmkwo0o4xx3z3	MTlkZDI2YzRhOGVjOTNkNjlhZGE1OTJhMmRkYWE5OWQ1NmUzNjRhYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNmMGJlMTM5NjU5OGMwZDk1ODAxOTRmZDM5MGFiODNjMzI2ZDE0NjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-12-03 19:10:34.969272+03
t3efqe38illrqvv705j8illydie36rlp	ZDM2MzhlZmQyODY0NjFhOGRmMGZlOWNmZjgyYmU1ZTEwZDEyODBiZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhODQ1YzQyZDZhMzYwMmUyODVmZmViNDVjOTE2MmJhOGI0YzY3NGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2016-01-11 01:04:23.723131+03
eu0js6b2ousrwbb28ax63cz074a5m00o	NTg0NTVkMTFmYzFjZWI1MTJmY2QxMjBkNDg0Y2IxZjk4YTA3YjAzNzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNjYyZmIyODVmMTIxZDhkMzhiMDEwMmU1NWFlNjNhNDVmODcxYmU4In0=	2019-10-10 13:03:45.99436+03
\.


--
-- Data for Name: encyclopedia_month; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.encyclopedia_month (id, pos, name, season_id) FROM stdin;
1	1	January	1
2	2	February	1
12	12	December	1
3	3	March	2
4	4	April	2
5	5	May	2
6	6	June	3
7	7	July	3
8	8	August	3
9	9	September	4
10	10	October	4
11	11	November	4
\.


--
-- Data for Name: encyclopedia_season; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.encyclopedia_season (id, name, slug, color) FROM stdin;
2	Spring	spring	100,65%,50%
1	Winter	winter	200,65%,50%
3	Summer	summer	75,65%,50%
4	Autumn	autumn	30,65%,50%
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 12, true);


--
-- Name: creatures.rarity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public."creatures.rarity_id_seq"', 4, true);


--
-- Name: creatures_bugtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.creatures_bugtype_id_seq', 1, false);


--
-- Name: creatures_creature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.creatures_creature_id_seq', 174, true);


--
-- Name: creatures_creature_months_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.creatures_creature_months_id_seq', 1083, true);


--
-- Name: creatures_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.creatures_section_id_seq', 3, true);


--
-- Name: creatures_shadow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.creatures_shadow_id_seq', 8, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 242, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: encyclopedia_month_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.encyclopedia_month_id_seq', 12, true);


--
-- Name: encyclopedia_season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.encyclopedia_season_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: creatures.rarity creatures.rarity_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public."creatures.rarity"
    ADD CONSTRAINT "creatures.rarity_pkey" PRIMARY KEY (id);


--
-- Name: creatures.rarity creatures.rarity_slug_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public."creatures.rarity"
    ADD CONSTRAINT "creatures.rarity_slug_key" UNIQUE (slug);


--
-- Name: creatures_bug creatures_bug_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_bug
    ADD CONSTRAINT creatures_bug_pkey PRIMARY KEY (creature_ptr_id);


--
-- Name: creatures_bugtype creatures_bugtype_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_bugtype
    ADD CONSTRAINT creatures_bugtype_pkey PRIMARY KEY (id);


--
-- Name: creatures_bugtype creatures_bugtype_slug_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_bugtype
    ADD CONSTRAINT creatures_bugtype_slug_key UNIQUE (slug);


--
-- Name: creatures_creature_months creatures_creature_months_creature_id_month_id_653a23dc_uniq; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature_months
    ADD CONSTRAINT creatures_creature_months_creature_id_month_id_653a23dc_uniq UNIQUE (creature_id, month_id);


--
-- Name: creatures_creature_months creatures_creature_months_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature_months
    ADD CONSTRAINT creatures_creature_months_pkey PRIMARY KEY (id);


--
-- Name: creatures_creature creatures_creature_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature
    ADD CONSTRAINT creatures_creature_pkey PRIMARY KEY (id);


--
-- Name: creatures_creature creatures_creature_slug_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature
    ADD CONSTRAINT creatures_creature_slug_key UNIQUE (slug);


--
-- Name: creatures_deepsea creatures_deepsea_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_deepsea
    ADD CONSTRAINT creatures_deepsea_pkey PRIMARY KEY (creature_ptr_id);


--
-- Name: creatures_fish creatures_fish_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_fish
    ADD CONSTRAINT creatures_fish_pkey PRIMARY KEY (creature_ptr_id);


--
-- Name: creatures_section creatures_section_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_section
    ADD CONSTRAINT creatures_section_pkey PRIMARY KEY (id);


--
-- Name: creatures_section creatures_section_slug_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_section
    ADD CONSTRAINT creatures_section_slug_key UNIQUE (slug);


--
-- Name: creatures_shadow creatures_shadow_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_shadow
    ADD CONSTRAINT creatures_shadow_pkey PRIMARY KEY (id);


--
-- Name: creatures_shadow creatures_shadow_slug_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_shadow
    ADD CONSTRAINT creatures_shadow_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: encyclopedia_month encyclopedia_month_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_month
    ADD CONSTRAINT encyclopedia_month_pkey PRIMARY KEY (id);


--
-- Name: encyclopedia_season encyclopedia_season_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_season
    ADD CONSTRAINT encyclopedia_season_pkey PRIMARY KEY (id);


--
-- Name: encyclopedia_season encyclopedia_season_slug_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_season
    ADD CONSTRAINT encyclopedia_season_slug_key UNIQUE (slug);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX auth_user_groups_0e939a4f ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX auth_user_groups_e8701ad4 ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX auth_user_user_permissions_8373b171 ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: creatures.rarity_slug_6f2eacee_like; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX "creatures.rarity_slug_6f2eacee_like" ON public."creatures.rarity" USING btree (slug varchar_pattern_ops);


--
-- Name: creatures_bug_bug_type_id_4dbe8500; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_bug_bug_type_id_4dbe8500 ON public.creatures_bug USING btree (bug_type_id);


--
-- Name: creatures_bugtype_slug_99229a86_like; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_bugtype_slug_99229a86_like ON public.creatures_bugtype USING btree (slug varchar_pattern_ops);


--
-- Name: creatures_creature_months_creature_id_3efe0933; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_creature_months_creature_id_3efe0933 ON public.creatures_creature_months USING btree (creature_id);


--
-- Name: creatures_creature_months_month_id_58a79ecc; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_creature_months_month_id_58a79ecc ON public.creatures_creature_months USING btree (month_id);


--
-- Name: creatures_creature_polymorphic_ctype_id_728fbd92; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_creature_polymorphic_ctype_id_728fbd92 ON public.creatures_creature USING btree (polymorphic_ctype_id);


--
-- Name: creatures_creature_rarity_id_2fbfc974; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_creature_rarity_id_2fbfc974 ON public.creatures_creature USING btree (rarity_id);


--
-- Name: creatures_creature_section_id_5dbf31c9; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_creature_section_id_5dbf31c9 ON public.creatures_creature USING btree (section_id);


--
-- Name: creatures_creature_slug_eba4609b_like; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_creature_slug_eba4609b_like ON public.creatures_creature USING btree (slug varchar_pattern_ops);


--
-- Name: creatures_deepsea_shadow_id_a0c2ed9e; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_deepsea_shadow_id_a0c2ed9e ON public.creatures_deepsea USING btree (shadow_id);


--
-- Name: creatures_fish_shadow_id_b5cc3ed8; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_fish_shadow_id_b5cc3ed8 ON public.creatures_fish USING btree (shadow_id);


--
-- Name: creatures_section_slug_3ba17fa6_like; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_section_slug_3ba17fa6_like ON public.creatures_section USING btree (slug varchar_pattern_ops);


--
-- Name: creatures_shadow_slug_ae7d8530_like; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX creatures_shadow_slug_ae7d8530_like ON public.creatures_shadow USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX django_admin_log_417f1b1c ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX django_admin_log_e8701ad4 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: encyclopedia_month_season_id_787078e9; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX encyclopedia_month_season_id_787078e9 ON public.encyclopedia_month USING btree (season_id);


--
-- Name: encyclopedia_season_slug_43dcb47e_like; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX encyclopedia_season_slug_43dcb47e_like ON public.encyclopedia_season USING btree (slug varchar_pattern_ops);


--
-- Name: auth_permission auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_bug creatures_bug_bug_type_id_4dbe8500_fk_creatures_bugtype_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_bug
    ADD CONSTRAINT creatures_bug_bug_type_id_4dbe8500_fk_creatures_bugtype_id FOREIGN KEY (bug_type_id) REFERENCES public.creatures_bugtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_bug creatures_bug_creature_ptr_id_6b870dff_fk_creatures_creature_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_bug
    ADD CONSTRAINT creatures_bug_creature_ptr_id_6b870dff_fk_creatures_creature_id FOREIGN KEY (creature_ptr_id) REFERENCES public.creatures_creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_creature_months creatures_creature_m_creature_id_3efe0933_fk_creatures; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature_months
    ADD CONSTRAINT creatures_creature_m_creature_id_3efe0933_fk_creatures FOREIGN KEY (creature_id) REFERENCES public.creatures_creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_creature_months creatures_creature_m_month_id_58a79ecc_fk_encyclope; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature_months
    ADD CONSTRAINT creatures_creature_m_month_id_58a79ecc_fk_encyclope FOREIGN KEY (month_id) REFERENCES public.encyclopedia_month(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_creature creatures_creature_polymorphic_ctype_id_728fbd92_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature
    ADD CONSTRAINT creatures_creature_polymorphic_ctype_id_728fbd92_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_creature creatures_creature_rarity_id_2fbfc974_fk_creatures.rarity_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature
    ADD CONSTRAINT "creatures_creature_rarity_id_2fbfc974_fk_creatures.rarity_id" FOREIGN KEY (rarity_id) REFERENCES public."creatures.rarity"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_creature creatures_creature_section_id_5dbf31c9_fk_creatures_section_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_creature
    ADD CONSTRAINT creatures_creature_section_id_5dbf31c9_fk_creatures_section_id FOREIGN KEY (section_id) REFERENCES public.creatures_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_deepsea creatures_deepsea_creature_ptr_id_0f2b5301_fk_creatures; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_deepsea
    ADD CONSTRAINT creatures_deepsea_creature_ptr_id_0f2b5301_fk_creatures FOREIGN KEY (creature_ptr_id) REFERENCES public.creatures_creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_deepsea creatures_deepsea_shadow_id_a0c2ed9e_fk_creatures_shadow_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_deepsea
    ADD CONSTRAINT creatures_deepsea_shadow_id_a0c2ed9e_fk_creatures_shadow_id FOREIGN KEY (shadow_id) REFERENCES public.creatures_shadow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_fish creatures_fish_creature_ptr_id_f2894c87_fk_creatures; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_fish
    ADD CONSTRAINT creatures_fish_creature_ptr_id_f2894c87_fk_creatures FOREIGN KEY (creature_ptr_id) REFERENCES public.creatures_creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creatures_fish creatures_fish_shadow_id_b5cc3ed8_fk_creatures_shadow_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.creatures_fish
    ADD CONSTRAINT creatures_fish_shadow_id_b5cc3ed8_fk_creatures_shadow_id FOREIGN KEY (shadow_id) REFERENCES public.creatures_shadow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: encyclopedia_month encyclopedia_month_season_id_787078e9_fk_encyclopedia_season_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_month
    ADD CONSTRAINT encyclopedia_month_season_id_787078e9_fk_encyclopedia_season_id FOREIGN KEY (season_id) REFERENCES public.encyclopedia_season(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

