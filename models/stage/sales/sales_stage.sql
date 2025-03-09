SELECT
    ID,
    STORE_ID,
    PRODUCT_ID,
    CUSTOMER_ID,
    TRANSACTION_TIME,
    QUANTITY,
    AMOUNT,
    DISCOUNT
FROM {{ source('sales_stage', 'stg_sales')}}