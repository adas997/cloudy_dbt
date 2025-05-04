{% macro check_nulls( table_name, column_list) %}
{% set null_list = [] %}
{% for col in column_list %}
{% do null_list.append(col ~ ' IS NULL ') %}
{% endfor %}

select 
*,
case when {{ null_list | join(' OR ') }} then 'FAIL'
else
'PASS'
end as null_status
from {{ table_name }}



{% endmacro %}