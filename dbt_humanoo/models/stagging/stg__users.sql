{{ config(
    materialized = 'table'
) }}

WITH src AS (

    SELECT
        *
    FROM
        {{ source(
            'users',
            'users'
        ) }}
)
SELECT
    *
FROM
    src
