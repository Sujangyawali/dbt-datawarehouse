{{ config(
  materialized='temp_truncate_insert',
  alias='tmp_store',
) }}

SELECT 
    STR.ID,
    RGN.RGN_KY,
    RGN.CNTRY_KY,
    STR.STORE_DESC
FROM {{ ref('store_stage') }} STR
LEFT OUTER JOIN {{ ref('region_target')}} RGN
ON RGN.RGN_ID = STR.REGION_ID