-- 3. Доля занятых мест по месяцам
WITH
	occupied_seats AS (
		SELECT
			flight_id,
			COUNT(*) AS occupied
		FROM
			bookings.boarding_passes bp
		GROUP BY
			flight_id
	),
	all_seats AS (
		SELECT
			flight_id,
			COUNT(*) AS seats_count
		FROM
			bookings.seats
			JOIN bookings.flights USING (aircraft_code)
		GROUP BY
			flight_id
	),
	flight_months AS (
		SELECT
			flight_id,
			TRIM(TO_CHAR (scheduled_departure, 'Month')) AS mnth
		FROM
			bookings.flights
	)
SELECT
	mnth,
	ROUND(SUM(occupied) / SUM(seats_count), 3) AS filling
FROM
	flight_months fm
	JOIN all_seats USING (flight_id)
	JOIN occupied_seats os ON os.flight_id = fm.flight_id
GROUP BY
	mnth
ORDER BY
	filling DESC