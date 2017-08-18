-----------------------------------------------------------------------------------------------------------------
-- Create Sequence

-- DROP SEQUENCE public.metrics_id_seq;
CREATE SEQUENCE public.metrics_id_seq
INCREMENT 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER TABLE public.metrics_id_seq
  OWNER TO postgres;

-- Create table

-- DROP TABLE public.metrics;
CREATE TABLE public.metrics
(
  id                 INTEGER NOT NULL DEFAULT nextval('metrics_id_seq' :: REGCLASS),
  transect_id        INTEGER,
  amazon_id          INTEGER,
  filename           CHARACTER VARYING(32),
  index_             INTEGER,
  x                  DOUBLE PRECISION,
  y                  DOUBLE PRECISION,
  all_               INTEGER,
  min                DOUBLE PRECISION,
  max                DOUBLE PRECISION,
  avg                DOUBLE PRECISION,
  qav                DOUBLE PRECISION,
  std                DOUBLE PRECISION,
  ske                DOUBLE PRECISION,
  kur                DOUBLE PRECISION,
  p01                DOUBLE PRECISION,
  p05                DOUBLE PRECISION,
  p10                DOUBLE PRECISION,
  p25                DOUBLE PRECISION,
  p50                DOUBLE PRECISION,
  p75                DOUBLE PRECISION,
  p90                DOUBLE PRECISION,
  p95                DOUBLE PRECISION,
  p99                DOUBLE PRECISION,
  b10                DOUBLE PRECISION,
  b20                DOUBLE PRECISION,
  b30                DOUBLE PRECISION,
  b40                DOUBLE PRECISION,
  b50                DOUBLE PRECISION,
  b60                DOUBLE PRECISION,
  b70                DOUBLE PRECISION,
  b80                DOUBLE PRECISION,
  b90                DOUBLE PRECISION,
  c00                INTEGER,
  c01                INTEGER,
  c02                INTEGER,
  c03                INTEGER,
  c04                INTEGER,
  c05                INTEGER,
  c06                INTEGER,
  c07                INTEGER,
  d00                DOUBLE PRECISION,
  d01                DOUBLE PRECISION,
  d02                DOUBLE PRECISION,
  d03                DOUBLE PRECISION,
  d04                DOUBLE PRECISION,
  d05                DOUBLE PRECISION,
  d06                DOUBLE PRECISION,
  d07                DOUBLE PRECISION,
  cov_gap            DOUBLE PRECISION,
  dns_gap            DOUBLE PRECISION,
  chm                DOUBLE PRECISION,
  agblongo_als_total DOUBLE PRECISION,
  agblongo_als_alive DOUBLE PRECISION,
  agblongo_tch_total DOUBLE PRECISION,
  agblongo_tch_alive DOUBLE PRECISION,
  CONSTRAINT metrics_pkey PRIMARY KEY (id)
)
WITH (
OIDS = FALSE
)
TABLESPACE pg_default;
ALTER TABLE public.metrics
  OWNER TO postgres;

ALTER TABLE metrics
  ADD CONSTRAINT transects_fkey
FOREIGN KEY (transect_id)
REFERENCES transects;

ALTER TABLE metrics
  ADD CONSTRAINT amazon_fkey
FOREIGN KEY (amazon_id)
REFERENCES amazon;

-----------------------------------------------------------------------------------------------------------------
-- Create Function

-- DROP FUNCTION public.fbiomasslongo_acd_als();
CREATE OR REPLACE FUNCTION public.fbiomasslongo_acd_als()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  IF NEW.p10 = 0 OR NEW.max = 0
  THEN
    NEW.agblongo_als_total:=NULL;
  ELSE
    NEW.agblongo_als_total:=
    ((0.2 * (NEW.avg ^ 2.02)) * (NEW.kur ^ 0.66) * (NEW.p05 ^ 0.11) * (NEW.p10 ^ (-0.32)) * ((NEW.p75 - NEW.p25) ^ 0.5)
     * (NEW.max ^ (-0.82))) * 2;
  END IF;
  RETURN NEW;
END$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;
ALTER FUNCTION public.fbiomasslongo_acd_als()
OWNER TO postgres;

-- Create Trigger

-- DROP TRIGGER metrics_agblongo_als_total ON public.metrics;
CREATE TRIGGER metrics_agblongo_als_total
BEFORE INSERT OR UPDATE
  ON public.metrics
FOR EACH ROW
EXECUTE PROCEDURE public.fbiomasslongo_acd_als();

-----------------------------------------------------------------------------------------------------------------
-- Create Function

-- DROP FUNCTION public.fbiomasslongo_acd_tch();
CREATE OR REPLACE FUNCTION public.fbiomasslongo_acd_tch()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  IF NEW.chm IS NULL OR NEW.chm < 0
  THEN
    NEW.agblongo_tch_total:=NULL;
  ELSIF NEW.chm = 0
    THEN
      NEW.agblongo_tch_total:=0.0;
  ELSE
    NEW.agblongo_tch_total:=(0.054 * (NEW.chm ^ 1.76)) * 2;
  END IF;
  RETURN NEW;
