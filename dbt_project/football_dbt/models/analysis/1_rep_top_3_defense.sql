SELECT
    club,
    SUM(price) AS total_defense_value
FROM
    {{ ref('clean_players') }}
WHERE

    position LIKE 'Defender%'
GROUP BY
    club
ORDER BY
    total_defense_value DESC
LIMIT 3