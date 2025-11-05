SELECT
    drug,
    SUM(price * COUNT) AS sales
FROM
    pharma_orders
GROUP BY
    drug
ORDER BY
    sales DESC
LIMIT
    3