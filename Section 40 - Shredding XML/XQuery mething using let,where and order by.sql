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


-- order by cost attribute 
SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item
				order by $ValueRetrieved/@Cost
				return concat(string($ValueRetrieved), ";")')

-- only those who's cost is greater than or equal to 4
SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item
				where $ValueRetrieved/@Cost >=4 
				order by $ValueRetrieved/@Cost
				return concat(string($ValueRetrieved), ";")')


-- asigning a variable to avoid duplication and better readability
SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item
			    let $CostVariable := $ValueRetrieved/@Cost
				where $CostVariable >=4 
				order by $CostVariable
				return concat(string($ValueRetrieved), ";")')


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