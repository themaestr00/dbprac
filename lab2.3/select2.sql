--- 2. Средний балл студентов за текущий семестр
SELECT
	s.id AS student_id,
	CONCAT(acc_t.first_name, ' ', acc_t.last_name) AS student_name,
	sc.term AS term,
	ROUND(AVG(sc.score_value), 2) AS avg_score
FROM student s
JOIN account acc_t ON acc_t.id = s.account_id
JOIN educational_status es ON es.id = s.status_id
JOIN score sc ON sc.student_id = s.id AND sc.term = es.term
GROUP BY s.id, student_name, sc.term
ORDER BY s.id