END$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;
ALTER FUNCTION public.fbiomasslongo_acd_tch()
OWNER TO postgres;

-- Create Trigger

-- DROP TRIGGER metrics_agblongo_tch_total ON public.metrics;
CREATE TRIGGER metrics_agblongo_tch_total
BEFORE INSERT OR UPDATE
  ON public.metrics
FOR EACH ROW
EXECUTE PROCEDURE public.fbiomasslongo_acd_tch();

-----------------------------------------------------------------------------------------------------------------
-- Create Function

-- DROP FUNCTION public.fbiomasslongo_abcd_als();
CREATE OR REPLACE FUNCTION public.fbiomasslongo_abcd_als()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  IF NEW.p10 = 0 OR NEW.max = 0
  THEN
    NEW.agblongo_als_alive:=NULL;
  ELSE
    NEW.agblongo_als_alive:=
    ((0.058 * exp((-3.6) * NEW.d00)) * (NEW.kur ^ 0.72) * (NEW.p05 ^ 0.16) * (NEW.p10 ^ (-0.43)) * (NEW.p75 ^ 2.41) *
     (NEW.max ^ (-0.61))) * 2;
  END IF;
  RETURN NEW;
END$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;
ALTER FUNCTION public.fbiomasslongo_abcd_als()
OWNER TO postgres;

-- Create Trigger

-- DROP TRIGGER metrics_agblongo_als_alive ON public.metrics;
CREATE TRIGGER metrics_agblongo_als_alive
BEFORE INSERT OR UPDATE
  ON public.metrics
FOR EACH ROW
EXECUTE PROCEDURE public.fbiomasslongo_abcd_als();

-----------------------------------------------------------------------------------------------------------------
-- Create Function

-- DROP FUNCTION public.fbiomasslongo_abcd_tch();
CREATE OR REPLACE FUNCTION public.fbiomasslongo_abcd_tch()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  IF NEW.chm IS NULL OR NEW.chm < 0
  THEN
    NEW.agblongo_tch_alive:=NULL;
  ELSIF NEW.chm = 0
    THEN
      NEW.agblongo_tch_alive:=0.0;
  ELSE
    NEW.agblongo_tch_alive:=(0.025 * (NEW.chm ^ 1.99)) * 2;
  END IF;
  RETURN NEW;
END$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;
ALTER FUNCTION public.fbiomasslongo_abcd_tch()
OWNER TO postgres;

-- Create Trigger

-- DROP TRIGGER metrics_agblongo_tch_alive ON public.metrics;
CREATE TRIGGER metrics_agblongo_tch_alive
BEFORE INSERT OR UPDATE
  ON public.metrics
FOR EACH ROW
EXECUTE PROCEDURE public.fbiomasslongo_abcd_tch();

-----------------------------------------------------------------------------------------------------------------
-- Create Function

-- DROP FUNCTION public.fupdate_amazon_biomass();

CREATE OR REPLACE FUNCTION fupdate_amazon_biomass(transect_id INTEGER)
  RETURNS VOID AS $$
DECLARE
    amazon_transects CURSOR FOR SELECT polys.*
                                FROM amazon_palsar_hv polys INNER JOIN transects bb
                                    ON ST_Intersects(bb.polyflown, polys.geom)
                                WHERE bb.id = transect_id;
BEGIN
  FOR amazon IN amazon_transects LOOP
    UPDATE amazon_palsar_hv
    SET agblongo_als_total = metric.agblongo_als_total,
      agblongo_als_alive   = metric.agblongo_als_alive,
      agblongo_tch_total   = metric.agblongo_tch_total,
      agblongo_tch_alive   = metric.agblongo_tch_alive
    FROM (SELECT
            AVG(mt.agblongo_als_total) AS agblongo_als_total,
            AVG(mt.agblongo_als_alive) AS agblongo_als_alive,
            AVG(mt.agblongo_tch_total) AS agblongo_tch_total,
            AVG(mt.agblongo_tch_alive) AS agblongo_tch_alive
          FROM metrics mt INNER JOIN amazon_palsar_hv amz ON ST_Intersects(amz.geom, mt.geom)
          WHERE amz.ogc_fid = amazon.ogc_fid) AS metric
    WHERE ogc_fid = amazon.ogc_fid;
  END LOOP;
END$$
LANGUAGE plpgsql;

-- Usage:
-- SELECT fupdate_amazon_biomass(597);

-- Create Trigger

-- DROP TRIGGER amazon_update_biomass ON public.metrics;
CREATE TRIGGER amazon_update_biomass
AFTER UPDATE
  ON public.metrics
FOR EACH ROW
EXECUTE PROCEDURE public.fupdate_metrics_amazon_id(new.transect_id);

-----------------------------------------------------------------------------------------------------------------
-- Get table schema

SELECT
  column_name,
  data_type,
  character_maximum_length,
  is_nullable
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
  information_schema.columns AS g
  JOIN
  geometry_columns AS f
    ON (g.table_schema = f.f_table_schema AND g.table_name = f.f_table_name)
