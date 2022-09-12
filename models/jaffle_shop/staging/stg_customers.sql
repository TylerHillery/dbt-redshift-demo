select
    id as customer_id,
    first_name,
    last_name
from
    {{ source('dbtworkshop', 'jaffle_shop_customers') }}