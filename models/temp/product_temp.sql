{{ config(
  materialized='temp_truncate_insert',
  alias='tmp_product',
) }}

SELECT 
  SUBCAT.ID AS SUB_CTGRY_ID,
  CAT.CTGRY_KY,
  SUBCAT.SUBCATEGORY_DESC
FROM {{ ref('product_stage') }} AS PRDT
LEFT OUTER JOIN {{ ref('subcategory_target') }} AS SUBCAT
ON SUBCAT.SUB_CTGRY_ID = PRDT.SUBCATEGORY_ID
