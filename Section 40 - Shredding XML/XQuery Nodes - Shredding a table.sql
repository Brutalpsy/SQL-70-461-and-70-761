 DECLARE @x1 XML, @x2 XML
 SET @x1 = '
<Shopping ShopperName="Danijel" Weather="awesome">
	<ShoppingTrip ShoppingTripID="L1">
		<Item Cost="5">Bananas</Item>
		<Item Cost="4">Apples</Item>
		<Item Cost="3">Cherries</Item>
	</ShoppingTrip>
</Shopping>'
SET @x2 =
'<Shopping ShopperName="Danijel" Weather="awesome">
	<ShoppingTrip ShoppingTripID="L2">
		<Item>Emeralds</Item>
		<Item>Diamonds</Item>
		<Item>Furniture</Item>
	</ShoppingTrip>
</Shopping>'

DROP TABLE #tblXML
CREATE TABLE #tblXML (pkXML INT PRIMARY KEY, xmlCol XML)
INSERT INTO #tblXML (pkXML,xmlCol) VALUES(1,@x1)
INSERT INTO #tblXML (pkXML,xmlCol) VALUES(2,@x2)

SELECT * FROM #tblXML


-- Showcase of using temp table
SELECT tbl.coluumn.query('.') 
FROM #tblXML CROSS APPLY --  USE ONLY WHERE TABLES ARE RELATED 
xmlCol.nodes('/Shopping/ShoppingTrip') AS tbl(coluumn)

-- GET ME THE COST
SELECT tbl.coluumn.value('@Cost','varchar(50)') 
FROM #tblXML CROSS APPLY --  USE ONLY WHERE TABLES ARE RELATED 
xmlCol.nodes('/Shopping/ShoppingTrip/Item') AS tbl(coluumn)




 -- XQuery order of execution 
--F - for
--L - let
--W - where 
--O - order by
--R - return

--$ - variable

--SELECT, ORDER OF EXECUTION
--S - SELECT
--F - FROM 
--W - WHERE
--G - GROUP BY
--H - HAVING 
--O - ORDER BY