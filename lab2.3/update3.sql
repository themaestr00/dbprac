-- 3. Перенос пар из аудитории

UPDATE lesson l
SET room_id = r_new.id
FROM room r_old
JOIN room r_new ON r_new.name = 'П-6'
JOIN building b ON b.id = r_old.building_id
WHERE l.room_id = r_old.id
AND r_old.name = 'СФА'
AND b.name = 'Корпус физического факультета'
AND timerange(l.scheduled_start, l.scheduled_end)
	&& timerange('8:45', '12:00')
