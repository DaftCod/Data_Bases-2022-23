use subd;

--select users who placed ticket with price > avg
SELECT price,roles.name AS role FROM tickets
LEFT JOIN users on tickets.id_passenger = users.id
LEFT JOIN user_roles on users.role_id=user_roles.id
WHERE price > (SELECT AVG(price) FROM tickets)

--select crew who placed >5 personell
SELECT personell_name,COUNT(*) AS PersonellsCount FROM personells
LEFT JOIN crews on personells.crew_id=crews.id
GROUP BY personell_name
HAVING COUNT(*)>5

--just cross join
SELECT personells.name_of_personell AS Personell,personells.crew_id
FROM personells
CROSS JOIN crews

--Union select
SELECT users.name_of_user, users.fullname_of_user FROM users
UNION SELECT personells.name_of_personell, personells.fullname_of_personell FROM personells

--select orders and show book names from the orders
SELECT airport_id_arrive, airport_id_departure, airplane_id
FROM flights
JOIN airplanes ON airplanes.id=flights.airplane_id
JOIN airports ON airports.id=flights.airport_id_arrive AND airports.id=flights.airport_id_departure

--select every ticket which has been ordered
SELECT tickets.ticket_status
FROM tickets
JOIN users ON users.Id = tickets.id_passenger


--select users and show count of tickets of every user,who placed ticket
SELECT users.name_of_user, COUNT(tickets.Id) as TicketsCount
FROM users
JOIN tickets
ON tickets.id_passenger = users.id
GROUP BY users.Id, users.name_of_user;


--select users and show count of tickets of every user
SELECT users.name_of_user, COUNT(tickets.Id) as TicketsCount
FROM users
LEFT JOIN tickets
ON tickets.id_passenger = users.id
GROUP BY users.Id, users.name_of_user;


--select every ticket and show who placed ticket
SELECT tickets.id,tickets.price, users.name_of_user
FROM tickets
INNER JOIN users ON tickets.id_passenger = users.id


--select airport_id_arrive which have > 1 flight
SELECT COUNT(id) as AirportCount, airport_id_arrive FROM flights
GROUP BY airport_id_arrive
HAVING COUNT(id)>1


--range tickets depending on price
SELECT id,"Price range"=
CASE
WHEN price = 0 THEN 'not for sale'
WHEN price < 250 THEN 'Under 500'
WHEN price >= 250 and price < 1000 THEN 'Under 1000'
ELSE 'Over 1000'
END
FROM tickets


--range tickets depending on price
SELECT price,name,
IIF(Price>250,'Expensive','Cheap')
FROM tickets
