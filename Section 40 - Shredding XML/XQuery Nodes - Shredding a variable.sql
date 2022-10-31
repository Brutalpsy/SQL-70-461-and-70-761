 DECLARE @x XML
 SET @x = '<Shopping ShopperName="Danijel" Weather="awesome">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'


-- Get me two of those ShoppingTrip nodes
SELECT tbl.coluumn.query('.')
FROM @x.nodes('/Shopping/ShoppingTrip') AS tbl(coluumn)

-- Get me all of those items in the nodes
SELECT tbl.coluumn.query('.')
FROM @x.nodes('/Shopping/ShoppingTrip/Item') AS tbl(coluumn)

-- Get me all of those items with the cost
SELECT tbl.coluumn.value('.','varchar(50)') as Item,tbl.coluumn.value('@Cost','varchar(50)') as Cost
FROM @x.nodes('/Shopping/ShoppingTrip/Item') AS tbl(coluumn)


-- move all of those data into a table
SELECT tbl.coluumn.value('.','varchar(50)') as Item,tbl.coluumn.value('@Cost','varchar(50)') as Cost
INTO tblTempa
FROM @x.nodes('/Shopping/ShoppingTrip/Item') AS tbl(coluumn)

SELECT * FROM tblTempa

DROP TABLE tblTempa

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