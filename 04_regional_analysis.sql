
-- Analysis 2: Regional Sales Performance

SELECT
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales::NUMERIC), 2) AS revenue,
    ROUND(SUM(profit::NUMERIC), 2) AS profit,
    ROUND(
        100 * SUM(profit::NUMERIC)
        / NULLIF(SUM(sales::NUMERIC), 0),
        2
    ) AS profit_margin_pct
FROM public.superstore_raw
GROUP BY region
ORDER BY profit_margin_pct ASC;
