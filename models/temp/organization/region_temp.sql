{{ config(
  materialized='temp_truncate_insert',
  alias='tmp_region',
) }}

SELECT 
  RGN.ID,
  CNTRY.CNTRY_KY,
  RGN.REGION_DESC
FROM {{ ref('region_stage') }} RGN
LEFT OUTER JOIN {{ ref('country_target')}} CNTRY
ON RGN.COUNTRY_ID = CNTRY.CNTRY_ID