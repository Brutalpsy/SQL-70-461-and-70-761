-- QUERY COST - 33%
-- CORRELATED SUBQUERY (WE CAN NO LONGER RUN THE INNER QUERY AS STAND ALONT, SINCE IT'S DEPENDEND ON THE OUTER QUERY)
-- SO THE SUBQUERY IS EXECUTED REPEATEDLY, ONCE FOR EACH ROW SELECTED BY THE OUTER QUERY
-- WE DONT HAVE TO USE GROUP BY, SINCE THERE IS NO AGGEGATE, WE GOT A SUBQUERY WHICH IS NOT A AGGREGATE FIGURE
SELECT e.*,  ((SELECT COUNT(*) FROM EmployeeTransaction AS ET WHERE E.EmployeeNumber = ET.EmployeeNumber)) AS NumTransactions 
FROM Employee AS E
WHERE E.EmployeeLastName LIKE 'Y%' 

-- QUERY COST - 67%
-- SAME RESULT BUT WAY SLOWER SOLUTION
SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, COUNT(ET.EmployeeNumber) AS NumTransactions
FROM EmployeeTransaction AS ET
INNER JOIN  Employee AS E ON E.EmployeeNumber = ET.EmployeeNumber
WHERE E.EmployeeLastName LIKE 'Y%' 
GROUP BY E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
------------------------------------------------------------------------------------------
-- THIS WONT WORK, SINCE IT RETURNS MORE THAN ONE VALUE!!!
SELECT e.*,  ((SELECT ET.DateOfTransaction FROM EmployeeTransaction AS ET WHERE E.EmployeeNumber = ET.EmployeeNumber))
FROM Employee AS E
WHERE E.EmployeeLastName LIKE 'Y%' 

-- WHAT WE CAN DO IS USE MIN, MAX, COUNT OR SOME SORT OF AGGREGATE TO RETURN ONE VALUE
SELECT e.*,  ((SELECT MAX(ET.DateOfTransaction) FROM EmployeeTransaction AS ET WHERE E.EmployeeNumber = ET.EmployeeNumber)) AS LastTransaction
FROM Employee AS E
WHERE E.EmployeeLastName LIKE 'Y%' 
------------------------------------------------------------------------------------------
-- THIS WONT WORK
-- ONLY ONE EXPRESSION CAN BE SPECIFIED IN THE SELECT LIST WHEN THE SUBQUERY IS NOT INTRODUCED WITH EXISTS.
SELECT e.*,  ((SELECT COUNT(*), SUM(Amount) FROM EmployeeTransaction AS ET WHERE E.EmployeeNumber = ET.EmployeeNumber)) AS NumTransactions 
FROM Employee AS E
WHERE E.EmployeeLastName LIKE 'Y%' 

-- WHAT YOU CAN DO IS TO INTRODUCE ANOTHER COLUMN, SO ANOTHER SUBQUERY
-- BUT IF YOU DO QUITE ALOT OF THESE SUB QUERIES, YOU MIGHT BE BETER OF WITH JOINS IN ANY CASE, BUT FOR LOWER NUMBER OF SUBQUERIES THEY ARE FASTER.
-- IF THE RESULT SET IS LARGE, JOINS ARE BETTER.
SELECT e.*,  ((SELECT COUNT(*)FROM EmployeeTransaction AS ET WHERE E.EmployeeNumber = ET.EmployeeNumber)) AS NumTransactions,
			 ((SELECT SUM(Amount)FROM EmployeeTransaction AS ET WHERE E.EmployeeNumber = ET.EmployeeNumber)) AS TransactionSum  
FROM Employee AS E
WHERE E.EmployeeLastName LIKE 'Y%' 

