SELECT
    position,
    
    COUNT(player_id) AS total_players,
    
    SUM(
        CASE 
            WHEN outfitter IS NULL OR outfitter = '' THEN 1 
            ELSE 0 
        END
    ) AS players_without_sponsorship,
    

    ROUND(
        (toFloat64(
            SUM(CASE WHEN outfitter IS NULL OR outfitter = '' THEN 1 ELSE 0 END)
        ) * 100.0) / COUNT(player_id), 
        2
    ) AS percentage_without_sponsorship
    
FROM {{ ref('clean_players') }}

WHERE position IS NOT NULL 

GROUP BY
    position

ORDER BY
    percentage_without_sponsorship DESC
    



-- 7_rep_hardest_position
