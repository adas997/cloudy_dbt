{{
  config(
    materialized = 'table',
    schema = 'gold_layer'
    )
}}
with fct_reviews as
(
    select * from {{ ref ('fct_reviews_merge') }}
),
full_moon_dates as
(
    select * from {{ ref ("full_moon") }}
)
select
r.*,
case when fm.full_moon_date is null then 'not a full moon'
else 'full moon'
end as is_full_moon
from fct_reviews r 
left join full_moon_dates fm 
on (to_date(r.review_date) = dateadd(day,1,fm.full_moon_date))