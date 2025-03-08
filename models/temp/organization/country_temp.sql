{{ config(
  materialized='temp_truncate_insert',
  alias='tmp_country',
) }}

SELECT 
  ID,
  COUNTRY_DESC
FROM {{ ref('country_stage') }}