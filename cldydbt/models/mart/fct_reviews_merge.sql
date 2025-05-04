{{
    config(
        materialized='incremental',
        unique_key = ['LISTING_ID','REVIEWER_NAME'],
        merge_update_columns = ['REVIEW_TEXT','review_date']  
    )
}}
select *
from {{ ref ('stg_reviews') }}
where REVIEW_TEXT is not null
{% if is_incremental() %}
  and review_date >= (select max(review_date) from {{this}} )
{% endif %}

