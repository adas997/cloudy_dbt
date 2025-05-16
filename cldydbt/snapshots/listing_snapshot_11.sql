{% snapshot listing_snapshot_11 %}
{{
    config (
        strategy = 'check',
        unique_key = 'id',
        check_cols = ['name','room_type','minimum_nights'],
        target_schema = 'snapshots',
        target_database = 'dbt_dev',
        snapshot_meta_column_names = {'dbt_valid_from': 'start_date','dbt_valid_to': 'end_date','dbt_scd_id': 'scd_id','dbt_updated_at': 'modified_date'} ,
        invalidate_hard_deletes = True
    )
}}
select * from {{ source ('bronze','listings') }}

{% endsnapshot %} 