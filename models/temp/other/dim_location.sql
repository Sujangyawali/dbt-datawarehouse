{{
    config(
        materialized = 'table'
    )
}}

WITH LOCATION AS (
    SELECT *
    FROM TARGET.D_RETAIL_LOCN_T
), COUNTRY AS (
    SELECT *
    FROM TARGET.D_RETAIL_CNTRY_T
)
    SELECT 
        L.LOCN_ID location_id
        ,L.LOCN_DESC location_name
        ,C.CNTRY_DESC country_name
    FROM LOCATION L
    INNER JOIN COUNTRY C
    ON L.CNTRY_KY = C.CNTRY_KY