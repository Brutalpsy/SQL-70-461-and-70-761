BEGIN TRAN
CREATE TABLE Geometry
(GXY GEOMETRY,
DESCRIPTION VARCHAR(20),
ID INT CONSTRAINT PK_TBLGEOM PRIMARY KEY IDENTITY(5,1))
INSERT INTO Geometry
VALUES (GEOMETRY::STGeomFromText('LINESTRING (1 1, 5 5)', 0),'FIRST LINE'),
       (GEOMETRY::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0),'SECOND LINE'),
	   (GEOMETRY::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0),'THIRD LINE'),
	   (GEOMETRY::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'POLYGON'),
	   (GEOMETRY::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'CIRCLE')
SELECT * FROM Geometry
ROLLBACK TRAN
