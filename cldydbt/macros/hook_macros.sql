{% macro log_pre_hook(table_name) %}

insert into DBT_DEV.LOGS.DBT_LOGS (text) values( 'pre-hook-'||'{{table_name}}'||': created' )

{% endmacro %}

{% macro log_post_hook(table_name) %}

insert into DBT_DEV.LOGS.DBT_LOGS (text) values( 'post-hook-'||'{{table_name}}'||': created' )

{% endmacro %}