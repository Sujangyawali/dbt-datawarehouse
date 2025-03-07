{{ config(
    materialized='product_upsert',
    unique_key='PDT_ID',
    merge_update_columns=['CTGRY_KY','SUB_CTGRY_KY','PDT_DESC', 'ROW_UPDT_TMS'],
    alias='D_RETAIL_PDT_T'
) }}

SELECT 
  PDT_ID,
  SUB_CTGRY_KY,
  CTGRY_KY,
  PDT_DESC,
  1 AS ACTV_FLG,
  NULL AS PRICE,
  1 AS OPEN_CLOSE_CD,
  CURRENT_TIMESTAMP AS ROW_INSRT_TMS,
  CURRENT_TIMESTAMP AS ROW_UPDT_TMS
FROM {{ ref('product_temp') }}