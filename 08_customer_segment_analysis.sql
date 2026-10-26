
-- Analysis 6: Customer Segment Performance

SELECT
    segment,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales::NUMERIC), 2) AS revenue,
    ROUND(SUM(profit::NUMERIC), 2) AS profit,
    ROUND(
        100 * SUM(profit::NUMERIC)
        / NULLIF(SUM(sales::NUMERIC), 0),
        2
    ) AS profit_margin_pct
FROM public.superstore_raw
GROUP BY segment
ORDER BY profit DESC;
