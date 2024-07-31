{##

Syntax of functions in macros:

    {% macro to_reporting_timezone(column_name) %}

        convert_timezone('UTC', 'America/Los_Angeles',
    {{column_name}}::timestamp_ntz)

    {% endmacro %}

##}