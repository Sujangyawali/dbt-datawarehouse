{{ config(
    materialized='country_upsert',
    unique_key='CNTRY_ID',
    merge_update_columns=['CNTRY_DESC', 'ROW_UPDT_TMS'],
    alias='D_RETAIL_CNTRY_T'
) }}

SELECT 
  CNTRY_ID,
  CNTRY_DESC,
  1 AS OPEN_CLOSE_CD,
  CURRENT_TIMESTAMP AS ROW_INSRT_TMS,
  CURRENT_TIMESTAMP AS ROW_UPDT_TMS
FROM {{ ref('country_temp') }}