-- Dynamic query - bad idea, danger of sql injection
DECLARE @PARAM VARCHAR(1000) = '127' + CHAR(10)+ 'SELECT * FROM tblDepartment'; -- you can insert sql injection and drop a table or w/e
DECLARE @SQL VARCHAR(1000) =
	'SELECT * FROM tblTransaction AS T WHERE T.EmployeeNumber = ' + @PARAM;

EXECUTE (@SQL);


-- Parameterised query
-- much safer 
DECLARE @param2 VARCHAR(1000) = '127' -- + CHAR(10)+ N'SELECT * FROM tblDepartment' --> sql injection wont work like this
EXECUTE SYS.sp_executesql
@statement = N'SELECT * FROM tblTransaction AS T WHERE T.EmployeeNumber = @EmployeeNumber',
@params = N'@EmployeeNumber VARCHAR(1000)',
@EmployeeNumber = @param2


