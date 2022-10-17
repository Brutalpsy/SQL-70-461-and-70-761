SELECT * FROM EmployeeTransaction AS T
WHERE EmployeeNumber = ANY -- OR YOU CAN USE "SOME" 
	(SELECT EmployeeNumber FROM Employee WHERE EmployeeLastName LIKE 'y%') 
ORDER BY EmployeeNumber  

-- GIVE ME EVERYTHING WHICH IS NOT IN  (129, 128, 127, 126)
SELECT * FROM EmployeeTransaction AS T
WHERE EmployeeNumber <> ALL -- NOT EQUAL TO ALL OF (129, 128, 127, 126)    // <> NEGATION // NOT EQUAL TO ANY OF THE FOLLOWING
	(SELECT EmployeeNumber FROM Employee WHERE EmployeeLastName LIKE 'y%') 
ORDER BY EmployeeNumber  

-- ANY/SOME = OR
-- ALL = AND

--126 <> ALL (126, 127, 128, 129)
--126 <> 126 AND 126 <> 127 AND 126 <> 128 and 126 <> 129
-- FALSE AND TRUE  = FALSE


--126 <> ANY (126, 127, 128, 129)
--126 <> 126 AND 126 <> 127 AND 126 <> 128 and 126 <> 129
-- FALSE OR TRUE = TRUE


-- GIVE ME ALL TRANSACTIONS UPTO HIGEST NUMBER IN SUBQUERY
SELECT * FROM EmployeeTransaction AS T
WHERE EmployeeNumber <= ANY 
	(SELECT EmployeeNumber FROM Employee WHERE EmployeeLastName LIKE 'y%') 
ORDER BY EmployeeNumber  


-- GIVE ME ALL TRANSACTIONS UPTO LOWEST NUMBER IN SUBQUERY THAT FULFILS THE CONDITION
SELECT * FROM EmployeeTransaction AS T
WHERE EmployeeNumber <= ALL 
	(SELECT EmployeeNumber FROM Employee WHERE EmployeeLastName LIKE 'y%') 
ORDER BY EmployeeNumber  
