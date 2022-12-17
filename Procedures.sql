USE subd;
SELECT * FROM airplanes
GO
CREATE PROCEDURE PlaneSummary AS
BEGIN
SELECT type_of_board
FROM airplanes
END;

GO

CREATE PROCEDURE UserSummary AS
BEGIN
SELECT name_of_user,fullname_of_user,
(SELECT role_name FROM user_roles WHERE users.role_id = user_roles.id) AS Role
FROM users
END;

GO

CREATE PROCEDURE AddTicket
@ticket_status BIT,
@price INT,
@id_passenger INT,
@id_flight INT
AS
INSERT INTO tickets(ticket_status, price, id_passenger, id_flight)
VALUES(@ticket_status, @price, @id_passenger, @id_flight);

GO

CREATE PROCEDURE AddUser
@name_of_user VARCHAR(30),
@fullname_of_user VARCHAR(30),
@citizenship VARCHAR(30),
@sex VARCHAR(6),
@role_id INT,
@birthdate DATETIME,
@passport_series_and_number VARCHAR(9),
@passport_id VARCHAR(14)
AS
INSERT INTO users(name_of_user, fullname_of_user, sex, role_id, citizenship, birthdate, passport_series_and_number, passport_id)
VALUES(@name_of_user, @fullname_of_user, @sex, @role_id, @citizenship, @birthdate, @passport_series_and_number, @passport_id);

GO

CREATE PROCEDURE AddPersonell
@name_of_personell VARCHAR(30),
@fullname_of_personell VARCHAR(30),
@sex VARCHAR(6),
@role_id INT,
@crew_id INT
AS
INSERT INTO tickets(name_of_personell, fullname_of_personell, sex, role_id, crew_id)
VALUES(@name_of_personell, @fullname_of_personell, @sex, @role_id, @crew_id);

GO

CREATE PROCEDURE AddAirport
@airport_name VARCHAR(100),
@country VARCHAR(30),
@city VARCHAR(30)
AS
INSERT INTO airports(airport_name,country,city)
VALUES(@airport_name,@country,@city);	

GO

CREATE PROCEDURE DeletePlane
@type_of_board VARCHAR(150)
AS
DELETE [airplanes]
WHERE type_of_board=@type_of_board;

GO

CREATE PROCEDURE DeleteAllFlightsWithSameAirport
@airport_id_arrive INT
AS
DELETE flights
WHERE (SELECT airport_name FROM airports WHERE airport_id_arrive=airports.id) LIKE @airport_id_arrive;

GO

CREATE PROCEDURE AddFlight
@flight_number VARCHAR(10),
@airplane_id INT,
@airport_id_departure INT,
@airport_id_arrive INT,
@departure_time DATETIME,
@arival_time DATETIME,
@gate_id_departure INT,
@gate_id_arival INT
AS
INSERT INTO flights(flight_number,airplane_id,airport_id_departure,airport_id_arrive,departure_time,arival_time,gate_id_departure,gate_id_arival)
VALUES(@flight_number,@airplane_id,@airport_id_departure,@airport_id_arrive,@departure_time,@arival_time,@gate_id_departure,@gate_id_arival);

GO

CREATE PROCEDURE PersonellSummary AS
BEGIN
SELECT name_of_personell,fullname_of_personell,
(SELECT role_name FROM personell_roles WHERE personells.role_id = personell_roles.id) AS Role
FROM personells
END;