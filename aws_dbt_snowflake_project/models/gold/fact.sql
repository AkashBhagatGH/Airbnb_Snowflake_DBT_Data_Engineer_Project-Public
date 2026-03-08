{% set congigs = [
    {
        "tables" : "AIRBNB.GOLD.OBT",
        "columns" : "GOLD_obt.BOOKING_ID,GOLD_obt.LISTING_ID,GOLD_obt.HOST_ID,GOLD_obt.TOTAL_AMOUNT,GOLD_obt.CLEANING_FEE,GOLD_obt.SERVICE_FEE,GOLD_obt.ACCOMMODATES,GOLD_obt.BEDROOMS,GOLD_obt.BATHROOMS,GOLD_obt.PRICE_PER_NIGHT",
        "alias" : "GOLD_obt"
    },
    {
        "tables" : "AIRBNB.GOLD.DIM_LISTINGS",
        "columns" : "",
        "alias" : "GOLD_listings",
        "join_condition" : "GOLD_OBT.LISTING_ID = GOLD_listings.LISTING_ID"
    },
    {
        "tables" : "AIRBNB.GOLD.DIM_HOSTS",
        "columns" : "",
        "alias" : "GOLD_hosts",
        "join_condition" : "GOLD_OBT.HOST_ID = GOLD_hosts.HOST_Id"
    }
]%}

SELECT
-- SELECT COLUMN
        {{congigs[0]['columns']}}
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

    
