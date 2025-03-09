{{ config(
  materialized='temp_truncate_insert',
  alias='tmp_customer',
) }}

SELECT 
    ID,
    CUSTOMER_FIRST_NAME,
    CUSTOMER_MIDDLE_NAME,
    CUSTOMER_LAST_NAME,
    CUSTOMER_ADDRESS
FROM {{ ref('customer_stage') }}