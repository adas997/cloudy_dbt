    {{
      config(
        materialized = 'incremental',
        unique_key = 'transaction_id',
        incremental_strategy = 'merge',
        incremental_predicates = ["DBT_INTERNAL_DEST.payment_date >= dateadd(day, -3 , current_date)"],
        post_hook = [
            """
            insert into DBT_DEV.GOLD_LAYER.TRANSACTIONS_RUN_AUDIT
            select '{{this.name}}' as model_name,
            current_timestamp as run_time,
            count(*) as row_count,
            min(payment_date) as min_payment_date,
            max(payment_date) as max_payment_date
            from {{this}}
            """
        ]
        )
    }}
select 
* from {{ ref ('source_transactions') }}
 {% if is_incremental() %}
   where payment_date >= dateadd(day, -3 , current_date)
    and last_updated > (select max(last_updated) from {{this}})
{% endif %}
