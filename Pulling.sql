USE subd;

SELECT * FROM users
WHERE CHARINDEX('Belarus', citizenship) > 0

SELECT CHARINDEX('Belarus', citizenship) FROM users

UPDATE tickets SET ticket_status=0
WHERE id_passenger > 0

SELECT * FROM airports
ORDER BY airport_name

SELECT * FROM tickets

SELECT SUM(price) FROM tickets WHERE price > 0

SELECT * FROM airplane_seats, tickets, flights
UPDATE tickets SET tickets.price=tickets.price*2
WHERE seat_class IN 'Bisuness'

INSERT INTO airplane_seats(email, password) VALUES
(
	5,
	'Pilot seat',
	'123'
)

DELETE FROM airplane_seats
WHERE seat_class NOT 'Bisuness' AND 'Econom' AND seat_number > 30

INSERT INTO airplanes(type_of_board) VALUES
(
	'TU-140'
)

SELECT type_of_board FROM airplanes
WHERE type_of_board NOT LIKE 'Boeing 787' AND 'Boeing 777' AND 'Airbus A300' AND 'Airbus A380' AND 'A350 XWB'

SELECT seat_class FROM airplane_seats
WHERE seat_class NOT LIKE 'Econom'

SELECT airport_name, city, country FROM airports
WHERE id < 4
ORDER BY country

SELECT airport_id_arrive, COUNT(id) count FROM flights
GROUP BY airport_id_arrive
ORDER BY count