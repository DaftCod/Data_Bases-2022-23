DROP TABLE IF EXISTS users, user_roles, personells, personell_roles, flights, crews, tickets, airplanes, airplane_seats, gates, airports;

GO
CREATE DATABASE subd
GO
USE subd;

CREATE TABLE user_roles
(
id INT PRIMARY KEY IDENTITY,
role_name VARCHAR(100) NOT NULL
)

CREATE TABLE users
(
id INT PRIMARY KEY IDENTITY,
name_of_user VARCHAR(30) NOT NULL,
fullname_of_user VARCHAR(30) NOT NULL,
citizenship VARCHAR(30) NOT NULL,
sex VARCHAR(6) NOT NULL,
birthdate DATETIME,
passport_series_and_number VARCHAR(9) NOT NULL,
passport_id VARCHAR(14) NOT NULL,
role_id INT FOREIGN KEY REFERENCES user_roles(id) NOT NULL
)

CREATE TABLE airplanes
(
id INT PRIMARY KEY IDENTITY,
type_of_board VARCHAR(30) NOT NULL
)

CREATE TABLE airports
(
id INT PRIMARY KEY IDENTITY,
airport_name VARCHAR(100) NOT NULL,
country VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL
)

CREATE TABLE gates
(
id INT PRIMARY KEY IDENTITY,
airport_id INT FOREIGN KEY REFERENCES airports(id) NOT NULL,
number_of_gate INT NOT NULL
)

CREATE TABLE flights
(
id INT PRIMARY KEY IDENTITY,
flight_number VARCHAR(10) NOT NULL,
airplane_id INT FOREIGN KEY REFERENCES airplanes(id) NOT NULL,
airport_id_departure INT FOREIGN KEY REFERENCES airports(id) NOT NULL,
airport_id_arrive INT FOREIGN KEY REFERENCES airports(id) NOT NULL,
departure_time DATETIME,
arival_time DATETIME,
gate_id_departure INT FOREIGN KEY REFERENCES gates(id) NOT NULL,
gate_id_arival INT FOREIGN KEY REFERENCES gates(id) NOT NULL
)

CREATE TABLE crews
(
id INT PRIMARY KEY IDENTITY,
airplane_id INT FOREIGN KEY REFERENCES airplanes(id) NOT NULL
)

CREATE TABLE personell_roles
(
id INT PRIMARY KEY IDENTITY,
role_name VARCHAR(10) NOT NULL
)

CREATE TABLE personells
(
id INT PRIMARY KEY IDENTITY,
name_of_personell VARCHAR(30) NOT NULL,
fullname_of_personell VARCHAR(30) NOT NULL,
sex VARCHAR(6) NOT NULL,
role_id INT FOREIGN KEY REFERENCES personell_roles(id) NOT NULL,
crew_id INT FOREIGN KEY REFERENCES crews(id) NOT NULL
)

CREATE TABLE tickets
(
id INT PRIMARY KEY IDENTITY,
ticket_status BIT NOT NULL, 
price INT NOT NULL,
id_passenger INT FOREIGN KEY REFERENCES users(id),
id_flight INT FOREIGN KEY REFERENCES flights(id) NOT NULL
)

CREATE TABLE airplane_seats
(
id INT PRIMARY KEY IDENTITY,
airplane_id INT FOREIGN KEY REFERENCES airplanes(id) NOT NULL,
seat_number INT NOT NULL,
seat_class VARCHAR(10) NOT NULL
)
