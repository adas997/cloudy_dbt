{{ config(materialized='view') }}

{% set dim_cust_v1 = ref('dim_customer_prt',v=1) %}

select 
{{dbt_utils.star(from=dim_cust_v1,except=['CUSTOMER_ADDRESS','CUSTOMER_NATION_KEY']) }}
from {{ dim_cust_v1 }}