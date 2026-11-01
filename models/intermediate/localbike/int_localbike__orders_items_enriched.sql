with order_items as (
    select * from {{ ref('stg_localbike__order_items') }}
),

products as (
    select * from {{ ref('stg_localbike__products') }}
),

categories as (
    select * from {{ ref('stg_localbike__categories') }}
),

brands as (
    select * from {{ ref('stg_localbike__brands') }}
),

enriched as (
    select
        oi.order_item_id,
        oi.order_id,
        oi.item_id,
        oi.product_id,
        p.product_name,
        c.category_name,
        b.brand_name,
        oi.quantity,
        oi.list_price,
        oi.discount,

        -- Amount before discount
        round(oi.quantity * oi.list_price, 2) as gross_item_amount,
        -- Amount after discount
        round(oi.quantity * oi.list_price * (1 - oi.discount), 2) as net_item_amount,
        -- Amount given away through the discount
        round(oi.quantity * oi.list_price * oi.discount, 2) as discount_item_amount

    from order_items oi
    left join products p on oi.product_id = p.product_id
    left join categories c on p.category_id = c.category_id
    left join brands b on p.brand_id = b.brand_id
)

select * from enriched