{% test is_even(model,column_name) %}

{{ config (store_failures= true) }}

with validation as
(
    select 
        {{ column_name }} as even_odd 
    from 
      {{ model }}
),
check_is_even
(
    select even_odd
        from validation
    where (even_odd % 2) = 1
)
select * 
from check_is_even


{% endtest %}