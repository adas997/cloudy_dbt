WITH stg_reviews AS ( SELECT
*
FROM   {{ source ('bronze','reviews') }} 
)
SELECT
listing_id,
date AS review_date, 
reviewer_name,
comments AS review_text, 
sentiment AS review_sentiment
FROM
stg_reviews