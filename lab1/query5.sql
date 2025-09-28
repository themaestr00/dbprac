
-- 5. Самолеты не совершавшие перелетов за рассматриваемый период времени
SELECT
    aircraft_code,
    model
FROM
    bookings.aircrafts
    LEFT JOIN bookings.flights USING (aircraft_code)
WHERE
    flight_id IS NULL
