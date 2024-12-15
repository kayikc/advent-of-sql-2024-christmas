
WITH CTE_TAGS AS (
        SELECT
            toy_id,
            toy_name,
            array(
                    SELECT unnest(new_tags)
                    EXCEPT -- new tags minus prev tags
                    SELECT unnest(previous_tags)
            ) AS added_tags,
            array(
                    SELECT unnest(new_tags)
                    INTERSECT -- overlapped tags
                    SELECT unnest(previous_tags)
            ) AS unchanged_tags,
            array(
                    SELECT unnest(previous_tags)
                    EXCEPT -- prev tags minus new tags
                    SELECT unnest(new_tags)
            ) AS removed_tags
        FROM public.toy_production)
SELECT
    toy_id,
    COALESCE(array_length(added_tags, 1), 0) as added_tags_length,
    COALESCE(array_length(unchanged_tags, 1), 0) as unchanged_tags_length,
    COALESCE(array_length(removed_tags, 1), 0) as removed_tags_length
FROM CTE_TAGS
ORDER BY array_length(added_tags, 1) DESC NULLS LAST --NULLs come after all non-NULLs
LIMIT 1;
