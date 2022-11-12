-- SCALAR UDF
CREATE FUNCTION fnc_TransactionTotal (@intEmplyee AS INT)
RETURNS MONEY
AS
BEGIN
DECLARE @TotalAmount AS MONEY
SELECT @TotalAmount = SUM(Amount)
FROM tblTransaction WHERE EmployeeNumber = @intEmplyee
RETURN @TotalAmount
END

SELECT dbo.fnc_TransactionTotal(134) 
SELECT SUM(Amount) FROM tblTransaction WHERE EmployeeNumber = 134


SET STATISTICS TIME ON
-- QUERY #1 -> COST : 23%
-- CPU time = 63 ms,  elapsed time = 197 ms.
SELECT EmployeeNumber, dbo.fnc_TransactionTotal(EmployeeNumber)
FROM tblEmployee

-- QUERY #2 -> COST : 77%
-- CPU time = 0 ms,  elapsed time = 289 ms.
SELECT E.EmployeeNumber, SUM(Amount) FROM tblTransaction AS T
RIGHT JOIN tblEmployee AS E ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber IS NOT NULL
GROUP BY E.EmployeeNumber

SET STATISTICS TIME OFF
-------------------------------------
-- LETS TRY WITH TABLE UDF

CREATE FUNCTION fnc_TransactionAll (@intEmployee AS INT)
RETURNS @returnTable table
(Amount smallmoney)
AS
BEGIN
	INSERT @returnTable
	SELECT AMOUNT
	FROM tblTransaction
	WHERE EmployeeNumber = @intEmployee
	RETURN
END

SELECT * FROM dbo.fnc_TransactionAll(127)


-- QUERY COST 95%
-- WAY SLOWER
SELECT EmployeeNumber, SUM(T.Amount)
FROM tblEmployee AS E
OUTER APPLY dbo.fnc_TransactionAll(EmployeeNumber) AS T -- LEFT JOIN equivalent
GROUP BY EmployeeNumber

-- QUERY COST 5%
SELECT E.EmployeeNumber, SUM(T.Amount)
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T ON T.EmployeeNumber = E.EmployeeNumber
GROUP BY E.EmployeeNumber


-- CONCLUSION IS TO NOT USE A FUNCTIONS, WHETHER THEY MAY BE SCALAR OR TABLE FUNCTIONS
-- EVEN THOUGH IN SOME CIRCUMSTANCES THEY MIGHT BE FASTER FEW TIMES THAN THE REGULAR SELECT
-- BUT THEY CAN'T BE OPTIMISED LATER ON IN THE SELECT STATMENT, BECAUSE THEY ARE SEPARATE 
-- AND SO WHEN STUFF GETS COMPLICATED, THEY WONT BE OPTIMIZED BY THE SQL AND SO THEY WILL BE SLOWER
-- SO YOU CAN FRELLY USE NESTED SELECTED STATMENTS


