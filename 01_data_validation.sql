
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT row_id) AS unique_row_ids,
    COUNT(*) - COUNT(DISTINCT row_id)
        AS duplicate_row_ids
FROM public.superstore_raw;
