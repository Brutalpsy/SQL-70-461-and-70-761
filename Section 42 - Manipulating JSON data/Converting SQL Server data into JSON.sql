SELECT 'Bananas' AS item, 5 as cost
UNION
SELECT 'Apples' , 4 -- don't need to specify the headers after the first one, since it will be "merged into it"
UNION
SELECT 'Cheries', 3 
FOR JSON PATH, ROOT('Items')