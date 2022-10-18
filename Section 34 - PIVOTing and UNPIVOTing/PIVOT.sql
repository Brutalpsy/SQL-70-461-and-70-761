WITH MyTable AS 
(SELECT YEAR(DateOfTransaction) AS TheYear, MONTH(DateOfTransaction) AS TheMonth, Amount FROM EmployeeTransaction)

-- In the selct all statment you need only to have those three columns, otherwise it work work
SELECT * FROM MyTable -- star can be avoided with this -> TheYear,[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]
PIVOT (SUM(Amount) FOR TheMonth IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS myPivot
ORDER BY TheYear
