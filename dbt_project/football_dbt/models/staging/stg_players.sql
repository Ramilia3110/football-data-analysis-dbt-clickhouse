-- models/staging/stg_players.sql
WITH source_players AS (
    SELECT
        -- Unique key generation
        ROW_NUMBER() OVER (ORDER BY name, club) AS player_id,
        
        -- Basic Info
        name,
        age,
        height,
        nationality,
        
        -- Prices: Use COALESCE for null handling
        COALESCE(price, 0) AS market_value,
        COALESCE(max_price, 0) AS max_market_value,

        -- Positions and Club
        TRIM(position) AS position_short, -- Clean up whitespace
        club,
        
        -- DATES: Simply select and rename the columns, as they are already Date type in raw_players
        contract_expires AS expires_date,
        joined_club AS joined_date,

        player_agent,
        outfitter

    FROM {{ source('football', 'raw_players') }}
)

SELECT *
FROM source_players
WHERE 
    name IS NOT NULL 
    AND club IS NOT NULL 
    AND position_short IS NOT NULL