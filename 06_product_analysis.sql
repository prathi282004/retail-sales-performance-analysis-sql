
-- Analysis 4A: Top 10 Revenue Products

SELECT
    product_id,
    product_name,
    category,
    ROUND(SUM(sales::NUMERIC), 2) AS revenue,
    ROUND(SUM(profit::NUMERIC), 2) AS profit,
    SUM(quantity::NUMERIC) AS units_sold
FROM public.superstore_raw
GROUP BY product_id, product_name, category
ORDER BY revenue DESC
LIMIT 10;



-- Analysis 4B: Products With Highest Losses

SELECT
    product_id,
    product_name,
    category,
    ROUND(SUM(sales::NUMERIC), 2) AS revenue,
    ROUND(SUM(profit::NUMERIC), 2) AS profit
FROM public.superstore_raw
GROUP BY product_id, product_name, category
HAVING SUM(profit::NUMERIC) < 0
ORDER BY profit ASC
LIMIT 10;



-- Analysis 4C: Top 3 Products Per Category

WITH product_sales AS (
    SELECT
        category,
        product_id,
        product_name,
        SUM(sales::NUMERIC) AS revenue
    FROM public.superstore_raw
    GROUP BY category, product_id, product_name
),
ranked_products AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY revenue DESC, product_id
        ) AS product_rank
    FROM product_sales
)
SELECT
    category,
    product_name,
    ROUND(revenue, 2) AS revenue,
    product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY category, product_rank;
