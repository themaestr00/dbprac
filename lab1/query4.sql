-- 4. Свободные места на рейс с flight_id = 2
SELECT DISTINCT
	aircraft_code,
	seat_no
FROM
	bookings.aircrafts
	JOIN bookings.seats USING (aircraft_code)
	JOIN bookings.flights USING (aircraft_code)
WHERE
	flight_id = 2
EXCEPT
SELECT DISTINCT
	aircraft_code,
	seat_no
FROM
	bookings.tickets
	JOIN bookings.boarding_passes USING (ticket_no)
	JOIN bookings.ticket_flights tf USING (ticket_no)
	JOIN bookings.flights fl ON fl.flight_id = tf.flight_id
WHERE
	fl.flight_id = 2;