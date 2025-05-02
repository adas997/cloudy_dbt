WITH stg_hosts AS ( 
    SELECT
*
FROM
       {{ source ('bronze','hosts') }}
)
SELECT
id AS host_id,
name AS host_name, 
is_superhost, 
created_at, 
updated_at
FROM
stg_hosts