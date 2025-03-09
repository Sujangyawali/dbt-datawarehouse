{{ config(materialized='ephemeral') }}
SELECT
    ID,
    DT_KY,
    MONTH_KY,
    QUARTER_KY,
    YEAR_KY,
    HALF_YEAR_KY
FROM {{ source('calendar_target', 'd_retail_time_day_t')}}
