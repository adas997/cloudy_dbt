 {{
  config(
    materialized = 'view'
    )
}}
with source_transactions as
(
select *,
row_number() over (partition by transaction_id order by last_updated desc) as rn
from dbt_dev.bronze_layer.RAW_TRANSACTIONS
)
select 
TRANSACTION_ID, 
USER_ID, 
PAYMENT_DATE, 
TRANSACTION_AMOUNT, 
STATUS, 
LAST_UPDATED
from source_transactions
where rn = 1