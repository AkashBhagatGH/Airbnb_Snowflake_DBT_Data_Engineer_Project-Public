{% set congigs = [
    {
        "tables" : "AIRBNB.SILVER.SILVER_BOOKINGS",
        "columns" : "silver_bookings.*",
        "alias" : "silver_bookings"
    },
    {
        "tables" : "AIRBNB.SILVER.SILVER_LISTINGS",
        "columns" : "silver_listings.HOST_ID,silver_listings.PROPERTY_TYPE,silver_listings.ROOM_TYPE,silver_listings.CITY,silver_listings.COUNTRY,silver_listings.ACCOMMODATES,silver_listings.BEDROOMS,silver_listings.BATHROOMS,silver_listings.PRICE_PER_NIGHT,silver_listings.PRICE_PER_NIGHT_TAG,silver_listings.CREATED_AT AS LISTINGS_CREATED_AT",
        "alias" : "silver_listings",
        "join_condition" : "silver_bookings.LISTING_ID = silver_listings.LISTING_ID"
    },
    {
        "tables" : "AIRBNB.SILVER.SILVER_HOSTS",
        "columns" : "silver_hosts.HOST_NAMES,silver_hosts.IS_SUPERHOST,silver_hosts.RESPONSE_RATE_QUALITY,silver_hosts.CREATED_AT AS HOSTS_CREATED_AT",
        "alias" : "silver_hosts",
        "join_condition" : "silver_listings.HOST_ID = silver_hosts.HOST_Id"

    }
]%}

SELECT
-- SELECT COLUMN
    {% for config in congigs %}
        {{config['columns']}} {%if not loop.last %} ,{% endif %}
        {% endfor %}
FROM
-- FROM TABLE
    {% for config in congigs %}
        {% if loop.first %}
            {{config['tables']}} AS {{ config['alias'] }}
        {% else %}
            LEFT JOIN {{ config['tables'] }} AS {{ config['alias'] }}
            ON {{ config['join_condition'] }}
            {% endif %}
            {% endfor %}

    
