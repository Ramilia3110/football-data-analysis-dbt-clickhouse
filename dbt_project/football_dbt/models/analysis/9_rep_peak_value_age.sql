SELECT
    age,
  
    AVG(max_price) AS average_peak_value
FROM
    {{ ref('clean_players') }}
WHERE
  
    max_price IS NOT NULL
GROUP BY
    age
ORDER BY
    average_peak_value DESC
LIMIT 1

-- 9_rep_peak_value_age