INSERT INTO lesson_group(group_id, lesson_id) VALUES
(3, 2);

INSERT INTO course_registration(course_id, student_id) VALUES
(3, 5)
RETURNING *;
