DECLARE @json NVARCHAR(4000)

SET @json = 
'{
"name": "Danijel",
"shopping":
	{
		"shoppingTrip": 1,
		"items": 
		[
			{ "item": "Bananas", "cost": 5 },
			{ "item": "Apples",  "cost": 4  },
			{ "item": "Cheries", "cost": 3 }
		]
	}
}'

-- convert json to table
SELECT * FROM OPENJSON(@json)

-- convert items object into a table
SELECT * FROM OPENJSON(@json,'$.shopping.items')

-- proper way to do it
SELECT * FROM OPENJSON(@json,'$.shopping.items')
		 WITH (item varchar(10), cost int)