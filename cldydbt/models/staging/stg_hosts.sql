WITH stg_hosts AS ( 
    SELECT
s.*,
row_number () over( partition by s.id order by s.created_at desc) rn
FROM
       {{ source ('bronze','hosts') }} s
) 
SELECT
id AS host_id,
name AS host_name, 
is_superhost, 
created_at, 
updated_at
FROM
stg_hosts
where rn = 1