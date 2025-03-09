{{ config(
    materialized='sales_upsert',
    unique_key='SLS_ID',
    merge_update_columns=['LOCN_KY','PDT_KY','CUSTOMER_KY', 'QTY','DSCNT','ROW_UPDT_TMS'],
    alias='F_RETAIL_SLS_T'
) }}

SELECT 
    SLS_ID,
    STORE_KY AS LOCN_KY,
    DT_KY,
    PDT_KY,
    CUSTOMER_KY,
    TRANSACTION_TIME,
    QTY,
    AMT,
    DSCNT,
    1 AS OPEN_CLOSE_CD,
    CURRENT_TIMESTAMP AS ROW_INSRT_TMS,
    CURRENT_TIMESTAMP AS ROW_UPDT_TMS
FROM {{ ref('sales_temp') }}