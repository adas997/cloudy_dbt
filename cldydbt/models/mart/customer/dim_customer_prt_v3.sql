{{ config (materialized='view') }}

{% set dm_v1 =  ref('dim_customer_prt',v=1)   %}

select
{{ dbt_utils.star (from=dm_v1 ,except=["CUSTOMER_PHONE"]) }}
from {{dm_v1}}