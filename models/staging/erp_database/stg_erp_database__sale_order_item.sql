SELECT
	CONCAT(order_id, '_' , item_id) as order_item_id,
	order_id,
	item_id,
	product_id,
	quantity,
	CAST(list_price as NUMERIC) as list_price ,
	CAST(discount as NUMERIC) as discount,
	ROUND(quantity * CAST((list_price - (list_price * discount)) as NUMERIC),2) as net_amount
FROM
    {{ source('erp_database' ,'order_items' )}}
	