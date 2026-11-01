select
    cast(product_id as int) as product_id,
    product_name,
    cast(brand_id as int) as brand_id,
    cast(category_id as int) as category_id,
    cast(model_year as int) as model_year,
    cast(list_price as numeric) as list_price
from {{ source('localbike', 'products') }}