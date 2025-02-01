SELECT 
        l.location_id
        ,l.location_name
        ,c.country_name
    FROM {{ ref('d_loc') }} L
    INNER JOIN {{ ref("d_cntry") }} C
    ON L.CNTRY_KY = C.CNTRY_KY