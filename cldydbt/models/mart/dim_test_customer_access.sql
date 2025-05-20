select *
from {{ ref ('dim_customer_prt',v=2) }}