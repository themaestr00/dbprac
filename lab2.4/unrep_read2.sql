BEGIN ISOLATION LEVEL READ COMMITTED;
SELECT s.id, e.basis
FROM student s
JOIN education e ON e.id = s.education_id;
COMMIT;
