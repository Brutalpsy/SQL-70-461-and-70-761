-- IN ORDER TO DO UNION
--		THERE HAS TO BE SAME NUMBER OF COLUMNS
--		SAME OR COMPATABLE DATA TYPES

-- COLUMN NAME IS TAKEN FROM THE FIRST DATASET
SELECT CONVERT (CHAR(5),'HI') AS GREETING 
UNION ALL --  RETRIEVES ALL ROWS, INCLUDING DUPLICATES ROWS, GETS EVERYTHING.
SELECT CONVERT (CHAR(11),'HELLOW THERE')
UNION ALL
SELECT CONVERT(CHAR(11),'BONJOUR')
UNION ALL
SELECT CONVERT(CHAR(11),'HI') -- DUPLICATE ROW -> GETS RID OF IT IF UNION, IF UNION ALL IT WILL SHOW IT

--MOVE THE DATA INSIDE CTE
WITH CTE AS (
--UNION WITH CONVERSION FROM ONE DATA TYPE TO ANOTHER -> THIS CASE TO BIGGER ONE
SELECT CONVERT(tinyint, 45) AS MYCOLUMN
UNION -- REMOVES DUPLICATE RECORDS (WHERE ALL COLUMNS IN THE RESULTS ARE THE SAME)
SELECT CONVERT(BIGINT,456))
SELECT MYCOLUMN INTO TBLTEMP FROM CTE;

-- SHOW COLUMN DATATYPE
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE
  TABLE_NAME = 'TBLTEMP' AND
  COLUMN_NAME = 'MYCOLUMN'

  -- FAILURE TO CONVERT FROM VARCHAR TO INT
  -- DOES NOT MATTER IF VARCHAR IS FIRST OR SECOND
  -- BECAUSE THE ORDER OF PRESEDANCE IN CONVERTING FROM ONE TYPE TO ANOTHER
  -- STRINGS HAVE A LOW PRESENDECE AND MOST OF THE TIME IT GETS CONVERTED TO ANOTHER TYPE
  --https://blog.dbdigger.com/data-type-precedence-t-sql/#:~:text=Data%20Type%20Precedence%20%28T-SQL%29%20When%20two%20expressions%20of,to%20the%20data%20type%20with%20the%20higher%20precedence.
  SELECT 'HI THERE'
  UNION 
  SELECT 4