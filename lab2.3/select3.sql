--- 3. Публикационная активность преподавателей

SELECT
	e.id AS educator_id,
	CONCAT(acc_t.first_name, ' ', acc_t.last_name) AS educator_name,
	COUNT(art.id) AS articles_count,
	MAX(art.publish_date) AS last_publish_date
FROM educator e
JOIN account acc_t ON acc_t.id = e.account_id
JOIN author a ON a.educator_id = e.id
JOIN article art ON art.id = a.article_id
GROUP BY e.id, educator_name
ORDER BY articles_count DESC, last_publish_date DESC
