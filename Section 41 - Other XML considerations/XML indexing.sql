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

-- CREATES AN PRIMARY INDEX ON #TEMP TABLE
CREATE PRIMARY XML INDEX PK_TBLXML ON #tblXML(xmlCol)         

CREATE XML INDEX secPK_tblXML_Path ON #tblXML(xmlCol)
USING XML INDEX PK_TBLXML FOR PATH  -- HELPS ON QUERIES THAT USE PATH, FOR EXAMPLE EXIST METHOD             
									-- can be useful for catalogs of all the paths
CREATE XML INDEX secPK_tblXML_Value ON #tblXML(xmlCol)
USING XML INDEX PK_TBLXML FOR VALUE  -- good for queries that use wild cards in a path, where the full path is not known      
									 -- least useful
CREATE XML INDEX secPK_tblXML_Property ON #tblXML(xmlCol)
USING XML INDEX PK_TBLXML FOR PROPERTY  -- good for when multiple values are being retrieved

-- BEST THING TO USE ALL FOUR INDEXES    
-- CON-> EVERY CHANGE YOU MAKE REQUIRES INDEXES TO RECALCULATE AND THAT TAKES TIME, SPACE                 