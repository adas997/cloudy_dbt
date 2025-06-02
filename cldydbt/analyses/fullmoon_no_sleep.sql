with mart_full_moon_reviews as 
(
    select * from {{ ref ('mart_full_moon_reviews') }}
)
select is_full_moon,
REVIEW_SENTIMENT,
count(*)
from mart_full_moon_reviews
group by 
is_full_moon,
REVIEW_SENTIMENT
order by 
is_full_moon,
REVIEW_SENTIMENT