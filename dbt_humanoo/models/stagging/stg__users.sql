{{ config(
    materialized = 'table'
) }}

WITH src AS (

    SELECT
        *
    FROM
        {{ source(
            'src',
            'users'
        ) }}
)
SELECT
    *
FROM
    src
