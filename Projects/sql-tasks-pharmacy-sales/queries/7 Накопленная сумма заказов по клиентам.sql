WITH all_customers AS(
    SELECT
        report_date,
        p_o.customer_id,
        concat(c_a.first_name, ' ', c_a.second_name, ' ', last_name) AS name_customer,
        SUM(price * COUNT) AS amount
    FROM
        pharma_orders AS p_o
        INNER JOIN customers AS c_a USING (customer_id)
    GROUP BY
        report_date,
        p_o.customer_id,
        c_a.first_name,
        c_a.second_name,
        c_a.last_name
    ORDER BY
        customer_id,
        report_date asc
)
SELECT
    report_date,
    name_customer,
    SUM(amount) OVER(
        PARTITION BY customer_id
        ORDER BY
            report_date asc
    )
FROM
    all_customers
ORDER BY
    name_customer asc,
    report_date