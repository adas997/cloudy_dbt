{{
    config (
        materialized='incremental',
        incremental_strategy='append'
    )
}}
with data as
(
select
    lh.listing_id,
    lh.host_id,
    --sum(to_number(trim(lh.PRICE_STR, '$'))) as total_price,
    sum(lh.PRICE_STR) as total_price,
    cast(date_trunc('day', lh.updated_at) as date) as updated_at,
    cast(date_trunc('day', lh.created_at) as date) as created_at,
from
    {{ ref ('dim_listings_w_hosts') }} lh
group by
    lh.listing_id,
    lh.host_id,
    cast(date_trunc('day', lh.updated_at) as date),
    cast(date_trunc('day', lh.created_at) as date)
)
select 
d.LISTING_ID,
d.HOST_ID,
d.total_price,
d.updated_at,
d.created_at
from data d
{% if is_incremental() %}
  where d.updated_at > (select max(d1.updated_at) 
                         from {{this}} d1
                         where d1.LISTING_ID = d.listing_id and d1.host_id = d.host_id)
{% endif %}