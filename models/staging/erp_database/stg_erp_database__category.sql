SELECT
	category_id,
	category_name
FROM
	{{ source('erp_database', 'categories') }}