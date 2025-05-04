WITH stg_reviews AS ( SELECT
r.*
FROM   {{ source ('bronze','reviews') }}  r
)
SELECT
listing_id,
cast(date_trunc('day', date) as date) as review_date ,
reviewer_name,
comments AS review_text, 
sentiment AS review_sentiment
FROM
stg_reviews