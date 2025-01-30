SELECT
	brand_id,
	brand_name
FROM {{ source('erp_database', 'brands') }}
