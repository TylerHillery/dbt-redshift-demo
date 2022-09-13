with source as (
    select * from {{ source('tickit', 'category') }}
),

rename as (
    select
        catid as cat_id,
        catgroup as cat_group,
        catname as cat_name,
        catdesc as cat_desc
    from
        source
    where
        cat_id IS NOT NULL
    order by
        cat_id
)

select * from rename