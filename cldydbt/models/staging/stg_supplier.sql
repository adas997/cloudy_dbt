with stg_supplier
as
(
    select * 
    from {{ source('bronze','supplier') }}
)
select 
S_SUPPKEY as supplier_key, 
upper(S_NAME) as supplier_name, 
S_ADDRESS as supplier_address, 
S_NATIONKEY  as supplier_nation_key, 
S_PHONE as supplier_phone, 
S_ACCTBAL as supplier_account_balance, 
S_COMMENT as supplier_comment
from stg_supplier
