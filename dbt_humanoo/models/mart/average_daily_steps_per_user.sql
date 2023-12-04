{{ config(
    materialized = 'incremental',
    unique_key = "activity_date || '-' ||user_id",
) }}

WITH activty AS (

    SELECT
        activity_date,
        user_id,
        steps
    FROM
        {{ ref('int__steps_data') }}
),
users AS (
    SELECT
        user_id,
        user_name
    FROM
        {{ ref('int__users') }}
)
SELECT
    A.activity_date,
    A.user_id,
    u.user_name,
    AVG(
        A.steps
    )
FROM
    activty AS A
    JOIN users AS u
    ON u.user_id = A.user_id

{% if is_incremental() %}
WHERE
    A.activity_date >= COALESCE(
        (
            SELECT
                MAX(activity_date)
            FROM
                {{ this }}
        ),
        '1900-01-01'
    )
{% endif %}
GROUP BY
    1,
    2,
    3
