{{ config(alias='sale_order')  }}
SELECT
	ord.order_item_id,
	ord.order_id,
	ord.order_status,
	ord.customer_id,
	ord.order_date,
	ord.required_date,
	ord.shipped_date,
	ord.store_id,
	ord.staff_id,	
	ord.product_id,
	ord.quantity,
	ord.list_price,
	ord.discount,
	ord.net_amount
FROM
    {{ ref('int_erp_database__sale_order') }} ord

