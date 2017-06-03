--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ac_admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ac_admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ac_admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ac_admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ac_admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ac_admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ac_admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ac_admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ac_admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ac_admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ac_admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ac_admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO ac_admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ac_admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ac_admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ac_admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ac_admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ac_admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ac_admin;

--
-- Name: encyclopedia_month; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE encyclopedia_month (
    id integer NOT NULL,
    pos integer NOT NULL,
    name character varying(10) NOT NULL,
    season character varying(7) NOT NULL
);


ALTER TABLE public.encyclopedia_month OWNER TO ac_admin;

--
-- Name: encyclopedia_month_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE encyclopedia_month_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encyclopedia_month_id_seq OWNER TO ac_admin;

--
-- Name: encyclopedia_month_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE encyclopedia_month_id_seq OWNED BY encyclopedia_month.id;


--
-- Name: encyclopedia_section; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE encyclopedia_section (
    id integer NOT NULL,
    pos integer NOT NULL,
    show boolean NOT NULL,
    name character varying(100) NOT NULL,
    "desc" text NOT NULL
);


ALTER TABLE public.encyclopedia_section OWNER TO ac_admin;

--
-- Name: encyclopedia_section_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE encyclopedia_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encyclopedia_section_id_seq OWNER TO ac_admin;

--
-- Name: encyclopedia_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE encyclopedia_section_id_seq OWNED BY encyclopedia_section.id;


--
-- Name: encyclopedia_unit; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE encyclopedia_unit (
    id integer NOT NULL,
    pos integer NOT NULL,
    pic character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    rarity integer NOT NULL,
    "desc" text NOT NULL,
    loc character varying(100) NOT NULL,
    shadow character varying(7) NOT NULL,
    price integer NOT NULL,
    str_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    section_id integer NOT NULL,
    island boolean NOT NULL
);


ALTER TABLE public.encyclopedia_unit OWNER TO ac_admin;

--
-- Name: encyclopedia_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE encyclopedia_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encyclopedia_unit_id_seq OWNER TO ac_admin;

--
-- Name: encyclopedia_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE encyclopedia_unit_id_seq OWNED BY encyclopedia_unit.id;


--
-- Name: encyclopedia_unit_months; Type: TABLE; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE TABLE encyclopedia_unit_months (
    id integer NOT NULL,
    unit_id integer NOT NULL,
    month_id integer NOT NULL
);


ALTER TABLE public.encyclopedia_unit_months OWNER TO ac_admin;

--
-- Name: encyclopedia_unit_months_id_seq; Type: SEQUENCE; Schema: public; Owner: ac_admin
--

CREATE SEQUENCE encyclopedia_unit_months_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encyclopedia_unit_months_id_seq OWNER TO ac_admin;

--
-- Name: encyclopedia_unit_months_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ac_admin
--

