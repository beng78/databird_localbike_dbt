Select s.stock_id,
	s.store_id,
	s.product_id,
	s.quantity,
    p.list_price * s.quantity as stock_value
From {{ ref('stg_erp_database__stock')}}  s
Inner join {{ ref('stg_erp_database__product') }} p on p.product_id = s.product_id