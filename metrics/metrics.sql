-- Create Functions

-- DROP FUNCTION public.fbiomasslongo_acd_als();
CREATE OR REPLACE FUNCTION public.fbiomasslongo_acd_als()
  RETURNS trigger AS
$BODY$
BEGIN
    IF NEW.p10 = 0 OR NEW.max = 0 THEN
    	NEW.agblongo_als_total:=0.0;
    ELSE
        NEW.agblongo_als_total:=((0.2*(NEW.avg^2.02))*(NEW.kur^0.66)*(NEW.p05^0.11)*(NEW.p10^(-0.32))*((NEW.p75-NEW.p25)^0.5)*(NEW.max^(-0.82)))*2;
    END IF;
    RETURN NEW;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.fbiomasslongo_acd_als()
  OWNER TO postgres;

-- DROP FUNCTION public.fbiomasslongo_acd_tch();
CREATE OR REPLACE FUNCTION public.fbiomasslongo_acd_tch()
  RETURNS trigger AS
$BODY$
BEGIN
    IF NEW.chm = NULL OR NEW.chm < 0 OR NEW.chm = 0 THEN
    	NEW.agblongo_tch_total:=0.0;
    ELSE
        NEW.agblongo_tch_total:=(0.054*(NEW.chm^1.76))*2;
    END IF;
    RETURN NEW;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.fbiomasslongo_acd_tch()
  OWNER TO postgres;

-- DROP FUNCTION public.fbiomasslongo_abcd_tch();
CREATE OR REPLACE FUNCTION public.fbiomasslongo_abcd_tch()
  RETURNS trigger AS
$BODY$
BEGIN
    IF NEW.chm = NULL OR NEW.chm < 0 OR NEW.chm = 0 THEN
    	NEW.agblongo_tch_alive:=0.0;
    ELSE
        NEW.agblongo_tch_alive:=(0.025*(NEW.chm^1.99))*2;
    END IF;
    RETURN NEW;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.fbiomasslongo_abcd_tch()
  OWNER TO postgres;

-- DROP FUNCTION public.fbiomasslongo_abcd_als();
CREATE OR REPLACE FUNCTION public.fbiomasslongo_abcd_als()
  RETURNS trigger AS
$BODY$
BEGIN
    IF NEW.p10 = 0 OR NEW.max = 0 THEN
    	NEW.agblongo_als_alive:=0.0;
    ELSE
        NEW.agblongo_als_alive:=((0.058*exp(-3.6*NEW.d00))*(NEW.kur^0.72)*(NEW.p05^0.16)*(NEW.p10^(-0.43))*(NEW.p75^2.41)*(NEW.max^(-0.61)))*2;
    END IF;
    RETURN NEW;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.fbiomasslongo_abcd_als()
  OWNER TO postgres;

-- Create Sequence

-- DROP SEQUENCE public.metrics_id_seq;
CREATE SEQUENCE public.metrics_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 4386667
  CACHE 1;
ALTER TABLE public.tempimport_id_seq
  OWNER TO postgres;

-- Create table

-- DROP TABLE public.metrics;
CREATE TABLE public.metrics
(
  id integer NOT NULL DEFAULT nextval('metrics_id_seq'::regclass),
  transect_id integer,
  filename character varying(32),
  index_ integer,
  x double precision,
  y double precision,
  all_ integer,
  min double precision,
  max double precision,
  avg double precision,
  qav double precision,
  std double precision,
  ske double precision,
  kur double precision,
  p01 double precision,
  p05 double precision,
  p10 double precision,
  p25 double precision,
  p50 double precision,
  p75 double precision,
  p90 double precision,
  p95 double precision,
  p99 double precision,
  b10 double precision,
  b20 double precision,
  b30 double precision,
  b40 double precision,
  b50 double precision,
  b60 double precision,
  b70 double precision,
  b80 double precision,
  b90 double precision,
  c00 integer,
  c01 integer,
  c02 integer,
  c03 integer,
  c04 integer,
  c05 integer,
  c06 integer,
  c07 integer,
  d00 double precision,
  d01 double precision,
  d02 double precision,
  d03 double precision,
  d04 double precision,
  d05 double precision,
  d06 double precision,
  cov_gap double precision,
  dns_gap double precision,
  chm double precision,
  agblongo_als_total double precision,
  agblongo_tch_total double precision,
  agblongo_tch_alive double precision,
  CONSTRAINT metrics_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
)
TABLESPACE pg_default;
ALTER TABLE public.metrics
  OWNER TO postgres;

