{{ config(
    materialized = 'table',
) }}

WITH src AS (

    SELECT
        *
    FROM
        {{ source(
            'steps_data',
            'steps_data'
        ) }}
)
SELECT
    *
FROM
    src
