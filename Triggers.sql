USE subd;

GO

CREATE TRIGGER tickets_INSERT
ON tickets
AFTER INSERT
AS
INSERT INTO ticket_logs(ticket_id,message)
SELECT ticket_id, 'Зарегистрирован новый билет '+(SELECT id from tickets WHERE ticket_id=tickets.id)
FROM INSERTED

GO

CREATE TRIGGER tickets_DELETE
ON tickets
AFTER DELETE
AS
INSERT INTO ticket_logs(ticket_id,message)
SELECT ticket_id, 'Билет удалён '+(SELECT id from tickets WHERE ticket_id=tickets.id)
FROM DELETED

GO

CREATE TRIGGER flight_INSERT
ON flights
AFTER INSERT
AS
INSERT INTO flight_logs(flight_id,message)
SELECT flight_id, 'Зарегистрирован новый рейс '+(SELECT id from flights WHERE flight_id=flights.id)
FROM INSERTED

GO

CREATE TRIGGER flight_DELETE
ON flights
AFTER DELETE
AS
INSERT INTO flight_logs(flight_id,message)
SELECT flight_id, 'Рейс отменён '+(SELECT id from flights WHERE flight_id=flights.id)
FROM DELETED