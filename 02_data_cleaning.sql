
SELECT
    COUNT(*) FILTER (
        WHERE order_id IS NULL OR TRIM(order_id) = ''
    ) AS missing_order_ids,

    COUNT(*) FILTER (
        WHERE sales IS NULL OR TRIM(sales) = ''
    ) AS missing_sales,

    COUNT(*) FILTER (
        WHERE profit IS NULL OR TRIM(profit) = ''
    ) AS missing_profit,

    COUNT(*) FILTER (
        WHERE region IS NULL OR TRIM(region) = ''
    ) AS missing_regions
FROM public.superstore_raw;
