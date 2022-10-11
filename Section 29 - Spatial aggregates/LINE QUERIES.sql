BEGIN TRAN
CREATE TABLE Geometry
(GXY GEOMETRY,
DESCRIPTION VARCHAR(20),
ID INT CONSTRAINT PK_TBLGEOM PRIMARY KEY IDENTITY(5,1))
INSERT INTO Geometry
VALUES (GEOMETRY::STGeomFromText('LINESTRING (1 1, 5 5)', 0),'First line'),
       (GEOMETRY::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0),'Second line'),
	   (GEOMETRY::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0),'Third line'),
	   (GEOMETRY::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
	   (GEOMETRY::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle')



SELECT ID, GXY.STGeometryType() AS MyType
, GXY.STStartPoint().ToString() AS StartingPoint
, GXY.STEndPoint().ToString() AS EndingPoint
, GXY.STPointN(1).ToString() AS FirstPoint
, GXY.STPointN(2).ToString() AS SecondPoint
, GXY.STPointN(1).STX AS FirstPointX
, GXY.STPointN(1).STY AS FirstPointY
, GXY.STBoundary().ToString() AS Boundary
, GXY.STLength() AS MyLength
, GXY.STNumPoints() AS NumberPoints
FROM Geometry

DECLARE @G AS GEOMETRY 
SELECT @G = GXY FROM Geometry WHERE ID = 5

-- DISTANCE FROM STRAIGHT LINE WITH NUMBER 5
SELECT ID, GXY.STIntersection(@g).ToString() AS Intersection
, GXY.STDistance(@g) AS DistanceFromFirstLine
FROM Geometry


--  COMBINING DATA, IN THIS CASE POLYGON AND LINE
SELECT GXY.STUnion(@G), Description
FROM Geometry
WHERE ID = 8 


ROLLBACK TRAN
