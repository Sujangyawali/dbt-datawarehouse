{% materialization temp_truncate_insert, adapter='snowflake' %}

    {% set target_relation = adapter.get_relation(database=this.database, schema=this.schema, identifier=this.identifier) %}

    {% if target_relation is none %}
        {% do exceptions.raise_compiler_error("Target relation " ~ this.database ~ "." ~ this.schema ~ "." ~ this.identifier ~ " does not exist.") %}
    {% endif %}

    {% set insert_sql %}
        TRUNCATE TABLE {{ target_relation }};
        INSERT INTO {{ target_relation }}
        {{ sql }}
        ;
    {% endset %}

    {%- call statement('main') -%}
        {{ insert_sql }}
    {%- endcall -%}
    {{ return({"relations": [target_relation]}) }}
{% endmaterialization %}
