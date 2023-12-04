{{ config(
    materialized = 'table',
) }}

WITH top_users_cte AS (

    SELECT
        u.user_name,
        s.activity_date,
        SUM(
            s.value
        ) AS total_steps
    FROM
        {{ ref('users') }}
        u
        JOIN {{ ref('steps') }}
        s
        ON u.user_id = s.user_id
    GROUP BY
        u.user_name,
        s.activity_date
    ORDER BY
        total_steps DESC
    LIMIT
        10
)
SELECT
    *
FROM
    top_users_cte
UNION ALL
SELECT
    u.user_name,
    s.activity_date,
    SUM(
        s.value
    ) AS total_steps
FROM
    {{ ref('users') }}
    u
    JOIN {{ ref('steps') }}
    s
    ON u.user_id = s.user_id
GROUP BY
    u.user_name,
    s.activity_date
ORDER BY
    total_steps ASC
LIMIT
    10
