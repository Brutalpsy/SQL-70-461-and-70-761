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

-- GET ME THE FIRST ELEMENT IN THE SHOPPING TRIP
-- XQUERY VALUE ONLY RETURNS A SINGLE VALUE (SINGLETON), OTHERWISE IF THERE IS MORE ELEMENTS IT WILL THROW AN ERROR
SELECT @x.value('(/Shopping/ShoppingTrip/Item)[1]','varchar(50)')
-- GET ME THE FIRST ELEMENT COST - USING @ SIGN WE CAN ACCESS ATTRIBUTES
SELECT @x.value('(/Shopping/ShoppingTrip/Item/@Cost)[1]','varchar(50)')


-- WE CAN USE EXIST METHOD
-- WHICH RETURNS 1 OR 0 DEPPENDING IF THAT NODE EXISTS
SELECT @x.exist('(/Shopping/ShoppingTrip/Item/@Cost)[1]')
SELECT @x.exist('(/Shopping/ShoppingTrip/Item/@Cost)[4]')
