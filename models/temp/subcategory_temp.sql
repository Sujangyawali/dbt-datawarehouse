{{ config(
  materialized='temp_truncate_insert',
  alias='tmp_subcategory',
) }}

SELECT 
  SUBCAT.ID,
  CAT.CTGRY_KY,
  SUBCAT.SUBCATEGORY_DESC
FROM {{ ref('subcategory_stage') }} AS SUBCAT
LEFT OUTER JOIN {{ ref('category_target') }} AS CAT
ON SUBCAT.CATEGORY_ID = CAT.CTGRY_ID
