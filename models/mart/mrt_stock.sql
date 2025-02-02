{{ config(alias='stock') }}

With 
CteAvgSale as (
	SELECT
        Product_ID, 
        store_id,    
        Sum(quantity) as sale_quantity,
    	Sum(quantity) / 60 as average_quantity
    FROM {{ ref('mrt_sale_order') }}
    WHERE order_date between '2018-03-01' and '2018-04-30'  
    Group by product_ID, store_id
    ),
CteTotalSale as (
    SELECT
        Product_ID, 
        store_id,    
        Sum(quantity) as sale_quantity
    FROM {{ ref('mrt_sale_order') }}    
    Group by product_ID, store_id
    )
Select  s.stock_id,
        s.product_ID,
		s.store_id,
		s.quantity as stock_quantity,
        s.stock_value,
		Coalesce(CteAvgSale.sale_quantity,0) as sale_quantity_last_2_months,
		--Round(average_quantity,3) as average_quantity, 
		Round(s.quantity / Coalesce(CteAvgSale.average_quantity,0.005),0) as stock_coverage_in_days,
        Coalesce(CteTotalSale.sale_quantity,0) as total_sale_quantity
From {{ ref('int_erp_database__stock')}}  s
Left join CteAvgSale on CteAvgSale.product_id = s.product_id and CteAvgSale.store_id = s.store_id
Left join CteTotalSale on CteTotalSale.product_id = s.product_id and CteTotalSale.store_id = s.store_id


