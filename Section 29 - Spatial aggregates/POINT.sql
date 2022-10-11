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

ROLLBACK TRAN