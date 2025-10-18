SELECT
    name,
    price
FROM (
    SELECT
        name,
        age,
        price,
        -- Rank by price descending within each age group
        rank() OVER (PARTITION BY age ORDER BY price DESC) AS rank_by_value
    FROM
        {{ ref('clean_players') }}
)
WHERE
    rank_by_value = 1
ORDER BY
    age 



    -- 5_rep_most_expensive_by_age