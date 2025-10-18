

SELECT
    club,
    AVG(price) AS avg_french_value
FROM
    {{ ref('clean_players') }}
WHERE
    nationality = 'France'
GROUP BY
    club
HAVING
   
    AVG(price) > 5
ORDER BY
    avg_french_value DESC 




    -- 3_rep_french_value_gt_5m