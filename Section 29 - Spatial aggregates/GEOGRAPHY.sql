BEGIN TRAN
CREATE TABLE tblGeog
(GXY GEOGRAPHY,
Description varchar(30),
IDtblGeog INT CONSTRAINT PK_tblGeog PRIMARY KEY IDENTITY(1,1))
INSERT INTO  tblGeog
VALUES (GEOGRAPHY::STGeomFromText('POINT (-73.993492 40.750525)', 4326),'Madison Square Gardens, NY'),
       (GEOGRAPHY::STGeomFromText('POINT (-0.177452 51.500905)', 4326),'Royal Albert Hall, London'),
	   (GEOGRAPHY::STGeomFromText('LINESTRING (-73.993492 40.750525, -0.177452 51.500905)', 4326),'Connection')

SELECT * from tblGeog

DECLARE @g AS GEOGRAPHY
SELECT @g = GXY from tblGeog WHERE IDtblGeog = 1

SELECT IDtblGeog, GXY.STGeometryType() AS MyType
, GXY.STStartPoint().ToString() AS StartingPoint
, GXY.STEndPoint().ToString() AS EndingPoint
, GXY.STPointN(1).ToString() AS FirstPoint
, GXY.STPointN(2).ToString() AS SecondPoint
, GXY.STLength() AS MyLength
, GXY.STIntersection(@g).ToString() AS Intersection
, GXY.STNumPoints() AS NumberPoints
, GXY.STDistance(@g) AS DistanceFromFirstLine
FROM tblGeog

-- CALCULATE DISTANCE
DECLARE @h AS GEOGRAPHY
SELECT @g = GXY FROM tblGeog WHERE IDtblGeog = 1
SELECT @h = GXY FROM tblGeog WHERE IDtblGeog = 2
SELECT @g.STDistance(@h) AS MyDistance

-- TESTING WITH UNION
SELECT GXY.STUnion(@g)
FROM tblGeog
WHERE IDtblGeog = 2 


SELECT * FROM sys.spatial_reference_systems


ROLLBACK TRAN
