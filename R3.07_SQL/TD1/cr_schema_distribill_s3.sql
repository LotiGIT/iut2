--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8 (Debian 15.8-0+deb12u1)
-- Dumped by pg_dump version 16.4


--
-- Name: distribill_s3; Type: SCHEMA; Schema: -; Owner: -
--
DROP SCHEMA IF EXISTS distribill_s3 CASCADE;

CREATE SCHEMA distribill_s3;

--
-- Name: _dept; Type: TABLE; Schema: distribill_s3; Owner: -
--

CREATE TABLE distribill_s3._dept (
    nodept integer NOT NULL,
    nomdept character varying(12) NOT NULL,
    lieu character varying(10) NOT NULL
);


--
-- Name: _employe; Type: TABLE; Schema: distribill_s3; Owner: -
--

CREATE TABLE distribill_s3._employe (
    matr integer NOT NULL,
    poste character varying(10) NOT NULL,
    sup integer NOT NULL
);


--
-- Name: _personnel; Type: TABLE; Schema: distribill_s3; Owner: -
--

CREATE TABLE distribill_s3._personnel (
    matr integer NOT NULL,
    nome character varying(10) NOT NULL,
    sal numeric(10,2) NOT NULL,
    datemb date NOT NULL,
    comm numeric(10,2) NOT NULL,
    nodept integer NOT NULL
);


--
-- Name: _president; Type: TABLE; Schema: distribill_s3; Owner: -
--

CREATE TABLE distribill_s3._president (
    matr integer NOT NULL
);


--
-- Name: personnel; Type: VIEW; Schema: distribill_s3; Owner: -
--

CREATE VIEW distribill_s3.personnel AS
 WITH RECURSIVE subordonnes(sub, sup) AS (
         SELECT _employe.matr,
            _employe.sup
           FROM distribill_s3._employe
        UNION
         SELECT e.matr,
            s_1.sup
           FROM (subordonnes s_1
             JOIN distribill_s3._employe e ON ((e.sup = s_1.sub)))
        )
 SELECT p.matr,
    p.nome,
    p.sal,
    round(((p.sal * 0.05) * (count(s.sub))::numeric), 2) AS prime_enc,
    p.datemb,
    p.comm,
    p.nodept
   FROM (subordonnes s
     RIGHT JOIN distribill_s3._personnel p ON ((s.sup = p.matr)))
  GROUP BY p.matr, p.nome, p.sal, p.datemb, p.comm, p.nodept;


--
-- Name: employe; Type: VIEW; Schema: distribill_s3; Owner: -
--

CREATE VIEW distribill_s3.employe AS
 SELECT personnel.matr,
    personnel.nome,
    personnel.sal,
    personnel.prime_enc,
    personnel.datemb,
    personnel.comm,
    personnel.nodept,
    _employe.poste,
    _employe.sup
   FROM (distribill_s3.personnel
     JOIN distribill_s3._employe USING (matr));


--
-- Name: president; Type: VIEW; Schema: distribill_s3; Owner: -
--

CREATE VIEW distribill_s3.president AS
 SELECT personnel.matr,
    personnel.nome,
    personnel.sal,
    personnel.prime_enc,
    personnel.datemb,
    personnel.comm,
    personnel.nodept
   FROM (distribill_s3.personnel
     JOIN distribill_s3._president USING (matr));


--
-- Data for Name: _dept; Type: TABLE DATA; Schema: distribill_s3; Owner: -
--

INSERT INTO distribill_s3._dept VALUES (10, 'FINANCES', 'PARIS');
INSERT INTO distribill_s3._dept VALUES (20, 'RECHERCHES', 'GRENOBLE');
INSERT INTO distribill_s3._dept VALUES (30, 'VENTES', 'LYON');
INSERT INTO distribill_s3._dept VALUES (40, 'FABRICATION', 'ROUEN');


--
-- Data for Name: _employe; Type: TABLE DATA; Schema: distribill_s3; Owner: -
--

INSERT INTO distribill_s3._employe VALUES (7369, 'SECRETAIRE', 7902);
INSERT INTO distribill_s3._employe VALUES (7499, 'COMMERCIAL', 7698);
INSERT INTO distribill_s3._employe VALUES (7521, 'COMMERCIAL', 7698);
INSERT INTO distribill_s3._employe VALUES (7566, 'DIRECTEUR', 7839);
INSERT INTO distribill_s3._employe VALUES (7654, 'COMMERCIAL', 7698);
INSERT INTO distribill_s3._employe VALUES (7698, 'DIRECTEUR', 7839);
INSERT INTO distribill_s3._employe VALUES (7782, 'DIRECTEUR', 7839);
INSERT INTO distribill_s3._employe VALUES (7788, 'INGENIEUR', 7566);
INSERT INTO distribill_s3._employe VALUES (7844, 'COMMERCIAL', 7698);
INSERT INTO distribill_s3._employe VALUES (7876, 'SECRETAIRE', 7788);
INSERT INTO distribill_s3._employe VALUES (7900, 'SECRETAIRE', 7698);
INSERT INTO distribill_s3._employe VALUES (7902, 'INGENIEUR', 7566);
INSERT INTO distribill_s3._employe VALUES (7934, 'SECRETAIRE', 7782);


