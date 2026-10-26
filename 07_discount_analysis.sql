
-- Analysis 5: Discount and Profitability

SELECT
    CASE
        WHEN discount::NUMERIC = 0
            THEN '0% - No Discount'
        WHEN discount::NUMERIC <= 0.10
            THEN '1-10%'
        WHEN discount::NUMERIC <= 0.20
            THEN '11-20%'
        WHEN discount::NUMERIC <= 0.30
            THEN '21-30%'
        ELSE 'Above 30%'
    END AS discount_group,

    COUNT(*) AS total_order_lines,

    ROUND(SUM(sales::NUMERIC), 2) AS revenue,

    ROUND(SUM(profit::NUMERIC), 2) AS profit,

    ROUND(
        100 * SUM(profit::NUMERIC)
        / NULLIF(SUM(sales::NUMERIC), 0),
        2
    ) AS profit_margin_pct

FROM public.superstore_raw

GROUP BY 1
ORDER BY MIN(discount::NUMERIC);
