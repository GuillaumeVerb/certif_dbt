

{{ config(materialized='incremental', unique_key="DATE") }}

WITH new_data1 AS (
    SELECT
        DATE,
        total_new_cases
    FROM {{ ref('covid_before_test') }} 
    --from  {{source ('PUBLIC', 'covid_before_test' ) }}
    WHERE DATE > COALESCE((SELECT MAX(DATE) FROM {{ this }}), '1900-01-01')
)

SELECT * FROM new_data1
