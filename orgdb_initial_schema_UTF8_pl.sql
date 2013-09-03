-- OrgDB - simple attribute orgunit database 
-- Copyright (C) 2013 Krzysztof Keński 

-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: orgdb; Type: DATABASE; Schema: -; Owner: postgres
--

--encoding set for UTF-8
--LC_COLLATE & LC_CTYPE instead default set for polish language  
CREATE DATABASE orgdb_init WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pl_PL.utf8' LC_CTYPE = 'pl_PL.utf8';


ALTER DATABASE orgdb_init OWNER TO postgres;

\connect orgdb_init

SET statement_timeout = 0;
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
-- Name: orgunit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgunit (
    id text
);


ALTER TABLE public.orgunit OWNER TO postgres;

--
-- Name: orgunit_attribute; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orgunit_attribute (
    orgunit_id text,
    name text,
    value text
);


ALTER TABLE public.orgunit_attribute OWNER TO postgres;

--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE person (
    id text
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_attribute; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE person_attribute (
    person_id text,
    name text,
    value text
);


ALTER TABLE public.person_attribute OWNER TO postgres;

--
-- Name: person_orgunit_phone; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE person_orgunit_phone (
    person_id text,
    orgunit_id text,
    role_id text,
    role_type text,
    phone text
);


ALTER TABLE public.person_orgunit_phone OWNER TO postgres;

--
-- Name: person_role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE person_role (
    person_id text,
    name text,
    orgunit_id text,
    type text,
    role_id text,
    hierarchy_info text
);


ALTER TABLE public.person_role OWNER TO postgres;

--
-- Name: orgunit_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orgunit
    ADD CONSTRAINT orgunit_id_key UNIQUE (id);


--
-- Name: person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_id_key UNIQUE (id);


--
-- Name: orgunit_attribute_id_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orgunit_attribute
    ADD CONSTRAINT orgunit_attribute_id_key FOREIGN KEY (orgunit_id) REFERENCES orgunit(id) MATCH FULL;


--
-- Name: person_attribute_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person_attribute
    ADD CONSTRAINT person_attribute_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(id);


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

