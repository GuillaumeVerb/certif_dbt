{{ config(materialized='view') }}

WITH new_data AS (
    SELECT
        EXTRACT(MONTH FROM DATE) AS month,
        {{ calculate_avg_cases('total_new_cases') }} AS avg_new_cases
    FROM {{ ref('covid_test') }} 
    GROUP BY month
)

SELECT * FROM new_data
