{{ config(materialized='table') }}

with source_data as (

    select DATE, SUM(POSITIVE) as total_new_cases
    from  {{source ('PUBLIC', 'CT_US_COVID_TESTS' ) }}
    group by DATE

)

select *
from source_data
