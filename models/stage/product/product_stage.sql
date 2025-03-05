SELECT
    ID,
    CATEGORY_ID,
    SUBCATEGORY_DESC
FROM {{ source('product_stage', 'stg_product')}}