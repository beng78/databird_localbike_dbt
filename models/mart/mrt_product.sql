{{ config(alias='product', ) }}

SELECT
	p.product_id,
	p.product_name,
	b.brand_name ,
	c.category_name ,
	p.model_year,
	p.list_price
FROM
	{{ ref('stg_erp_database__product') }} p
INNER JOIN {{ ref('stg_erp_database__brand') }} b on b.brand_id  = p.brand_id 
INNER JOIN {{ ref('stg_erp_database__category') }} c on c.category_id = p.category_id
