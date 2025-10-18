-- models/analysis/2_rep_joined_after_count.sql

SELECT
    t1.name,
    t1.club,
    -- Count players (t2) in the same club
    -- whose joined_club date is strictly LATER than t1.joined_club
    COUNT(t2.player_id) AS players_joined_after
FROM
    {{ ref('clean_players') }} AS t1 -- The player being evaluated ('him')
LEFT JOIN
    {{ ref('clean_players') }} AS t2 -- The other players
    ON
        t1.club = t2.club                  -- Players must be in the same club
        AND t2.joined_club > t1.joined_club -- t2 joined strictly AFTER t1
GROUP BY
    t1.name,
    t1.club
ORDER BY
    t1.club,
    players_joined_after DESC