-- Analysis: Category Revenue and Profitability

SELECT
    category,
    ROUND(SUM(sales::NUMERIC), 2) AS revenue,
    ROUND(SUM(profit::NUMERIC), 2) AS profit,
    ROUND(
        100 * SUM(profit::NUMERIC)
        / NULLIF(SUM(sales::NUMERIC), 0),
        2
    ) AS profit_margin_pct
FROM superstore_raw
GROUP BY category
ORDER BY profit DESC;



-- Analysis 1B: Furniture Subcategory Performance

SELECT
    sub_category,
    COUNT(*) AS total_order_lines,
    ROUND(SUM(sales::NUMERIC), 2) AS revenue,
    ROUND(SUM(profit::NUMERIC), 2) AS profit,
    ROUND(
        100 * SUM(profit::NUMERIC)
        / NULLIF(SUM(sales::NUMERIC), 0),
        2
    ) AS profit_margin_pct,
    ROUND(AVG(discount::NUMERIC) * 100, 2)
        AS avg_discount_pct
FROM public.superstore_raw
WHERE category = 'Furniture'
GROUP BY sub_category
ORDER BY profit ASC;

