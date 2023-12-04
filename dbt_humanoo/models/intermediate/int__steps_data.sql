{{ config(
    materialized = 'table',
) }}

WITH src AS (

    SELECT
        activity_date :: DATE AS activity_date,
        user_id,
        CAST(
            VALUE AS INTEGER
        ) AS steps
    FROM
        {{ ref('stg__steps_data') }}
    WHERE
        activity_date IS NOT NULL
        AND activity_date NOT LIKE '0000-00-00'
)
SELECT
    *
FROM
    src
