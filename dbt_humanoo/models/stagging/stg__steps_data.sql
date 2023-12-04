{{ config(
    materialized = 'table',
) }}

WITH src AS (

    SELECT
        *
    FROM
        {{ source(
            'src',
            'steps'
        ) }}
)
SELECT
    *
FROM
    src
