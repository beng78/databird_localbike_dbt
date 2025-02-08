{%  docs mrt_sale_order %}
This model generates a daily detail of sales orders with :

- ** Dimensions **
    * product_id : link to product table which contains product, category and brand name
    * customer_id : link to customer table which contains name and state
    * store_id : link to store table which contains name, state
    * staff_id : link to staff table which contains seller and manager
    
- ** Metrics **
    * quantity : sale quantity per day
    * net_amount : sale net amount per day

- ** Additional metrics **
    * Total orders : calculated in Metabase with count(distinct order_id)
    * Average order amount : calculated in Metabase with Sum(net_amount) /  count(distinct order_id)
    * Average distinct items per order : calculated in Metabase with count(distinct product_id) /  count(distinct order_id)

{% enddocs %}