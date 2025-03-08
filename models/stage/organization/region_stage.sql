SELECT
    ID,
    COUNTRY_ID,
    REGION_DESC
FROM {{ source('organization_stage', 'stg_region')}}