--
-- Data for Name: _personnel; Type: TABLE DATA; Schema: distribill_s3; Owner: -
--

INSERT INTO distribill_s3._personnel VALUES (7369, 'LECLERC', 6400.00, '1980-12-02', 0.00, 20);
INSERT INTO distribill_s3._personnel VALUES (7499, 'BIRAUD', 12800.00, '1981-02-20', 2400.00, 30);
INSERT INTO distribill_s3._personnel VALUES (7521, 'BERGER', 10000.00, '1981-10-22', 4000.00, 30);
INSERT INTO distribill_s3._personnel VALUES (7566, 'MERCIER', 23000.00, '1981-03-02', 0.00, 20);
INSERT INTO distribill_s3._personnel VALUES (7654, 'MARTIN', 10000.00, '1981-05-28', 11200.00, 30);
INSERT INTO distribill_s3._personnel VALUES (7698, 'NOIRET', 22800.00, '1981-05-01', 0.00, 30);
INSERT INTO distribill_s3._personnel VALUES (7782, 'LESAGE', 19600.00, '1981-06-09', 0.00, 10);
INSERT INTO distribill_s3._personnel VALUES (7788, 'DUBOIS', 24000.00, '1985-04-14', 0.00, 20);
INSERT INTO distribill_s3._personnel VALUES (7839, 'LEROY', 40000.00, '1981-11-17', 0.00, 10);
INSERT INTO distribill_s3._personnel VALUES (7844, 'BENAIN', 12000.00, '1981-05-08', 0.00, 30);
INSERT INTO distribill_s3._personnel VALUES (7876, 'CLEMENT', 8800.00, '1985-05-10', 0.00, 20);
INSERT INTO distribill_s3._personnel VALUES (7900, 'FREMONT', 7600.00, '1981-12-03', 0.00, 30);
INSERT INTO distribill_s3._personnel VALUES (7902, 'CHATEL', 24000.00, '1981-12-17', 0.00, 20);
INSERT INTO distribill_s3._personnel VALUES (7934, 'VILLARD', 10400.00, '1982-08-23', 0.00, 10);


--
-- Data for Name: _president; Type: TABLE DATA; Schema: distribill_s3; Owner: -
--

INSERT INTO distribill_s3._president VALUES (7839);


--
-- Name: _employe _employe_pk; Type: CONSTRAINT; Schema: distribill_s3; Owner: -
--

ALTER TABLE ONLY distribill_s3._employe
    ADD CONSTRAINT _employe_pk PRIMARY KEY (matr);


--
-- Name: _personnel _personnel_pk; Type: CONSTRAINT; Schema: distribill_s3; Owner: -
--

ALTER TABLE ONLY distribill_s3._personnel
    ADD CONSTRAINT _personnel_pk PRIMARY KEY (matr);


--
-- Name: _dept dept_pk; Type: CONSTRAINT; Schema: distribill_s3; Owner: -
--

ALTER TABLE ONLY distribill_s3._dept
    ADD CONSTRAINT dept_pk PRIMARY KEY (nodept);


--
-- Name: _president president_pk; Type: CONSTRAINT; Schema: distribill_s3; Owner: -
--

ALTER TABLE ONLY distribill_s3._president
    ADD CONSTRAINT president_pk PRIMARY KEY (matr);


--
-- Name: _employe employe_dirige; Type: FK CONSTRAINT; Schema: distribill_s3; Owner: -
--

ALTER TABLE ONLY distribill_s3._employe
    ADD CONSTRAINT employe_dirige FOREIGN KEY (sup) REFERENCES distribill_s3._personnel(matr);


--
-- Name: _employe employe_is_personnel; Type: FK CONSTRAINT; Schema: distribill_s3; Owner: -
--

ALTER TABLE ONLY distribill_s3._employe
    ADD CONSTRAINT employe_is_personnel FOREIGN KEY (matr) REFERENCES distribill_s3._personnel(matr);


--
-- Name: _personnel personnel_travaille; Type: FK CONSTRAINT; Schema: distribill_s3; Owner: -
--

ALTER TABLE ONLY distribill_s3._personnel
    ADD CONSTRAINT personnel_travaille FOREIGN KEY (nodept) REFERENCES distribill_s3._dept(nodept);


--
-- Name: _president president_is_personnel; Type: FK CONSTRAINT; Schema: distribill_s3; Owner: -
--

ALTER TABLE ONLY distribill_s3._president
    ADD CONSTRAINT president_is_personnel FOREIGN KEY (matr) REFERENCES distribill_s3._personnel(matr);



--
-- PostgreSQL database dump complete
--

