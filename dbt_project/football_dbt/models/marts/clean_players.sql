WITH players AS (
    SELECT * FROM {{ ref('stg_players') }}
)

SELECT
    player_id,
    name,
    substring(
        name, 
        1, 
        (length(name) - position(reverse(name), ' '))
    ) AS first_name,
    
    arrayElement(
        splitByChar(' ', name), 
        -1
    ) AS last_name,

    age,
    height,
    nationality,
    market_value AS price,
    max_market_value AS max_price,
    max_market_value - market_value AS value_gap,
    position_short AS position,
    club,
    expires_date AS contract_expires,
    joined_date AS joined_club,
    player_agent,
    outfitter

FROM players 
