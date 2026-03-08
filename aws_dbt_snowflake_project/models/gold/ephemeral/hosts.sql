{{
      config(
        materialized = 'ephemeral',
        )
}}

WITH HOSTS AS
(
    SELECT
        HOST_ID,
        HOST_NAMES,
        IS_SUPERHOST,
        CREATED_AT
        
    FROM 
        {{ref('obt')}}
)
SELECT * FROM hosts

