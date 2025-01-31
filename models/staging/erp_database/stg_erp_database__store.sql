SELECT
	store_id,
	store_name,
	city,
	state,
	zip_code
FROM
    {{ source('erp_database' ,'stores' )}}	