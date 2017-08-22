-----------------------------------------------------------------------------------------------------------------
-- Create Function
-- https://trac.osgeo.org/postgis/wiki/UsersWikiCreateFishnet

-- DROP FUNCTION public.st_createfishnet(nrow integer, ncol integer, xsize double precision, ysize double precision, x0 double precision DEFAULT 0, y0 double precision DEFAULT 0, OUT "row" integer, OUT col integer, OUT geom geometry);

CREATE OR REPLACE FUNCTION ST_CreateFishnet(
      nrow  INTEGER, ncol INTEGER,
      xsize FLOAT8, ysize FLOAT8,
      x0    FLOAT8 DEFAULT 0, y0 FLOAT8 DEFAULT 0,
  OUT "row" INTEGER, OUT col INTEGER,
  OUT geom  GEOMETRY)
  RETURNS SETOF RECORD AS
$$
SELECT
  i + 1                                        AS row,
  j + 1                                        AS col,
  ST_Translate(cell, j * $3 + $5, i * $4 + $6) AS geom
FROM generate_series(0, $1 - 1) AS i,
      generate_series(0, $2 - 1) AS j,
  (
    SELECT ('POLYGON((0 0, 0 ' || $4 || ', ' || $3 || ' ' || $4 || ', ' || $3 || ' 0,0 0))') :: GEOMETRY AS cell
  ) AS foo;
$$ LANGUAGE SQL IMMUTABLE STRICT;

-- DROP VIEW view_ST_CreateFishnet;

CREATE VIEW view_ST_CreateFishnet AS
  SELECT
    ROW_NUMBER()
    OVER (
      ORDER BY cells.row )       AS id,
    cells.row,
    cells.col,
    st_setsrid(cells.geom, 5880) AS geom
  FROM ST_CreateFishnet(3066, 2645, 248.817651102, 248.817651102, 3798111.5935, 9823587.88427) AS cells;

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

DELETE FROM amazon amz
USING biome mask
WHERE mask.gid = 1 AND NOT ST_Intersects(amz.geom, mask.geom);

-----------------------------------------------------------------------------------------------------------------
-- Create Function

-- DROP FUNCTION public.fupdate_amazon_biomass(transect_id INTEGER);

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
-- Create Function

-- DROP FUNCTION public.fbiomass_classes(biomass DOUBLE PRECISION );

CREATE OR REPLACE FUNCTION fbiomass_classes(biomass DOUBLE PRECISION)
  RETURNS VARCHAR AS $$
DECLARE
  classe VARCHAR;
BEGIN
  IF biomass IS NULL OR biomass < 0
  THEN
    classe:=NULL;
  ELSE
    IF biomass >= 0 AND biomass < 5
    THEN
      classe:='00|--05';
    ELSEIF biomass >= 5 AND biomass < 10
      THEN
        classe:='05|--10';
    ELSEIF biomass >= 10 AND biomass < 15
      THEN
        classe:='10|--15';
    ELSEIF biomass >= 15 AND biomass < 20
      THEN
        classe:='15|--20';
    ELSEIF biomass >= 20 AND biomass < 25
      THEN
        classe:='20|--25';
    ELSEIF biomass >= 25 AND biomass < 30
      THEN
        classe:='25|--30';
    ELSEIF biomass >= 30 AND biomass < 35
      THEN
        classe:='30|--35';
    ELSEIF biomass >= 35 AND biomass < 40
      THEN
        classe:='35|--40';
    ELSEIF biomass >= 40 AND biomass < 45
      THEN
        classe:='40|--45';
    ELSEIF biomass >= 45 AND biomass < 50
      THEN
        classe:='45|--50';
    ELSEIF biomass >= 50 AND biomass < 60
      THEN
        classe:='50|--60';
    ELSEIF biomass >= 60 AND biomass < 80
      THEN
        classe:='60|--80';
    ELSE
      classe:='80|--';
    END IF;
  END IF;
  RETURN classe;
END; $$
LANGUAGE plpgsql;

SELECT fbiomass_classes(9);
SELECT fbiomass_classes(10);
SELECT fbiomass_classes(81);
SELECT fbiomass_classes(NULL);
SELECT fbiomass_classes(-0.1);

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

-- Ids to check intersection
-- roraima id: 130634.518
-- amazon_test id: 20001.963, 30093696

SELECT st_intersects(amz.geom, ro.geom), st_astext(amz.geom), st_astext(ro.geom)
FROM amazon_test amz, roraima ro
WHERE amz.ogc_fid = 20001963 AND ro.id = 130634518;

SELECT ro.*
FROM amazon_test amz, roraima ro
WHERE amz.ogc_fid = 20001963 AND st_overlaps(amz.geom, ro.geom);

EXPLAIN ANALYSE SELECT ro.id, st_astext(ro.geom), st_astext(amz.geom)
FROM amazon_test amz, roraima ro
WHERE amz.ogc_fid = 20001963 AND st_intersects(amz.geom, ro.geom);

SELECT ro.*
FROM amazon_test amz, roraima ro
WHERE amz.ogc_fid = 20001963 AND st_intersects(amz.geom, ro.geom) AND st_equals(st_snaptogrid(amz.geom, 10), st_snaptogrid(ro.geom, 10)); -- 1.377 ms

SELECT ro.id, count(*)
FROM amazon_test amz, roraima ro
WHERE st_intersects(amz.geom, ro.geom) AND st_equals(st_snaptogrid(amz.geom, 10), st_snaptogrid(ro.geom, 10))
group by ro.id
HAVING count(*) > 1
LIMIT 1;