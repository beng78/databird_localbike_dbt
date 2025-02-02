{{ config(alias='store') }}
SELECT
	store_id,
	store_name,
	city,
	state,
	zip_code
FROM
    {{ ref('stg_erp_database__store') }}