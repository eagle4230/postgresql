--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    subscription_type boolean,
    subscription_id integer NOT NULL,
    subscription_at timestamp without time zone
);


ALTER TABLE public.subscriptions OWNER TO gb_user;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO gb_user;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.communities VALUES (1, 'nulla.', 7, '2022-08-22 17:07:29');
INSERT INTO public.communities VALUES (2, 'morbi', 18, '2022-10-31 12:13:15');
INSERT INTO public.communities VALUES (3, 'vestibulum', 11, '2022-08-26 07:20:03');
INSERT INTO public.communities VALUES (4, 'Etiam', 18, '2023-01-27 14:53:42');
INSERT INTO public.communities VALUES (5, 'Sed', 5, '2022-12-15 16:20:22');
INSERT INTO public.communities VALUES (6, 'tincidunt.', 1, '2022-06-09 16:06:01');
INSERT INTO public.communities VALUES (7, 'auctor', 7, '2022-08-29 20:28:41');
INSERT INTO public.communities VALUES (8, 'et', 14, '2022-06-17 19:37:38');
INSERT INTO public.communities VALUES (9, 'hendrerit.', 12, '2023-01-10 11:11:01');
INSERT INTO public.communities VALUES (10, 'bulla.', 5, '2022-08-28 13:09:49');
INSERT INTO public.communities VALUES (11, 'nec', 13, '2022-09-02 11:13:43');
INSERT INTO public.communities VALUES (12, 'sodales', 18, '2022-07-01 09:58:53');
INSERT INTO public.communities VALUES (13, 'dignissim.', 7, '2023-02-03 06:04:11');
INSERT INTO public.communities VALUES (14, 'eu', 2, '2022-07-07 10:08:31');
INSERT INTO public.communities VALUES (15, 'semper', 4, '2022-11-08 04:42:25');
INSERT INTO public.communities VALUES (16, 'eget', 19, '2022-12-20 02:15:05');
INSERT INTO public.communities VALUES (17, 'elit', 17, '2023-01-25 22:27:06');
INSERT INTO public.communities VALUES (18, 'ligula', 4, '2022-09-14 19:52:01');
INSERT INTO public.communities VALUES (19, 'vitae', 2, '2022-12-21 04:07:44');
INSERT INTO public.communities VALUES (20, 'tellus', 3, '2023-02-15 16:54:43');


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.communities_users VALUES (9, 5, '2022-08-09 20:22:22');
INSERT INTO public.communities_users VALUES (1, 3, '2022-07-27 12:05:45');
INSERT INTO public.communities_users VALUES (13, 10, '2023-01-13 06:53:18');
INSERT INTO public.communities_users VALUES (3, 1, '2022-09-14 15:11:50');
INSERT INTO public.communities_users VALUES (8, 6, '2023-02-16 07:09:46');
INSERT INTO public.communities_users VALUES (14, 12, '2022-05-22 18:45:16');
INSERT INTO public.communities_users VALUES (10, 8, '2023-01-07 02:27:39');
INSERT INTO public.communities_users VALUES (13, 4, '2022-06-18 06:50:10');
INSERT INTO public.communities_users VALUES (8, 12, '2022-08-27 15:59:29');
INSERT INTO public.communities_users VALUES (8, 19, '2022-05-31 19:06:51');
INSERT INTO public.communities_users VALUES (4, 8, '2022-12-26 08:34:55');
INSERT INTO public.communities_users VALUES (5, 16, '2022-10-04 18:24:50');
INSERT INTO public.communities_users VALUES (9, 10, '2022-09-04 17:36:21');
INSERT INTO public.communities_users VALUES (6, 6, '2022-05-28 05:33:35');
INSERT INTO public.communities_users VALUES (5, 12, '2022-10-20 01:54:33');
INSERT INTO public.communities_users VALUES (7, 13, '2022-06-25 15:33:26');
INSERT INTO public.communities_users VALUES (7, 2, '2022-05-19 12:01:40');
INSERT INTO public.communities_users VALUES (9, 16, '2022-05-31 22:47:20');
INSERT INTO public.communities_users VALUES (6, 13, '2023-01-04 17:31:53');
INSERT INTO public.communities_users VALUES (4, 16, '2022-07-26 08:06:56');


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.friendship VALUES (1, 6, 5, 2, '2022-02-09 15:24:00', '2022-07-10 19:27:38');
INSERT INTO public.friendship VALUES (2, 16, 11, 2, '2022-01-31 22:05:46', '2023-01-05 03:48:44');
INSERT INTO public.friendship VALUES (3, 14, 19, 2, '2022-07-22 20:06:17', '2022-11-09 10:32:18');
INSERT INTO public.friendship VALUES (4, 19, 16, 1, '2022-11-04 19:40:47', '2022-10-26 12:38:05');
INSERT INTO public.friendship VALUES (5, 13, 19, 2, '2021-07-16 01:55:53', '2022-06-24 07:09:05');
INSERT INTO public.friendship VALUES (6, 17, 20, 1, '2022-05-11 16:03:36', '2023-01-17 06:28:59');
INSERT INTO public.friendship VALUES (7, 10, 19, 1, '2022-01-06 11:30:39', '2022-11-07 00:00:13');
INSERT INTO public.friendship VALUES (8, 18, 7, 3, '2022-04-05 14:30:00', '2022-09-14 20:46:19');
INSERT INTO public.friendship VALUES (9, 13, 4, 3, '2021-10-30 20:30:42', '2022-12-06 15:55:47');
INSERT INTO public.friendship VALUES (10, 5, 19, 2, '2022-11-11 21:11:15', '2022-12-15 12:43:54');
INSERT INTO public.friendship VALUES (11, 12, 5, 1, '2022-11-20 01:17:41', '2022-11-25 05:12:57');
INSERT INTO public.friendship VALUES (12, 4, 16, 2, '2022-01-01 16:32:54', '2023-01-06 11:19:25');
INSERT INTO public.friendship VALUES (13, 8, 15, 2, '2022-08-15 00:41:07', '2022-10-28 15:43:16');
INSERT INTO public.friendship VALUES (14, 9, 7, 3, '2022-06-18 19:19:35', '2023-01-12 05:41:11');
INSERT INTO public.friendship VALUES (15, 17, 14, 2, '2021-09-05 16:21:51', '2022-10-18 09:45:01');
INSERT INTO public.friendship VALUES (16, 10, 4, 1, '2021-08-31 16:03:06', '2022-07-28 13:59:06');
INSERT INTO public.friendship VALUES (17, 18, 4, 1, '2021-11-28 19:47:40', '2022-09-07 16:38:05');
INSERT INTO public.friendship VALUES (18, 16, 7, 1, '2021-10-07 05:51:14', '2022-06-24 03:38:22');
INSERT INTO public.friendship VALUES (19, 15, 4, 2, '2022-04-15 17:24:29', '2023-01-10 10:05:40');
INSERT INTO public.friendship VALUES (20, 16, 2, 1, '2023-01-17 00:04:12', '2022-06-13 10:08:14');


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.friendship_statuses VALUES (1, 'sent');
INSERT INTO public.friendship_statuses VALUES (2, 'accept');
INSERT INTO public.friendship_statuses VALUES (3, 'reject');


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.messages VALUES (1, 7, 8, 'at, velit. Cras lorem', true, true, '2022-11-07 23:29:32');
INSERT INTO public.messages VALUES (2, 15, 7, 'sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac', true, false, '2022-01-14 18:32:38');
INSERT INTO public.messages VALUES (3, 17, 10, 'neque. In ornare', false, false, '2022-07-18 06:45:44');
INSERT INTO public.messages VALUES (4, 3, 15, 'neque', false, false, '2022-08-14 17:14:02');
INSERT INTO public.messages VALUES (5, 0, 4, 'enim. Etiam gravida molestie', true, false, '2021-07-12 20:54:50');
INSERT INTO public.messages VALUES (6, 2, 15, 'in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod', false, false, '2022-04-25 00:29:48');
INSERT INTO public.messages VALUES (7, 20, 19, 'nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui.', false, true, '2021-09-09 19:55:10');
INSERT INTO public.messages VALUES (8, 12, 3, 'Aenean massa. Integer vitae nibh. Donec est', false, false, '2021-08-10 11:35:38');
INSERT INTO public.messages VALUES (9, 11, 13, 'malesuada. Integer', false, true, '2023-01-09 01:01:41');
INSERT INTO public.messages VALUES (10, 15, 7, 'est, congue a, aliquet vel,', false, true, '2022-04-21 16:49:13');
INSERT INTO public.messages VALUES (11, 5, 3, 'magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim', true, false, '2022-05-19 22:38:19');
INSERT INTO public.messages VALUES (12, 8, 2, 'fringilla mi lacinia mattis. Integer', false, true, '2022-12-07 21:15:17');
INSERT INTO public.messages VALUES (13, 17, 4, 'erat nonummy ultricies', false, false, '2022-02-01 04:56:48');
INSERT INTO public.messages VALUES (14, 11, 17, 'nulla. Cras eu tellus eu augue', false, true, '2022-10-08 15:27:36');
INSERT INTO public.messages VALUES (15, 12, 15, 'non, cursus non, egestas a, dui. Cras pellentesque.', true, true, '2021-10-09 06:56:05');
INSERT INTO public.messages VALUES (16, 1, 7, 'mauris sagittis placerat. Cras dictum ultricies ligula.', false, false, '2022-05-10 09:31:09');
INSERT INTO public.messages VALUES (17, 17, 17, 'tellus lorem eu metus. In lorem.', true, true, '2022-02-21 15:23:24');
INSERT INTO public.messages VALUES (18, 19, 14, 'primis in faucibus orci luctus et ultrices posuere cubilia', false, true, '2021-10-31 21:46:00');
INSERT INTO public.messages VALUES (19, 8, 13, 'Donec at arcu. Vestibulum ante', true, true, '2022-12-22 15:49:33');
INSERT INTO public.messages VALUES (20, 12, 16, 'feugiat nec, diam. Duis mi', false, true, '2022-03-31 20:15:09');


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.photo VALUES (1, 'http://twitter.com/settings', 15, 'orci sem eget massa. Suspendisse', '2022-09-20 07:04:31', 3);
INSERT INTO public.photo VALUES (2, 'http://whatsapp.com/user/110', 20, 'vehicula risus. Nulla eget metus', '2022-04-23 11:14:33', 4);
INSERT INTO public.photo VALUES (3, 'http://cnn.com/user/110', 14, 'risus. Morbi metus. Vivamus euismod', '2023-01-06 22:30:02', 3);
INSERT INTO public.photo VALUES (4, 'https://pinterest.com/sub', 7, 'quam. Curabitur vel lectus. Cum', '2022-12-15 21:08:43', 3);
INSERT INTO public.photo VALUES (5, 'http://yahoo.com/en-ca', 18, 'sodales. Mauris blandit enim consequat', '2022-08-10 04:17:28', 3);
INSERT INTO public.photo VALUES (6, 'https://ebay.com/user/110', 9, 'Aenean massa. Integer vitae nibh.', '2023-02-17 01:24:18', 2);
INSERT INTO public.photo VALUES (7, 'https://cnn.com/sub', 7, 'mollis. Phasellus libero mauris, aliquam', '2022-07-20 07:39:01', 3);
INSERT INTO public.photo VALUES (8, 'https://naver.com/one', 15, 'molestie arcu. Sed eu nibh', '2022-11-25 05:28:35', 3);
INSERT INTO public.photo VALUES (9, 'https://ebay.com/fr', 6, 'laoreet posuere, enim nisl elementum', '2022-12-02 13:51:48', 2);
INSERT INTO public.photo VALUES (10, 'https://whatsapp.com/en-ca', 2, 'sed consequat auctor, nunc nulla', '2022-08-08 16:55:55', 1);
INSERT INTO public.photo VALUES (11, 'https://youtube.com/one', 3, 'eget tincidunt dui augue eu', '2022-04-28 06:19:55', 3);
INSERT INTO public.photo VALUES (12, 'https://instagram.com/sub', 14, 'In at pede. Cras vulputate', '2022-05-19 14:40:54', 2);
INSERT INTO public.photo VALUES (13, 'https://bbc.co.uk/en-us', 15, 'Vivamus nisi. Mauris nulla. Integer', '2022-06-14 05:21:45', 4);
INSERT INTO public.photo VALUES (14, 'http://cnn.com/one', 3, 'ipsum primis in faucibus orci', '2022-12-09 19:26:16', 3);
INSERT INTO public.photo VALUES (15, 'http://ebay.com/en-ca', 10, 'amet luctus vulputate, nisi sem', '2022-11-05 13:25:42', 4);
INSERT INTO public.photo VALUES (16, 'http://netflix.com/en-ca', 19, 'Nulla semper tellus id nunc', '2022-07-17 01:23:56', 3);
INSERT INTO public.photo VALUES (17, 'http://nytimes.com/site', 6, 'imperdiet, erat nonummy ultricies ornare,', '2022-09-11 16:32:10', 3);
INSERT INTO public.photo VALUES (18, 'https://naver.com/settings', 17, 'augue porttitor interdum. Sed auctor', '2023-01-19 00:06:38', 2);
INSERT INTO public.photo VALUES (19, 'http://whatsapp.com/fr', 12, 'neque sed dictum eleifend, nunc', '2022-10-17 11:15:50', 4);
INSERT INTO public.photo VALUES (20, 'https://twitter.com/user/110', 5, 'Nullam ut nisi a odio', '2022-08-03 15:14:51', 4);


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.subscriptions VALUES (1, 14, false, 4, '2022-08-12 19:23:59');
INSERT INTO public.subscriptions VALUES (2, 3, true, 17, '2023-02-08 23:05:10');
INSERT INTO public.subscriptions VALUES (3, 14, true, 7, '2022-10-12 11:45:15');
INSERT INTO public.subscriptions VALUES (4, 1, false, 9, '2022-09-19 21:16:15');
INSERT INTO public.subscriptions VALUES (5, 11, true, 4, '2022-10-08 12:31:27');
INSERT INTO public.subscriptions VALUES (6, 11, false, 1, '2022-06-30 23:03:28');
INSERT INTO public.subscriptions VALUES (7, 16, false, 3, '2022-12-10 09:28:48');
INSERT INTO public.subscriptions VALUES (8, 15, true, 13, '2022-04-22 22:59:31');
INSERT INTO public.subscriptions VALUES (9, 16, false, 18, '2022-09-05 04:08:21');
INSERT INTO public.subscriptions VALUES (10, 3, true, 19, '2022-11-11 14:52:13');
INSERT INTO public.subscriptions VALUES (11, 15, false, 9, '2022-12-15 04:06:14');
INSERT INTO public.subscriptions VALUES (12, 19, false, 12, '2022-07-28 01:17:29');
INSERT INTO public.subscriptions VALUES (13, 15, true, 12, '2022-10-02 06:50:45');
INSERT INTO public.subscriptions VALUES (14, 8, false, 8, '2022-09-21 03:33:47');
INSERT INTO public.subscriptions VALUES (15, 10, false, 2, '2022-07-06 07:31:35');
INSERT INTO public.subscriptions VALUES (16, 2, false, 11, '2022-06-29 02:10:26');
INSERT INTO public.subscriptions VALUES (17, 8, true, 7, '2022-09-19 12:02:22');
INSERT INTO public.subscriptions VALUES (18, 13, false, 12, '2022-08-01 04:13:27');
INSERT INTO public.subscriptions VALUES (19, 4, false, 13, '2023-01-12 02:43:24');
INSERT INTO public.subscriptions VALUES (20, 14, true, 15, '2022-11-01 05:32:55');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.users VALUES (1, 'Nero', 'Mccullough', 'odio.nam@hotmail.couk', '350-5533', 57, '2022-01-09 20:15:13');
INSERT INTO public.users VALUES (2, 'Bo', 'Parrish', 'mauris.blandit@outlook.org', '178-6284', 73, '2021-10-07 04:13:02');
INSERT INTO public.users VALUES (3, 'Fritz', 'Beck', 'justo.nec@aol.ca', '244-1267', 41, '2022-12-02 13:51:43');
INSERT INTO public.users VALUES (4, 'Carissa', 'Grimes', 'ac.libero@icloud.ca', '522-6938', 83, '2021-12-08 02:40:05');
INSERT INTO public.users VALUES (5, 'Shannon', 'Travis', 'sed@yahoo.net', '130-7254', 48, '2021-11-10 16:23:51');
INSERT INTO public.users VALUES (6, 'Emerald', 'Talley', 'morbi@icloud.edu', '423-6864', 55, '2022-10-13 04:46:49');
INSERT INTO public.users VALUES (7, 'Knox', 'Stokes', 'nunc.ullamcorper@aol.edu', '965-7196', 94, '2021-07-20 00:40:02');
INSERT INTO public.users VALUES (8, 'Riley', 'Hodge', 'hendrerit.consectetuer.cursus@yahoo.couk', '330-5538', 9, '2022-11-07 02:41:57');
INSERT INTO public.users VALUES (9, 'Mara', 'Reilly', 'rutrum.fusce@outlook.ca', '859-6661', 34, '2021-10-31 02:18:53');
INSERT INTO public.users VALUES (10, 'Shelby', 'Pearson', 'duis.dignissim.tempor@aol.org', '575-9500', 32, '2022-03-03 12:52:44');
INSERT INTO public.users VALUES (11, 'Clementine', 'Duffy', 'eros.non@outlook.edu', '515-8574', 29, '2022-03-28 08:44:30');
INSERT INTO public.users VALUES (12, 'Aaron', 'Shaffer', 'est@protonmail.ca', '323-2120', 28, '2022-08-23 20:56:30');
INSERT INTO public.users VALUES (13, 'Skyler', 'Joyner', 'morbi@yahoo.edu', '445-3405', 41, '2022-10-16 20:03:57');
INSERT INTO public.users VALUES (14, 'Mollie', 'Henry', 'lobortis.class.aptent@icloud.org', '313-2436', 70, '2021-12-19 07:41:05');
INSERT INTO public.users VALUES (15, 'Jelani', 'Santana', 'vitae@outlook.org', '311-3933', 100, '2021-07-30 09:01:26');
INSERT INTO public.users VALUES (16, 'Priscilla', 'Beach', 'magna.sed@aol.org', '884-2182', 47, '2021-12-25 01:12:02');
INSERT INTO public.users VALUES (17, 'Emmanuel', 'Hubbard', 'semper.auctor@google.org', '222-2560', 10, '2022-10-16 08:33:04');
INSERT INTO public.users VALUES (18, 'Merritt', 'Thornton', 'imperdiet.non.vestibulum@yahoo.ca', '178-7614', 74, '2022-12-14 11:02:26');
INSERT INTO public.users VALUES (19, 'Forrest', 'Buckley', 'turpis.aliquam.adipiscing@yahoo.net', '599-7335', 40, '2022-02-11 06:10:24');
INSERT INTO public.users VALUES (20, 'Neve', 'Rowland', 'aliquam.ultrices.iaculis@yahoo.com', '223-4540', 50, '2023-02-25 10:54:07');


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.video VALUES (1, 'https://yahoo.com/one', 10, 'mauris, aliquam eu, accumsan sed,', '2022-05-02 17:55:29', 4);
INSERT INTO public.video VALUES (2, 'https://facebook.com/sub', 4, 'porttitor eros nec tellus. Nunc', '2022-05-15 04:28:44', 3);
INSERT INTO public.video VALUES (3, 'http://cnn.com/user/110', 11, 'Sed et libero. Proin mi.', '2022-09-01 12:58:42', 2);
INSERT INTO public.video VALUES (4, 'http://zoom.us/en-us', 10, 'nonummy. Fusce fermentum fermentum arcu.', '2022-12-30 14:01:59', 3);
INSERT INTO public.video VALUES (5, 'http://guardian.co.uk/settings', 15, 'odio a purus. Duis elementum,', '2023-01-02 17:24:42', 3);
INSERT INTO public.video VALUES (6, 'https://cnn.com/site', 7, 'tristique aliquet. Phasellus fermentum convallis', '2022-07-19 14:49:56', 3);
INSERT INTO public.video VALUES (7, 'https://instagram.com/sub', 5, 'tempor diam dictum sapien. Aenean', '2023-02-11 17:13:44', 5);
INSERT INTO public.video VALUES (8, 'http://google.com/sub/cars', 14, 'eu, placerat eget, venenatis a,', '2022-12-21 18:14:29', 6);
INSERT INTO public.video VALUES (9, 'http://baidu.com/en-us', 2, 'venenatis vel, faucibus id, libero.', '2023-02-13 13:48:04', 3);
INSERT INTO public.video VALUES (10, 'https://walmart.com/en-ca', 16, 'Quisque purus sapien, gravida non,', '2022-09-01 03:55:25', 6);
INSERT INTO public.video VALUES (11, 'http://walmart.com/sub', 20, 'tellus lorem eu metus. In', '2022-10-06 15:10:02', 5);
INSERT INTO public.video VALUES (12, 'http://reddit.com/settings', 14, 'mauris. Suspendisse aliquet molestie tellus.', '2022-08-20 11:50:43', 5);
INSERT INTO public.video VALUES (13, 'https://naver.com/user/110', 4, 'accumsan sed, facilisis vitae, orci.', '2022-08-25 21:25:17', 4);
INSERT INTO public.video VALUES (14, 'http://whatsapp.com/en-ca', 2, 'cursus vestibulum. Mauris magna. Duis', '2022-10-07 04:00:58', 6);
INSERT INTO public.video VALUES (15, 'http://instagram.com/user/110', 15, 'magna. Cras convallis convallis dolor.', '2022-05-09 02:55:29', 4);
INSERT INTO public.video VALUES (16, 'https://cnn.com/user/110', 6, 'metus. In nec orci. Donec', '2022-04-29 14:32:21', 6);
INSERT INTO public.video VALUES (17, 'http://ebay.com/site', 9, 'ligula eu enim. Etiam imperdiet', '2022-10-17 08:51:02', 3);
INSERT INTO public.video VALUES (18, 'http://google.com/fr', 14, 'metus. Aenean sed pede nec', '2022-08-02 03:45:23', 5);
INSERT INTO public.video VALUES (19, 'http://guardian.co.uk/site', 7, 'Nunc laoreet lectus quis massa.', '2022-08-30 03:03:44', 5);
INSERT INTO public.video VALUES (20, 'https://walmart.com/fr', 8, 'et ultrices posuere cubilia Curae', '2022-07-11 06:16:44', 2);


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 20, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 20, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 3, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 20, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 20, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 20, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 20, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 20, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

