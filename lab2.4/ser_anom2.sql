BEGIN ISOLATION LEVEL REPEATABLE READ;
WITH results AS (
	SELECT
		s.id AS student_id,
		e.basis AS basis,
		COUNT(*) AS marks_count,
		ROUND(COALESCE(AVG(sc.score_value), 0), 2) * (COALESCE(MIN(sc.score_value), 0) >= 4)::int AS avg_score
	FROM student s
	JOIN educational_status es ON es.id = s.status_id
	JOIN education e ON e.id = s.education_id
	LEFT JOIN score sc ON sc.student_id = s.id AND sc.term = es.term
	WHERE es.status = 'active'
	GROUP BY s.id, e.basis
)
UPDATE student AS s
SET stipend_type = CASE
	WHEN r.basis = 'contract' THEN 1
	WHEN r.avg_score = 5 THEN 4
	WHEN r.avg_score > 4 THEN 3
	WHEN r.avg_score = 4 THEN 2
	ELSE 1
END
FROM results AS r
WHERE s.id = r.student_id AND marks_count > 0
COMMIT;