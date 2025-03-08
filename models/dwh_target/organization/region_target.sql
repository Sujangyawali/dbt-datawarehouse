{{ config(
    materialized='region_upsert',
    unique_key='RGN_ID',
    merge_update_columns=['RGN_DESC', 'ROW_UPDT_TMS'],
    alias='D_RETAIL_RGN_T'
) }}

SELECT 
  RGN_ID,
  CNTRY_KY,
  RGN_DESC,
  1 AS OPEN_CLOSE_CD,
  CURRENT_TIMESTAMP AS ROW_INSRT_TMS,
  CURRENT_TIMESTAMP AS ROW_UPDT_TMS
FROM {{ ref('region_temp') }}