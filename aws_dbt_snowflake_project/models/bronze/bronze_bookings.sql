{% set night_booked = 1%}

SELECT * FROM {{ source('staging', 'bookings') }}
WHERE NIGHTS_BOOKED > {{ night_booked}}
