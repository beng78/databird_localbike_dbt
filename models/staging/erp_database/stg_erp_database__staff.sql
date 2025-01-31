SELECT
	staff_id,
	CONCAT(first_name, ' ', last_name) AS staff_name,    
	active,
	store_id,
	CAST(NULLIF(manager_id, 'NULL') as INT) as manager_id,
FROM
    {{ source('erp_database' ,'staffs' )}}
	
