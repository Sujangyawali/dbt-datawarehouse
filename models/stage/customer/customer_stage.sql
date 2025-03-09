SELECT
    ID,
    CUSTOMER_FIRST_NAME,
    CUSTOMER_MIDDLE_NAME,
    CUSTOMER_LAST_NAME,
    CUSTOMER_ADDRESS
FROM {{ source('customer_stage', 'stg_customer')}}