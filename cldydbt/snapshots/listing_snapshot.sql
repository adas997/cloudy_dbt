{% snapshot listing_snapshot %}
{{
    config (
        strategy = 'check',
        unique_key = 'id',
        check_cols = ['name','room_type','minimum_nights'],
        target_schema = 'snapshots',
        target_database = 'dbt_dev',
        invalidate_hard_deletes = True
    )
}}
select * from {{ source ('bronze','listings') }}

{% endsnapshot %}  