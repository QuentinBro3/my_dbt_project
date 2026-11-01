{% docs mrt_orders_localbike %}

This model contains one row per order line (one product within an order), enriched with order, store and product information. It is the single model connected to the BI tool and supports the following metrics:

Net revenue. Sum of net_item_amount, after discount.
Gross revenue. Sum of gross_item_amount, before discount.
Discount amount. Sum of discount_item_amount.
Total orders. Count of distinct order_id.
Items sold. Sum of quantity.
Shipped orders rate. Distinct orders with is_shipped true, divided by all distinct orders.

This allows for analysis of performance by month, store, product category, brand and product.

Order-level fields (order_date, is_shipped, store) are repeated on each line of the same order, so orders must be counted with a distinct count on order_id.

{% enddocs %}