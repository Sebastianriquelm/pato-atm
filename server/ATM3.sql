PGDMP  *        
             |           ATM3    16.0    16.0 C    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    245885    ATM3    DATABASE     y   CREATE DATABASE "ATM3" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "ATM3";
                postgres    false            �            1259    246208    atm    TABLE     ;  CREATE TABLE public.atm (
    id_atm integer NOT NULL,
    direccion character(200),
    nombre_cliente character(90),
    fecha_hora character(200) NOT NULL,
    estado_check character(200) NOT NULL,
    ciudad character(200),
    nombre_auditor character(200),
    region character(200),
    cod character(10)
);
    DROP TABLE public.atm;
       public         heap    postgres    false            �            1259    246207    atm_id_atm_seq    SEQUENCE     �   CREATE SEQUENCE public.atm_id_atm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.atm_id_atm_seq;
       public          postgres    false    216                       0    0    atm_id_atm_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.atm_id_atm_seq OWNED BY public.atm.id_atm;
          public          postgres    false    215            �            1259    246213 	   auditoria    TABLE     �   CREATE TABLE public.auditoria (
    id_auditoria integer NOT NULL,
    id_usuario integer,
    id_atm integer,
    fecha timestamp without time zone,
    id_site integer,
    id_fisica integer,
    id_senalitica integer,
    id_exterior integer
);
    DROP TABLE public.auditoria;
       public         heap    postgres    false            �            1259    246216    auditoria_id_auditoria_seq    SEQUENCE     �   CREATE SEQUENCE public.auditoria_id_auditoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.auditoria_id_auditoria_seq;
       public          postgres    false    217                       0    0    auditoria_id_auditoria_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.auditoria_id_auditoria_seq OWNED BY public.auditoria.id_auditoria;
          public          postgres    false    218            �            1259    246217    exterior    TABLE     �   CREATE TABLE public.exterior (
    id_exterior integer NOT NULL,
    puerta boolean,
    muro boolean,
    ad_visa boolean,
    ad_mc boolean
);
    DROP TABLE public.exterior;
       public         heap    postgres    false            �            1259    246220    exterior_id_exterior_seq    SEQUENCE     �   CREATE SEQUENCE public.exterior_id_exterior_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.exterior_id_exterior_seq;
       public          postgres    false    219                       0    0    exterior_id_exterior_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.exterior_id_exterior_seq OWNED BY public.exterior.id_exterior;
          public          postgres    false    220            �            1259    246221    fisico    TABLE     �   CREATE TABLE public.fisico (
    id_fisico integer NOT NULL,
    estado_pantalla boolean,
    teclado_pantalla boolean,
    teclado_dano boolean,
    cubre_teclado boolean,
    impresion boolean,
    basurero boolean,
    presentacion boolean
);
    DROP TABLE public.fisico;
       public         heap    postgres    false            �            1259    246224    fisico_id_fisico_seq    SEQUENCE     �   CREATE SEQUENCE public.fisico_id_fisico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.fisico_id_fisico_seq;
       public          postgres    false    221                       0    0    fisico_id_fisico_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.fisico_id_fisico_seq OWNED BY public.fisico.id_fisico;
          public          postgres    false    222            �            1259    246225    perfiles    TABLE     l   CREATE TABLE public.perfiles (
    id_perfil integer NOT NULL,
    nombre character varying(90) NOT NULL
);
    DROP TABLE public.perfiles;
       public         heap    postgres    false            �            1259    246228    perfiles_id_perfil_seq    SEQUENCE     �   CREATE SEQUENCE public.perfiles_id_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.perfiles_id_perfil_seq;
       public          postgres    false    223                       0    0    perfiles_id_perfil_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.perfiles_id_perfil_seq OWNED BY public.perfiles.id_perfil;
          public          postgres    false    224            �            1259    246229 
   senaletica    TABLE     �  CREATE TABLE public.senaletica (
    id_senaletica integer NOT NULL,
    ad_visa boolean,
    ad_visa_diseno boolean,
    ad_ubicacion boolean,
    ad_mc boolean,
    ad_mc_diseno boolean,
    ad_mc_ubicacion boolean,
    numero_atm boolean,
    sen_seg boolean,
    sen_seg_diseno boolean,
    redbanc boolean,
    redbanc_ubicacion boolean,
    redbanc_diseno boolean,
    grafica_atm boolean,
    grafica_piso boolean,
    redbanc_largo boolean
);
    DROP TABLE public.senaletica;
       public         heap    postgres    false            �            1259    246232    senaletica_id_senaletica_seq    SEQUENCE     �   CREATE SEQUENCE public.senaletica_id_senaletica_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.senaletica_id_senaletica_seq;
       public          postgres    false    225                       0    0    senaletica_id_senaletica_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.senaletica_id_senaletica_seq OWNED BY public.senaletica.id_senaletica;
          public          postgres    false    226            �            1259    246233    site    TABLE     t  CREATE TABLE public.site (
    id_site integer NOT NULL,
    control_acceso boolean,
    control_acceso_op boolean,
    conexion_visible boolean,
    estado_gral_espacio boolean,
    estado_paredes boolean,
    estado_puerta boolean,
    estado_cielo boolean,
    estado_ac boolean,
    estado_iluminaria boolean,
    estado_muebles boolean,
    estado_camaras boolean
);
    DROP TABLE public.site;
       public         heap    postgres    false            �            1259    246238    site_id_site_seq    SEQUENCE     �   CREATE SEQUENCE public.site_id_site_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.site_id_site_seq;
       public          postgres    false    227                       0    0    site_id_site_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.site_id_site_seq OWNED BY public.site.id_site;
          public          postgres    false    228            �            1259    246239    usuarios    TABLE     -  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(45) NOT NULL,
    apellido character varying(45) NOT NULL,
    perfil integer NOT NULL,
    telefono integer NOT NULL,
    login character varying(45) NOT NULL,
    password character varying(45) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    246242    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public          postgres    false    229                       0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public          postgres    false    230            =           2604    246243 
   atm id_atm    DEFAULT     h   ALTER TABLE ONLY public.atm ALTER COLUMN id_atm SET DEFAULT nextval('public.atm_id_atm_seq'::regclass);
 9   ALTER TABLE public.atm ALTER COLUMN id_atm DROP DEFAULT;
       public          postgres    false    215    216    216            >           2604    246244    auditoria id_auditoria    DEFAULT     �   ALTER TABLE ONLY public.auditoria ALTER COLUMN id_auditoria SET DEFAULT nextval('public.auditoria_id_auditoria_seq'::regclass);
 E   ALTER TABLE public.auditoria ALTER COLUMN id_auditoria DROP DEFAULT;
       public          postgres    false    218    217            ?           2604    246245    exterior id_exterior    DEFAULT     |   ALTER TABLE ONLY public.exterior ALTER COLUMN id_exterior SET DEFAULT nextval('public.exterior_id_exterior_seq'::regclass);
 C   ALTER TABLE public.exterior ALTER COLUMN id_exterior DROP DEFAULT;
       public          postgres    false    220    219            @           2604    246246    fisico id_fisico    DEFAULT     t   ALTER TABLE ONLY public.fisico ALTER COLUMN id_fisico SET DEFAULT nextval('public.fisico_id_fisico_seq'::regclass);
 ?   ALTER TABLE public.fisico ALTER COLUMN id_fisico DROP DEFAULT;
       public          postgres    false    222    221            A           2604    246247    perfiles id_perfil    DEFAULT     x   ALTER TABLE ONLY public.perfiles ALTER COLUMN id_perfil SET DEFAULT nextval('public.perfiles_id_perfil_seq'::regclass);
 A   ALTER TABLE public.perfiles ALTER COLUMN id_perfil DROP DEFAULT;
       public          postgres    false    224    223            B           2604    246248    senaletica id_senaletica    DEFAULT     �   ALTER TABLE ONLY public.senaletica ALTER COLUMN id_senaletica SET DEFAULT nextval('public.senaletica_id_senaletica_seq'::regclass);
 G   ALTER TABLE public.senaletica ALTER COLUMN id_senaletica DROP DEFAULT;
       public          postgres    false    226    225            C           2604    246249    site id_site    DEFAULT     l   ALTER TABLE ONLY public.site ALTER COLUMN id_site SET DEFAULT nextval('public.site_id_site_seq'::regclass);
 ;   ALTER TABLE public.site ALTER COLUMN id_site DROP DEFAULT;
       public          postgres    false    228    227            D           2604    246250    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    230    229            �          0    246208    atm 
   TABLE DATA              COPY public.atm (id_atm, direccion, nombre_cliente, fecha_hora, estado_check, ciudad, nombre_auditor, region, cod) FROM stdin;
    public          postgres    false    216   kQ       �          0    246213 	   auditoria 
   TABLE DATA           |   COPY public.auditoria (id_auditoria, id_usuario, id_atm, fecha, id_site, id_fisica, id_senalitica, id_exterior) FROM stdin;
    public          postgres    false    217   �Q       �          0    246217    exterior 
   TABLE DATA           M   COPY public.exterior (id_exterior, puerta, muro, ad_visa, ad_mc) FROM stdin;
    public          postgres    false    219   �Q       �          0    246221    fisico 
   TABLE DATA           �   COPY public.fisico (id_fisico, estado_pantalla, teclado_pantalla, teclado_dano, cubre_teclado, impresion, basurero, presentacion) FROM stdin;
    public          postgres    false    221   R       �          0    246225    perfiles 
   TABLE DATA           5   COPY public.perfiles (id_perfil, nombre) FROM stdin;
    public          postgres    false    223   =R       �          0    246229 
   senaletica 
   TABLE DATA           �   COPY public.senaletica (id_senaletica, ad_visa, ad_visa_diseno, ad_ubicacion, ad_mc, ad_mc_diseno, ad_mc_ubicacion, numero_atm, sen_seg, sen_seg_diseno, redbanc, redbanc_ubicacion, redbanc_diseno, grafica_atm, grafica_piso, redbanc_largo) FROM stdin;
    public          postgres    false    225   tR       �          0    246233    site 
   TABLE DATA           �   COPY public.site (id_site, control_acceso, control_acceso_op, conexion_visible, estado_gral_espacio, estado_paredes, estado_puerta, estado_cielo, estado_ac, estado_iluminaria, estado_muebles, estado_camaras) FROM stdin;
    public          postgres    false    227   �R       �          0    246239    usuarios 
   TABLE DATA           c   COPY public.usuarios (id_usuario, nombre, apellido, perfil, telefono, login, password) FROM stdin;
    public          postgres    false    229   �R       	           0    0    atm_id_atm_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.atm_id_atm_seq', 1, false);
          public          postgres    false    215            
           0    0    auditoria_id_auditoria_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.auditoria_id_auditoria_seq', 1, false);
          public          postgres    false    218                       0    0    exterior_id_exterior_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.exterior_id_exterior_seq', 1, false);
          public          postgres    false    220                       0    0    fisico_id_fisico_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.fisico_id_fisico_seq', 1, false);
          public          postgres    false    222                       0    0    perfiles_id_perfil_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.perfiles_id_perfil_seq', 1, false);
          public          postgres    false    224                       0    0    senaletica_id_senaletica_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.senaletica_id_senaletica_seq', 1, false);
          public          postgres    false    226                       0    0    site_id_site_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.site_id_site_seq', 1, false);
          public          postgres    false    228                       0    0    usuarios_id_usuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, false);
          public          postgres    false    230            F           2606    246252    atm atm_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.atm
    ADD CONSTRAINT atm_pkey PRIMARY KEY (id_atm);
 6   ALTER TABLE ONLY public.atm DROP CONSTRAINT atm_pkey;
       public            postgres    false    216            H           2606    246254    auditoria auditoria_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT auditoria_pkey PRIMARY KEY (id_auditoria);
 B   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT auditoria_pkey;
       public            postgres    false    217            J           2606    246256    exterior exterior_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.exterior
    ADD CONSTRAINT exterior_pkey PRIMARY KEY (id_exterior);
 @   ALTER TABLE ONLY public.exterior DROP CONSTRAINT exterior_pkey;
       public            postgres    false    219            L           2606    246258    fisico fisico_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.fisico
    ADD CONSTRAINT fisico_pkey PRIMARY KEY (id_fisico);
 <   ALTER TABLE ONLY public.fisico DROP CONSTRAINT fisico_pkey;
       public            postgres    false    221            N           2606    246260    perfiles perfiles_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.perfiles
    ADD CONSTRAINT perfiles_pkey PRIMARY KEY (id_perfil);
 @   ALTER TABLE ONLY public.perfiles DROP CONSTRAINT perfiles_pkey;
       public            postgres    false    223            P           2606    246262    senaletica senaletica_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.senaletica
    ADD CONSTRAINT senaletica_pkey PRIMARY KEY (id_senaletica);
 D   ALTER TABLE ONLY public.senaletica DROP CONSTRAINT senaletica_pkey;
       public            postgres    false    225            R           2606    246264    site site_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (id_site);
 8   ALTER TABLE ONLY public.site DROP CONSTRAINT site_pkey;
       public            postgres    false    227            T           2606    246266    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    229            U           2606    246267    auditoria fk_audiotoria_site    FK CONSTRAINT        ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_audiotoria_site FOREIGN KEY (id_site) REFERENCES public.site(id_site);
 F   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT fk_audiotoria_site;
       public          postgres    false    227    217    4690            V           2606    246272    auditoria fk_audiotoria_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_audiotoria_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 I   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT fk_audiotoria_usuario;
       public          postgres    false    4692    217    229            W           2606    246277    auditoria fk_auditoria_atm    FK CONSTRAINT     z   ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_auditoria_atm FOREIGN KEY (id_atm) REFERENCES public.atm(id_atm);
 D   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT fk_auditoria_atm;
       public          postgres    false    216    4678    217            X           2606    246282    auditoria fk_auditoria_exterior    FK CONSTRAINT     �   ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_auditoria_exterior FOREIGN KEY (id_exterior) REFERENCES public.exterior(id_exterior);
 I   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT fk_auditoria_exterior;
       public          postgres    false    219    4682    217            Y           2606    246287    auditoria fk_auditoria_fisico    FK CONSTRAINT     �   ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_auditoria_fisico FOREIGN KEY (id_fisica) REFERENCES public.fisico(id_fisico);
 G   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT fk_auditoria_fisico;
       public          postgres    false    217    221    4684            Z           2606    246292 !   auditoria fk_auditoria_senaletica    FK CONSTRAINT     �   ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT fk_auditoria_senaletica FOREIGN KEY (id_senalitica) REFERENCES public.senaletica(id_senaletica);
 K   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT fk_auditoria_senaletica;
       public          postgres    false    217    225    4688            [           2606    246297    usuarios fk_usuario_perfil    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuario_perfil FOREIGN KEY (perfil) REFERENCES public.perfiles(id_perfil);
 D   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT fk_usuario_perfil;
       public          postgres    false    4686    223    229            �   Z   x�3���/VH�KO�I-Vʀ3�$?�FF����(�[�����N��̲��v�`4�6����� �CpZ���A�\1z\\\ "��D      �      x������ � �      �      x�3�L�,�4�=... ~�      �      x�3�L�,b(����� /��      �   '   x�3�tL����,.)JL�/�2�-.M,������� �	k      �      x�3�,�L�	K�LL�L�K�X\1z\\\ /��      �      x�3�L�0��b���� [`�      �   0   x�3�NMJ,.�L���,,M��M�4�4��b�4g���1W� ]m�     