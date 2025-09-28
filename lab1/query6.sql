-- Вывести, за какую минимальную цену можно улететь из Москвы в разные аэропорты?
SELECT
	arr.city AS destination,
    MIN(amount) AS min_price
FROM
    bookings.ticket_flights
    NATURAL JOIN bookings.flights
    JOIN bookings.airports dep ON dep.airport_code = flights.departure_airport
	JOIN bookings.airports arr ON arr.airport_code = flights.arrival_airport
WHERE
    dep.city = 'Москва'
GROUP BY
	arr.city
ORDER BY
	min_price
