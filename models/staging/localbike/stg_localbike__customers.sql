select
    cast(customer_id as int) as customer_id,
    initcap(first_name) as first_name,
    initcap(last_name) as last_name,
    phone,
    lower(email) as email,
    street,
    city,
    state,
    cast(zip_code as int) as zip_code
from {{ source('localbike', 'customers') }}