SELECT
    ID,
    COUNTRY_DESC
FROM {{ source('organization_stage', 'stg_country')}}