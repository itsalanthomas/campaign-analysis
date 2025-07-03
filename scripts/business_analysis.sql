-- ensure python script loaded data in
SELECT*
FROM marketing;

-- 1. What is the total revenue generated across all campaigns?
SELECT SUM(revenue) AS total_revenue
FROM marketing;
-- Expected: $42,889,366


-- 2. How many unique campaigns had more than 100,000 impressions?
SELECT COUNT(DISTINCT campaign_name) AS high_impression_campaigns
FROM marketing
WHERE impressions > 100000;
-- Expected: 11 campaigns


-- 3. How many campaigns were profitable?
SELECT COUNT(*) AS profitable_campaigns
FROM marketing
WHERE (revenue - campaign_cost) > 0;
-- Expected: 168 campaigns


-- 4. What is the average conversion rate per category (orders / clicks) as a percentage?
SELECT 
  category, 
  ROUND(AVG(orders * 100.0 / NULLIF(clicks, 0)), 2) AS conversion_rate_percent
FROM marketing
GROUP BY category;


-- 5. What is the 7-day rolling average of revenue per campaign?
SELECT 
  campaign_name, 
  c_date, 
  revenue,
  AVG(revenue) OVER (
    PARTITION BY campaign_name 
    ORDER BY c_date 
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS rolling_7_day_avg_revenue
FROM marketing;


-- 6. Which campaigns are over/underperforming compared to category average revenue?
WITH category_avg AS (
  SELECT category, AVG(revenue) AS avg_revenue
  FROM marketing
  GROUP BY category
)
SELECT 
  m.*,
  c.avg_revenue,
  ROUND(m.revenue - c.avg_revenue, 2) AS revenue_diff
FROM marketing m
JOIN category_avg c ON m.category = c.category;


-- 7. What were the top 3 revenue-generating campaigns per day?
SELECT *
FROM (
  SELECT *,
         RANK() OVER (PARTITION BY c_date ORDER BY revenue DESC) AS rank
  FROM marketing
) ranked
WHERE rank <= 3;


-- 8. What is the average cost-per-click (CPC) by campaign category?
SELECT 
  category, 
  ROUND(AVG(campaign_cost * 1.0 / NULLIF(clicks, 0)), 2) AS avg_cpc
FROM marketing
GROUP BY category
ORDER BY avg_cpc DESC;
