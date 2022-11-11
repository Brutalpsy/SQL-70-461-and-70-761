-- Comparing the cost of queries when having or not ORDER BY 

-- Query cost: 29%
SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 340 AND 349 

-- Query cost: 71% (sorting cost 59% out of 100%)
-- way more extra time is needed (2.5 times in this case) when sorting is applied 
SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 340 AND 349 
ORDER BY Amount


-- Same goes when you are doing with without SARG
-- sorting cost quite alot -> DONT SORT IF YOU DONT NEED TOs

-- Query cost:36%
SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber / 10 = 34 -- NOT A SARG

-- Query cost: 64% (sorting cost 43% out of 100%)
SELECT * FROM tblEmployee as E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber / 10 = 34
ORDER BY Amount
