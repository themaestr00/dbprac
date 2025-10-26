-- Средняя успеваемость студентов Faculty 1
SELECT f.name, AVG(fs.avg_score_value)
FROM analytics.fact_score fs
JOIN analytics.dim_faculty f ON f.id = fs.faculty_id
WHERE f.name = 'Faculty 1'
GROUP BY f.name
