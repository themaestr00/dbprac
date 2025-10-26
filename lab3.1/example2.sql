-- Публикационная активность Cathedra 1 за последний год
SELECT c.name, COUNT (DISTINCT fde.article_id)
FROM analytics.fact_daily_educator_activity fde
JOIN analytics.dim_cathedra c ON c.id = fde.cathedra_id
JOIN analytics.dim_date d ON d.id = fde.date_id
WHERE c.name = 'Cathedra 1'
AND EXTRACT(YEAR FROM d.date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY c.name
