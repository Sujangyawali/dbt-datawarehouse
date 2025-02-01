{% macro snowflake__insert_by_period(relation, period, tmp_relation, unique_key, dest_columns) %}
    {#
        Custom macro to handle INSERTs for incremental models.
        This macro explicitly specifies the target columns, excluding CTGRY_KY.
    #}
    INSERT INTO {{ relation }} (
        CTGRY_ID,
        CTGRY_DESC,
        OPEN_CLOSE_CD,
        ROW_INSRT_TMS,
        ROW_UPDT_TMS
    )
    SELECT
        CTGRY_ID,
        CTGRY_DESC,
        OPEN_CLOSE_CD,
        ROW_INSRT_TMS,
        ROW_UPDT_TMS
    FROM {{ tmp_relation }}
{% endmacro %}