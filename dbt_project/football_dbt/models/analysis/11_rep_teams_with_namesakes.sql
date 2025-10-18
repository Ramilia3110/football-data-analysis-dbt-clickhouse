SELECT
    club,
    first_name
FROM
    {{ ref('clean_players') }}
WHERE
    first_name IS NOT NULL
GROUP BY
    club,
    first_name
HAVING
    COUNT(player_id) >= 2 
ORDER BY
    club

    -- 11_rep_teams_with_namesakes