--- 4. Пары, к которым прикреплены преподаватели
SELECT
	e.id AS educator_id,
	CONCAT(acc_t.first_name, ' ', acc_t.last_name) AS educator_name,
	l.day AS day,
	l.parity AS parity,
	l.scheduled_start AS start,
	l.scheduled_end AS end,
	d.name AS lesson_name,
	r.name AS room_name,
	b.name AS building_name,
	b.address AS building_address
FROM educator e
JOIN account acc_t ON acc_t.id = e.account_id
JOIN lesson l ON l.educator_id = e.id
JOIN discipline d ON d.id = l.discipline_id
JOIN speciality s ON s.speciality_code = d.speciality_code
JOIN faculty f ON f.id = s.faculty_id
JOIN room r ON r.id = l.room_id
JOIN building b ON b.id = r.building_id
UNION
SELECT
	e.id AS educator_id,
	CONCAT(acc_t.first_name, ' ', acc_t.last_name) AS educator_name,
	ic.day AS day,
	'all'::week_parity AS parity,
	ic.scheduled_start AS start,
	ic.scheduled_end AS end,
	ic.name AS lesson_name,
	r.name AS room_name,
	b.name AS building_name,
	b.address AS building_address
FROM educator e
JOIN account acc_t ON acc_t.id = e.account_id
JOIN individual_course ic ON ic.educator_id = e.id
JOIN room r ON r.id = ic.room_id
JOIN building b ON b.id = r.building_id
ORDER BY day, start

