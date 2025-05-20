with stg_customers
as
(
    select c.* ,
    row_number () over( partition by c.C_CUSTKEY order by c.C_NAME desc) rn
    from {{ source ('bronze','customers') }} c
)
select 
  C_CUSTKEY as customer_id
, C_NAME as customer_name
, C_ADDRESS as customer_address
, C_NATIONKEY as customer_nation_key
, C_PHONE as customer_phone
, C_ACCTBAL as customer_account_bal
, C_MKTSEGMENT as customer_mkt_segment
, C_COMMENT as customer_comment
, current_timestamp () as created_at
, current_timestamp () as updated_at
from stg_customers