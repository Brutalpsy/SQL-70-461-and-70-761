 DECLARE @X XML
 SET @X = '<Shopping ShopperName="Danijel" Weather="awesome">
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

SELECT @X AS XmlOutput

ALTER TABLE Employee
ADD XmlOutput XML NULL



UPDATE Employee
SET XmlOutput = @X
WHERE EmployeeNumber = 200

SELECT * FROM Employee WHERE EmployeeNumber = 200


-- DROP EXAMPLE STUFF
ALTER TABLE Employee
DROP COLUMN XmlOutput

