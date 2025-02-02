{{ config(materialized='view', alias='stock_transfer') }}

SELECT s1.* ,
	   s2.store_id as source_store_id,
	   s2.stock_quantity as source_stock_quantity
FROM {{ ref('mrt_stock') }} s1
LEFT JOIN {{ ref('mrt_stock') }} s2 on s2.product_id = s1.Product_ID and s2.stock_coverage_in_days > 60 and s2.stock_quantity > 5
where s1.stock_coverage_in_days <= 20 
and s1.sale_quantity_last_2_months >  0
QUALIFY ROW_NUMBER () over (partition by s1.Product_id , s1.store_id order by s2.stock_quantity desc) = 1