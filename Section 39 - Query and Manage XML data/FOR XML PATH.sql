

select E.EmployeeFirstName as '@EmployeeFirstName' -- USING @ SIGN WILL TRANSFORM THIS FIELDS TO ATTRIBUTES
	   , E.EmployeeLastName as '@EmployeeLastName'
	   , E.EmployeeNumber
       , E.DateOfBirth
	   , T.Amount as 'Transaction/Amount'  -- / SIGN WILL STORE THIS COLUMN UNDER A FOLDER "Transaction"
	   , T.DateOfTransaction as 'Transaction/DateOfTransaction'
from  Employee as E
left join EmployeeTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeNumber between 200 and 202
for xml path('Employees'), ROOT('MyXML') -- WE CAN USE ROOT TO DEFINE WELL FORMED XML, TO BASICALLY WRAP IT


-- Handling duplcated values for same id's in a different way with correlated subqueries
select E.EmployeeFirstName 
	   , E.EmployeeLastName 
	   , E.EmployeeNumber
       , E.DateOfBirth
	   , (SELECT T.Amount AS 'Amount'
	      FROM EmployeeTransaction as T
		  WHERE T.EmployeeNumber = E.EmployeeNumber
		  FOR XML PATH(''), TYPE /* TYPE WILL CONVERT IT, SO THE REAL XML WILL BE USED AND NOT HTML ENCODING */) as TransactionElement
from  Employee as E
where E.EmployeeNumber between 200 and 202
for xml path('Employees'), ROOT('MyXML') 

