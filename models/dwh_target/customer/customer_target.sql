{{ config(
    materialized='customer_upsert',
    unique_key='CUSTOMER_ID',
    merge_update_columns=['CUSTOMER_FST_NM','CUSTOMER_MID_NM', 'CUSTOMER_LST_NM','CUSTOMER_ADDR','ROW_UPDT_TMS'],
    alias='D_RETAIL_CUSTOMER_T'
) }}

SELECT 
  CUSTOMER_ID,
  CUSTOMER_FST_NM,
  CUSTOMER_MID_NM,
  CUSTOMER_LST_NM,
  CUSTOMER_ADDR,
  1 AS OPEN_CLOSE_CD,
  CURRENT_TIMESTAMP AS ROW_INSRT_TMS,
  CURRENT_TIMESTAMP AS ROW_UPDT_TMS
FROM {{ ref('customer_temp') }}