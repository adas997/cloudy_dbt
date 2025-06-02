{% macro learnvariables() %}

    {% set my_name = 'Arpan' %}
        {{ log ('Hello  '~ my_name, info= True) }}

        {{ log ("Hello dbt user " ~  var("user_name","NO USER")  ~ "!", info= True   )}}

{% endmacro %}