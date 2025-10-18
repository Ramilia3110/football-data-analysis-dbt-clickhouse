SELECT 
    p1.name,
    p1.position,
    p1.price,
    p2.avg_price as avg_position_price
FROM   {{ ref('clean_players') }} p1
JOIN (
    SELECT position, AVG(price) as avg_price
    FROM   {{ ref('clean_players') }}
    WHERE price IS NOT NULL
    GROUP BY position
) p2 ON p1.position = p2.position
WHERE p1.price > 1.5 * p2.avg_price
AND p1.price IS NOT NULL
ORDER BY p1.position, p1.price DESC

-- 6_rep_value_gt_1_5x_avg_pos