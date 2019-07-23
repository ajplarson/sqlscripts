DROP DATABASE IF EXISTS bullsandcows;
CREATE DATABASE bullsandcows;
USE bullsandcows;

CREATE TABLE game (
	gameid INT PRIMARY KEY AUTO_INCREMENT,
    winningnumbers varchar(30) NOT NULL
);

CREATE TABLE round (
	roundid INT PRIMARY KEY AUTO_INCREMENT,
    guess varchar(10) NOT NULL,
    exact INT NOT NULL,
    partial INT NOT NULL,
    time TIMESTAMP NOT NULL,
    gameid INT NOT NULL,
	 FOREIGN KEY fk_round_game (gameid)
        REFERENCES game(gameid)
);




