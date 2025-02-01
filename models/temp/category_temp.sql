{{ config(
  materialized='table',
  alias='tmp_category',
  pre_hook="TRUNCATE TABLE {{ this }}"
) }}

SELECT 
  CTGRY_ID,
  CTGRY_DESC
FROM {{ ref('category_stage') }}