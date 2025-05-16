{% snapshot host_snapshot %}

{{
    config(
      target_database='dbt_dev',
      target_schema='snapshots',
      unique_key='id',
      strategy='timestamp',
      updated_at='updated_at',
      invalidate_hard_deletes =True
    )
}}

select * from {{ source('bronze', 'hosts') }}

{% endsnapshot %}