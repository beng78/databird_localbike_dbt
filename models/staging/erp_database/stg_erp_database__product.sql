SELECT
	product_id,
	product_name,
	brand_id,
	category_id,
	model_year,
	CAST(list_price as NUMERIC) as list_price
FROM
	{{ source('erp_database' ,'products' )}}
    