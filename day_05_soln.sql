WITH ranked_data AS (
    SELECT
        production_date,
        toys_produced,
        LAG(toys_produced) OVER (ORDER BY production_date) AS prev_toys_produced
    FROM toy_production
)
SELECT
    production_date,
	toys_produced - prev_toys_produced,
    100.0 * (toys_produced - prev_toys_produced) / prev_toys_produced AS percentage_delta
FROM ranked_data
WHERE prev_toys_produced IS NOT NULL
ORDER BY percentage_delta DESC