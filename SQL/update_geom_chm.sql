ALTER TABLE chm DROP COLUMN geom;
ALTER TABLE chm ADD COLUMN geom geometry(Polygon);
UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0002';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0003';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0004';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0005';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0006';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0007';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0008';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0009';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0010';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0011';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0012';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0013';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0014';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0015';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0016';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0017';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0018';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0019';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0020';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0021';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0022';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0023';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0024';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0025';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0026';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0027';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0028';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0029';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0030';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0031';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0032';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0033';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0034';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0035';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0036';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0037';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0038';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0039';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0040';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0041';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0042';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0043';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0044';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0045';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0046';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0047';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0048';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0049';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0050';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0051';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0052';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0053';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0054';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0055';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0056';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0057';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0058';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0060';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0061';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0062';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0063';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0064';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0065';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0066';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0067';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0068';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0069';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0070';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0071';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0072';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0073';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0074';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0075';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0076';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0077';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0078';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0079';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0080';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0081';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0082';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0083';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0084';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0085';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0086';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0087';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0088';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0089';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0090';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0091';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0092';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0093';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0094';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0095';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0096';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0097';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0098';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0099';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0100';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0101';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0102';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0103';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0104';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0105';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0106';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0107';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0108';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0109';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0110';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0111';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0112';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0113';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0114';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0115';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0116';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0118';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0120';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0121';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0122';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0123';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0124';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0125';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0126';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0127';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0128';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0129';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0130';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0131';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0132';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0133';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0134';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0135';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0136';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0137';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0138';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0139';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0140';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0141';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0142';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0143';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0144';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0145';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0146';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0147';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0148';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0149';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0150';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0151';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0152';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0153';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0154';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0155';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0156';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0157';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0158';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0159';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0160';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0161';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0162';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0163';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0164';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0165';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0166';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0167';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0168';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0169';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0170';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0171';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0172';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0173';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0174';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0175';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0176';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0177';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0178';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0179';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0180';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0181';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0183';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0184';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0185';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0186';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0187';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0188';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0189';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0190';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0191';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0192';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0193';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0194';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0195';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0196';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0197';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0198';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0199';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0200';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0201';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0202';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0203';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0204';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0205';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0206';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0208';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0209';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0210';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0211';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0212';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0213';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0214';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0215';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0216';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0217';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0218';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0219';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0220';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0221';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0222';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0223';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0224';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0225';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0226';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0227';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0228';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0229';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0230';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0231';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0232';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0233';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0234';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0235';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0236';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0237';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0238';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0239';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0240';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0241';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0242';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0243';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0244';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0245';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0246';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0247';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0248';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0249';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0250';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0251';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0252';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0253';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0254';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0255';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0256';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0257';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0258';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0259';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0260';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0261';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0262';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0263';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0264';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0265';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0266';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0267';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0268';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0269';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0271';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0272';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0273';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0274';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0275';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0276';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0277';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0278';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0279';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0280';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0281';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0282';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0283';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0284';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0285';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0286';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0287';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0288';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0289';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0290';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0291';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0292';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0293';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0294';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0295';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0296';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0297';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0298';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0299';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0300';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0301';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0302';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0303';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0304';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0305';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0306';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0307';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0308';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0309';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0310';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0311';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0312';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0313';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0314';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0315';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0316';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0317';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0318';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0319';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0320';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0321';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0322';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0323';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0324';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0325';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0326';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0327';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0328';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0329';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0330';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0331';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0332';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0333';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0334';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0335';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0336';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0338';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0341';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0342';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0343';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0344';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0345';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0346';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0347';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0348';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0349';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0350';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0351';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0352';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0353';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0354';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0355';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0356';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0357';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0358';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0359';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0360';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0361';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0362';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0363';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0364';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0367';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0368';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0369';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0370';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0371';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0372';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0373';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0374';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0375';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0376';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0377';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0378';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0379';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0380';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0381';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0382';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0383';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0384';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0385';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0386';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0387';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0388';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0389';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0390';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0391';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0392';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0393';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0394';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0395';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0396';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0397';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0398';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0399';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0400';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0401';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0402';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0403';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0404';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0405';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0406';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0407';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0408';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0409';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0410';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0411';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0412';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0413';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0414';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0415';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0416';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0417';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0418';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0419';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0420';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0421';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0422';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0423';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0424';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0425';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0426';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0427';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0428';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0430';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0431';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0432';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0433';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0434';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0435';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0437';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0438';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0439';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0440';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0441';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0442';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0443';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0444';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0445';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0446';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0447';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0448';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0449';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0450';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0451';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0452';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0453';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0454';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0455';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0456';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0457';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0458';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0459';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0460';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0461';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0462';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0463';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0464';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0465';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0466';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0467';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0468';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0469';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0470';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0471';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0472';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0473';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0474';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0475';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0476';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0477';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0478';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0479';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0480';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0481';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0482';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0483';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0484';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0485';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0486';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0487';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0488';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0489';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0490';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0491';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0492';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0493';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0494';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0495';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0496';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0497';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0498';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0499';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0500';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0501';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0502';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0503';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0504';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0505';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0506';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0507';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0509';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0510';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0511';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0512';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0513';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0514';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0515';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0516';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0517';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0518';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0519';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0520';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0521';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0522';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0523';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0525';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0526';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0527';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0528';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0529';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0530';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0531';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0532';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0533';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0534';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0535';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0536';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0537';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0538';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0539';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0540';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0541';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0542';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0543';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0544';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0545';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0546';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0547';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0548';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0549';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0550';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31975)
WHERE filename ~ '0551';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0552';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0553';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0554';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0555';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0556';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31973)
WHERE filename ~ '0558';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0559';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0560';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0561';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0562';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0563';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0564';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0565';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0566';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0567';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0568';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0569';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0570';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0571';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0572';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0573';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0574';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0575';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0577';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0578';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0579';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0580';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0581';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0582';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0583';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0584';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0585';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0586';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0587';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0588';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0589';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0590';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0591';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0592';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0593';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0594';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0595';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0596';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0597';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0598';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0599';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0600';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0601';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0602';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '0603';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0604';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0605';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0606';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0607';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0608';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0609';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0610';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0611';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31978)
WHERE filename ~ '0612';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0613';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0614';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31976)
WHERE filename ~ '0615';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31983)
WHERE filename ~ '0616';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0617';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0618';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0619';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0620';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0621';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31982)
WHERE filename ~ '0622';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '0623';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0624';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0625';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31979)
WHERE filename ~ '0626';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0629';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0632';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0633';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0635';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0637';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0638';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0639';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '0645';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31974)
WHERE filename ~ '1010';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '1011';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '1012';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '1013';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31980)
WHERE filename ~ '1014';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1016';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1021';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1022';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1023';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1024';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1025';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1026';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1027';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1028';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1029';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1030';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1031';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1032';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1033';

UPDATE chm
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint(x - 25, y - 25), ST_MakePoint(x + 25, y - 25), ST_MakePoint(x + 25, y + 25), ST_MakePoint(x - 25, y + 25), ST_MakePoint(x - 25, y - 25)])), 31981)
WHERE filename ~ '1034';

UPDATE chm
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31973;

UPDATE chm
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31974;

UPDATE chm
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31975;

UPDATE chm
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31976;

UPDATE chm
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31978;

UPDATE chm
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31979;

UPDATE chm
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31980;

UPDATE chm
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31981;

UPDATE chm
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31982;

UPDATE chm
SET geom = ST_Transform(geom, 5880)
WHERE ST_SRID(geom) = 31983;

SELECT UpdateGeometrySRID('public', 'chm', 'geom', 5880);
