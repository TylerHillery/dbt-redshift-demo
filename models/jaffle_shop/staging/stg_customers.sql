with 
customers as (
    select * from {{ source('dbtworkshop', 'jaffle_shop_customers') }}
),

rename as (
    select
        id as customer_id,
        first_name,
        last_name
    from
        customers
)

select * from rename