{{ config(
  materialized='temp_truncate_insert',
  alias='tmp_category',
) }}

SELECT 
  CTGRY_ID,
  CTGRY_DESC
FROM {{ ref('category_stage') }}