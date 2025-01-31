{{ config(materialized='view', alias="sale_calendar") }}

With cteCal as 
    (   SELECT * 
        FROM
            {{ ref ('int_erp_database__calendar') }} 
    )
SELECT *
FROM cteCal


