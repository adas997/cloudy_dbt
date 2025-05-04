{{
    config(
        materialized='table',
        database='DBT_DEV',
        schema='SILVER_LAYER',
        alias='custom_save_exceptions'
    )
}}

with excp as
(
    {{
        check_nulls(  ref('stg_supplier'),['supplier_name','supplier_comment']   )   
    }}
)
select *
from excp
where null_status = 'FAIL'