ALTER SEQUENCE encyclopedia_unit_months_id_seq OWNED BY encyclopedia_unit_months.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY encyclopedia_month ALTER COLUMN id SET DEFAULT nextval('encyclopedia_month_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY encyclopedia_section ALTER COLUMN id SET DEFAULT nextval('encyclopedia_section_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY encyclopedia_unit ALTER COLUMN id SET DEFAULT nextval('encyclopedia_unit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY encyclopedia_unit_months ALTER COLUMN id SET DEFAULT nextval('encyclopedia_unit_months_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
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
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('auth_permission_id_seq', 27, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$15000$IyRRQlqYfPmF$5khZQhqo+TnNZSzo3FRue1koFHvQ9i0PqMhhMp+0P6E=	2015-12-02 19:10:34.966415+03	f	roscoe				t	t	2015-02-05 12:37:53+03
1	pbkdf2_sha256$15000$lP883YGbiqrU$Y4YtyB3qkZ6zrxihG+yi6EYnWCwe1EfxONs+b5ilykU=	2016-01-10 01:04:23.720705+03	t	aka_alarm			alarm-1@yandex.ru	t	t	2015-02-05 12:32:08.426821+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
7	2	19
8	2	20
9	2	21
10	2	25
11	2	26
12	2	27
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 12, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
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
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 231, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	section	encyclopedia	section
8	month	encyclopedia	month
9	unit	encyclopedia	unit
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('django_content_type_id_seq', 9, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-02-05 12:19:30.954412+03
2	auth	0001_initial	2015-02-05 12:19:31.541207+03
3	admin	0001_initial	2015-02-05 12:19:31.656356+03
4	sessions	0001_initial	2015-02-05 12:19:31.701056+03
5	encyclopedia	0001_initial	2015-02-05 12:27:36.111252+03
6	encyclopedia	0002_auto_20150207_1820	2015-02-07 18:20:38.64178+03
7	encyclopedia	0003_auto_20150215_1035	2015-02-15 10:36:15.807646+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('django_migrations_id_seq', 7, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
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
\.


--
-- Data for Name: encyclopedia_month; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY encyclopedia_month (id, pos, name, season) FROM stdin;
1	1	January	winter
2	2	February	winter
3	3	March	spring
4	4	April	spring
5	5	May	spring
6	6	June	summer
7	7	July	summer
8	8	August	summer
9	9	September	autumn
10	10	October	autumn
11	11	November	autumn
12	12	December	winter
\.


--
-- Name: encyclopedia_month_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('encyclopedia_month_id_seq', 12, true);


--
-- Data for Name: encyclopedia_section; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY encyclopedia_section (id, pos, show, name, "desc") FROM stdin;
1	0	t	Bugs	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 
2	2	t	Fish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.
3	3	t	Deep sea creatures	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 
\.


--
-- Name: encyclopedia_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('encyclopedia_section_id_seq', 3, true);


--
-- Data for Name: encyclopedia_unit; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY encyclopedia_unit (id, pos, pic, name, rarity, "desc", loc, shadow, price, str_time, end_time, section_id, island) FROM stdin;
1	1	units/Common_Butterfly_nl.png	Common Butterfly	2	Seen flapping in the sun, common butterflies can be identified by black spots on their white wings. To the human eye, both males and females look white, but there are actually subtle differences. On closer inspection, the males' wings look black while the females' wings look white. The caterpillars have been known to cause damage to farmers' crops.	Flying near flowers 		90	04:00:00	19:00:00	1	f
2	2	units/Yellow_Butterfly_nl.png	Yellow Butterfly	2	The yellow butterfly is similar to the common butterfly, with the two easily mistaken for one another. Males are more often a yellowish color, and females are more often white. The larvae feed on plants of the Fabacae family, such as milk vetch or white clover.	Flying near flowers 		90	06:00:00	16:00:00	1	f
3	3	units/Tiger_Butterfly_nl.png	Tiger Butterfly	3	The larvae of tiger butterflies feed on leaves of orange trees until they metamorphose. When they're threatened, they emit a foul smell from their antennae to protect themselves. The dusting you see on your fingers whenever you touch their wings is actually from their scales. These scales form the wing pattern as well as repel rainwater, making them very important for survival.	Flying near flowers 		160	08:00:00	19:00:00	1	f
4	4	units/peacock_butterfly_nl.png	Peacock Butterfly	3	The back of the wings of a peacock butterfly is black, while the front is blue or green. The males have black, velvet hair on their forewings and are easy to spot because of their beauty. Sometimes you may see a group of male peacock butterflies drinking water together.	Flying near flowers		220	04:00:00	19:00:00	1	f
5	5	units/Monarch_butterfly_nl.png	Monarch Butterfly	1	Monarch butterflies are known for their lengthy southward migrations in the winter. Once spring rolls around, they return to their original homes until the weather turns cold again. In their southern habitat during the winter, you may see thousands of them covering the trees.	Flying 		140	09:00:00	17:00:00	1	f
6	6	units/emperor.jpg	Emperor Butterfly	3	Emperor butterflies are easily recognized because of their lovely, iridescent blue wings.  Pigmentation isn't actually what causes the color, but rather the reflections on their wing scales.  Since their wings shimmer when moving, noticing them is much easier when they are midflight.	Flying		2500	20:00:00	06:00:00	1	f
7	7	units/arigas.jpg	Agrias Butterfly	3	Agrias butterflies are argued to have the most beautiful wings of all butterfly species.  They're capable of flying quite fast, making them more difficult to catch than a number of their peers.  Their wings sport three colors -- red, blue, and black -- but many have different patterns and shapes.	Flying		3000	08:00:00	17:00:00	1	f
8	8	units/raja.jpg	Raja Brooke Butterfly	3	Raja Brooke butterflies have red heads and a red strip around their necks, giving the look of a collar. They are known to drink hot-spring water and often hang around water flowing up from the ground. While males are vibrantly green, females are much more commonly seen with brown wings.	Flying		2500	08:00:00	17:00:00	1	f
9	9	units/birdwing.jpg	Birdwing Butterfly	3	The world's largest butterflies, birdwing butterflies, have wings that can measure 30 cm long. The females have longer wings than the males, while the males' wings have a deeper blue color. Though they are extremely popular with collectors, international trading is either limited or fully banned.	Flying		4000	08:00:00	17:00:00	1	f
10	10	units/moth.jpg	Moth	2	Moths are related to butterflies, but they're most often active at night instead of day. They use their large antenna to sense, smell, and guide themselves in the dark. Interestingly, the number of moth species is estimated at 160,000, so "moth" is a fairly broad descriptor.	Near lights		60	19:00:00	04:00:00	1	f
11	11	units/osmoth.jpg	Oak Silk Moth	3	Oak silk moths are seen in the summer and are one of the largest moth species in the world. They make silk from their mouths as they transition into the pupa stage. As adults, they don't eat anything and only live off the nutrients they stored while they were caterpillars.	On trees		1200	19:00:00	04:00:00	1	f
12	12	units/honeybee.jpg	Honeybee	1	Honeybees gather nectar from flowers and make honey, making them integral in many ecosystems.  The worker bees are females and the only ones capable of stinging, though that is rather rare.  The hive does contain males, but after mating season, they are all sent away.  Honey has been consumed since ancient times.  Cave paintings 8,000 years old show people eating honey.	Near flowers		100	08:00:00	17:00:00	1	f
13	13	units/bee.jpg	Bee	1	Bees are prone to attacking anyone who comes too close to their hive, so be careful when approaching! The yellow and black you see on their bodies are colors often used to convey danger. This danger is pretty significant, as many varieties of bees are capable of stinging multiple times.	When trees are shaken		2500	00:00:00	00:00:00	1	f
14	14	units/llocust.jpg	Long-headed Locust	2	When male long locusts jump, you can hear the trademark stridulation noise they make. Long locusts can be green as well as brown. The brown ones usually hide near dried grass or brown areas. While males are long, females are consistently much longer, making it simple to tell them apart.	On the ground		200	08:00:00	19:00:00	1	f
15	15	units/mlocust.jpg	Migratory Locust	3	Migratory locusts are large insects that can jump up to 32 feet, as they open their wings when they jump. These locusts love to eat and can consume their own weight in food every single day. As a group, their hunger is enough that a million locusts can consume one ton of food per day. Oddly, when migratory locusts grow up surrounded only by other locusts, their shells will be entirely black.	On the ground		600	08:00:00	19:00:00	1	f
16	16	units/rhopper.jpg	Rice Grass­hopper	3	Rice grasshoppers are typically known as pests that eat farmers' crop, making them undesirable. But they're also edible, and boiling them in soy sauce is a typical way to prepare them in certain regions. While they are generally green, their shells will turn a darker color when heavily crowded in groups.	On the ground		400	08:00:00	19:00:00	1	f
17	17	units/mantis.jpg	Mantis	2	Mantises are known for the praying pose they sit in while ambushing unsuspecting prey. They'll snatch whatever is moving nearby and can even capture creatures larger than themselves. When threatened, mantises will spread their thin green wings to appear more intimidating.	On flowers		430	08:00:00	17:00:00	1	f
18	18	units/omantis.jpg	Orchid Mantis	3	Orchid mantises look like orchids and use them as camouflage for protection from predators. While this camouflage keeps them safe, is also helps them to surprise any prey that comes to the flowers. They are usually carnivorous, but they still eat the occasional banana to balance their vitamin intake.	On white flowers		2400	08:00:00	17:00:00	1	f
19	19	units/lbcicada.jpg	Large Brown Cicada	1	The crying of brown cicadas is usually associated with the sound of hot oil sputtering. Their wings are brown instead of being transparent, making them a rare species throughout the world. While completely harmless by themselves, in swarms they can cause devastation to crops.	On trees		200	08:00:00	17:00:00	1	f
20	20	units/rcicada.jpg	Robust Cicada	1	Robust cicadas are distinguished by the shortness of their bodies in relation to their wing size. They used to share territories with brown cicadas, but robust cicadas tend to prefer dry locales. As you'd expect, they make a rather robust call, though males actually change their sound around females.	On trees		300	08:00:00	17:00:00	1	f
21	21	units/gcicada.jpg	Giant Cicada	3	As the name might indicate, giant cicadas are one of the largest species of cicada in the world. They used to live mostly in warmer western Japan, but they've now also moved to urban eastern Japan. Though they're now common in these areas, they aren't well known in other parts of the world.	On trees		500	08:00:00	17:00:00	1	f
22	22	units/wcicada.jpg	Walker Cada	3	Walker cicadas have a unique crying sound that gives the impression they're all singing in harmony. They usually start crying late in the summer, so people can associate their sound with summer's end. This call is so related with summer in general, TV shows regularly use this cicada to indicate the season.	On trees		400	08:00:00	17:00:00	1	f
23	23	units/ecicada.jpg	Evening Cicada	1	Evening cicadas cry when it's dark out, regardless of what time of day it actually is. People tend to think it's the end of summer when they hear the cry of evening cicadas. However, this species of cicada starts crying at the end of the rainy season, which generally falls in July.	On trees		550	16:00:00	19:00:00	1	f
24	24	units/cshell.jpg	Cicada Shell	2	Cicada larvae emerge from the ground in the evening and molt on trees, leaving behind empty shells. It's possible to find out the species of cicadas just be looking at these shells. Collecting the shells will tell you how many and what kind of cicadas inhabit a certain area.	On trees		100	00:00:00	00:00:00	1	f
25	25	units/lfly.jpg	Lantern Fly	3	Lantern flies stay on trees to drink tree sap, which is where you'll most commonly find them. Their heads are shaped like an alligators, though this is just an odd coincidence. Their wings have patterns that look like eyes so when they're open they can scare off predators. They don't really cry that much, but they are still related to cicadas to some extent.	On trees		1800	16:00:00	08:00:00	1	f
26	26	units/rdragon.jpg	Red Dragonfly	1	Red dragonflies are seen in the fall, as they're rather sensitive to the heat of summer. They stay in the mountains during the summer and come down to the plains in cooler weather. The males' bodies turn red when they're mature, but their heads and thoraxes are brownish. The females have a more yellowish color and aren't as red as the males, making them easy to tell apart.	Flying		80	08:00:00	19:00:00	1	f
27	27	units/ddragon.jpg	Darner Dragonfly	2	The heads and thoraxes of darner dragonflies are colored a lovely yellow green. The males have a light-blue spot on their bellies, which is not a trait the females share. Darner dragonflies can usually be seen flying around bodies of water such as lakes or ponds.	Flying		200	08:00:00	17:00:00	1	f
28	28	units/bdragon.jpg	Banded Dragonfly	3	Banded dragonflies have black-and-yellow-striped bodies and bright-green eyes. They are large and can fly quite fast. They have strong jaws, so it might be painful if you're bitten. Their larval stage lasts two to four years, where they live near water, feeding on tadpoles and small fish.	Flying		4500	08:00:00	17:00:00	1	f
29	29	units/gpetaltail.jpg	Giant Petaltail	4	Dragonflies very similar to petaltail dragonflies have been found in fossils from the Jurassic period. They are considered "living fossils" that haven't changed much since prehistoric times. Their wingspan is over 16 cm, making them the world's largest dragonfly.	Flying		8000	16:00:00	19:00:00	1	f
30	30	units/ant.jpg	Ant	2	Ants are small but very powerful and are able to carry items far heavier than they are. In the nest, there is a queen and also worker ants, making them somewhat similar to bees. In some habitats, ants actually make up between 15-20% of the area's total terrestrial-animal biomass.	Dropped Candy, Spoiled Turnips, Rotten Fruit 		80	00:00:00	00:00:00	1	f
31	31	units/pondskater.jpg	Pondskater	3	Pondskaters distinguish themselves by having the ability to run on the surface of the water. They have a mouth part that lets them suck up bugs that fall on the water's surface. Their wings allow them to freely move to different parts of the water's surface if the need arises. Some say they smell like candy, which is a rather curious association to make in the insect world.	On water		130	08:00:00	19:00:00	1	f
32	32	units/dbeetle.jpg	Diving Beetle	3	Diving beetles swim using thick, hairy hind legs and clean the water by eating dead insects. They store a supply of air under their wings to breathe underwater and surface to replenish as needed. When they're caught by predators, they release a foul-smelling bluish fluid from their heads in defense.	In freshwater		800	08:00:00	17:00:00	1	f
33	33	units/stinkbug.jpg	Stinkbug	1	Stinkbugs are known for their foul smell, enough to drive away most predators and people. The smell is so strong that if they release it in an airtight place, they pass out from their own smell. They like to gather in clumps to stay warm in sunshine, though they will seek out warm houses as well.	On trees		120	00:00:00	00:00:00	1	f
34	34	units/snail.jpg	Snail	3	Snails are mollusks that live on land and are related to shellfish like clams and oysters. One snail can play the role of both a male and a female, so it can lay eggs all by itself. Newly hatched snails already have a tiny shell, so right from birth they are easily identified. Most species have clockwise spirals on their shells, though spirals that go counterclockwise are possible.	When raining. On flowers, on flowering bushes (Hibiscus Bushes).		250	00:00:00	00:00:00	1	f
36	36	units/bcricket.jpg	Bell Cricket	3	The chirping sound of bell crickets is considered beautiful and tends to represent the coming of fall. This easily recognizable chirping is created when males of the species rub their forewings together. The resulting sound is much higher in pitch than the human voice, so it can't be heard over a phone. 	On the ground		430	17:00:00	05:00:00	1	f
37	37	units/grasshopper.jpg	Grasshopper	2	Grasshoppers are known for their unique songs, but unlike crickets, it doesn't come from their wings. Rather, the chirping sound comes from their rubbing their legs together. They look like a thicker version of locusts, but some species of grasshoppers actually eat locusts.	On the ground		400	08:00:00	17:00:00	1	f
35	35	units/cricket.jpg	Cricket	2	The chirping sound you often hear from male crickets is emitted by the stridulation of their wings. Crickets' ears are located just below the middle joint of each front leg. While this seems odd to us, it helps them easily pinpoint where various sounds are coming from.	Ground		130	17:00:00	08:00:00	1	f
74	65	units/pillbug.jpg	Pill Bug	3	Pill bugs live in moist places, which is why you will commonly find them under rocks and in stumps. When they're touched, they roll into a ball. Oddly enough, they're part of the crustacean family. As such, and since they don't like dry places, they can travel for a short time underwater if need be.	Under rocks		250	00:00:00	00:00:00	1	f
38	38	units/mole.jpg	Mole Cricket	3	Mole crickets live underground in tunnels they dig themselves, moving freely through the soil. Their forelimbs resemble those of moles and are very suitable for the task of digging. They have large wings that allow them to fly, but they can also swim if the need arises. In the past people used to think the noise they made underground was actually coming from worms.	Underground		280	00:00:00	00:00:00	1	f
39	39	units/wleaf.jpg	Walking Leaf	3	Walking leaves look just like real leaves. They're related to walking sticks, which resemble twigs. The females are better at mimicking leaves than the males, though they can't fly. Their mimicking is so thorough that some of them even have fake bite marks on their bodies.	On the ground		600	08:00:00	17:00:00	1	f
40	40	units/wstick.jpg	Walkingstick	1	Walking sticks disguise themselves to confuse predators and are very closely related to walking leaves. They have cylindrical bodies that look like sticks. Some of them can even change their pigmentation. Females can lay eggs without the males, so most of the walking sticks you see are females.	On trees		600	04:00:00	19:00:00	1	f
41	41	units/bugworm.jpg	Bagworm	3	Bagworms are certain moths in caterpillar phase. They stay in cases or cocoons for warmth in winter. They construct their cases by sticking silk threads together between leaves or branches. Females don't have wings, and some simply wait inside their cocoons for males to come by to mate.	When trees are shaken		300	00:00:00	00:00:00	1	f
42	42	units/ladybug.jpg	Spotted Ladybug	2	Despite the name, not all ladybugs are 'ladies.' There are also male ladybugs. Though you'll see different ladybugs with different numbers of spots, they don't get more as they age. Ladybugs eat insects harmful to crops. A few species eat the leaves of crops, but most are beneficial. They're tough against the cold, but during winter they stay in groups under dry leaves for warmth.	On flowers		200	08:00:00	17:00:00	1	f
43	43	units/violin.jpg	Violin Beetle	3	As the name indicates, these bugs resemble violins. They're very thin and roughly five mm thick. They stay on top of fungi on trees and prey upon small bugs that happen by. When predators come near, violin beetles emit a noxious fluid to protect themselves. The fluid is toxic and can be painful if it touches your hands or eyes, so be careful!	On tree stumps		260	04:00:00	17:00:00	1	f
44	101	units/bitterling.jpg	Bitterling	1	These fish are so small, they can fit their entire body in the palm of your hand. During mating season, the male's belly turns a light orange in order to properly attract a mate. They live in rivers and lakes and deposit eggs in large bivalves where the eggs hatch and live for a while.	River	1	900	00:00:00	00:00:00	2	f
45	44	units/longhorn.jpg	Longhorn Beetle	3	Longhorn beetles have very strong mandibles, and both adult and larval forms eat through the bark of trees. They have extremely long antennae that are sometimes even longer than their bodies. The adults have such strong mandibles that they can bite off people's hair. And keep in mind that hair isn't the only thing they'll bite, so be careful when handling them!	On tree stumps		260	23:00:00	19:00:00	1	f
46	102	units/palechub.jpg	Pale Chub	3	These fish are related to carp, with distinguishing features such as long ventral fins and protruding mouths. They have good jumping abilities, which allow them to jump up and grab bugs hanging around the water. They are known as very active fish with rather scrappy attitudes, making them tenacious survivors. During mating season, the male's stomach turns pink and its back turns blue. Females love this.	River	1	200	09:00:00	16:00:00	2	f
47	45	units/tiger.jpg	Tiger Beetle	1	Tiger Beetles are known for their aggressive habits and fast running speed. Their bodies are rather colorful and reflect the sunshine, giving them a shimmery appearance. Tiger-Beetle larvae live in cylindrical burrows and capture insects that wander past with their mandibles.	On the ground		1500	08:00:00	19:00:00	1	f
48	103	units/cruciancarp.jpg	Crucian Carp	1	Crucian carp are fairly easy fish for beginners to catch, but they're also popular with veteran anglers. They are related to koi and can live up to 15 years, making them a great fish to keep in a pond. Male offspring are seldom born, so females significantly outnumber males, making populations suffer. Luckily, females reproduce with males of some other species, so the problem is relatively temporary.	River	2	120	00:00:00	00:00:00	2	f
49	46	units/dung.jpg	Dung Beetle	2	Dung beetles are famous for the exact thing you'd assume they're famous for. In fact, they use their namesake both as a source of food and a place to lay their eggs. Dung beetles are very strong and can roll things 10 times the weight of their bodies. One species can even pull objects 1,141 times its weight, which is like a human pulling 6 packed buses!	Rolling snowballs		800	17:00:00	08:00:00	1	f
50	47	units/roach.jpg	Wharf Roach	2	Wharf roaches can be seen along the sea, usually just above the waterline on rocky cliffs. They feed mainly on microalgae and detritus that drift to the seashore, making them cleaners of sorts. They often move in groups and run away quickly when they hear people approaching.	On the beach		200	00:00:00	00:00:00	1	f
51	104	units/dace.jpg	Dace	1	Dace can live in cloudier, murkier water than most but are easy to see as their numbers are so plentiful. They are related to carp, and some species of face live in the ocean as well as rivers and streams. During mating season, the bellies of the males develop an orange stripe to indicate their intent to mate.	River	3	200	16:00:00	09:00:00	2	f
52	48	units/crab.jpg	Hermit Crab	3	Hermit crabs live in empty shells they can fit their bodies into. As they grow, they find bigger shells. They're quite picky about each new shell and first measure the opening with their claws. The shells they choose usually fit well, and they'll sometimes fight one another over ownership rights.	On the beach (Tortimer Island)		1000	00:00:00	00:00:00	1	f
53	49	units/firefly.jpg	Firefly	1	Both male and female fireflies are capable of producing light from their lower abdomens. This light isn't the same as the light from a lightbulb, though, and isn't hot when you touch it. Fireflies can actually glow when in the egg and larval stages, but that light is comparatively weaker.	Near freshwater		300	19:00:00	04:00:00	1	f
54	50	units/fruit.jpg	Fruit Beetle	1	The fruit beetle has a brilliant-green-colored body and tends to hang around fruit trees. They have a hard outer wing casing and lift this casing when they need to fly using their thin wings. The larvae of fruit beetles feed on decaying vegetable debris and plant roots.	On trees		100	00:00:00	00:00:00	1	f
55	105	units/barbelsteed.jpg	Barbel Steed	2	Barbel steeds have a longer distance between their eyes and mouths than carp do. This makes them look almost like they're averting their eyes downward in embarrassment. Their whiskers aren't as long as carp whiskers, so the resemblance is still only minor. They are full of bones, but they're edible nonetheless and actually taste similar to flounder.	River	3	200	00:00:00	00:00:00	2	f
56	106	units/carp.jpg	Carp	1	These tough fish have very long life spans, capping out at ages surpassing 100 years. Their whiskers are one of their trademark features, making them relatively easy to identify. They're omnivorous and eat waterweed and bugs by sucking their food into their mouths. They also have teeth in the back of their throats that help break down shellfish for digestion.	River	4	300	00:00:00	00:00:00	2	f
57	107	units/koi.jpg	Koi	3	Though typically pale in color, these aquarium fish also can be found with rather beautiful patterns. This is all thanks to very selective breeding of carp with genetic mutations, allowing for diversity. No two koi have the exact same pattern and are popularly known as "swimming jewels" as a result. They can be sold for a very high price, depending on their coloring and pattern. If properly cared for, they can live for over 100 years, making them a staple for outdoor garden ponds.	River	4	4000	16:00:00	09:00:00	2	f
58	108	units/goldfish.jpg	Goldfish	3	These are aquarium fish that came about by selectively breeding types of crucian carp. It took hundreds of years to get the long tail fin and beautiful color of the current breed. Even red goldfish are black when they are young and still retain some other vestiges of the crucian carp. They turn red as they grow, thus gaining their much more commonly known look.	River	1	1300	00:00:00	00:00:00	2	f
59	109	units/popeyedgoldfish.jpg	Popeyed Goldfish	3	They're known for their protruding eyes, as the name indicates, but this feature is actually a detriment. Their vision is quite poor, to the point that they will swim past food and frequently bump into things. They are a type of goldfish and get their distinguishing eye pop about two months after birth.	River	1	1300	09:00:00	16:00:00	2	f
60	51	units/scarab.jpg	Scarab Beetle	3	Scarab beetles have elegant, metallic-looking bodies and are shinier even than fruit beetles. They're so shiny that they're said to gleam like gold. They're very rare and can be sold for high prices. Like all beetles in the scarab family, the outer shell provides a very thick layer of protection from predators. The high value and golden shell do make them more vulnerable when it comes to Bell hunters, though.	On trees		6000	23:00:00	08:00:00	1	t
61	52	units/jewel.jpg	Jewel Beetle	3	Jewel beetles are very pretty insects that show a red line on their green bodies when refracting light. They're so pretty that it's believed people used them for craftwork a long time ago. Their shiny wings are easy to notice, but birds have a hard time targeting them. This is because birds aren't very good at seeing things that change color in different lights.	On trees		2400	08:00:00	16:00:00	1	f
62	53	units/mstag.jpg	Miyama Stag Beetle	2	Miyama stags look strong, with their thick, bumpy exoskeletons and yellow hair covering their bodies. They're active during the day but really don't prefer the heat during the summer. Contrary to their appearance, they are rather delicate insects, so be sure to handle with care.	On trees		1000	00:00:00	00:00:00	1	t
63	54	units/sstag.jpg	Saw Stag Beetle	3	The most distinguishing feature of saw stags are their large, curved jaws. The inner parts of their jaws look like saws, which is how they get their moniker. When they feel vibrations, they stop moving right away and feign death as a defense mechanism.	On trees		2000	00:00:00	00:00:00	1	t
65	56	units/rstag.jpg	Rainbow Stag Beetle	3	Rainbow stags are called the most beautiful of stag beetles because of their metallic-rainbow color.  Not only are their wings a pretty rainbow color, but their bellies are as well.  They are quite laid back, but they can be seen every now and then fighting to protect their territories.	On trees		10000	17:00:00	08:00:00	1	t
66	57	units/cstag.jpg	Cyclommatus	2	Cyclommatus stags are identified by their long pairs of mandibles, which can be as long as their bodies. Their large mandibles are actually already formed when they're in the pupal stage of life. Although these beetles are mostly easygoing, those living in mountains really can't stand the heat.	On palm trees		8000	23:00:00	08:00:00	1	t
67	58	units/gstag.jpg	Golden Stag	4	Golden stags are named after their unique gold color and are highly prized by collectors. They shine like gold when their bodies are dry, but when it's humid, they actually look black. Golden stags have short mandibles that aren't good for fighting, but males sometimes fight for territory. The males are surprisingly friendly to the females, which gives these beetles a likeable quality.	On palm trees		12000	23:00:00	08:00:00	1	t
68	59	units/hd.jpg	Dynastid Beetle	3	Horned dynastids are part of the scarab family. Their horns are actually part of their exoskeleton. Horned dynastids don't have a nose or ears, but they can sense smells with their antennae. They are also able to feel the minor vibrations of sounds traveling in the air using thin hair on their bodies. They are fairly loud when flying, plus they emit a rather sour odor, so they are hard not to notice.	On trees		1350	17:00:00	08:00:00	1	t
69	60	units/ha.jpg	Atlas Beetle	3	Horned atlases, though perhaps not the largest, are still known as the strongest of dynastid beetles. Their 3 horns make them look like a mash-up of a dynastid beetle and a stag beetle! In the pupal stage, they already have 3 horns and tend to be pretty strong.	On palm trees		8000	23:00:00	08:00:00	1	t
70	61	units/he.jpg	Elephant Beetle	4	Horned elephants are some of the heaviest dynastid beetles in the world. The thin yellow hair that covers their bodies makes them rather attractive to mates and collectors. Their horns resemble an elephant raising its trunk, which is how they got their name. They're already big in their larval stage, but by their pupal stage, they are the size of a person's hand.	On palm trees		8000	23:00:00	08:00:00	1	t
71	62	units/hh.jpg	Hercules Beetle	4	Horned herculeses are the largest beetles in the world, reaching over 17 cm in exceptional cases. Their 2 long horns look pretty, but they're powerful and can hurt a lot of you're pinched by them. The longer horn is covered with short, soft yellow hair, which helps them to sense vibrations. The yellow on their bodies turns black when it's humid, making them difficult to spot on humid evenings.	On palm trees		12000	23:00:00	08:00:00	1	t
72	63	units/goliah.jpg	Goliath Beetle	3	Goliath beetles, named after the legendary giant, are among the largest insects in the world. The larvae can weigh four ounces or more. Once mature, they are only half that weight, however. They spend their days flying from tree to tree to feed on tree sap or fruits.	On palm trees		6000	23:00:00	08:00:00	1	t
73	64	units/flea.jpg	Flea	3	Fleas are tiny insects that feed on blood from humans and animals, which then results in an itchy rash. They use their piercing mouths to suck blood while injecting saliva into their host at the same time. Unlike mosquitoes, both males and females suck blood. The females are larger than the males.	On villagers		70	00:00:00	00:00:00	1	f
75	66	units/mosquito.jpg	Mosquito	2	Mosquitoes can easily be found flying around on warm summer nights looking for targets. Only the females feed on blood, and when they do so, they also inject saliva. The saliva is actually what causes the annoying itchy feeling, rather than the bite itself. Mosquitoes detect body heat, sweat, and carbon dioxide, so they are drawn to exercising humans.	Flying		130	17:00:00	04:00:00	1	f
77	68	units/hc.jpg	House Centipede	2	The house centipede has many remarkably long legs that give it a very intimidating appearance. However, despite this intense look, they are for the most part harmless to humans. When an enemy is holding down one of its legs, the house centipede will drop that leg to make an escape. The dropped leg will continue to flail for a while, though, providing a distraction.	Under rocks		250	19:00:00	08:00:00	1	f
78	69	units/centipade.jpg	Centipede	3	Despite the name, centipedes have a varying number of legs, from about 30 to 46 rather than 100. They also have forcipules, which are a modification of the first pair of legs, that inject venom. Centipedes are sometimes used as an ingredient in herbal medicine, though the effect is questionable.	Under rocks		300	16:00:00	23:00:00	1	f
79	70	units/spider.jpg	Spider	1	Spiders emit silk from their spinnerets and use it to create elaborate webs to snag prey. The horizontal threads are sticky to the touch, allowing them to be used as very strong restraints. However, the vertical threads are smooth, allowing spiders to walk on them without getting stuck.	When trees are shaken		300	23:00:00	16:00:00	1	f
80	71	units/tarantula.jpg	Tarantula	4	Tarantulas are large arachnids that live in warm areas. They're sometimes kept as pets. They have sharp fangs and while it is painful if you're bitten by one, they aren't deadly to humans. What's scarier is the hair they kick off of their abdomens to protect themselves. The hair can cause serious itching and rashes wherever it sticks and can be rather difficult to remove.	On the ground		8000	23:00:00	04:00:00	1	f
81	72	units/scorpion.jpg	Scorpion	3	Scorpions resemble crabs and are in the class arachnida, though they aren't aquatic. Most species possess venom, but of the 1,000 or more species, only 25 are deadly to humans. Scorpion eggs hatch inside the female's abdomen, and the young spend time on her back after birth.	On the ground		8000	19:00:00	04:00:00	1	f
76	67	units/fly.jpg	Fly	2	Flies are often seen rubbing their forelegs to clean them, which seems odd, because, well, they're flies. However, they need to keep their legs clean as they contain taste and tactile receptors. By doing so, they can better savor the flavor of whatever they find to eat next. The legs also contain a sticky liquid so flies can more easily land on smooth surfaces.	Rafflesia, Trash, and Spoiled turnips 		80	00:00:00	00:00:00	1	f
82	110	units/killifish.jpg	Killifish	3	Killifish are small, travel in schools, and are known for having eyes higher up on their faces than others. They swim in shallow areas in rivers and mostly eat bugs that float on the surface of the water. This is why they have mouths as high up their faces as their eyes, making them effective hunters. Being the same temperature as the water they inhabit, getting grabbed by warm hands can shock them.	Pond 	1	300	00:00:00	00:00:00	2	f
83	145	units/clownfish.jpg	Clownfish	3	Clown fish spend their lives hiding among the feelers of sea anemones, a place that only they can live. Their homes may be dangerous, but they produce a special coating that protects them from the poison. In exchange for the anemone's protection, the clown fish chases off any parasitic bugs and enemies. Curiously, all clown fish are males when they're young but change into females if necessity demands.	Ocean	1	650	00:00:00	00:00:00	2	t
84	111	units/crawfish.jpg	Crawfish	2	These shrimp relatives are usually found in ponds and rivers, typically making them easy to catch. The reason for this strange habitat is that crawfish are plentiful and will eat just about anything. Eating plant material makes their bodies red, but only eating fish and meat will turn their bodies blue. A red color indicates they are eating a healthy and balanced diet, so red is the ideal for the species.	Pond 	2	200	00:00:00	00:00:00	2	f
85	112	units/softshelledturtle.jpg	Soft-Shelled Turtle	3	These relatives of common turtles will not let go when they decide to bite down on something. Although they can be quite shy, they will become a bit aggressive when threatened. They are often found in water and are very good swimmers because of the flat shape of their shells. They swim with their snouts over the surface of the water so they can breathe. Soft-shelled turtles aren't safe to hold because they are so prone to biting at the slightest movement. However, if one bites down on you, it will usually let go when you put it safely back in the water.	River	3	3750	16:00:00	09:00:00	2	f
86	113	units/tadpole.jpg	Tadpole	3	Tadpoles are nothing more than baby frogs and generally inhabit ponds and streams. Their round heads and quirky style of movement give them a different kind of cuteness from adult frogs. They become more frog-like when they eventually grow legs and start to lose their tails. Unlike fish, though, their skin is very delicate because they do not have scales, so handle carefully.	Pond	1	100	00:00:00	00:00:00	2	f
87	114	units/frog.jpg	Frog	2	These former tadpoles prefer to live near pond and other damp and swampy places. They dwell on land, so they have lungs and skin as opposed to a set of gills. They like to stick close to water because they require a nice, moist lifestyle. Frogs are moist because they emit a liquid to protect their skin from dryness. If too much moisture evaporates from their thin skins, they could have trouble breathing. It's better not to handle frogs, as some species are poisonous, even to the touch!	Pond 	1	120	00:00:00	00:00:00	2	f
88	115	units/freshwatergoby.jpg	Freshwater Goby	3	These short and stocky river-dwelling fish have a lot of slender teeth for tearing apart other fish. Freshwater gobies dig holes under rocks in riverbeds to make nests for eggs, which the males guard. Other fish breeds take advantage of this protective quality and often lay eggs in goby nests.	River	2	300	16:00:00	09:00:00	2	f
90	117	units/catfish.jpg	Catfish	1	Catfish are known for their long whiskers, wide bodies, and large mouths, but they don't have fur. Despite having large eyes, they have rather poor eyesight. They make up for this with sensory whiskers. Catfish have small horizontal and vertical lines in their bodies, almost like perforated lines. These holes are for detecting weak electric currents of other fish, making them adept hunters. Catfish are artful carnivores as they swim around lazily but then strike quickly when prey is found.	Lake	4	800	16:00:00	09:00:00	2	f
92	119	units/giantsnakehead.jpg	Giant Snakehead	3	Giant snakeheads get their name from the fact that their heads look like those of snakes. Their scales and patterns also look like snakes', really bringing the resemblance to a high degree. They have sharp teeth, so don't poke your finger anywhere near their mouths! Both males and females are well known for protecting their eggs and offspring. They will scare off any other fish that approach by frantically waving their tails.	Lake	5	5500	09:00:00	16:00:00	2	f
93	120	units/bluegill.jpg	Bluegill	3	Bluegills have spikes on their dorsal fins o help protect them from enemies and harm. Their offspring actually have a fairly high survival rate when compared to other fish. The males chase away the females and take over protecting the eggs and babies in the nest. Although bluegills are small, they are actually related quite closely to black bass.	River 	2	120	09:00:00	16:00:00	2	f
94	121	units/yellowperch.jpg	Yellow Perch	1	These fish are relatives of sea bass, though they're preyed on by other, larger fish, such as black bass. Their defining features are their large, prickly dorsal fins and gray stripes on pale-yellow bodies. Ice fishing on frozen lakes is a very popular way to catch them in their native United States and Canada. They are often fried before being eaten, which makes them a simple but tasty meal.	River	3	240	00:00:00	00:00:00	2	f
95	122	units/blackbass.jpg	Black Bass	2	They get their name from their somewhat blackish bodies, though they have a green tint. They usually hide in weeds and wait until other fish approach before forcefully striking. Many people use lures to catch black bass because they are such strong fish. Black bass have a fierce image, as the males will scare off other fish to protect the fry in the nest. They are related to sea bass, so they make for a tasty dinner, though their skin has a very strong odor.	River	4	300	00:00:00	00:00:00	2	f
96	123	units/pike.jpg	Pike	3	Pikes are only found in cold water, so they cannot live in warmer parts of the world. They can grow over three feet long and as such are a very popular fish with anglers. Pike have a slightly protruding jaw and large mouths with sharp teeth, making them powerful predators. They use these teeth for tearing apart not only other fish but also birds and other aquatic creatures.	River	5	1800	04:00:00	21:00:00	2	f
97	124	units/pondsmelt.jpg	Pond Smelt	2	Pond smelt are small but vigorous fish that can survive in water of relatively poor quality. Pond smelt are related to salmon and as such have a lot of the same migratory tendencies. Most of them swim from rivers to the ocean and then return to rivers and lakes. However, some of them actually live in lakes that have no connection to the ocean, so they don't migrate. They have small fins and are perfect for eating whole as tempura or grilled on barbecues.	River	2	300	00:00:00	00:00:00	2	f
98	125	units/sweetfish.jpg	Sweetfish	1	Sweetfish are migratory fish born upstream that travel to the ocean and then return to rivers to spawn.''This migratory mind-set is what emphasizes their similarity to salmon. Adult sweetfish have a watermelon-like mossy smell when caught, since they eat moss on riverbed rocks. Sweetfish are very territorial and will attack rivals that encroach on their territory. Anglers use this combative nature against them by using lures made of other sweetfish.	River	3	900	00:00:00	00:00:00	2	f
102	129	units/stringfish.jpg	Stringfish	4	Stringfish live in cold rivers, can grow to over a yard long, and are stout and bulky like logs. They live up to 20 years but grow so slowly that it takes them 15 years to reach full maturity. They are called 'phantom fish' because there are so few of them. Adults are particularly hard to find.	River	6	15000	16:00:00	09:00:00	2	f
91	118	units/eel.jpg	Eel	1	Eels are born in the ocean but swim upstream through rivers when they become adults. They do, however, eventually swim back to the ocean when it is time to lay eggs. Their blood can be toxic, which is why you've never heard of eel sashimi. It's just to dangerous. Cooked eel, however, is edible and has no poisonous effects to speak of, making it a popular dish. For a long time, the egg-laying locations and habits of eels were largely a mystery. However, they are gradually being revealed through research, making eels a very hot topic of study.	River 	narrow	2000	16:00:00	09:00:00	2	f
99	126	units/cherrysalmon.jpg	Cherry Salmon	3	The spotted pattern on cherry salmon serves as camouflage and is rather common in all salmon. Most cherry salmon spend their lives in rivers, but some do migrate to the ocean to fully mature. They are popular with anglers because of their well-balanced physique and beautiful patterns. Plus, their nervous nature makes them a good challenge to catch, which just adds to the fun.	River	3	1000	00:00:00	00:00:00	2	f
100	127	units/char.jpg	Char	3	Char are related to salmon and live in rivers upstream, not generally migrating to the ocean. They prefer colder water and dwell in secluded, clear rivers deep in mountain ranges. Since they tend to hide mostly in between rocks in these cold areas, they can be rather difficult to spot.	Waterfall 	3	3800	16:00:00	21:00:00	2	f
101	128	units/rainbowtrout.jpg	Rainbow Trout	1	When rainbow trout get bigger, they develop a pretty pink band from their gills to their tails. Some of them spend their entire lives in rivers, while others live in the ocean. Steelhead trout are a unique type of rainbow trout that live in the ocean and return to freshwater to spawn. Rainbow trout are a major species of fish, but finding them in the wild is actually fairly rare.	River	4	800	00:00:00	00:00:00	2	f
103	130	units/salmon.jpg	Salmon	2	Salmon are popular migratory fish that are born in rivers, migrate to oceans, and return in four years. In Japan, flavored salmon eggs are a very popular dish called ikura, but it hasn't caught on in the US. In rare cases, salmon will only stay in the ocean for one or two years before coming back. These fish are known as "phantom salmon" since they're so hard to find in the wild. Their characteristic pink color comes from the shrimp and krill they get in their diet. If they ate differently, their flesh would be white. Salmon only spawn at the bottom of the waterfall where the lake meets the ocean.	Waterfall	5	700	00:00:00	00:00:00	2	f
104	131	units/kingsalmon.jpg	King Salmon	3	King salmon grow to about twice the size of regular salmon, which really helps them embody the name. This size essentially makes them the actual kings of salmon, though they are also called chinook salmon. In some regions, they return to the river in spring or summer and live there until spawning in the fall. In rare cases, king salmons' meat will be white, but these are not as popular since pink is the standard.	Waterfall	6	1800	00:00:00	00:00:00	2	f
105	132	units/mittencrab.jpg	Mitten Crab	3	Officially known as the mitten crab, they also go by the name "shanghai crab." They are commonly used in Chinese dishes, which is how most people become familiar with them. Their breeding habits are the complete opposite of salmon in that they hatch in the ocean first. They then move up rivers when they reach adult size, returning to the ocean in order to spawn.	River	2	2000	16:00:00	09:00:00	2	f
106	133	units/guppy.jpg	Guppy	3	Guppies are tropical fish that are related to killifish and live in warm rivers. They are popular fish that have been bred to have beautiful flowing tail fins. Mother guppies give birth to their babies after the eggs hatch in their bellies. They give birth at a rate that's nearly constant, so their population tends to grow rather quickly.	River	1	100	09:00:00	16:00:00	2	f
107	134	units/nibblefish.jpg	Nibble Fish	3	The official name given to this warm-water-dwelling species of fish is "Garra rufa." They are omnivorous, as they both eat algae and scrape the skin off other fish. All you'd have to do to feed them is stick your hand in the tank; they would live off your dead skin. That's why they're called nibble fish. They exfoliate but don't have any teeth, so it doesn't hurt at all!	River	1	1500	09:00:00	16:00:00	2	f
108	135	units/angelfish.jpg	Angelfish	3	These tropical fish move very gracefully because of long fins on their backs and underbellies. Males and females are almost impossible to tell apart, making identification tricky. They lay eggs among water plants. Both genders look after the babies while they cling to weeds. The young look like any other fish, but they gain their angelfish looks once they leave the weeds.	River	2	3000	16:00:00	09:00:00	2	f
109	136	units/neontetra.jpg	Neon Tetra	3	Neon tetras get their names from the beautiful blue metallic line on their bodies. Although their shy, gentle fish, surprisingly they're related to piranha, though very distantly. They have very sharp and narrow teeth, an odd contrast to their beauty. They are delicate fish who tend to be very sensitive to the cleanliness and temperature of water.	River	1	500	09:00:00	16:00:00	2	f
110	137	units/piranha.jpg	Piranha	3	They have terrifyingly sharp teeth, which contributes to their ferocious reputation. Oddly enough, they are actually quite timid, though they are still very dangerous fish. If they can't find food, they will resort to cannibalism or tear apart any animal they can grab hold of. Take care when catching them so they don't end up biting your hand with their sharp teeth!	River	2	2500	09:00:00	04:00:00	2	f
111	138	units/arowana.jpg	Arowana	3	Arowanas are ancient fish that have remained basically unchanged for 100 million years. They are known for their large scales and the hair that sticks out from their lower lips. They have a remarkable jumping ability and can leap over a yard above the surface of the water. Males protect their babies by keeping them in their mouths and releasing them once they reach a certain size.	River	4	10000	16:00:00	09:00:00	2	f
112	139	units/dorado.jpg	Dorado	4	Dorado means "golden" in Spanish. As the name would indicate, these fish are gold and have black dots. They look like salmon but are very toothy, carnivorous, and related to piranha. They're such ferocious fish that other fish regularly flee from them, fearful of becoming a snack. Their ferocious natures and power make them a prize catch among anglers.	River	5	15000	16:00:00	09:00:00	2	f
113	140	units/gar.jpg	Gar	3	Their long faces and large mouths make them look like alligators. Some can grow up to three yards. They are ancient fish that haven't changed since they first appeared millions of years ago. They breathe not only through gills, but also by sticking their mouths above the surface of the water. Gar eggs are poisonous, so people all over the world are advised not to eat them -- no exceptions.	Lake	5	6000	16:00:00	09:00:00	2	f
114	141	units/arapaima.jpg	Arapaima	3	Arapaima, at over two yards long, are one of the largest freshwater-fish breeds in the world. They've been around for over 100 million years, making them rather ancient fish as well. They breathe through gills but also with an air bladder used by poking their mouths above water. They have hard,coarse tongues that are used to break down the smaller fish they eat.	River	6	10000	16:00:00	09:00:00	2	f
115	141	units/saddledbichir.jpg	Saddled Bichir	3	The cool-looking saddled bichir are ancient fish with spiky fins on their backs. Though they've been around for more than 400 million years, they remain relatively unchanged. They have big appetites and will wait to ambush any fish they think will fit in their mouths. They can grow up to 30 inches long, making them rather large fish indeed. They swim slowly in a way that gives them the appearance of walking like dinosaurs.	River	5	4000	21:00:00	04:00:00	2	f
116	143	units/seabutterfly.jpg	Sea Butterfly	3	Sea butterflies go with the flow, as they'll drift in cold winter waters along with ice floes. They are called "ice-floe angels" because of the mysterious way they swim with their winglike arms. Their heads will open up when they make an attempt to catch their helpless prey. Once its head is opened, it grabs its prey with six special feelers called "buccal cones".	Ocean	1	1000	00:00:00	00:00:00	2	f
117	144	units/seahorse.jpg	Seahorse	3	Sea horses don't look like fish, but they still share a lot of distant connections. They use their small dorsal fins and tail fins to swim, but in actuality they're pretty bad swimmers. They wrap their tail fins around seaweed or coral so they won't float away with the current. Once attached they feed on plankton and small shrimp that float by. The female deposits eggs in the male's pouch, putting the burden of child care on the male.	Ocean	1	1100	00:00:00	00:00:00	2	t
118	146	units/surgeonfish.jpg	Surgeonfish	3	These tropical fish sport beautiful, yellow, traingular tails and elegant black lines on dazzling blue bodies. Personalitywise, the surgeonfish is actually rather laid back and timid. They seek out gaps in coral or between rocks for the greatest amount of protection while sleeping. 	Ocean	2	1000	00:00:00	00:00:00	2	t
120	148	units/napoleon.jpg	Napoleonfish	3	Called Napoleonfish, these fish also have the more accurate name of humphead wrasse. The true name comes from the distinctive humps on their heads. But "Napoleonfish" is more popular. When small, all Napoleonfish are females, but some become males as they age and their humps grow. Their bodies also turn a bluer shade as they mature and become males, making identification simple. Their bulky bodies, which can get to about six feet long, still glide easily through warm tropical seas. Finding these fish is a real treat for divers, as they're stunning to see - and it's a great story to tell.	Ocean	6	10000	04:00:00	21:00:00	2	t
119	147	units/butterflyfish.jpg	Butterfly Fish	3	Butterfly fish are considered very cute pets, popular because of their beautiful nature. They glide through the warm seas by flapping their yellow bodies as if they were butterflies. Their diets are surprisingly hardy, as they gobble coral and poisonous anemones using narrow mouths. Butterfly-fish couples have been known to live together for 10 years or more. Often they can be seen swimming around in pairs. You'll likely never find a better underwater romance.	Ocean	2	1000	00:00:00	00:00:00	2	f
121	149	units/zebraturkeyfish.jpg	Zebra Turkeyfish	1	Zebra turkeyfish have long, beautiful fins that flow like gowns as they swim through the sea. However, these aquatic beauties pack a punch, as their fins are filled with poisonous spikes. Aside from protection against predators, this poison comes in handy for turn wars between males. The losing male succumbs to the poison in a matter of days, making these battles life and death.	Ocean	3	400	00:00:00	00:00:00	2	t
158	213	units/seastar.jpg	Sea Star	2	These star-shaped creatures have hundreds of tiny feet attached to their mobile arms. This allows them to slowly walk and open shellfish for food, making them effective predators. If an arm gets caught and ripped off by another predator, the sea star's arm will just grow back. Some sea stars eat by extending their stomachs out of their mouths to trap and then digest prey.	Ocean	2	100	00:00:00	00:00:00	3	t
123	150	units/blowfish_7ohU3Lc.jpg	Blowfish	3	Blowfish are concidered a delicacy, famous for their tempting taste despite being highly poisonous. Blowfish are not poisonous at birth, though, which makes young ones relatively safe for consumption. It's only once they have ingested enough microbes from seawater and food that they become poisonous. When they feel threatened, they suck in air and water to blow themselves up like balloons. This makes them too big to eat without predators being forced to chomp down on their posion quills.	Ocean	3	125	21:00:00	04:00:00	2	f
124	151	units/pufferfish.jpg	Puffer Fish	3	As expected, all puffer fish are covered in spines. While related to the blowfish, they are not poisonous. Exaggerated claims about the fish say they have 1,000 spines; the true number is between 300 and 400. When threatened, they suck in water and air to puff themselves up in order to intimidate enemies.	Ocean	3	240	21:00:00	04:00:00	2	f
125	152	units/horsemackerel.jpg	Horse Mackerel	2	With their appealing flavor, horse mackerel have long been a cheap and common food source. However, in certain regions, they have actually been branded as something of a luxury dish. They have tough scales on both sides of their bodies that must be removed before preparing. Though small, they are formidable carnivores. Since they go after bait, they are popular with fishers.	Ocean	2	150	00:00:00	00:00:00	2	t
126	153	units/barredknifejaw.jpg	Barred Knifejaw	3	Barred knifejaws stand out thanks to the seven stripes adorning their white bodies. Their natural curiosity and strong pull make them a popular target of anglers, but they're no easy catch. They have strong teeth that allow them to make short work of sea creatures with tough shells. This means that both urchins and mollusks need to be careful, lest they become meals for these fish.	Ocean	3	5000	00:00:00	00:00:00	2	t
127	154	units/seabass.jpg	Sea Bass	1	Whoa there! This is no bass! Well, OK, technically, it is a bass. But...not the right kind of bass at all! And I hate to yell you, but we're only accepting ONE type of bass in this tourney. I WOULD take a dish of miso-glazed sea bass if you had that handy. Yup! Nyuuuk nyuk nyuk nyuk! So, do you think I could, you know, possibly, maybe just keep this? Huh?	Ocean	5	200	00:00:00	00:00:00	2	t
128	155	units/redsnapper.jpg	Red Snapper	3	Red snappers are gregarious fish that often form schools close to reefs and shipwrecks. They are a prized food fish, but because of demand, other species are often served as "red snapper". They usually live up to 50 years. The oldest recorded red snapper was thought to be 57.	Ocean	3	3000	00:00:00	00:00:00	2	t
129	156	units/dab.jpg	Dab	1	Dabs generally have both eyes on the right side of their body, though there are some exceptions. Both types of dabs begin in infancy with an eye on each side of their body. As dabs grow, the eye on the left migrates to the right, though sometimes it doesn't move at all. Dabs dig in the sand to hide, which allows their eyes to stick up a bit to watch for danger. Because they live off of bugs and small creatures, their mouths are small, containing narrow, dull teeth.	Ocean	3	300	00:00:00	00:00:00	2	f
130	157	units/oliveflounder.jpg	Olive Flounder	3	Olive flounders are rather flexible whitefish that have both eyes on the left side of their body. They can reach three feet in length and are commonly mistaken for dabs, a close relative. When young, they have an eye on each side, but as they age, their right eye migrates to their left side. These carnivorous fish can change color to camouflage themselves on the seabed as they wait for prey.	Ocean	4	800	00:00:00	00:00:00	2	f
131	158	units/squid.jpg	Squid	3	People assume squids have legs, but those are actually arms. There are 10 in all; two are used to grab prey. To swim, they twist their fins and expel water from inside their bodies to allow for fluid motion. The ink they shoot when threatened forms into the shape of a squid, acting as a sort of body double.	Ocean	3	400	00:00:00	00:00:00	2	t
132	159	units/morayeel.jpg	Moray Eel	3	Moray eels can often be seen sticking just their heads out from between two rocks. When unsuspecting prey approaches, the dart out to snatch it up into their sharp-toothed mouths. Once moray eels have their teeth in you, it's hard to get away, making moray-eel bites no trifling matter. Their long, finless bodies are covered in tough, snakelike skin that often gets used as leather.	Ocean	5	2000	00:00:00	00:00:00	2	t
133	160	units/ribboneel.jpg	Ribbon Eel	3	Ribbon eels have long, ribbonlike bodies and look as if they have flowers sprouting from their noses. They get their name from their bright, vivid color, in addition to the length of their bodies. Ribbon eels hatch sexless before first becoming males, then females as they age. Their tendency to stick their heads out from holes in the sand and open their mouths is not a sign of anger. In actuality, they're merely taking a breath. Oddly, they're surprisingly peaceful creatures, despite the look	Island	narrow	600	00:00:00	00:00:00	2	t
134	161	units/footballfish.jpg	Football Fish	3	Football fish live in parts of the ocean so deep that light does not reach them. Their lanterns, which they sway back and forth to lure prey, can emit light thanks to special bacteria. When prey gets near, they shoot a luminescent liquid and snatch the prey while it's blinded by the light. Only females possess the useful lantern. They can grow to be about two feet by maturity. Males are small, less than two inches in length.	Ocean	4	2500	16:00:00	09:00:00	2	f
135	162	units/tuna.jpg	Tuna	3	Tuna can reach almost 10 feet in length and weigh over 800 pounds, which is huge in the fish world. Combining this great size with their good flavor makes them literally the biggest catch for most anglers. Tuna can't breathe when they aren't moving, so their entire lives revolve around constantly swimming. To sleep, they merely slow down. This ability to swim while sleeping is a huge advantage. They're also rather fast, capable of beating both sets of fins so hard they reach speeds of 50 mph.	Ocean	6	7000	00:00:00	00:00:00	2	f
136	163	units/bluemarlin.jpg	Blue Marlin	3	Blue marlins are famous for their long, swordlike noses that give them the nickname "swordfish." They use their "swords" to knock out their prey before capture, not skewering it as you'd think. Able to swim as speeds above 60 mph, their speed and power make them a true test for any angler.	Ocean	6	10000	00:00:00	00:00:00	2	t
137	164	units/gianttrevally.jpg	Giant Trevally	3	Though you wouldn't guess it because of their size, giant trevallys are actually a type of mackerel. Unlike normally slim and sleek mackerels, giant trevallys have wide, sliver bodies. Surprisingly, though, these fish cannot tolerate the cold, so they tend to live in warmer places. Their jaw strength is great enough to bite off a person's finger, so be very careful when fishing for them!	Island	5	4500	00:00:00	00:00:00	2	t
138	165	units/ray.jpg	Ray	3	Beating their large fins up and down to move through the water gives the rays the impression of flying. If viewed from below, rays appear to have their mouths curled up into a sort of smile. Some varieties have poisonous spikes at the base of their long tail fins that can be fatal to humans. This, combined with the ability to hide in sand at the bottom of the sea, can make them very dangerous.	Ocean	5	3000	04:00:00	21:00:00	2	t
139	166	units/oceansunfish.jpg	Ocean Sunfish	3	Ocean sunfish are a relative of blowfish that can reach up to two tons in weight. Lacking a tail fin, they cannot swim particularly quickly, which is an odd bit of anatomical detriment. The number of eggs they can lay is the most in the world at over 300 million. However, out of that 300 million, only one or two fish will ultimately survive. Ocean sunfish sometimes like to bob up and down on the surface of the ocean. This gives them the appearance they're sunbathing, which helps to make them a popular breed of fish.	Ocean	fin	4000	04:00:00	21:00:00	2	t
140	167	units/hammerheadshark.jpg	Hammerhead Shark	3	The hammerhead shark is a shark with a head like a hammer, which is what you'd expect. However, despite being sharks, they are actually fairly laid back, which is not what you'd expect. With their eyes positioned on the two ends of their "hammer," they can see in almost all directions. Oddly, their nose holes are located right next to their eyes on their hammer section. They have a number of small holes on the front and lower portions of their heads as well. These holes allow them to detect prey, even fish hiding below them and out of sight. While they eat a nice array of fish, it seems that rays are their favorite source of food. Rays, beware!	Ocean	fin	8000	16:00:00	09:00:00	2	t
141	168	units/shark.jpg	Shark	3	The triangular teeth of sharks appear to have evolved from scales sometime in the past. When a tooth breaks, it quickly falls out and a new one grows in, keeping them always in good shape for prey. Sharks can be fearsome creatures, able to smell blood from several miles away. They can even jump out of the water to catch prey, making them powerful predators. Contrary to their tough image, their bones are made out of cartilage and erroneously used as health food.	Ocean	fin	15000	16:00:00	09:00:00	2	t
142	169	units/sawshark.jpg	Saw Shark	3	Saw sharks got their name from their long head lined with spike-like teeth much like a chain-saw blade. Sensors located below their mouths detect prey as they press their flat bodies against the seabed to search. They will sometimes swing their 'saws' wildly amid a school of fish, catching any that are struck.	Ocean	fin	12000	16:00:00	09:00:00	2	t
144	171	units/oarfish.png	Oarfish	3	Oarfish are deep-sea-dwelling fish with long, thin, silver bodies and one red fin lining their backs. They can reach lengths of over 10 yards, making them huge and striking fish. They usually swim by twisting their long, thin bodies, but they can also swim in more vertical positions. Their mouths are small compared to their bodies and they have no teeth, so they're large but not imposing.	Ocean	6	9000	00:00:00	00:00:00	2	f
145	172	units/coelacanth.jpg	Coelacanth	4	Coelacanths are ancient fish once believed to be extinct but recently discovered around South Africa. Called "living fossils," they have apparently changed very little over the past 400 million years. They can live for over 60 years and reach lengths of six feet but have rather small brains, even for fish. They have more fins and harder scales than the average fish, making them a rather resilient breed. Their flavor is very different from most fish, and they contain a fat that is indigestible by humans. It's for that second reason that eating them really isn't highly recommended.	Ocean (Rain/Snow)	6	15000	16:00:00	09:00:00	2	t
143	170	units/whaleshark.png	Whale Shark	3	Whale sharks are the world's largest fish, but they're surprisingly some of the gentlest. They can swim at only three mph, so although they're large and very imposing, they're not really a threat. They swim with their mouths open to swallow vast quantities of tiny creatures and sea water. As they expel the water through their gills, they will eat what then remains. Since they don't have to bite prey their teeth are file-like and number about 10,000 in multiple rows.	Island	fin	13000	00:00:00	00:00:00	2	t
146	201	units/seaweed.jpg	Seaweed	2	Seaweed can be over three feet long. When its spores attach to rocks, they take root and grow. Seaweed is naturally brown but turns to the dark-green color we associate it with when cooked. It tends to spoil easily when picked, so various preservation methods have been developed as a necessity. Such methods of preservation are sprinkling ash and drying it out, or boiling it and adding salt.	Ocean	4	200	00:00:00	00:00:00	3	t
148	203	units/seaurchin.jpg	Sea Urchin	2	Sea Urchins are a close relative of both the starfish and sea cucumbers and are assumed to be stationary. In actuality, they are capable of walking thanks to the many skinny legs they have between their spikes. They feed on seaweed on the ocean floor using their strong mouths located on their undersides. They are rich in nutrients but also have a lot of cholesterol, so take care not to eat too much.	Ocean	2	800	00:00:00	00:00:00	3	t
147	202	units/seagrapes.jpg	Sea Grapes	2	Sea grapes are small spheres attached to slender stems on branches, similar to normal grapes. However, despite looking like and being called "grapes," they aren't much like the land-based variety. They grow in warm oceans and are very susceptible to cold conditions, meaning refrigeration is difficult.	Ocean	2	100	00:00:00	00:00:00	3	t
149	204	units/acornbarnacle.jpg	Acorn Barnacle	2	They attach to hard places, and though they looks like bivalves, they are related to shrimp and crab. Some species are even edible and have a very crab-like taste to them, making it a fine delicacy. Young acorn barnacles come from eggs, do not have shells, and float around the ocean like shrimp. They gradually develop their shells as they grow into the image we usually see.	Ocean	1	200	00:00:00	00:00:00	3	t
151	206	units/turbanshell.png	Turban Shell	3	They are related to spiral shells. Also, they have lids that cover the openings of their shells. When they walk, they remove the lid and move in the shell by shuffling their feet, much like snails. They become active at night and eat seaweed. They are delicious when cooked in the shell.	Ocean	2	300	16:00:00	09:00:00	3	f
152	207	units/abalone.jpg	Abalone	3	Abalones grow less than an inch a year, so it takes several years for them to grow to full size. They are related to ear shells and have been used in celebrations and offerings since ancient times.	Ocean	3	100	16:00:00	09:00:00	3	t
153	208	units/earshell.jpg	Ear Shell	3	They resemble young abalone, as they are directly related to them, though they act more like snails. They live in various habitats, but being snaillike, they actually have feelers to get around the ocean. 	Ocean	2	300	16:00:00	09:00:00	3	t
165	220	units/spinylobster.jpg	Spiny Lobster	4	The representative species for all large Lobsters, they've become a lasting symbol of longevity. They live between rocks in shallow waters with octopuses as their natural enemies. Only Octopuses are capable of reaching in between the rocks with their long arms to catch them.	Ocean	4	3000	21:00:00	04:00:00	3	f
157	212	units/seaanemone.jpg	Sea Anemone	2	Sea anemones make their homes by attaching to rocks and coral on the bottom of the sea. They use their venomous tentacles to stun fish and shrimp to the point of paralysis and then devour them. The only species of fish with a natural resistance to the venom is the clown fish. Sea anemones and the clown fish nesting in their tentacles make for a rather striking ocean-floor sight.	Ocean	3	100	00:00:00	00:00:00	3	t
163	218	units/sweetshrimp.jpg	Sweet Shrimp	3	Also called "northern shrimp," they have a life span of about 5 years, in which they are male for half. After that time, the shrimps change genders and become females, a rather unique feature of the species. The females are a popular sashimi dish, but they don't instantly have their characteristic sweetness. That sweetness actually comes out after they're left to sit for a day, making them a dish of patience.	Ocean	2	650	16:00:00	09:00:00	3	f
160	215	units/seaslug.jpg	Sea Slug	2	Although they have no shells, sea slugs are more closely related to spiral shells than anything else. Their vivid colors and patterns and variety of shapes and sizes make them popular with divers. Sea slugs are hermaphrodites, so they are all capable of mating with one another, regardless of gender.	Ocean	2	200	00:00:00	00:00:00	3	t
161	216	units/flatworm.jpg	Flatworm	3	Flatworms are flat creatures, and while some types look like sea slugs, they have little else in common. Some types are venomous and produce a poison similar to the kind blowfish are famous for. Flatworms are hermaphrodites and mate by fighting to determine the loser, who then bears the eggs.	Ocean	2	200	16:00:00	09:00:00	3	t
162	217	units/mantisshrimp.jpg	Mantis Shrimp	3	Mantis shrimp have long, sickle-shaped legs and thick carapaces covering both their bodies and tails. They strike captured prey with claws powerful enough to crack the shells of even the toughest crabs. They are a popular dish with fans of seafood, though females with eggs are worth more than males.	Ocean	2	1250	16:00:00	09:00:00	3	t
150	205	units/oyster.jpg	Oyster	3	Oysters are sometimes referred to as "the milk of the sea" because of their high nutritional value. Young oysters come from eggs, attach themselves to hard places in the ocean, and then grow. They can change gender, allowing them to reproduce regardless of their neighbors' genders	Ocean	2	400	00:00:00	00:00:00	3	f
154	209	units/clam.jpg	Clam	3	Bivalves shaped like chestnuts, they live in shallow waters and hide in sand when predators approach. They secrete a viscous liquid that gets pulled along by the current and enables long-distance travel. They are popular both roasted in the shell and cooked in a variety of soups and chowders.	Ocean	2	400	00:00:00	00:00:00	3	f
155	210	units/pearloyster.jpg	Pearl Oyster	3	Pearls are formed when mostly calcium carbonate and protein envelop foreign substances. Pearl oysters have numerous threadlike feet sticking out from their shell opening. These allow them to latch on to surrounding rocks and are actually surprisingly strong. Their adductor muscles are edible and are considered a delicious ingredient in some foods.	Ocean	2	1600	00:00:00	00:00:00	3	f
159	214	units/seacucumber.jpg	Sea Cucumber	2	Sea cucumbers are similar to sea urchins and sea stars but are far more slender and softer. When threatened by a predator, they expel part of their internal organs as a natural defense. This is to blind and entangle the enemy so the sea cucumber has a window of escape. Some types of sea cucumbers allow predators to feed on their internal organs while they escape. Don't shed a tear for them, though as the internal organs grow back after a while.	Ocean	3	150	00:00:00	00:00:00	3	f
156	211	units/scallop.jpg	Scallop	4	Scallops inhabit the cool ocean bed. They swim by rapidly clapping together their shell valves. The black does on scallops, known as wavy "strings," are actually their eyes. These eyes number over 80 but only really function as a means to sense light rather than motion. Often grilled and buttered, scallops have become a tasty seafood enjoyed all over the world.	Ocean	3	1000	00:00:00	00:00:00	3	t
166	221	units/lobster.jpg	Lobster	3	Lobsters live in the ocean, have large, powerful claws, and are closely related to crawfish. They are a delicacy, also known by the names "crawfish of the sea" or "homard", their french name. However, unlike crawfish, they are much bigger and can live for more than a hundred years. Lobsters are aggressive and will pinch with their claws if you don't properly bind them while handling.	Ocean	4	2500	00:00:00	00:00:00	3	t
167	222	units/snowcrab.jpg	Snow Crab	3	Snow crabs live in the deep sea and are know mostly as a highly prized winter delicacy. When cooked, the typically dark-red shell turns to the beautiful bright-red color most commonly seen. They have a life span of 20 years and gradually grow bigger while periodically molting. If a leg is lost, it will grow back when molting occurs. The female is about half the size of the male.	Ocean	4	4000	00:00:00	00:00:00	3	f
168	223	units/horsehaircrab.jpg	Horsehair Crab	3	Horsehair crabs get their name from their spiky hairs, which can hurt, though they have soft shells. They inhabit the bottom of fairly shallow waters, with their biggest predator being the octopus. They camouflage themselves by putting dirt on their hair so they don't stand out in the sand. Their shells house a tasty portion of innards, so this species is a favorite of those who enjoy crab.	Ocean	3	4000	00:00:00	00:00:00	3	f
169	224	units/redkingcrab.jpg	Red King Crab	3	These are one of the most popular and sought-after species of crab in the world. They have eight legs, including their claws, but also two small legs under their carapace, making 10 in all. At full size, their leg span can easily reach more than one yard wide, making them big ocean dwellers. Their thick legs are packed with meat, making them a prized catch for many fishers around the world.	Ocean	4	6000	00:00:00	00:00:00	3	f
172	227	units/spottedgardeneel.jpg	Spotted Garden Eel	2	Spotted garden eels get their name from the black spots on their otherwise white bodies. They nest in the sandy seafloor and poke their heads out to catch the plankton drifting in the current. They're rather shy, as they quickly dart back into their hole at the slightest hint of danger.	Ocean	2	600	00:00:00	00:00:00	3	t
173	228	units/chamberednautilus.jpg	Chambered Nautilus	3	These creatures are related to both octopuses and squids and originated about 60 million years ago. They have air and body fluid in their shells and move by adjusting the amount of body fluid inside. This allows them to either float or sink depending on the situation they find themselves in. They have nearly 90 tentacles that can stick out from under their shells to grab on to rocks or prey.	Ocean	3	900	00:00:00	00:00:00	3	t
174	229	units/horseshoecrab.jpg	Horseshoe Crab	3	Horseshoe crabs are called "living fossils," as they have not evolved since the age of the dinosaurs. Their backs are covered by a hard shell, forming a simple silhouette with their flat backs and long tails. Though referred to as crabs, they're actually more closely related to spiders and scorpions.	Ocean	3	1500	21:00:00	04:00:00	3	f
175	230	units/giantisopod.jpg	Giant Isopod	3	Giant isopods are related to pill bugs, and they can grow up to 20 inches long. They are scary looking but still come across as humorous for some odd reason. Despite their roly-poly builds, they are surprisingly fast swimmers, making them rather agile. They have big appetites, gaining the title "sea cleaners" mostly because they eat dead fish on the seafloor.	Ocean	3	9000	00:00:00	00:00:00	3	t
164	219	units/tigerprawn.jpg	Tiger Prawn	3	These shrimp inhabit shallow areas of the sea and are nocturnal, hiding under sand during the day. By night, they go out and hunt shellfish before returning to the safety of their sand. Unlike other shrimp, they don't carry their eggs around with them in their abdomen. They are famous for being a tasty variety of shrimp and are perfect for tempura and sushi.	Ocean	2	1600	00:00:00	00:00:00	3	t
170	225	units/spidercrab.jpg	Spider Crab	4	Known for their long legs, adult male spider crabs can have leg spans of over three yards. This actually makes them the largest species of crab in the world. They are thought to have lived in ocean bottoms for tens of millions of years without changing shape. Their vivid-orange bodies feature white spots, making their coloration truly beautiful.	Ocean	5	10000	00:00:00	00:00:00	3	f
64	55	units/giantstagbeetle.jpg	Giant Stag Beetle	3	Giant stags are huge stag beetles with one tooth in each side of their large jaws. They're very territorial but careful at the same time, so they usually hide in holes in trees. They have a long life span. Records show that some have lived up to five years. They're very popular among collectors as pets, so they commonly fetch a high price.	On trees		10000	23:00:00	08:00:00	1	t
89	116	units/loach.jpg	Loach	2	Loaches are rather small fish that make their habitats in rivers and muddy water. They have 10 whiskers around their mouths with taste buds built in for tasting sweetness and bitterness. Loaches can breathe through their intestines as well as their gills - a rather unique quality of the species. They push their mouths above the surface of the water to inhale, exhaling through their tail regions. Making stew with loaches and burdock root is known to improve stamina, or so people believe.	River	2	300	00:00:00	00:00:00	2	f
171	226	units/octopus.jpg	Octopus	3	Many people think octopuses have eight legs, but those are not legs. Their tentacles are actually arms. They have a strange anatomy, with their head located between their body and arms. The flexible arms are perfect for catching all kinds of crab, shrimp, and shellfish, especially in reefs. When attacked by predators, octopuses emit a black ink that spreads through the water. This greatly reduces visibility and allows them to escape, making them highly skilled at disappearing.	Ocean	3	1000	00:00:00	00:00:00	3	t
\.


--
-- Name: encyclopedia_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('encyclopedia_unit_id_seq', 175, true);


--
-- Data for Name: encyclopedia_unit_months; Type: TABLE DATA; Schema: public; Owner: ac_admin
--

COPY encyclopedia_unit_months (id, unit_id, month_id) FROM stdin;
1	1	9
2	1	3
3	1	4
4	1	5
5	1	6
6	2	9
7	2	3
8	2	4
9	2	5
10	2	6
11	3	3
12	3	4
13	3	5
14	3	6
15	3	7
16	3	8
17	3	9
25	4	3
26	4	4
27	4	5
28	4	6
29	4	7
30	4	8
31	4	9
32	5	9
33	5	10
34	5	11
39	6	8
40	6	9
41	6	6
42	6	7
43	7	8
44	7	9
45	7	6
46	7	7
47	8	8
48	8	9
49	8	5
50	8	6
51	8	7
52	9	3
53	9	4
54	9	5
55	9	6
56	9	7
57	9	8
58	9	9
59	10	8
60	10	9
61	10	5
62	10	6
63	10	7
64	11	8
65	11	9
66	11	6
67	11	7
68	12	3
69	12	4
70	12	5
71	12	6
72	12	7
73	13	1
74	13	2
75	13	3
76	13	4
77	13	5
78	13	6
79	13	7
80	13	8
81	13	9
82	13	10
83	13	11
84	13	12
85	14	5
86	14	6
87	14	7
88	14	8
89	14	9
90	14	10
91	14	11
92	15	8
93	15	9
94	15	10
95	15	11
96	16	8
97	16	9
98	17	4
99	17	5
100	17	6
101	17	7
102	17	8
103	17	9
104	17	10
105	17	11
106	18	4
107	18	5
108	18	6
109	18	7
110	18	8
111	18	9
112	18	10
113	18	11
114	19	8
115	19	7
116	20	8
117	20	7
118	21	8
119	21	7
120	22	8
121	22	9
122	22	7
123	23	8
124	23	7
125	24	8
126	24	7
127	25	8
128	25	9
129	25	6
130	25	7
131	26	9
132	26	10
133	26	11
134	27	8
135	27	6
136	27	7
137	28	8
138	28	7
139	29	8
140	29	9
141	29	10
142	30	1
143	30	2
144	30	3
145	30	4
146	30	5
147	30	6
148	30	7
149	30	8
150	30	9
151	30	10
152	30	11
153	30	12
154	31	8
155	31	9
156	31	5
157	31	6
158	31	7
159	32	8
160	32	9
161	32	5
162	32	6
163	32	7
164	33	4
165	33	5
166	33	6
167	33	7
168	33	8
169	33	9
170	33	10
171	34	4
172	34	5
173	34	6
174	34	7
175	34	8
176	34	9
180	36	9
181	36	10
182	37	8
183	37	9
184	35	9
185	35	10
186	35	11
187	38	1
188	38	2
189	38	3
190	38	4
191	38	5
192	38	11
193	38	12
194	39	8
195	39	9
196	39	7
197	40	8
198	40	9
199	40	10
200	40	11
201	40	7
202	41	1
203	41	2
204	41	11
205	41	12
206	41	10
207	42	3
208	42	4
209	42	5
210	42	6
211	42	8
212	42	9
213	42	10
214	43	9
215	43	10
216	43	11
217	44	1
218	44	2
219	44	11
220	44	12
221	45	8
222	45	6
223	45	7
224	46	1
225	46	2
226	46	3
227	46	4
228	46	5
229	46	6
230	46	7
231	46	8
232	46	9
233	46	10
234	46	11
235	46	12
236	47	3
237	47	4
238	47	5
239	47	6
240	47	7
241	47	8
242	47	9
243	47	10
244	48	1
245	48	2
246	48	3
247	48	4
248	48	5
249	48	6
250	48	7
251	48	8
252	48	9
253	48	10
254	48	11
255	48	12
256	49	1
257	49	2
258	49	12
259	50	1
260	50	2
261	50	3
262	50	4
263	50	5
264	50	6
265	50	7
266	50	8
267	50	9
268	50	10
269	50	11
270	50	12
271	51	1
272	51	2
273	51	3
274	51	4
275	51	5
276	51	6
277	51	7
278	51	8
279	51	9
280	51	10
281	51	11
282	51	12
283	52	1
284	52	2
285	52	3
286	52	4
287	52	5
288	52	6
289	52	7
290	52	8
291	52	9
292	52	10
293	52	11
294	52	12
295	53	6
296	54	8
297	54	9
298	54	7
299	55	1
300	55	2
301	55	3
302	55	4
303	55	5
304	55	6
305	55	7
306	55	8
307	55	9
308	55	10
309	55	11
310	55	12
311	56	1
312	56	2
313	56	3
314	56	4
315	56	5
316	56	6
317	56	7
318	56	8
319	56	9
320	56	10
321	56	11
322	56	12
323	57	1
324	57	2
325	57	3
326	57	4
327	57	5
328	57	6
329	57	7
330	57	8
331	57	9
332	57	10
333	57	11
334	57	12
335	58	1
336	58	2
337	58	3
338	58	4
339	58	5
340	58	6
341	58	7
342	58	8
343	58	9
344	58	10
345	58	11
346	58	12
347	59	1
348	59	2
349	59	3
350	59	4
351	59	5
352	59	6
353	59	7
354	59	8
355	59	9
356	59	10
357	59	11
358	59	12
359	60	8
360	60	7
361	61	8
362	61	7
363	62	8
364	62	7
365	63	8
366	63	7
369	65	8
370	65	9
371	65	6
372	65	7
373	66	8
374	66	7
375	67	8
376	67	7
377	68	8
378	68	7
379	69	8
380	69	6
381	69	7
382	70	8
383	70	6
384	70	7
385	71	8
386	71	7
387	72	8
388	72	9
389	72	6
390	72	7
391	73	3
392	73	4
393	73	5
394	73	6
395	73	7
396	73	8
397	73	9
398	73	10
399	73	11
400	74	1
401	74	2
402	74	3
403	74	4
404	74	5
405	74	6
406	74	7
407	74	8
408	74	9
409	74	10
410	74	11
411	74	12
412	75	8
413	75	9
414	75	6
415	75	7
428	77	8
429	77	9
430	77	10
431	78	1
432	78	2
433	78	6
434	78	7
435	78	8
436	78	9
437	78	10
438	78	11
439	78	12
440	79	3
441	79	4
442	79	5
443	79	6
444	79	7
445	79	8
446	79	9
447	79	10
448	80	8
449	80	6
450	80	7
451	81	8
452	81	9
453	81	7
454	76	1
455	76	2
456	76	3
457	76	4
458	76	5
459	76	6
460	76	7
461	76	8
462	76	9
463	76	10
464	76	11
465	76	12
466	82	8
467	82	4
468	82	5
469	82	6
470	82	7
477	83	4
478	83	5
479	83	6
480	83	7
481	83	8
482	83	9
489	84	4
490	84	5
491	84	6
492	84	7
493	84	8
494	84	9
495	85	8
496	85	9
497	85	6
498	85	7
499	86	3
500	86	4
501	86	5
502	86	6
503	86	7
504	87	8
505	87	5
506	87	6
507	87	7
508	88	1
509	88	2
510	88	3
511	88	4
512	88	5
513	88	6
514	88	7
515	88	8
516	88	9
517	88	10
518	88	11
519	88	12
523	90	5
524	90	6
525	90	7
526	90	8
527	90	9
528	90	10
533	92	8
534	92	6
535	92	7
536	93	1
537	93	2
538	93	3
539	93	4
540	93	5
541	93	6
542	93	7
543	93	8
544	93	9
545	93	10
546	93	11
547	93	12
548	94	1
549	94	2
550	94	3
551	94	10
552	94	11
553	94	12
554	95	1
555	95	2
556	95	3
557	95	4
558	95	5
559	95	6
560	95	7
561	95	8
562	95	9
563	95	10
564	95	11
565	95	12
566	96	9
567	96	10
568	96	11
569	96	12
573	97	1
574	97	2
575	97	12
584	91	8
585	91	9
586	91	6
587	91	7
588	98	8
589	98	9
590	98	10
591	98	7
592	99	3
593	99	4
594	99	5
595	99	6
596	99	9
597	99	10
598	99	11
599	100	3
600	100	4
601	100	5
602	100	6
603	100	9
604	100	10
605	100	11
606	101	3
607	101	4
608	101	5
609	101	6
610	101	9
611	101	10
612	101	11
613	102	1
614	102	2
615	102	12
616	103	9
618	104	9
619	105	9
620	105	10
621	105	11
622	106	4
623	106	5
624	106	6
625	106	7
626	106	8
627	106	9
628	106	10
629	106	11
630	107	8
631	107	9
632	107	5
633	107	6
634	107	7
635	108	5
636	108	6
637	108	7
638	108	8
639	108	9
640	108	10
641	109	4
642	109	5
643	109	6
644	109	7
645	109	8
646	109	9
647	109	10
648	110	8
649	110	9
650	110	6
651	110	7
652	111	8
653	111	9
654	111	6
655	111	7
656	112	8
657	112	9
658	112	6
659	112	7
660	113	8
661	113	9
662	113	6
663	113	7
664	114	8
665	114	9
666	114	7
667	115	8
668	115	9
669	115	6
670	115	7
671	116	1
672	116	2
673	116	12
674	117	4
675	117	5
676	117	6
677	117	7
678	117	8
679	117	9
680	117	10
681	117	11
682	118	4
683	118	5
684	118	6
685	118	7
686	118	8
687	118	9
688	118	12
695	120	8
696	120	7
697	119	4
698	119	5
699	119	6
700	119	7
701	119	8
702	119	9
703	121	4
704	121	5
705	121	6
706	121	7
707	121	8
708	121	9
709	121	10
710	121	11
711	123	1
712	123	2
713	123	11
714	123	12
715	124	8
716	124	9
717	124	6
718	124	7
719	125	1
720	125	2
721	125	3
722	125	4
723	125	5
724	125	6
725	125	7
726	125	8
727	125	9
728	125	10
729	125	11
730	125	12
731	126	3
732	126	4
733	126	5
734	126	6
735	126	7
736	126	8
737	126	9
738	126	10
739	126	11
740	127	1
741	127	2
742	127	3
743	127	4
744	127	5
745	127	6
746	127	7
747	127	8
748	127	9
749	127	10
750	127	11
751	127	12
752	128	1
753	128	2
754	128	3
755	128	4
756	128	5
757	128	6
758	128	7
759	128	8
760	128	9
761	128	10
762	128	11
763	128	12
764	129	1
765	129	2
766	129	3
767	129	4
768	129	10
769	129	11
770	129	12
771	130	1
772	130	2
773	130	3
774	130	4
775	130	5
776	130	6
777	130	7
778	130	8
779	130	9
780	130	10
781	130	11
782	130	12
783	131	1
784	131	2
785	131	3
786	131	4
787	131	5
788	131	6
789	131	7
790	131	8
791	131	12
792	132	8
793	132	9
794	132	10
795	132	6
796	132	7
797	133	1
798	133	2
799	133	3
800	133	4
801	133	5
802	133	6
803	133	7
804	133	8
805	133	9
806	133	10
807	133	11
808	133	12
809	134	3
810	134	1
811	134	2
812	134	11
813	134	12
814	135	3
815	135	1
816	135	2
817	135	11
818	135	12
819	136	8
820	136	9
821	136	6
822	136	7
835	137	1
836	137	2
837	137	3
838	137	4
839	137	5
840	137	6
841	137	7
842	137	8
843	137	9
844	137	10
845	137	11
846	137	12
847	138	6
848	138	7
849	138	8
850	138	9
851	138	10
852	138	11
853	139	8
854	139	9
855	139	6
856	139	7
857	140	8
858	140	9
859	140	5
860	140	6
861	140	7
862	141	8
863	141	9
864	141	5
865	141	6
866	141	7
867	142	8
868	142	9
869	142	5
870	142	6
871	142	7
884	144	1
885	144	2
886	144	3
887	144	4
888	144	5
889	144	12
890	145	1
891	145	2
892	145	3
893	145	4
894	145	5
895	145	6
896	145	7
897	145	8
898	145	9
899	145	10
900	145	11
901	145	12
902	143	1
903	143	2
904	143	3
905	143	4
906	143	5
907	143	6
908	143	7
909	143	8
910	143	9
911	143	10
912	143	11
913	143	12
914	146	1
915	146	2
916	146	3
917	146	4
918	146	5
919	146	6
920	146	7
921	146	11
922	146	12
932	147	8
933	147	9
934	147	6
935	147	7
936	148	8
937	148	9
938	148	5
939	148	6
940	148	7
953	149	1
954	149	2
955	149	3
956	149	4
957	149	5
958	149	6
959	149	7
960	149	8
961	149	9
962	149	10
963	149	11
964	149	12
987	152	1
988	152	2
989	152	3
990	152	4
991	152	5
992	152	6
993	152	7
994	152	8
995	152	9
996	152	10
997	152	11
998	152	12
999	153	1
1000	153	2
1001	153	3
1002	153	4
1003	153	5
1004	153	6
1005	153	7
1006	153	8
1007	153	9
1008	153	10
1009	153	11
1010	153	12
1055	157	1
1056	157	2
1057	157	3
1058	157	4
1059	157	5
1060	157	6
1061	157	7
1062	157	8
1063	157	9
1064	157	10
1065	157	11
1066	157	12
1067	158	1
1068	158	2
1069	158	3
1070	158	4
1071	158	5
1072	158	6
1073	158	7
1074	158	8
1075	158	9
1076	158	10
1077	158	11
1078	158	12
1091	160	1
1092	160	2
1093	160	3
1094	160	4
1095	160	5
1096	160	6
1097	160	7
1098	160	8
1099	160	9
1100	160	10
1101	160	11
1102	160	12
1103	161	8
1104	161	9
1105	161	6
1106	161	7
1107	162	1
1108	162	2
1109	162	3
1110	162	4
1111	162	5
1112	162	6
1113	162	7
1114	162	8
1115	162	9
1116	162	10
1117	162	11
1118	162	12
1133	166	1
1134	166	2
1135	166	3
1136	166	4
1137	166	5
1138	166	6
1139	166	7
1140	166	8
1141	166	9
1142	166	10
1143	166	11
1144	166	12
1145	167	1
1146	167	2
1147	167	3
1148	167	4
1149	167	11
1150	167	12
1151	168	1
1152	168	2
1153	168	3
1154	168	4
1155	168	11
1156	168	12
1157	169	3
1158	169	1
1159	169	2
1160	169	11
1161	169	12
1174	172	1
1175	172	2
1176	172	3
1177	172	4
1178	172	5
1179	172	6
1180	172	7
1181	172	8
1182	172	9
1183	172	10
1184	172	11
1185	172	12
1198	173	1
1199	173	2
1200	173	3
1201	173	4
1202	173	5
1203	173	6
1204	173	7
1205	173	8
1206	173	9
1207	173	10
1208	173	11
1209	173	12
1210	174	8
1211	174	9
1212	174	7
1213	175	1
1214	175	2
1215	175	3
1216	175	4
1217	175	5
1218	175	6
1219	175	7
1220	175	8
1221	175	9
1222	175	10
1223	175	11
1224	175	12
1225	164	8
1226	164	9
1227	164	6
1228	164	7
1229	150	1
1230	150	2
1231	150	9
1232	150	10
1233	150	11
1234	150	12
1235	151	1
1236	151	2
1237	151	3
1238	151	4
1239	151	5
1240	151	8
1241	151	9
1242	151	10
1243	151	11
1244	151	12
1245	154	1
1246	154	2
1247	154	3
1248	154	4
1249	154	9
1250	154	10
1251	154	11
1252	154	12
1253	155	1
1254	155	2
1255	155	3
1256	155	4
1257	155	5
1258	155	6
1259	155	7
1260	155	8
1261	155	9
1262	155	10
1263	155	11
1264	155	12
1277	159	1
1278	159	2
1279	159	3
1280	159	4
1281	159	11
1282	159	12
1283	163	1
1284	163	2
1285	163	9
1286	163	10
1287	163	11
1288	163	12
1301	165	9
1302	165	10
1303	165	11
1304	165	12
1305	156	1
1306	156	2
1307	156	3
1308	156	4
1309	156	5
1310	156	6
1311	156	7
1312	156	8
1313	156	9
1314	156	10
1315	156	11
1316	156	12
1317	170	3
1318	170	4
1319	64	8
1320	64	7
1321	89	3
1322	89	4
1323	89	5
1324	171	1
1325	171	3
1326	171	4
1327	171	5
1328	171	6
1329	171	7
1330	171	9
1331	171	10
1332	171	11
1333	171	12
\.


--
-- Name: encyclopedia_unit_months_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ac_admin
--

SELECT pg_catalog.setval('encyclopedia_unit_months_id_seq', 1333, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: encyclopedia_month_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY encyclopedia_month
    ADD CONSTRAINT encyclopedia_month_pkey PRIMARY KEY (id);


--
-- Name: encyclopedia_section_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY encyclopedia_section
    ADD CONSTRAINT encyclopedia_section_pkey PRIMARY KEY (id);


--
-- Name: encyclopedia_unit_months_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY encyclopedia_unit_months
    ADD CONSTRAINT encyclopedia_unit_months_pkey PRIMARY KEY (id);


--
-- Name: encyclopedia_unit_months_unit_id_month_id_key; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY encyclopedia_unit_months
    ADD CONSTRAINT encyclopedia_unit_months_unit_id_month_id_key UNIQUE (unit_id, month_id);


--
-- Name: encyclopedia_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: ac_admin; Tablespace: 
--

ALTER TABLE ONLY encyclopedia_unit
    ADD CONSTRAINT encyclopedia_unit_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: encyclopedia_unit_730f6511; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX encyclopedia_unit_730f6511 ON encyclopedia_unit USING btree (section_id);


--
-- Name: encyclopedia_unit_months_be312c22; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX encyclopedia_unit_months_be312c22 ON encyclopedia_unit_months USING btree (month_id);


--
-- Name: encyclopedia_unit_months_e8175980; Type: INDEX; Schema: public; Owner: ac_admin; Tablespace: 
--

CREATE INDEX encyclopedia_unit_months_e8175980 ON encyclopedia_unit_months USING btree (unit_id);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: encyclope_section_id_604b141532b7458_fk_encyclopedia_section_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY encyclopedia_unit
    ADD CONSTRAINT encyclope_section_id_604b141532b7458_fk_encyclopedia_section_id FOREIGN KEY (section_id) REFERENCES encyclopedia_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: encyclopedia_month_id_4ac43ad09a1cd49c_fk_encyclopedia_month_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY encyclopedia_unit_months
    ADD CONSTRAINT encyclopedia_month_id_4ac43ad09a1cd49c_fk_encyclopedia_month_id FOREIGN KEY (month_id) REFERENCES encyclopedia_month(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: encyclopedia_u_unit_id_47bd3ccc3a74f68b_fk_encyclopedia_unit_id; Type: FK CONSTRAINT; Schema: public; Owner: ac_admin
--

ALTER TABLE ONLY encyclopedia_unit_months
    ADD CONSTRAINT encyclopedia_u_unit_id_47bd3ccc3a74f68b_fk_encyclopedia_unit_id FOREIGN KEY (unit_id) REFERENCES encyclopedia_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

