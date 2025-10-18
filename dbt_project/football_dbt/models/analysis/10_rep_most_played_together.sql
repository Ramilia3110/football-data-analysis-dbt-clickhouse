SELECT
    club,
   
    AVG(dateDiff('day', joined_club, today())) AS average_tenure_days
FROM
    {{ ref('clean_players') }}
WHERE
   
    joined_club IS NOT NULL
GROUP BY
    club
ORDER BY
    average_tenure_days DESC
LIMIT 1 

-- 10_rep_most_played_together