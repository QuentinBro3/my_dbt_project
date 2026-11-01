select
    cast(store_id as int) as store_id,
    store_name,
    phone,
    lower(email) as email,
    street,
    city,
    state,
    cast(zip_code as string) as zip_code
from {{ source('localbike', 'stores') }}