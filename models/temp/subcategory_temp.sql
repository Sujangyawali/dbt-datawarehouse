{{ config(
  materialized='temp_truncate_insert',
  alias='tmp_subcategory',
) }}

SELECT 
  SUBCAT.ID,
  CAT.CTGRY_KY,
  SUBCAT.SUBCATEGORY_DESC
FROM {{ ref('subcategory_stage') }} AS SUBCAT
LEFT OUTER JOIN RETAIL_DWH.TARGET.D_RETAIL_CTGRY_T AS CAT
ON SUBCAT.CATEGORY_ID = CAT.CTGRY_ID
