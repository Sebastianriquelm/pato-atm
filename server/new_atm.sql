--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-12-18 17:27:46

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16545)
-- Name: atm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atm (
    id_atm integer NOT NULL,
    direccion character varying(200),
    ciudad integer,
    nombre_cliente character varying(90),
    region integer,
    foto_exterior character varying(200) NOT NULL,
    estado_gral_atm_ubi character varying(200) NOT NULL,
    estado_check character varying(200) NOT NULL,
    foto_estado character varying(200) NOT NULL
);


ALTER TABLE public.atm OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16544)
-- Name: atm_id_atm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.atm_id_atm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.atm_id_atm_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 219
-- Name: atm_id_atm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.atm_id_atm_seq OWNED BY public.atm.id_atm;


--
-- TOC entry 230 (class 1259 OID 16582)
-- Name: auditoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auditoria (
    id_auditoria integer NOT NULL,
    id_usuario integer,
    id_atm integer,
    fecha timestamp without time zone,
    id_site integer,
    id_fisica integer,
    id_senalitica integer,
    id_exterior integer
);


ALTER TABLE public.auditoria OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16581)
-- Name: auditoria_id_auditoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auditoria_id_auditoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auditoria_id_auditoria_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 229
-- Name: auditoria_id_auditoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auditoria_id_auditoria_seq OWNED BY public.auditoria.id_auditoria;


--
-- TOC entry 228 (class 1259 OID 16575)
-- Name: exterior; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exterior (
    id_exterior integer NOT NULL,
    puerta smallint NOT NULL,
    muro smallint NOT NULL,
    ad_visa smallint NOT NULL,
    ad_mc smallint NOT NULL
);


ALTER TABLE public.exterior OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16574)
-- Name: exterior_id_exterior_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exterior_id_exterior_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exterior_id_exterior_seq OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 227
-- Name: exterior_id_exterior_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exterior_id_exterior_seq OWNED BY public.exterior.id_exterior;


--
-- TOC entry 224 (class 1259 OID 16561)
-- Name: fisico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fisico (
    id_fisico integer NOT NULL,
    estado_pantalla smallint NOT NULL,
    teclado_pantalla smallint NOT NULL,
    teclado_dano smallint NOT NULL,
    cubre_teclado smallint NOT NULL,
    impresion smallint NOT NULL,
    basurero smallint NOT NULL,
    presentacion smallint NOT NULL
);


ALTER TABLE public.fisico OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16560)
-- Name: fisico_id_fisico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fisico_id_fisico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fisico_id_fisico_seq OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 223
-- Name: fisico_id_fisico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fisico_id_fisico_seq OWNED BY public.fisico.id_fisico;


--
-- TOC entry 216 (class 1259 OID 16526)
-- Name: perfiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfiles (
    id_perfil integer NOT NULL,
    nombre character varying(90) NOT NULL
);


ALTER TABLE public.perfiles OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16525)
-- Name: perfiles_id_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perfiles_id_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perfiles_id_perfil_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 215
-- Name: perfiles_id_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfiles_id_perfil_seq OWNED BY public.perfiles.id_perfil;


--
-- TOC entry 226 (class 1259 OID 16568)
-- Name: senaletica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.senaletica (
    id_senaletica integer NOT NULL,
    ad_visa smallint NOT NULL,
    ad_visa_diseno smallint NOT NULL,
    ad_ubicacion smallint NOT NULL,
    ad_mc smallint NOT NULL,
    ad_mc_diseno smallint NOT NULL,
    ad_mc_ubicacion smallint NOT NULL,
    numero_atm smallint NOT NULL,
    sen_seg smallint NOT NULL,
    sen_seg_diseno smallint NOT NULL,
    redbanc smallint NOT NULL,
    redbanc_ubicacion smallint NOT NULL,
    redbanc_diseno smallint NOT NULL,
    grafica_atm smallint NOT NULL,
    grafica_piso smallint NOT NULL
);


ALTER TABLE public.senaletica OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16567)
-- Name: senaletica_id_senaletica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.senaletica_id_senaletica_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.senaletica_id_senaletica_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 225
-- Name: senaletica_id_senaletica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.senaletica_id_senaletica_seq OWNED BY public.senaletica.id_senaletica;


