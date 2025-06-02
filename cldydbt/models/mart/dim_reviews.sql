{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}
select 
{{dbt_utils.generate_surrogate_key(['LISTING_ID','review_date','REVIEWER_NAME','REVIEW_TEXT'])}} as review_id,
LISTING_ID, 
--cast(date_trunc('day', review_date) as date) as review_date ,
review_date,
REVIEWER_NAME, 
REVIEW_TEXT, 
REVIEW_SENTIMENT
from {{ ref('stg_reviews') }}
where REVIEW_TEXT is not null  
 {% if is_incremental() %}
  and review_date >= coalesce((select max(is_incremental) from {{ this }}), '1900-01-01')
{% endif %}
