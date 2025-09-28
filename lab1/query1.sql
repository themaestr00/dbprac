-- 1. Маршруты с наибольшей выручкой
WITH
	routes AS (
		SELECT
			flight_id,
			dep.airport_name AS departure_name,
			arr.airport_name AS arrival_name
		FROM
			bookings.flights fl
			JOIN bookings.airports dep ON fl.departure_airport = dep.airport_code
			JOIN bookings.airports arr ON fl.arrival_airport = arr.airport_code
	)
SELECT
	departure_name,
	arrival_name,
	TO_CHAR(SUM(amount), 'FM999G999G999G990') AS total_revenue
FROM
	bookings.ticket_flights
	JOIN routes USING (flight_id)
GROUP BY
	departure_name,
	arrival_name
ORDER BY
	SUM(amount) DESC
LIMIT
	10;