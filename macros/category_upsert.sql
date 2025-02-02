{% materialization custom_incremental, adapter='snowflake' %}
    {% set unique_key = config.get('unique_key') %}
    {% set merge_update_columns = config.get('merge_update_columns') %}

    {% set target_relation = adapter.get_relation(database=this.database, schema=this.schema, identifier=this.identifier) %}

    {% set merge_sql %}
        MERGE INTO {{ target_relation }} AS DBT_INTERNAL_DEST
        USING ({{ sql }}) AS DBT_INTERNAL_SOURCE
        ON DBT_INTERNAL_SOURCE.{{ unique_key }} = DBT_INTERNAL_DEST.{{ unique_key }}
        WHEN MATCHED THEN UPDATE SET
             {% for column in merge_update_columns %}
                {% if column == 'ROW_UPDT_TMS' %}
                    {{ column }} = CURRENT_TIMESTAMP
                {% else %}
                    {{ column }} = DBT_INTERNAL_SOURCE.{{ column }}
                {% endif %}
                {% if not loop.last %}, {% endif %}
            {% endfor %}
        WHEN NOT MATCHED THEN INSERT (
            CTGRY_ID,
            CTGRY_DESC,
            OPEN_CLOSE_CD,
            ROW_INSRT_TMS,
            ROW_UPDT_TMS
        ) VALUES (
            DBT_INTERNAL_SOURCE.CTGRY_ID,
            DBT_INTERNAL_SOURCE.CTGRY_DESC,
            DBT_INTERNAL_SOURCE.OPEN_CLOSE_CD,
            DBT_INTERNAL_SOURCE.ROW_INSRT_TMS,
            DBT_INTERNAL_SOURCE.ROW_UPDT_TMS
        );
    {% endset %}

    {%- call statement('main') -%}
        {{ merge_sql }}
    {%- endcall -%}
    {{ return({"relations": [target_relation]}) }}
{% endmaterialization %}
