select
    concat(order_id, '_', item_id) as order_item_id,
    cast(order_id as int) as order_id,
    cast(item_id as int) as item_id,
    cast(product_id as int) as product_id,
    cast(quantity as int) as quantity,
    cast(list_price as numeric) as list_price,
    cast(discount as numeric) as discount
from {{ source('localbike', 'order_items') }}