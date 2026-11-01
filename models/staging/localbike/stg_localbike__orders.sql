select
    cast(order_id as int) as order_id,
    cast(customer_id as int) as customer_id,
    cast(order_status as int) as order_status,
    order_date,
    required_date,
    safe.parse_date('%Y-%m-%d', shipped_date) as shipped_date,
    cast(store_id as int) as store_id,
    cast(staff_id as int) as staff_id
from {{ source('localbike', 'orders') }}