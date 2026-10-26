
-- Analysis 3: Monthly Revenue and Growth

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC(
            'month',
            TO_DATE(order_date, 'MM/DD/YYYY')
        )::DATE AS sales_month,
        SUM(sales::NUMERIC) AS revenue,
        SUM(profit::NUMERIC) AS profit
    FROM public.superstore_raw
    GROUP BY 1
),
monthly_growth AS (
    SELECT
        sales_month,
        revenue,
        profit,
        LAG(revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly_sales
)
SELECT
    sales_month,
    ROUND(revenue, 2) AS revenue,
    ROUND(profit, 2) AS profit,
    ROUND(
        100 * (revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0),
        2
    ) AS revenue_growth_pct
FROM monthly_growth
ORDER BY sales_month;
