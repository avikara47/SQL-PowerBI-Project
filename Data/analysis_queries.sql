WITH cte AS (
    SELECT * 
    FROM bike_share_yr_0
    UNION
    SELECT *
    FROM bike_share_yr_1
)
SELECT 
    dtday,
    season,
    a.yr,
    weekday,
    hr,
    rider_type,
    riders,
    price,
    COGS,
    riders * price AS Revenue,
    riders * price - cogs * riders AS Profit
FROM cte a
LEFT JOIN cost_table b
ON a.yr = b.yr;