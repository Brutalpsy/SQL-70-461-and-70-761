DECLARE @json NVARCHAR(4000)

SET @json = 
'{
"name": "Danijel",
"shopping":
	{
		"ShoppingTrip": 1,
		"Items": 
		[
			{ "Item": "Bananas", "Cost": 5 },
			{ "Item": "Apples", "Cost": 4  },
			{ "Item": "Cheries", "Cost": 3 }
		]
	}
}'

SELECT @json
SELECT ISJSON(@json) -- RETURNS 1/0
