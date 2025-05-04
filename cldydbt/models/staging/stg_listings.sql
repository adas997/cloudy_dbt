with stg_listings 
as
(
    select l.* ,
     row_number () over( partition by l.id order by l.created_at desc) rn
    from {{ source ('bronze','listings') }} l
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
where rn = 1