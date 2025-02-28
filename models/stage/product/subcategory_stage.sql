SELECT
    ID,
    SUBCATEGORY_DESC
FROM {{ source('product_stage', 'stg_subcategory')}}