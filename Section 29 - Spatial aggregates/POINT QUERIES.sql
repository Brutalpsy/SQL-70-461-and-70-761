BEGIN TRAN
CREATE TABLE Geometry
(
GXY GEOMETRY,
Description VARCHAR(30),
Id INT CONSTRAINT PK_GEOMETRY PRIMARY KEY IDENTITY(1,1))

INSERT INTO Geometry VALUES 
(GEOMETRY::STGeomFromText('POINT (3 4)',0),'FIRST POINT'), -- zeros does not matter, as longs as all of those inserts have it
(GEOMETRY::STGeomFromText('POINT (3 5)',0),'SECOND POINT'),
(GEOMETRY::Point(4, 6, 0),'THIRD POINT'),
(GEOMETRY::STGeomFromText('MULTIPOINT ((1 2), (2 3), (3 4))',0),'THREE POINT')
SELECT * FROM Geometry


select Id, GXY.STGeometryType() as MyType
, GXY.STStartPoint().ToString() as StartingPoint
, GXY.STEndPoint().ToString() as EndingPoint
, GXY.STPointN(1).ToString() as FirstPoint
, GXY.STPointN(2).ToString() as SecondPoint
, GXY.STPointN(1).STX as FirstPointX
, GXY.STPointN(1).STY as FirstPointY
, GXY.STNumPoints() as NumberPoints
from Geometry


-- TRY TO  STORE THE VALUES AND CALCULATE THE DISTANCE BETWEEN THE POINTS
DECLARE @G AS GEOMETRY
DECLARE @H AS GEOMETRY

SELECT @G = GXY FROM Geometry WHERE ID=1
SELECT @H = GXY FROM Geometry WHERE ID=3

SELECT @G.STDistance(@h) as Distance

-- TRY TO USE UNION WITH GEOMERTY
SELECT @G, 'POINT 1'
UNION ALL
SELECT @H, 'POINT2'

ROLLBACK TRAN