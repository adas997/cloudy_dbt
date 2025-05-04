
with listings as
(
    select 
    l.LISTING_ID, 
    l.LISTING_NAME, 
    l.LISTING_URL, 
    l.ROOM_TYPE, 
    l.MINIMUM_NIGHTS, 
    l.HOST_ID, 
    --l.PRICE_STR, 
    to_number(trim(l.PRICE_STR, '$')) as PRICE_STR,
    l.CREATED_AT, 
    l.UPDATED_AT
    from {{ ref ('stg_listings') }} l
),
hosts as
(
    select 
    h.HOST_ID, 
    h.HOST_NAME, 
    case when h.IS_SUPERHOST = 't' then 'True' else 'False' end as superhost, 
    h.CREATED_AT, 
    h.UPDATED_AT
    from {{ ref ('stg_hosts') }} h
)
select l.*
,h.HOST_NAME
,h.superhost
from listings l 
left join hosts h 
on (l.host_id = h.host_id)