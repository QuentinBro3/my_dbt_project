select
    cast(store_id as int) as store_id,
    cast(product_id as int) as product_id,
    cast(quantity as int) as quantity
from {{ source('localbike', 'stocks') }}