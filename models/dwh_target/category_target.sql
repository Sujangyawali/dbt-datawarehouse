{{ config(
    materialized='incremental',
    unique_key='CTGRY_ID',
    merge_update_columns=['CTGRY_DESC'],
    alias='D_RETAIL_CTGRY_T',
    insert_by_period='custom_insert'
) }}

SELECT 
  CTGRY_ID,
  CTGRY_DESC,
  1 AS OPEN_CLOSE_CD,
  CURRENT_TIMESTAMP AS ROW_INSRT_TMS,
  CURRENT_TIMESTAMP AS ROW_UPDT_TMS
FROM {{ ref('category_temp') }}

{% if is_incremental() %}
  WHERE CTGRY_ID NOT IN (SELECT CTGRY_ID FROM {{ this }})
{% endif %}