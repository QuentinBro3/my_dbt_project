select
    cast(category_id as int) as category_id,
    category_name
from {{ source('localbike', 'categories') }}