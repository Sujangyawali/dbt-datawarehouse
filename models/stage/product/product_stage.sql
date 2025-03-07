SELECT
    ID,
    SUBCATEGORY_ID,
    PRODUCT_DESC
FROM {{ source('product_stage', 'stg_product')}}