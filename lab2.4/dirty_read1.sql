BEGIN ISOLATION LEVEL READ UNCOMMITTED;
INSERT INTO score (discipline_id, educator_id, student_id, score_value, term)
VALUES
(2, 5, 1, 5, 1);
ROLLBACK;
