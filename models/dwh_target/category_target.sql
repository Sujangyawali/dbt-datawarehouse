{{ config(
    materialized='custom_incremental',
    unique_key='CTGRY_ID',
    merge_update_columns=['CTGRY_DESC', 'ROW_UPDT_TMS'],
    alias='D_RETAIL_CTGRY_T'
) }}

SELECT 
  CTGRY_ID,
  CTGRY_DESC,
  1 AS OPEN_CLOSE_CD,
  CURRENT_TIMESTAMP AS ROW_INSRT_TMS,
  CURRENT_TIMESTAMP AS ROW_UPDT_TMS
FROM {{ ref('category_temp') }}