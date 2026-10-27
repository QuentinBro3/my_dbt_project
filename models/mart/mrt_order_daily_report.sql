SELECT DATE_TRUNC(order_created_at_x, DAY) AS report_datee,
    2 AS column_2,
    1 AS column_1,	
    mapping.account_manager_x,
    mapping.state_x,
    COUNT(DISTINCT order_id) AS total_orders_y,
    AVG(total_distinct_items) AS average_total_distinct_items_y,
    SUM(sum_feedback_score_y) / SUM(total_feedbacks_y) AS average_feedback_score,
    AVG(total_order_amount_y) AS average_total_order_amount_y
FROM {{ ref('int_sales_database__order') }} AS orders
LEFT JOIN {{ ref('stg_google_sheets__account_manager_region_mapping') }} as mapping ON orders.user_state = mapping.state
GROUP BY report_datee,
    account_manager,
    state