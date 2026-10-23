select seller_id,
 seller_zip_code,
 seller_city,
 seller_state,
 4 AS column_4
from {{ source('sales_database', 'seller') }}