-- Triggers

-- DROP TRIGGER metrics_agblongo_als_total ON public.metrics;
CREATE TRIGGER metrics_agblongo_als_total
  BEFORE INSERT OR UPDATE
  ON public.metrics
  FOR EACH ROW
  EXECUTE PROCEDURE public.fbiomasslongo_acd_als();

-- DROP TRIGGER metrics_agblongo_tch_total ON public.metrics;
CREATE TRIGGER metrics_agblongo_tch_total
  BEFORE INSERT OR UPDATE
  ON public.metrics
  FOR EACH ROW
  EXECUTE PROCEDURE public.fbiomasslongo_acd_tch();

-- DROP TRIGGER metrics_agblongo_tch_alive ON public.metrics;
CREATE TRIGGER metrics_agblongo_tch_alive
  BEFORE INSERT OR UPDATE
  ON public.metrics
  FOR EACH ROW
  EXECUTE PROCEDURE public.fbiomasslongo_abcd_tch();

-- Get table schema
SELECT column_name, data_type, character_maximum_length, is_nullable 
FROM information_schema.columns 
WHERE table_schema = 'public' AND table_name = 'metrics';

SELECT 
    g.column_name,
    g.data_type,
    g.character_maximum_length,
    g.is_nullable,
    g.udt_name,
    f.type,
    f.srid
FROM 
     information_schema.columns as g JOIN
     geometry_columns AS f 
         ON (g.table_schema = f.f_table_schema and g.table_name = f.f_table_name )
WHERE
    table_schema = 'public' and
    table_name = 'metrics';

-- Create geometry using fields
-- ALTER TABLE metrics ADD COLUMN geom geometry(Geometry, 31974);
-- SELECT AddGeometryColumn('metrics','geom', 31974, 'Polygon', 2);
ALTER TABLE metrics DROP COLUMN geom;
ALTER TABLE metrics ADD COLUMN geom geometry(Geometry);
SELECT geom, * FROM metrics LIMIT 3;

-- Testing select a polygon using fields
SELECT ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])) as geom
FROM metrics
LIMIT 3;

-- Create a polygon using fields
UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE geom IS NULL;

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename = 'NP_T-0225.CSV';

-- Reproject columns 'geom'
-- http://www.spatialreference.org/ref/epsg/5880/
SELECT DISTINCT(ST_SRID(geom)) FROM metrics; -- should be 10 items
SELECT filename, ST_SRID(geom) FROM metrics WHERE filename = 'NP_T-0612.CSV';
SELECT filename, biomasslongo, geom FROM metrics WHERE ST_SRID(geom) = 31981 ORDER BY filename;

UPDATE metrics
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31973;

UPDATE metrics
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31974;

UPDATE metrics
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31975;

UPDATE metrics
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31976;

UPDATE metrics
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31978;

UPDATE metrics
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31979;

UPDATE metrics
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31980;

UPDATE metrics
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31981;

UPDATE metrics
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31982;

UPDATE metrics
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31983;

SELECT DISTINCT(ST_SRID(geom)) FROM metrics; -- should be 1 item

-- after all
-- Change the column srid
-- ALTER TABLE metrics ALTER COLUMN geom TYPE Geometry(Polygon, 32644) USING ST_Transform(geom, 5880) -- reproject all columns
-- ALTER TABLE metrics ALTER COLUMN geom TYPE geometry(Polygon) USING ST_SetSRID(geom, 5880);
SELECT UpdateGeometrySRID('public', 'metrics', 'geom', 5880); -- set only srid
SELECT Find_SRID('public', 'metrics', 'geom'); -- must be 5880

