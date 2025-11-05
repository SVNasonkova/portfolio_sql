SELECT
    pharmacy_name,
    COUNT(DISTINCT customer_id) AS customers_cnt
FROM
    pharma_orders
GROUP BY
    pharmacy_name
ORDER BY
    customers_cnt DESC