--
-- TOC entry 222 (class 1259 OID 16552)
-- Name: site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site (
    id_site integer NOT NULL,
    frontal character varying(200) NOT NULL,
    lateral_derecho character varying(200) NOT NULL,
    sitecol character varying(45),
    lateral_izquierdo character varying(200) NOT NULL,
    num_atm character varying(200) NOT NULL,
    estado_piso character varying(200) NOT NULL,
    conexion_electrica character varying(200) NOT NULL,
    control_acceso smallint NOT NULL,
    control_acceso_op smallint NOT NULL,
    conexion_visible smallint NOT NULL,
    conexion_visible_foto character varying(200),
    estado_gral_espacio smallint NOT NULL,
    estado_paredes smallint NOT NULL,
    estado_puerta smallint NOT NULL,
    estado_cielo smallint NOT NULL,
    estado_ac smallint NOT NULL,
    estado_camara smallint NOT NULL
);


ALTER TABLE public.site OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16551)
-- Name: site_id_site_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_id_site_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.site_id_site_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 221
-- Name: site_id_site_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_id_site_seq OWNED BY public.site.id_site;


--
-- TOC entry 218 (class 1259 OID 16533)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(45) NOT NULL,
    apellido character varying(45) NOT NULL,
    perfil integer NOT NULL,
    telefono integer NOT NULL,
    login character varying(45) NOT NULL,
    password character varying(45) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16532)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 4725 (class 2604 OID 16548)
