{{
    config(
        materialized='incremental',
        unique_key='order_key',
        cluster_by=['order_date'],
        incremental_strategy = 'merge',
        incremental_predicates = [
            "DBT_INCREMENTAL_DEST.order_date > dateadd(day,-7,current_date)"
        ]
    )
}}
select * from {{ ref ('stg_orders') }}
{% if is_incremental() %}
    where order_date >= dateadd(day,-7,current_date)
{% endif %}