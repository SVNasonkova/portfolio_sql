WITH Gorzdrav AS(
    SELECT
        p_o.customer_id,
        concat(c_a.first_name, ' ', c_a.second_name, ' ', last_name) AS name_customer,
        COUNT(order_id) AS order_cnt,
        'Горздрав' AS pharmacy_name
    FROM
        pharma_orders AS p_o
        JOIN customers AS c_a USING (customer_id)
    WHERE
        pharmacy_name = 'Горздрав'
    GROUP BY
        p_o.customer_id,
        c_a.first_name,
        c_a.second_name,
        c_a.last_name
    ORDER BY
        order_cnt DESC
    LIMIT
        10
), Zdravcity AS(
    SELECT
        p_o.customer_id,
        concat(c_a.first_name, ' ', c_a.second_name, ' ', last_name) AS name_customer,
        COUNT(order_id) AS order_cnt,
        'Здравсити' AS pharmacy_name
    FROM
        pharma_orders AS p_o
        JOIN customers AS c_a USING (customer_id)
    WHERE
        pharmacy_name = 'Здравсити'
    GROUP BY
        p_o.customer_id,
        c_a.first_name,
        c_a.second_name,
        c_a.last_name
    ORDER BY
        order_cnt DESC
    LIMIT
        10
)
SELECT
    name_customer,
    order_cnt,
    pharmacy_name
FROM
    Gorzdrav
UNION ALL
SELECT
    name_customer,
    order_cnt,
    pharmacy_name
FROM
    Zdravcity