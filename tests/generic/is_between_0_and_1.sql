{% test is_between_0_and_1 (model, column_name) %}

    SELECT {{ column_name }} as incorrect_value       
    FROM {{ model }}
    WHERE {{ column_name }} < 0 or {{ column_name }}  > 1
    LIMIT 1

{% endtest %}
