SELECT
    ID AS CTGRY_ID,
    CATEGORY_DESC AS CTGRY_DESC
FROM {{ source('product_stage', 'stg_category')}}