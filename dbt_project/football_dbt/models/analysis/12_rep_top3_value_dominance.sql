SELECT
    ranked.club
FROM (
    SELECT
        club,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY club 
            ORDER BY price DESC
        ) AS player_rank
    FROM 
        {{ ref('clean_players') }}
    WHERE 
        price IS NOT NULL
) ranked
GROUP BY 
    ranked.club
HAVING 
    (SUM(CASE WHEN ranked.player_rank <= 3 THEN ranked.price ELSE 0 END) * 100.0 / SUM(ranked.price)) >= 50
ORDER BY 
    club


-- 12_rep_top3_value_dominance