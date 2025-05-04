{% macro compare_date(pdate) %}
{% set current_dt = modules.datetime.datetime.now().strftime("%Y-%m-%d") %}
{% if pdate < current_dt %}
    'Before date'
{% elif pdate == current_dt %}
    'today'
{% else %}
    'After Date'
{% endif %}
{% endmacro %}

{% macro yesterday() %}
{% set partition_key = (modeules.datetime.datetime.now() - modules.datetime.timedelta(days-1)).strftime("%Y-%m-%d") %}
{{return (partition_key)}}
{% endmacro %}