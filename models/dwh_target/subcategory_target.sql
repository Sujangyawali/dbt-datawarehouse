{{ config(
    materialized='subcategory_upsert',
    unique_key='SUB_CTGRY_ID',
    merge_update_columns=['CTGRY_KY','SUB_CTGRY_DESC', 'ROW_UPDT_TMS'],
    alias='D_RETAIL_SUB_CTGRY_T'
) }}

SELECT 
  SUB_CTGRY_ID,
  CTGRY_KY,
  SUB_CTGRY_DESC,
  1 AS OPEN_CLOSE_CD,
  CURRENT_TIMESTAMP AS ROW_INSRT_TMS,
  CURRENT_TIMESTAMP AS ROW_UPDT_TMS
FROM {{ ref('subcategory_temp') }}