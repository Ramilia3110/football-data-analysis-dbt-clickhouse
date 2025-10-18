SELECT club
FROM  {{ ref('clean_players') }}
GROUP BY club
HAVING CAST(SUM(CASE WHEN nationality = 'Germany' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100 >= 90