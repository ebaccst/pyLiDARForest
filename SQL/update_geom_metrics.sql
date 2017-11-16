ALTER TABLE metrics DROP COLUMN geom;
ALTER TABLE metrics ADD COLUMN geom geometry(Polygon);
UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0002';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0003';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0004';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0005';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0006';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0007';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0008';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0009';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0010';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0011';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0012';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0013';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0014';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0015';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0016';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0017';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0018';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0019';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0020';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0021';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0022';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0023';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0024';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0025';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0026';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0027';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0028';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0029';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0030';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0031';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0032';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0033';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0034';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0035';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0036';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0037';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0038';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0039';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0040';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0041';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0042';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0043';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0044';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0045';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0046';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0047';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0048';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0049';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0050';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0051';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0052';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0053';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0054';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0055';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0056';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0057';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0058';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0060';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0061';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0062';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0063';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0064';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0065';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0066';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0067';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0068';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0069';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0070';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0071';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0072';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0073';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0074';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0075';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0076';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0077';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0078';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0079';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0080';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0081';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0082';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0083';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0084';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0085';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0086';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0087';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0088';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0089';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0090';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0091';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0092';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0093';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0094';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0095';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0096';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0097';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0098';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0099';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0100';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0101';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0102';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0103';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0104';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0105';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0106';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0107';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0108';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0109';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0110';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0111';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0112';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0113';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0114';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0115';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0116';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0118';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0120';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0121';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0122';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0123';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0124';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0125';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0126';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0127';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0128';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0129';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0130';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0131';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0132';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0133';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0134';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0135';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0136';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0137';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0138';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0139';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0140';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0141';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0142';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0143';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0144';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0145';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0146';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0147';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0148';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0149';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0150';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0151';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0152';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0153';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0154';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0155';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0156';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0157';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0158';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0159';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0160';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0161';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0162';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0163';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0164';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0165';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0166';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0167';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0168';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0169';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0170';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0171';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0172';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0173';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0174';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0175';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0176';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0177';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0178';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0179';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0180';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0181';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0183';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0184';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0185';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0186';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0187';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0188';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0189';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0190';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0191';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0192';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0193';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0194';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0195';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0196';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0197';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0198';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0199';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0200';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0201';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0202';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0203';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0204';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0205';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0206';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0208';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0209';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0210';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0211';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0212';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0213';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0214';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0215';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0216';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0217';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0218';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0219';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0220';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0221';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0222';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0223';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0224';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0225';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0226';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0227';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0228';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0229';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0230';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0231';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0232';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0233';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0234';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0235';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0236';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0237';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0238';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0239';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0240';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0241';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0242';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0243';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0244';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0245';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0246';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0247';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0248';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0249';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0250';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0251';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0252';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0253';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0254';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0255';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0256';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0257';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0258';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0259';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0260';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0261';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0262';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0263';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0264';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0265';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0266';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0267';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0268';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0269';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0271';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0272';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0273';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0274';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0275';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0276';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0277';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0278';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0279';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0280';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0281';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0282';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0283';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0284';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0285';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0286';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0287';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0288';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0289';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0290';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0291';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0292';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0293';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0294';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0295';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0296';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0297';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0298';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0299';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0300';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0301';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0302';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0303';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0304';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0305';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0306';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0307';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0308';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0309';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0310';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0311';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0312';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0313';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0314';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0315';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0316';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0317';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0318';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0319';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0320';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0321';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0322';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0323';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0324';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0325';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0326';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0327';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0328';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0329';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0330';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0331';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0332';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0333';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0334';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0335';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0336';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0338';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0341';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0342';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0343';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0344';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0345';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0346';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0347';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0348';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0349';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0350';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0351';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0352';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0353';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0354';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0355';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0356';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0357';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0358';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0359';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0360';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0361';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0362';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0363';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0364';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0367';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0368';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0369';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0370';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0371';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0372';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0373';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0374';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0375';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0376';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0377';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0378';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0379';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0380';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0381';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0382';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0383';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0384';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0385';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0386';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0387';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0388';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0389';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0390';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0391';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0392';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0393';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0394';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0395';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0396';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0397';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0398';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0399';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0400';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0401';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0402';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0403';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0404';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0405';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0406';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0407';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0408';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0409';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0410';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0411';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0412';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0413';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0414';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0415';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0416';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0417';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0418';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0419';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0420';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0421';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0422';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0423';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0424';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0425';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0426';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0427';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0428';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0430';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0431';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0432';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0433';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0434';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0435';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0437';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0438';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0439';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0440';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0441';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0442';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0443';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0444';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0445';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0446';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0447';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0448';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0449';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0450';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0451';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0452';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0453';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0454';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0455';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0456';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0457';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0458';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0459';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0460';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0461';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0462';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0463';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0464';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0465';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0466';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0467';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0468';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0469';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0470';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0471';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0472';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0473';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0474';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0475';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0476';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0477';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0478';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0479';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0480';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0481';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0482';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0483';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0484';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0485';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0486';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0487';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0488';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0489';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0490';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0491';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0492';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0493';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0494';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0495';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0496';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0497';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0498';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0499';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0500';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0501';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0502';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0503';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0504';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0505';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0506';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0507';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0509';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0510';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0511';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0512';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0513';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0514';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0515';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0516';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0517';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0518';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0519';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0520';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0521';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0522';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0523';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0525';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0526';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0527';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0528';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0529';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0530';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0531';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0532';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0533';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0534';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0535';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0536';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0537';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0538';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0539';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0540';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0541';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0542';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0543';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0544';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0545';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0546';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0547';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0548';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0549';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0550';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0551';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0552';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0553';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0554';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0555';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0556';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0558';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0559';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0560';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0561';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0562';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0563';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0564';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0565';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0566';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0567';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0568';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0569';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0570';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0571';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0572';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0573';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0574';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0575';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0577';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0578';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0579';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0580';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0581';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0582';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0583';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0584';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0585';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0586';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0587';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0588';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0589';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0590';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0591';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0592';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0593';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0594';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0595';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0596';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0597';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0598';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0599';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0600';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0601';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0602';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0603';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0604';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0605';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0606';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0607';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0608';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0609';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0610';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0611';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0612';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0613';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0614';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0615';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0616';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0617';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0618';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0619';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0620';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0621';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0622';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0623';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0624';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0625';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0626';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0629';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0632';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0633';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0635';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0637';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0638';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0639';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0645';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '1010';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '1012';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '1013';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '1014';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1016';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1021';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1022';

UPDATE metrics
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1023';

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

SELECT UpdateGeometrySRID('public', 'metrics', 'geom', 5880);
