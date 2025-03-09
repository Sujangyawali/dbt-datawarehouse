{{ config(
  materialized='temp_truncate_insert',
  alias='tmp_sales',
) }}

SELECT 
    SLS.ID,
    LOC.LOCN_KY,
    DT.DT_KY,
    ITM.PDT_KY,
    CUST.CUSTOMER_KY,
    SLS.TRANSACTION_TIME,
    SLS.QUANTITY,
    SLS.AMOUNT,
    SLS.DISCOUNT
FROM {{ ref('sales_stage') }} AS SLS
LEFT OUTER JOIN {{ ref('store_target') }} LOC
ON SLS.STORE_ID = LOC.LOCN_ID
LEFT OUTER JOIN {{ ref('product_target') }} ITM
ON SLS.PRODUCT_ID = ITM.PDT_ID
LEFT OUTER JOIN {{ ref('time_day_target') }} DT
ON TO_DATE(SLS.TRANSACTION_TIME) = DT.ID
LEFT OUTER JOIN {{ ref('customer_target') }} CUST
ON CUST.CUSTOMER_ID = SLS.CUSTOMER_ID
