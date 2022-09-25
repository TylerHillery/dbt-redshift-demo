with 
orders as (
    select * from {{ source('dbtworkshop', 'jaffle_shop_orders') }}
),

rename as (
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    from
        orders
)

select * from rename