{{ config(
    materialized = 'incremental',
    unique_key = 'company_id',
) }}

WITH usercounts AS (

    SELECT
        u.company_id,
        u.company_name,
        COUNT(
            u.user_id
        ) AS total_users,
        COUNT(
            s.user_id
        ) AS users_with_steps
    FROM
        {{ ref('int__users') }}
        u
        LEFT JOIN {{ ref('int__steps_data') }}
        s
        ON u.user_id = s.user_id
    GROUP BY
        u.company_id,
        u.company_name
)
SELECT
    company_id,
    company_name,
    total_users,
    users_with_steps,
    (
        users_with_steps * 100.0
    ) / total_users AS percentage_with_steps
FROM
    usercounts
