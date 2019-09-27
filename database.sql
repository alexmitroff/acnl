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
    season character varying(7) NOT NULL
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
-- Name: encyclopedia_section; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.encyclopedia_section (
    id integer NOT NULL,
    pos integer NOT NULL,
    show boolean NOT NULL,
    name character varying(100) NOT NULL,
    "desc" text NOT NULL
);


ALTER TABLE public.encyclopedia_section OWNER TO acnl;

--
-- Name: encyclopedia_section_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.encyclopedia_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encyclopedia_section_id_seq OWNER TO acnl;

--
-- Name: encyclopedia_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.encyclopedia_section_id_seq OWNED BY public.encyclopedia_section.id;


--
-- Name: encyclopedia_unit; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.encyclopedia_unit (
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


ALTER TABLE public.encyclopedia_unit OWNER TO acnl;

--
-- Name: encyclopedia_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.encyclopedia_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encyclopedia_unit_id_seq OWNER TO acnl;

--
-- Name: encyclopedia_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.encyclopedia_unit_id_seq OWNED BY public.encyclopedia_unit.id;


--
-- Name: encyclopedia_unit_months; Type: TABLE; Schema: public; Owner: acnl
--

CREATE TABLE public.encyclopedia_unit_months (
    id integer NOT NULL,
    unit_id integer NOT NULL,
    month_id integer NOT NULL
);


ALTER TABLE public.encyclopedia_unit_months OWNER TO acnl;

--
-- Name: encyclopedia_unit_months_id_seq; Type: SEQUENCE; Schema: public; Owner: acnl
--

CREATE SEQUENCE public.encyclopedia_unit_months_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encyclopedia_unit_months_id_seq OWNER TO acnl;

--
-- Name: encyclopedia_unit_months_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: acnl
--

ALTER SEQUENCE public.encyclopedia_unit_months_id_seq OWNED BY public.encyclopedia_unit_months.id;


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
-- Name: encyclopedia_section id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_section ALTER COLUMN id SET DEFAULT nextval('public.encyclopedia_section_id_seq'::regclass);


--
-- Name: encyclopedia_unit id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_unit ALTER COLUMN id SET DEFAULT nextval('public.encyclopedia_unit_id_seq'::regclass);


--
-- Name: encyclopedia_unit_months id; Type: DEFAULT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_unit_months ALTER COLUMN id SET DEFAULT nextval('public.encyclopedia_unit_months_id_seq'::regclass);


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
1	1	Very Common	very-common	0,50%,50
2	2	Common	common	0,50%,50
3	3	Rare	rare	0,50%,50
4	4	Vary Rare	vary-rare	0,50%,50
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

COPY public.encyclopedia_month (id, pos, name, season) FROM stdin;
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
-- Data for Name: encyclopedia_section; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.encyclopedia_section (id, pos, show, name, "desc") FROM stdin;
1	0	t	Bugs	Bugs are collectable items in the Animal Crossing series. Players can catch them with a net. They can be donated to the museum, sold to Tom Nook, or placed in the player's home inside a Bug Cage, like a piece of furniture. Most of them are worth a lot less than most fish at Tom Nook's store. A large amount of bugs will only emerge during the Summer, a few unique species emerge in Autumn and Spring, and there are almost none during the Winter. 
2	2	t	Fish	Fish are a collectible item in the Animal Crossing series. Players can catch them with a fishing rod. They can be donated to the museum to fill out the aquarium, sold to Tom Nook, or placed in the player's home inside a Fish Tank, like a piece of furniture.
3	3	t	Deep sea creatures	Deep sea creatures are a new category of collectables in Animal Crossing: New Leaf, found by diving underwater while swimming. 
\.


--
-- Data for Name: encyclopedia_unit; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.encyclopedia_unit (id, pos, pic, name, rarity, "desc", loc, shadow, price, str_time, end_time, section_id, island) FROM stdin;
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
-- Data for Name: encyclopedia_unit_months; Type: TABLE DATA; Schema: public; Owner: acnl
--

COPY public.encyclopedia_unit_months (id, unit_id, month_id) FROM stdin;
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 232, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: encyclopedia_month_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.encyclopedia_month_id_seq', 12, true);


--
-- Name: encyclopedia_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.encyclopedia_section_id_seq', 3, true);


--
-- Name: encyclopedia_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.encyclopedia_unit_id_seq', 175, true);


--
-- Name: encyclopedia_unit_months_id_seq; Type: SEQUENCE SET; Schema: public; Owner: acnl
--

SELECT pg_catalog.setval('public.encyclopedia_unit_months_id_seq', 1333, true);


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
-- Name: encyclopedia_section encyclopedia_section_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_section
    ADD CONSTRAINT encyclopedia_section_pkey PRIMARY KEY (id);


--
-- Name: encyclopedia_unit_months encyclopedia_unit_months_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_unit_months
    ADD CONSTRAINT encyclopedia_unit_months_pkey PRIMARY KEY (id);


--
-- Name: encyclopedia_unit_months encyclopedia_unit_months_unit_id_month_id_key; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_unit_months
    ADD CONSTRAINT encyclopedia_unit_months_unit_id_month_id_key UNIQUE (unit_id, month_id);


--
-- Name: encyclopedia_unit encyclopedia_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_unit
    ADD CONSTRAINT encyclopedia_unit_pkey PRIMARY KEY (id);


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
-- Name: encyclopedia_unit_730f6511; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX encyclopedia_unit_730f6511 ON public.encyclopedia_unit USING btree (section_id);


--
-- Name: encyclopedia_unit_months_be312c22; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX encyclopedia_unit_months_be312c22 ON public.encyclopedia_unit_months USING btree (month_id);


--
-- Name: encyclopedia_unit_months_e8175980; Type: INDEX; Schema: public; Owner: acnl
--

CREATE INDEX encyclopedia_unit_months_e8175980 ON public.encyclopedia_unit_months USING btree (unit_id);


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
-- Name: encyclopedia_unit encyclope_section_id_604b141532b7458_fk_encyclopedia_section_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_unit
    ADD CONSTRAINT encyclope_section_id_604b141532b7458_fk_encyclopedia_section_id FOREIGN KEY (section_id) REFERENCES public.encyclopedia_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: encyclopedia_unit_months encyclopedia_month_id_4ac43ad09a1cd49c_fk_encyclopedia_month_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_unit_months
    ADD CONSTRAINT encyclopedia_month_id_4ac43ad09a1cd49c_fk_encyclopedia_month_id FOREIGN KEY (month_id) REFERENCES public.encyclopedia_month(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: encyclopedia_unit_months encyclopedia_u_unit_id_47bd3ccc3a74f68b_fk_encyclopedia_unit_id; Type: FK CONSTRAINT; Schema: public; Owner: acnl
--

ALTER TABLE ONLY public.encyclopedia_unit_months
    ADD CONSTRAINT encyclopedia_u_unit_id_47bd3ccc3a74f68b_fk_encyclopedia_unit_id FOREIGN KEY (unit_id) REFERENCES public.encyclopedia_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

