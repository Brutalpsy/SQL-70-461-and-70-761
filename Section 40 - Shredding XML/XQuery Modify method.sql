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

-- QUERY METHODS HAVE TO BE ALL LOWER CASE
-- UPDATE 
SET @x.modify('replace value of (/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1] 
			   with "6.0"')

-- INSERT 
SET @x.modify('insert <Item Cost="5"> New Food </Item>
			   into (/Shopping/ShoppingTrip)[1]')

SELECT @X
