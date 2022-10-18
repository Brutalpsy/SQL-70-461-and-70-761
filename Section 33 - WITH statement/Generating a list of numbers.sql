-- FIND OUT WHICH EMPLOYEE NUMBERS HAVE NOT BEEN USED

-- # SOLUTION #1 - NOT CORRECT -> THERE ARE SOME MORE EmployeeNumber NUMBERS IN EmployeeTransaction WHICH HAVE NOT BEEN USED
SELECT * FROM Employee AS E
LEFT JOIN EmployeeTransaction AS T ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY E.EmployeeNumber

-- # SOLUTION #2- NOT CORRECT - SAMES AS SOLUTION #1
SELECT * FROM Employee AS E
WHERE EmployeeNumber NOT IN (SELECT EmployeeNumber FROM EmployeeTransaction)
ORDER BY E.EmployeeNumber

-- CHECK THAT THERE IS SOME THAT HAVEN'T BEEN USED
SELECT * FROM EmployeeTransaction ORDER BY EmployeeNumber


-- SOLUTION #3  - CORRECT
-- GENERATE ROWNUBMERS BASED ON THE LARGEST EmployeeNumber IN EmployeeTransaction
--  LEFT JOIN IT WITH EmployeeTransaction AND FIND OUT WHICH EmployeeNumbers are not used!

WITH RowNumbers AS 
(SELECT TOP(SELECT MAX(EmployeeNumber) FROM EmployeeTransaction )  ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) as RowNumbers FROM EmployeeTransaction)

SELECT RowNumbers FROM RowNumbers AS U
LEFT JOIN EmployeeTransaction AS T ON T.EmployeeNumber = U.RowNumbers
WHERE EmployeeNumber IS NULL
ORDER BY RowNumbers


----------------------------------------------------
-- WAY TO GENERATE TABLE OF NUMBERS / LIST OF NUMBERS
SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) FROM sys.objects o CROSS JOIN  sys.objects p


