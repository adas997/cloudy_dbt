{{
    config(
        materialized='ephemeral'
    )
}}
select 
LISTING_ID, 
--cast(date_trunc('day', review_date) as date) as review_date ,
review_date,
REVIEWER_NAME, 
REVIEW_TEXT, 
REVIEW_SENTIMENT
from {{ ref('stg_reviews') }}