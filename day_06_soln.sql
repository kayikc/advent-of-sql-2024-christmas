WITH CTE_AVG AS (
    SELECT
        SUM(price) / count(name) AS average_price
    FROM public.gifts
)

SELECT
    child.name,
    gift.name,
    gift.price
FROM public.children AS CHILD
LEFT JOIN public.gifts AS GIFT
    ON CHILD.child_id = GIFT.child_id
WHERE GIFT.price > (SELECT * FROM CTE_AVG)
ORDER BY price
LIMIT 1;