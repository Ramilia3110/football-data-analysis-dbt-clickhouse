-- models/analysis/2_rep_joined_after_count.sql

SELECT
    t1.name,
    t1.club,
 
    COUNT(t2.player_id) AS players_joined_after
FROM
    {{ ref('clean_players') }} AS t1 
LEFT JOIN
    {{ ref('clean_players') }} AS t2 
    ON
        t1.club = t2.club                 
        AND t2.joined_club > t1.joined_club 
GROUP BY
    t1.name,
    t1.club
ORDER BY
    t1.club,
    players_joined_after DESC