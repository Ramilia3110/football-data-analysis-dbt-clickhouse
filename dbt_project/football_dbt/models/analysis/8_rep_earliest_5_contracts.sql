-- 8_rep_earliest_5_contracts


SELECT
    sub.club,
    sub.contract_expires AS fifth_earliest_expiry_date
FROM
    (
       
        SELECT
            club,
            contract_expires,
           
            ROW_NUMBER() OVER (
                PARTITION BY club
                ORDER BY contract_expires ASC
            ) AS contract_rank
        FROM
            {{ ref('clean_players') }}
        WHERE
            contract_expires IS NOT NULL
    ) AS sub
WHERE
    sub.contract_rank = 5
ORDER BY
    fifth_earliest_expiry_date ASC
LIMIT 1
