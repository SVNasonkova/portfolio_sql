WITH all_customers AS (
    SELECT
        p_o.customer_id,
        c_a.first_name,
        c_a.second_name,
        c_a.last_name,
        SUM(price * COUNT) AS total_sale
    FROM
        pharma_orders AS p_o
        INNER JOIN customers AS c_a USING (customer_id)
    GROUP BY
        p_o.customer_id,
        c_a.first_name,
        c_a.second_name,
        c_a.last_name
    ORDER BY
        total_sale desc
),
raiting AS (
    SELECT
        *,
        ROW_NUMBER() OVER(
            ORDER BY
                total_sale desc
        ) AS rn
    FROM
        all_customers
)
SELECT
    *
FROM
    raiting
WHERE
    rn < 11