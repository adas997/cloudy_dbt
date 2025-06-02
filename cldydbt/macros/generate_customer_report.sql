{% macro generate_customer_report(segment) %}
{% set query %}

select customer_mkt_segment,
count(*) as total_transactions,
sum(customer_account_bal) as total_cust_account_bal
from {{ ref ('stg_customers') }}
where customer_mkt_segment = {{ segment }}
group by customer_mkt_segment

{% endset %}

{% set results = run_query(query) %}

{% for row in results %}
{{ log(row,info=True) }}

{% endfor %}

{{ return(results) }}

{% endmacro %}