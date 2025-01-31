SELECT
	order_id,
	customer_id,
	order_status,
	CAST(order_date as DATE) as order_date,
	CAST(required_date as DATE) as required_date,
	CAST(NULLIF(shipped_date, 'NULL') as DATE) as shipped_date,
	store_id,
	staff_id
FROM
    {{ source('erp_database' ,'orders' )}}
	