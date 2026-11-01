select
    order_item_id,
    discount
from {{ ref('stg_localbike__order_items') }}
where discount < 0
   or discount > 1