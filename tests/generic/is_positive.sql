{% test is_positive(model, column_name) %}

    SELECT {{ column_name }} as negative_value       
    FROM {{ model }}
    WHERE {{ column_name }} < 0
    LIMIT 1

{% endtest %}
