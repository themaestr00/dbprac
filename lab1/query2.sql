-- 2. Список пассажиров, летящих в Домодедово 11 октября 2016
WITH
	arrival_flights AS (
		SELECT
			flight_id
		FROM
			bookings.flights
		WHERE
			arrival_airport = 'DME'
			AND actual_arrival::date = '2016-10-11'
	)
SELECT
	passenger_id,
	passenger_name,
	contact_data
FROM
	bookings.tickets
	JOIN bookings.ticket_flights USING (ticket_no)
	JOIN arrival_flights USING (flight_id)