with stg_listings 
as
(
    select * from {{ source ('bronze','listings') }}
)
select id as listing_id,
name as listing_name,
listing_url,
room_type, 
minimum_nights, 
host_id,
price AS price_str, 
created_at, 
updated_at
FROM
stg_listings