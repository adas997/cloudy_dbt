{{
    config (
        materilaized='table'
    )
}}
select 
--cast(a.HOST_ID as string ) as HOST_ID,
a.HOST_ID,
a.HOST_NAME, a.IS_SUPERHOST, a.CREATED_AT, a.UPDATED_AT
from {{ ref ('stg_hosts')}} a
inner join {{ ref ('host_snapshot') }} b   
where a.host_id = b.id 
and current_date() between b.dbt_valid_from and nvl(b.dbt_valid_to,'9999-12-31')