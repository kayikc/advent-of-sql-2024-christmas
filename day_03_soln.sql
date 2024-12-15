WITH CTE_GUEST AS (
    SELECT
        postgres.dbo.christmas_menus.id,
        COALESCE(
            (SELECT
                 (xpath('//total_count/text()', cm2.menu_data))[1]::text::integer
             FROM postgres.dbo.christmas_menus AS cm2
             WHERE
                 cm2.id = postgres.dbo.christmas_menus.id AND xpath_exists('//total_count', cm2.menu_data)),
            (SELECT
                 (xpath('//total_guests/text()', cm3.menu_data))[1]::text::integer
             FROM postgres.dbo.christmas_menus AS cm3
             WHERE
                 cm3.id = postgres.dbo.christmas_menus.id AND xpath_exists('//total_guests', cm3.menu_data)),
            (SELECT
                 (xpath('//guestCount/text()', cm4.menu_data))[1]::text::integer
             FROM postgres.dbo.christmas_menus AS cm4
             WHERE
                 cm4.id = postgres.dbo.christmas_menus.id AND xpath_exists('//guestCount', cm4.menu_data)),
            0
        ) AS guest_count
    FROM postgres.dbo.christmas_menus
),
CTE_FOOD AS (
    SELECT
        postgres.dbo.christmas_menus.id,
        UNNEST(xpath('//food_item_id/text()', postgres.dbo.christmas_menus.menu_data))::text AS food_item_id
    FROM postgres.dbo.christmas_menus
)
SELECT
    fi.food_item_id,
    COUNT(*) AS frequency
FROM CTE_FOOD AS fi
JOIN CTE_GUEST AS gc ON fi.id = gc.id
WHERE gc.guest_count > 78
GROUP BY fi.food_item_id
ORDER BY frequency DESC
LIMIT 1;