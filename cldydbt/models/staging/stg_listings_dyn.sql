{{
    config (
        materialized='dynamic_table',
        target_lag='downstream',
        snowflake_warehouse='CLOUDY_WH',
        on_config_change = 'apply',
        pre_hook=log_pre_hook('{{this}}'),
        post_hook=log_post_hook('{{this}}')
    )
}}
select id as listing_id,
name as listing_name,
listing_url,
room_type, 
minimum_nights, 
host_id,
price AS price_str, 
created_at, 
updated_at
from {{ source ('bronze','listings') }}