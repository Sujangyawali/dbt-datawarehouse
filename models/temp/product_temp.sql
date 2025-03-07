{{ config(
  materialized='temp_truncate_insert',
  alias='tmp_product',
) }}

SELECT 
  PRDT.ID ,
  SUBCAT.SUB_CTGRY_KY,
  SUBCAT.CTGRY_KY,
  PRODUCT_DESC,
FROM {{ ref('product_stage') }} AS PRDT
LEFT OUTER JOIN {{ ref('subcategory_target') }} AS SUBCAT
ON SUBCAT.SUB_CTGRY_ID = PRDT.SUBCATEGORY_ID
