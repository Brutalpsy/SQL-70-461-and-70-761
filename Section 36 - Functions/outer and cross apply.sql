SELECT *, (SELECT COUNT(*) FROM EmployeeTransaction AS T WHERE T.EmployeeNumber = E.EmployeeNumber)
FROM Employee AS E

SELECT *, (SELECT COUNT(*) FROM dbo.TransList(E.EmployeeNumber))
FROM Employee AS E

--SELECT *
--FROM Employee AS E
--LEFT JOIN TransList(E.EmployeeNumber) AS T -- CANNOT USE JOINS WITH FUNCTIONS
--ON E.EmployeeNumber = T.EmployeeNumber     -- SINCE, IT'S NOT A TABLE, ITS MORE LIKE ARRAY

-- WHAT WE HAVE TO USE IS "APPLY"
SELECT *
FROM Employee AS E
OUTER APPLY TransList(E.EmployeeNumber) AS T -- CANNOT USE JOINS WITH FUNCTIONS
--ON E.EmployeeNumber = T.EmployeeNumber -- DONT NEED ON CLAUSE

SELECT *
FROM Employee AS E
CROSS APPLY TransList(E.EmployeeNumber) AS T 

-- THERE ARE TWO VERSIONS OF APPLY
-- OUTER APPLY -> LEFT JOIN 
-- CROSS APPLY -> INNER JOIN

