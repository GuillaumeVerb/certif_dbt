
-- Use the `ref` function to select from other models

select *
from {{ ref('my_first_dbt_model') }}
--from  {{source ('PUBLIC', 'DEMOGRAPHICS' ) }}
where TOTAL_POPULATION > 1000000


