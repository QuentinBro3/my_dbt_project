select
    cast(brand_id as int) as brand_id,
    brand_name
from {{ source('localbike', 'brands') }}