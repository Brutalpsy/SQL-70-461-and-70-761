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


-- Give me the items only from first shopping trip 
SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item 
				return concat(string($ValueRetrieved), ";")')



--$ - variable

 -- XQuery order of execution 
--F - for
--L - let
--W - where 
--O - order by
--R - return





--SELECT, ORDER OF EXECUTION
--S - SELECT
--F - FROM 
--W - WHERE
--G - GROUP BY
--H - HAVING 
--O - ORDER BY