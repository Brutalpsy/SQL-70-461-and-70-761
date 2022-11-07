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

-- WAY TO CHANGE ONE VALUE
SELECT JSON_MODIFY(@json, 'strict $.shopping.Items[0].Item', 'Big Bananas')

 -- WAY TO CHANGE WHOLE OBJECT
 -- BUT THE PROBLEM IS THAT JSON_MODIFY EXPECTS A QUERY AND NOT A STRING, SO IT INSERTS ESCAPE CHARACTERS
SELECT JSON_MODIFY(@json, 'strict $.shopping.Items[0]', '{ "Item": "Bananas BIG", "Cost": 1 }')

-- PROPER WAY TO DO IT
SELECT JSON_MODIFY(@json, 'strict $.shopping.Items[0]', JSON_QUERY('{ "Item": "Bananas BIG", "Cost": 1 }'))

-- WE CAN ALSO ADD NEW ITEMS WITH JSON_MODIFY
SELECT JSON_MODIFY(@json, '$.Date', '2022-11-05')
