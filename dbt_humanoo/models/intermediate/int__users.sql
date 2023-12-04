{{ config(
    materialized = 'table',
    unique_key = 'id'
) }}

WITH src AS (

    SELECT
        user_id,
        user_name,
        company_id,
        company_name,
        company_size
    FROM
        {{ ref('stg__users') }}
)
SELECT
    *
FROM
    src
