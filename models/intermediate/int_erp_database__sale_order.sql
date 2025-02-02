SELECT
	itm.order_item_id,
	itm.order_id,
	ord.order_status,
	ord.customer_id,
	ord.order_date,
	ord.required_date,
	ord.shipped_date,
	ord.store_id,
	ord.staff_id,	
	itm.product_id,
	itm.quantity,
	itm.list_price,
	itm.discount,
	itm.net_amount
FROM
    {{ ref('stg_erp_database__sale_order_item') }} itm
INNER JOIN {{ ref('stg_erp_database__sale_order') }} ord on ord.order_id  = itm.order_id
