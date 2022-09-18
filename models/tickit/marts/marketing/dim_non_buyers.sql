with 
sales as (
    select * from {{ ref('stg_tickit__sales') }}
),

users as (
    select * from {{ ref('stg_tickit__users') }}
),

final as (
    select distinct
        u.user_id,
        u.username,
        cast((u.last_name||', '||u.first_name) as varchar(100)) as full_name,
        u.city,
        u.state,
        u.email,
        u.phone,
        u.like_broadway,
        u.like_classical,
        u.like_concerts,
        u.like_jazz,
        u.like_musicals,
        u.like_opera,
        u.like_rock,
        u.like_sports,
        u.like_theatre,
        u.like_vegas
    from 
        users as u
        left join sales as s 
            on u.user_id = s.buyer_id
    where
        s.buyer_id is null
    order by 
        user_id

)

select * from final