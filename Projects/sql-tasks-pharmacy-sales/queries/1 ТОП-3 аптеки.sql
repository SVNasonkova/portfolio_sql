SELECT
    pharmacy_name,
    SUM(price * COUNT) AS sales
FROM
    pharma_orders
GROUP BY
    pharmacy_name
ORDER BY
    sales DESC
LIMIT
    3