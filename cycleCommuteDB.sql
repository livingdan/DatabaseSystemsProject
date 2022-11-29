--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-11-28 20:24:06

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

DROP DATABASE commute;
--
-- TOC entry 4409 (class 1262 OID 42333)
-- Name: commute; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE commute WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE commute OWNER TO postgres;

\connect commute

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
-- TOC entry 4410 (class 0 OID 0)
-- Name: commute; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE commute SET search_path TO '$user', 'public', 'topology';


\connect commute

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
-- TOC entry 8 (class 2615 OID 43399)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 2 (class 3079 OID 42334)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 3 (class 3079 OID 43400)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 43391)
-- Name: amenity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amenity (
    amenity_id integer NOT NULL,
    type text NOT NULL
);


ALTER TABLE public.amenity OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 43390)
-- Name: amenity_amenity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.amenity_amenity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amenity_amenity_id_seq OWNER TO postgres;

--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 223
-- Name: amenity_amenity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amenity_amenity_id_seq OWNED BY public.amenity.amenity_id;


--
-- TOC entry 233 (class 1259 OID 43581)
-- Name: line_segment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.line_segment (
    line_id integer NOT NULL,
    type_id integer NOT NULL,
    text_field text
);


ALTER TABLE public.line_segment OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 43589)
-- Name: line_segment_line_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.line_segment_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.line_segment_line_id_seq OWNER TO postgres;

--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 234
-- Name: line_segment_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.line_segment_line_id_seq OWNED BY public.line_segment.line_id;


--
-- TOC entry 232 (class 1259 OID 43565)
-- Name: line_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.line_type (
    type_id integer NOT NULL,
    type_desc text NOT NULL
);


ALTER TABLE public.line_type OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 43385)
-- Name: point_node; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.point_node (
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    amenity_id integer,
    node_id integer NOT NULL
);


ALTER TABLE public.point_node OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 51758)
-- Name: point_node_node_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.point_node_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.point_node_node_id_seq OWNER TO postgres;

--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 235
-- Name: point_node_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.point_node_node_id_seq OWNED BY public.point_node.node_id;


--
-- TOC entry 231 (class 1259 OID 43562)
-- Name: polyline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polyline (
    line_id integer NOT NULL,
    "order" integer NOT NULL,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.polyline OWNER TO postgres;

--
-- TOC entry 4220 (class 2604 OID 43394)
-- Name: amenity amenity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenity ALTER COLUMN amenity_id SET DEFAULT nextval('public.amenity_amenity_id_seq'::regclass);


--
-- TOC entry 4224 (class 2604 OID 43590)
-- Name: line_segment line_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_segment ALTER COLUMN line_id SET DEFAULT nextval('public.line_segment_line_id_seq'::regclass);


--
-- TOC entry 4219 (class 2604 OID 51759)
-- Name: point_node node_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_node ALTER COLUMN node_id SET DEFAULT nextval('public.point_node_node_id_seq'::regclass);


--
-- TOC entry 4398 (class 0 OID 43391)
-- Dependencies: 224
-- Data for Name: amenity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.amenity (amenity_id, type) VALUES (1, 'parking');
INSERT INTO public.amenity (amenity_id, type) VALUES (2, 'repair station');
INSERT INTO public.amenity (amenity_id, type) VALUES (3, 'water');
INSERT INTO public.amenity (amenity_id, type) VALUES (4, 'shelter');
INSERT INTO public.amenity (amenity_id, type) VALUES (5, 'hazard');
INSERT INTO public.amenity (amenity_id, type) VALUES (6, 'need help');


--
-- TOC entry 4401 (class 0 OID 43581)
-- Dependencies: 233
-- Data for Name: line_segment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.line_segment (line_id, type_id, text_field) VALUES (1, 1, 'avoid this road');
INSERT INTO public.line_segment (line_id, type_id, text_field) VALUES (2, 2, 'Segment in not optimal');
INSERT INTO public.line_segment (line_id, type_id, text_field) VALUES (3, 3, 'Good and safe');
INSERT INTO public.line_segment (line_id, type_id, text_field) VALUES (4, 4, 'This is an route in use by someone');
INSERT INTO public.line_segment (line_id, type_id, text_field) VALUES (12, 1, 'highway');
INSERT INTO public.line_segment (line_id, type_id, text_field) VALUES (13, 1, 'Heavy traffic and high speed.');
INSERT INTO public.line_segment (line_id, type_id, text_field) VALUES (14, 1, 'unsafe road
');


--
-- TOC entry 4400 (class 0 OID 43565)
-- Dependencies: 232
-- Data for Name: line_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.line_type (type_id, type_desc) VALUES (1, 'Avoid');
INSERT INTO public.line_type (type_id, type_desc) VALUES (2, 'Caution');
INSERT INTO public.line_type (type_id, type_desc) VALUES (3, 'Good');
INSERT INTO public.line_type (type_id, type_desc) VALUES (4, 'Existing Route');


--
-- TOC entry 4396 (class 0 OID 43385)
-- Dependencies: 222
-- Data for Name: point_node; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.4670557, -98.4664142, 1, 1);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.4667194, -98.4713615, 1, 2);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.466337, -98.4690099, 1, 3);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.4524399, -98.5325414, 1, 4);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.521470794760393, -98.59967798321944, 2, 5);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.525838465677403, -98.59983267066475, 3, 6);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.52307511398471, -98.61092245780398, 4, 7);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.52062911134065, -98.60309311098422, 5, 8);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.526641317221166, -98.60909918525691, 6, 9);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.526037485082373, -98.59943410023148, 1, 10);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.341471105242288, -98.53043070715586, 3, 12);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.529620014791355, -98.59408457850424, 5, 13);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.53968209457179, -98.61642479896545, 1, 15);
INSERT INTO public.point_node (latitude, longitude, amenity_id, node_id) VALUES (29.53149563267253, -98.5623836517334, 6, 18);


