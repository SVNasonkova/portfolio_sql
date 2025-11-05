SELECT
    DISTINCT report_date,
    pharmacy_name,
    SUM(price * COUNT) OVER(
        PARTITION BY pharmacy_name
        ORDER BY
            report_date asc
    ) AS comul_sales
FROM
    pharma_orders
ORDER BY
    pharmacy_name,
    report_date