--- 1. Полное расписание группы 101 с ВМК

SELECT
	l.day AS day,
	l.parity AS parity,
	l.scheduled_start AS start,
	l.scheduled_end AS end,
	d.name AS discipline_name,
	CONCAT(acc_t.first_name, ' ', acc_t.last_name) AS educator_name,
	r.name AS room_name,
	b.name AS building_name,
	b.address AS building_address
FROM student s
JOIN academic_group ag ON ag.id = s.group_id
NATURAL JOIN speciality spec
JOIN faculty f ON f.id = spec.faculty_id
JOIN lesson_group lg ON lg.group_id = ag.id
JOIN lesson l ON l.id = lg.lesson_id
JOIN educator e ON e.id = l.educator_id
JOIN account acc_t ON acc_t.id = e.account_id
JOIN discipline d ON d.id = l.discipline_id
JOIN room r ON r.id = l.room_id
JOIN building b ON b.id = r.building_id
WHERE group_number = 101 AND f.name = 'Факультет ВМК'
ORDER BY day, start
