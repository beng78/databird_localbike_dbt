{{ config(alias='staff')  }}
SELECT
	s1.staff_id,
	s1.staff_name,
	s1.active,
	s1.store_id,
	s2.staff_name  as manager_name
FROM
    {{ ref('stg_erp_database__staff') }} s1	
LEFT JOIN {{ ref('stg_erp_database__staff') }} s2 on s2.staff_id = s1.manager_id