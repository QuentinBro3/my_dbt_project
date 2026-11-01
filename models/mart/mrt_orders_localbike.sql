with order_items as (
    select * from {{ ref('int_localbike__orders_items_enriched') }}
),

orders as (
    select * from {{ ref('stg_localbike__orders') }}
),

stores as (
    select * from {{ ref('stg_localbike__stores') }}
),

final as (
    select
        oi.order_item_id,
        oi.order_id,

        -- Order
        o.order_date,
        date_trunc(o.order_date, month) as order_month,
        (o.shipped_date is not null) as is_shipped,

        -- Store
        s.store_name,
        s.city as store_city,

        -- Product
        oi.product_name,
        oi.category_name,
        oi.brand_name,

        -- Amounts
        oi.quantity,
        oi.gross_item_amount,
        oi.net_item_amount,
        oi.discount_item_amount

    from order_items oi
    left join orders o on oi.order_id = o.order_id
    left join stores s on o.store_id = s.store_id
)

select * from final