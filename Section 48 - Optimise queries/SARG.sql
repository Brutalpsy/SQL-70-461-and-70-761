-- USING SARG CAN IMPROVE TIME IT TAKES TO EXECUTE A QUERY
-- SARG - [S]EARCH [ARG]UMENTS
-- SARG CAN USE INDEXES


-- WHERE YEAR(DateOrigin) = 2020 -> not a SARG (doesn't use an index), because a query uses a function and there is no index for YEAR function
-- WHERE DateOrigin >='20200101' AND DateOrigin < '20210101' -> is a SARG (uses an index), it's not enclosing field in a function like the previous example
 
-- WHERE SUBSTRING(PersonName, 1,4) = 'Danijel' -> not a SARG
-- WHERE PersonName LIKE 'Dani%' -> IS A SARGE, uses PersonName and not the function 

-- QUERY COST : 23%
-- using Where clause with index can really improve the time
SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber = 134

-- QUERY COST : 77%
SELECT * FROM tblEmployeeNoIndex as E
LEFT JOIN tblTransactionNoIndex AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber = 134
-------------------------------------------------------------------------------
-- QUERY COST : 65%
SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber / 10 = 34 -- NOT A SARG, SO IT NEEDS TO SCAN THE INDEX, SO IT COMPUTED ALL OF THE ROWS

-- QUERY COST : 35%
SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 340 AND 349 -- SARG, used index seek, so it only scanned 10 rows


-- so conclusing is just to use the field that is indexes and not to do some derivative of it or a function
-- so it's more optimised queries when you're using SARG

