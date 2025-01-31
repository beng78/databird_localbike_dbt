SELECT
	customer_id,
	CONCAT(first_name, ' ', last_name) AS customer_name,
	city,
	state,
	zip_code
FROM
	{{ source('erp_database' ,'customers' )}}