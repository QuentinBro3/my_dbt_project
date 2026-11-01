select
    cast(staff_id as int) as staff_id,
    first_name,
    last_name,
    lower(email) as email,
    phone,
    cast(active as int) as active,
    cast(store_id as int) as store_id,
    cast(manager_id as int) as manager_id
from {{ source('localbike', 'staffs') }}