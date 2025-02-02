{{ config(alias='customer') }}
SELECT
	customer_id,
	customer_name,
	city,
	state,
	zip_code
FROM
    {{ ref('stg_erp_database__customer') }}
	