-- Name: atm id_atm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atm ALTER COLUMN id_atm SET DEFAULT nextval('public.atm_id_atm_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 16585)
-- Name: auditoria id_auditoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria ALTER COLUMN id_auditoria SET DEFAULT nextval('public.auditoria_id_auditoria_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 16578)
-- Name: exterior id_exterior; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exterior ALTER COLUMN id_exterior SET DEFAULT nextval('public.exterior_id_exterior_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 16564)
-- Name: fisico id_fisico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fisico ALTER COLUMN id_fisico SET DEFAULT nextval('public.fisico_id_fisico_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 16529)
-- Name: perfiles id_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfiles ALTER COLUMN id_perfil SET DEFAULT nextval('public.perfiles_id_perfil_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 16571)
-- Name: senaletica id_senaletica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.senaletica ALTER COLUMN id_senaletica SET DEFAULT nextval('public.senaletica_id_senaletica_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 16555)
-- Name: site id_site; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site ALTER COLUMN id_site SET DEFAULT nextval('public.site_id_site_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 16536)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 4902 (class 0 OID 16545)
-- Dependencies: 220
-- Data for Name: atm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atm (id_atm, direccion, ciudad, nombre_cliente, region, foto_exterior, estado_gral_atm_ubi, estado_check, foto_estado) FROM stdin;
1	roma 26	1	Santander	2	asd	asd	Activo	foto
\.


--
-- TOC entry 4912 (class 0 OID 16582)
-- Dependencies: 230
-- Data for Name: auditoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auditoria (id_auditoria, id_usuario, id_atm, fecha, id_site, id_fisica, id_senalitica, id_exterior) FROM stdin;
\.


--
-- TOC entry 4910 (class 0 OID 16575)
-- Dependencies: 228
-- Data for Name: exterior; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exterior (id_exterior, puerta, muro, ad_visa, ad_mc) FROM stdin;
\.


--
-- TOC entry 4906 (class 0 OID 16561)
-- Dependencies: 224
-- Data for Name: fisico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fisico (id_fisico, estado_pantalla, teclado_pantalla, teclado_dano, cubre_teclado, impresion, basurero, presentacion) FROM stdin;
\.


--
-- TOC entry 4898 (class 0 OID 16526)
-- Dependencies: 216
-- Data for Name: perfiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perfiles (id_perfil, nombre) FROM stdin;
1	Administrador
\.


--
-- TOC entry 4908 (class 0 OID 16568)
-- Dependencies: 226
-- Data for Name: senaletica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.senaletica (id_senaletica, ad_visa, ad_visa_diseno, ad_ubicacion, ad_mc, ad_mc_diseno, ad_mc_ubicacion, numero_atm, sen_seg, sen_seg_diseno, redbanc, redbanc_ubicacion, redbanc_diseno, grafica_atm, grafica_piso) FROM stdin;
\.


--
-- TOC entry 4904 (class 0 OID 16552)
-- Dependencies: 222
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site (id_site, frontal, lateral_derecho, sitecol, lateral_izquierdo, num_atm, estado_piso, conexion_electrica, control_acceso, control_acceso_op, conexion_visible, conexion_visible_foto, estado_gral_espacio, estado_paredes, estado_puerta, estado_cielo, estado_ac, estado_camara) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 16533)
-- Dependencies: 218
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nombre, apellido, perfil, telefono, login, password) FROM stdin;
2	Pato	Balboa	1	945255554	pbalboa	1q2w3e
\.


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 219
-- Name: atm_id_atm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.atm_id_atm_seq', 1, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 229
-- Name: auditoria_id_auditoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auditoria_id_auditoria_seq', 1, false);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 227
-- Name: exterior_id_exterior_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exterior_id_exterior_seq', 1, false);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 223
-- Name: fisico_id_fisico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fisico_id_fisico_seq', 1, false);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 215
-- Name: perfiles_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfiles_id_perfil_seq', 1, true);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 225
-- Name: senaletica_id_senaletica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.senaletica_id_senaletica_seq', 1, false);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 221
-- Name: site_id_site_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_id_site_seq', 1, false);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 2, true);


--
-- TOC entry 4736 (class 2606 OID 16550)
-- Name: atm atm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atm
    ADD CONSTRAINT atm_pkey PRIMARY KEY (id_atm);


--
-- TOC entry 4746 (class 2606 OID 16587)
-- Name: auditoria auditoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT auditoria_pkey PRIMARY KEY (id_auditoria);


--
-- TOC entry 4744 (class 2606 OID 16580)
-- Name: exterior exterior_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exterior
    ADD CONSTRAINT exterior_pkey PRIMARY KEY (id_exterior);


--
-- TOC entry 4740 (class 2606 OID 16566)
-- Name: fisico fisico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fisico
    ADD CONSTRAINT fisico_pkey PRIMARY KEY (id_fisico);


--
-- TOC entry 4732 (class 2606 OID 16531)
-- Name: perfiles perfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfiles
    ADD CONSTRAINT perfiles_pkey PRIMARY KEY (id_perfil);


--
-- TOC entry 4742 (class 2606 OID 16573)
-- Name: senaletica senaletica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.senaletica
    ADD CONSTRAINT senaletica_pkey PRIMARY KEY (id_senaletica);


--
-- TOC entry 4738 (class 2606 OID 16559)
-- Name: site site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (id_site);


--
-- TOC entry 4734 (class 2606 OID 16538)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4748 (class 2606 OID 16598)
-- Name: auditoria fk_audiotoria_site; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_audiotoria_site FOREIGN KEY (id_site) REFERENCES public.site(id_site);


--
-- TOC entry 4749 (class 2606 OID 16593)
-- Name: auditoria fk_audiotoria_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_audiotoria_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4750 (class 2606 OID 16588)
-- Name: auditoria fk_auditoria_atm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_auditoria_atm FOREIGN KEY (id_atm) REFERENCES public.atm(id_atm);


--
-- TOC entry 4751 (class 2606 OID 16613)
-- Name: auditoria fk_auditoria_exterior; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_auditoria_exterior FOREIGN KEY (id_exterior) REFERENCES public.exterior(id_exterior);


--
-- TOC entry 4752 (class 2606 OID 16603)
-- Name: auditoria fk_auditoria_fisico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_auditoria_fisico FOREIGN KEY (id_fisica) REFERENCES public.fisico(id_fisico);


--
-- TOC entry 4753 (class 2606 OID 16608)
-- Name: auditoria fk_auditoria_senaletica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_auditoria_senaletica FOREIGN KEY (id_senalitica) REFERENCES public.senaletica(id_senaletica);


--
-- TOC entry 4747 (class 2606 OID 16539)
-- Name: usuarios fk_usuario_perfil; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuario_perfil FOREIGN KEY (perfil) REFERENCES public.perfiles(id_perfil);


-- Completed on 2023-12-18 17:27:46

--
-- PostgreSQL database dump complete
--

