BEGIN ISOLATION LEVEL REPEATABLE READ;
WITH results AS (
	SELECT
		s.id AS student_id,
		e.speciality_code AS spec_code,
		e.basis AS basis,
		e.type AS type,
		ROUND(COALESCE(AVG(sc.score_value), 0), 2) * (COALESCE(MIN(sc.score_value), 0) >= 4)::int AS avg_score
	FROM student s
	JOIN educational_status es ON es.id = s.status_id
	JOIN education e ON e.id = s.education_id
	LEFT JOIN score sc ON sc.student_id = s.id AND sc.term = es.term
	WHERE es.status = 'active'
	GROUP BY s.id, e.speciality_code, e.basis, e.type
), budget AS (
	SELECT
		s.id AS student_id,
		e2.id AS budget_id
	FROM student s
	JOIN education e1 ON e1.id = s.education_id
	JOIN education e2 ON e2.speciality_code = e1.speciality_code
	AND e2.basis = 'budget'
	AND e2.type = e1.type
)
UPDATE student s
SET education_id = b.budget_id
FROM results r
JOIN budget b ON b.student_id = r.student_id
WHERE r.student_id = s.id AND b.student_id = s.id AND r.avg_score > 4.5 AND r.basis = 'contract';
COMMIT;
