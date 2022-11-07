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

--JSON_QUERY -- RETURNS AN OBJECT OR ARRAY 
--JSON_VALUE -- RETURNS ONE VALUE

SELECT JSON_QUERY(@json,'$') -- ROOT
SELECT JSON_QUERY(@json,'$.shopping') -- OBJECT
SELECT JSON_QUERY(@json,'$.shopping.Items')  -- ARRAY

-- path is case sensitive on both of JSON_QUERY and JSON_VALUE
--SELECT JSON_VALUE(@json, 'strict $.Name') -- strict gives an error message instead of NULL 
SELECT JSON_VALUE(@json, '$.name') 
SELECT JSON_VALUE(@json, '$.shopping.ShoppingTrip') 
SELECT JSON_VALUE(@json, '$.shopping.Items[0].Item') AS FirstItem, JSON_VALUE(@json, '$.shopping.Items[0].Cost') as Cost



