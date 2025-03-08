{{ config(
    materialized='store_upsert',
    unique_key='LOCN_ID',
    merge_update_columns=['RGN_KY','CNTRY_KY','LOCN_DESC', 'ROW_UPDT_TMS'],
    alias='D_RETAIL_LOCN_T'
) }}

SELECT 
  STORE_ID AS LOCN_ID,
  RGN_KY,
  CNTRY_KY,
  STORE_DESC AS LOCN_DESC,
  LOCALTIMESTAMP AS LAST_OPEN_TMS,
  1 AS ACTV_FLG,
  1 AS OPEN_CLOSE_CD,
  CURRENT_TIMESTAMP AS ROW_INSRT_TMS,
  CURRENT_TIMESTAMP AS ROW_UPDT_TMS
FROM {{ ref('store_temp') }}