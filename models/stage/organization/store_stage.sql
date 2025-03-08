SELECT
    ID,
    REGION_ID,
    STORE_DESC
FROM {{ source('organization_stage', 'stg_store')}}