WHERE
  table_schema = 'public' AND
  table_name = 'metrics';

-----------------------------------------------------------------------------------------------------------------
-- Create geometry using fields
-- ALTER TABLE metrics ADD COLUMN geom geometry(Geometry, 31974);
-- SELECT AddGeometryColumn('metrics','geom', 31974, 'Polygon', 2);
ALTER TABLE metrics
  DROP COLUMN geom;
ALTER TABLE metrics
  ADD COLUMN geom GEOMETRY(Geometry);
SELECT
  geom,
  *
FROM metrics
LIMIT 3;

-----------------------------------------------------------------------------------------------------------------
-- Create a polygon using fields
UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY [ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y -
                                                                                                           25), ST_MakePoint(
    x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0002';

-- Reproject columns 'geom'
-- http://www.spatialreference.org/ref/epsg/5880/
SELECT DISTINCT (ST_SRID(geom))
FROM metrics; -- should be 10 items
SELECT
  filename,
  ST_SRID(geom)
FROM metrics
WHERE filename ~ '0002';

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

SELECT DISTINCT (ST_SRID(geom))
FROM metrics; -- should be 1 item

-- Change the column srid
-- ALTER TABLE metrics ALTER COLUMN geom TYPE Geometry(Polygon, 32644) USING ST_Transform(geom, 5880) -- reproject all columns
-- ALTER TABLE metrics ALTER COLUMN geom TYPE geometry(Polygon) USING ST_SetSRID(geom, 5880);
SELECT UpdateGeometrySRID('public', 'metrics', 'geom', 5880); -- set only srid
SELECT Find_SRID('public', 'metrics', 'geom'); -- must be 5880

-----------------------------------------------------------------------------------------------------------------
-- Data analysis

-- Export to SHP
SELECT
  filename,
  index_,
  x,
  y,
  chm,
  agblongo_als_total,
  agblongo_tch_total,
  agblongo_tch_alive,
  geom
FROM metrics;

-- Checks points with outlier
-- 4 points/m2 * 50x50m2 = 10000
SELECT *
FROM metrics
WHERE all_ < 10000;

-- EQ
SELECT
  ((0.058 * exp((-3.6) * (d00 / 100))) * (kur ^ 0.72) * (p05 ^ 0.16) * (p10 ^ (-0.43)) * (p75 ^ 2.41) * (max ^ (-0.61)))
  * 2 AS agblongo_als_alive
FROM metrics
WHERE p10 > 0 AND max > 0
LIMIT 10;

-----------------------------------------------------------------------------------------------------------------
-- Spatial Indexing

-- Indexing
CREATE INDEX metrics_gix
  ON metrics USING GIST (geom);

-- Vacuuming
VACUUM ANALYZE metrics;

-- Clustering
CLUSTER metrics USING metrics_gix;
ANALYZE metrics;

-----------------------------------------------------------------------------------------------------------------
-- Clip Real

CREATE SEQUENCE public.amazon_seq
INCREMENT 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER TABLE public.amazon_seq
  OWNER TO eba;

ALTER TABLE amazon
  ADD COLUMN fid INTEGER;
ALTER TABLE amazon
  ALTER COLUMN fid SET DEFAULT nextval('amazon_seq');
UPDATE amazon
SET fid = nextval('amazon_seq');
ALTER TABLE amazon
  ALTER COLUMN fid SET NOT NULL;

ALTER TABLE amazon
  DROP CONSTRAINT amazon_pkey;
ALTER TABLE amazon
  ADD PRIMARY KEY (fid);
ALTER TABLE amazon
  DROP COLUMN ogc_fid;

CREATE INDEX biome_gix
  ON biome USING GIST (geom);
VACUUM ANALYZE biome;
CLUSTER biome USING biome_gix;
ANALYZE biome;

CREATE INDEX amazon_gix
  ON amazon USING GIST (geom);
VACUUM ANALYZE amazon;
CLUSTER amazon USING amazon_gix;
ANALYZE amazon;

DELETE FROM amazon v
USING biome b
WHERE NOT ST_Intersects(v.geom, b.geom);

-----------------------------------------------------------------------------------------------------------------
--- Getting transects intersects test

SELECT polys.*
FROM amazon polys
  INNER JOIN transects bb ON ST_Intersects(bb.polyflown, polys.geom)
WHERE bb.id = 597;

SELECT polys.*
FROM metrics polys
WHERE ST_Intersects(ST_GeomFromText(
                        'POLYGON((4050246.0701944 10275844.213429,4050494.8878455 10275844.213429,4050494.8878455 10275595.3957779,4050246.0701944 10275595.3957779,4050246.0701944 10275844.213429))',
                        5880), polys.geom);

ALTER TABLE amazon
  ADD COLUMN transect_id INTEGER;

UPDATE amazon
SET transect_id = transects.id
FROM transects
WHERE transects.id = 597 AND ST_Intersects(transects.polyflown, amazon.geom);