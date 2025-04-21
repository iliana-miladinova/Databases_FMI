--CREATE DATABASE Facebook;
--USE Facebook;

CREATE TABLE Users
(
	id INT IDENTITY,
	email VARCHAR(30),
	password VARCHAR(10),
	registration_date DATE
)

CREATE TABLE Friends
(
	user_id INT,
	friend_id INT
)

CREATE TABLE Walls
(
	user_id INT,
	sender_id INT,
	message VARCHAR(100),
	message_date DATE
)

CREATE TABLE Groups
(
	id INT IDENTITY,
	name VARCHAR(10),
	description VARCHAR(50) DEFAULT ''
)

CREATE TABLE GroupMembers
(
	group_id INT,
	user_id INT
)