--
-- TOC entry 4399 (class 0 OID 43562)
-- Dependencies: 231
-- Data for Name: polyline; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (1, 1, 29.523579244584504, -98.59981407574388);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (1, 2, 29.51898596185859, -98.59625333171078);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (1, 3, 29.517566856742672, -98.59505211685625);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (2, 2, 29.523065778209165, -98.61239994720687);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (3, 1, 29.52313112861986, -98.61735780241884);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (3, 2, 29.53089819103509, -98.61748665108838);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (3, 3, 29.536200362238112, -98.61757255020139);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 1, 29.542697009890198, -98.61369919234492);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 2, 29.54078352916696, -98.61557595637865);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 3, 29.540167474007777, -98.61666043268046);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 4, 29.54000879252545, -98.61788449504094);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 5, 29.540494170393014, -98.61960247730126);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 6, 29.541726272976195, -98.62068859710783);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 7, 29.542995696296146, -98.62079597099911);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 8, 29.545067808939482, -98.62064564755134);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 9, 29.548670570330298, -98.62058122321658);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 10, 29.550107905617562, -98.62017320242974);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 11, 29.551246559320678, -98.61957190863865);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 12, 29.55182521448275, -98.61890619051279);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (4, 13, 29.551601219329182, -98.61849816972597);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (2, 1, 29.523047106655508, -98.61564263872317);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (12, 1, 29.32020876384012, -98.517211065649);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (12, 2, 29.320508264217004, -98.50210290392685);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (13, 1, 29.54254766635627, -98.58096599578859);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (13, 2, 29.538477970141443, -98.57886314392091);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (13, 3, 29.535453594380968, -98.5772752761841);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (13, 4, 29.534632143368658, -98.57688903808595);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (13, 5, 29.532951881878667, -98.57663154602051);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (13, 6, 29.53063680920898, -98.5761594772339);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (13, 7, 29.525969162874535, -98.57512950897218);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (13, 8, 29.523504558728227, -98.57427120208742);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (14, 1, 29.520535751289582, -98.57283353805542);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (14, 2, 29.521544035282574, -98.57191085815431);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (14, 3, 29.52247762261362, -98.57103109359741);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (14, 4, 29.523336515350014, -98.57019424438478);
INSERT INTO public.polyline (line_id, "order", latitude, longitude) VALUES (14, 5, 29.52413938674919, -98.56946468353273);


--
-- TOC entry 4216 (class 0 OID 42647)
-- Dependencies: 218
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4217 (class 0 OID 43402)
-- Dependencies: 226
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--



--
-- TOC entry 4218 (class 0 OID 43414)
-- Dependencies: 227
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--



--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 223
-- Name: amenity_amenity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amenity_amenity_id_seq', 1, false);


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 234
-- Name: line_segment_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.line_segment_line_id_seq', 14, true);


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 235
-- Name: point_node_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.point_node_node_id_seq', 18, true);


--
-- TOC entry 4231 (class 2606 OID 43398)
-- Name: amenity amenity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenity
    ADD CONSTRAINT amenity_pkey PRIMARY KEY (amenity_id);


--
-- TOC entry 4243 (class 2606 OID 43571)
-- Name: line_type line_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_type
    ADD CONSTRAINT line_description_pkey PRIMARY KEY (type_id);


--
-- TOC entry 4245 (class 2606 OID 43597)
-- Name: line_segment line_segment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_segment
    ADD CONSTRAINT line_segment_pkey PRIMARY KEY (line_id);


--
-- TOC entry 4229 (class 2606 OID 51764)
-- Name: point_node node_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_node
    ADD CONSTRAINT node_id PRIMARY KEY (node_id);


--
-- TOC entry 4241 (class 2606 OID 51757)
-- Name: polyline polyline_composit_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polyline
    ADD CONSTRAINT polyline_composit_key PRIMARY KEY (line_id, "order");


--
-- TOC entry 4246 (class 2606 OID 43584)
-- Name: point_node amenity_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_node
    ADD CONSTRAINT amenity_id FOREIGN KEY (amenity_id) REFERENCES public.amenity(amenity_id) NOT VALID;


--
-- TOC entry 4247 (class 2606 OID 43603)
-- Name: polyline line_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polyline
    ADD CONSTRAINT line_id FOREIGN KEY (line_id) REFERENCES public.line_segment(line_id) NOT VALID;


--
-- TOC entry 4248 (class 2606 OID 43598)
-- Name: line_segment type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.line_segment
    ADD CONSTRAINT type_id FOREIGN KEY (type_id) REFERENCES public.line_type(type_id) NOT VALID;


-- Completed on 2022-11-28 20:24:07

--
-- PostgreSQL database dump complete
--

