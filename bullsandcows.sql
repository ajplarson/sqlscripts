DROP DATABASE IF EXISTS bullsandcows;
CREATE DATABASE bullsandcows;
USE bullsandcows;

CREATE TABLE guess (
    guessid INT PRIMARY KEY AUTO_INCREMENT,
    numbers varchar(30) NOT NULL
);

CREATE TABLE game (
	gameid INT PRIMARY KEY AUTO_INCREMENT,
    winningnumbers varchar(30) NOT NULL,
    numberofrounds INT NOT NULL
);

CREATE TABLE round (
	roundid INT PRIMARY KEY AUTO_INCREMENT,
    exact INT NOT NULL,
    partial INT NOT NULL,
    time DATETIME NOT NULL,
	guessid INT NOT NULL,
    gameid INT NOT NULL,
    FOREIGN KEY fk_round_guess (guessid)
        REFERENCES guess(guessid),
	 FOREIGN KEY fk_round_game (gameid)
        REFERENCES game(gameid)
);




INSERT INTO guess (numbers) VALUES
(1234),
(1325),
(7345),
(5746);

INSERT INTO game (winningnumbers, numberofrounds) VALUES
(1234, 4),
(1423, 5),
(2034, 3);
-- 	   roundid INT PRIMARY KEY,
--     exact INT NOT NULL,
--     partial INT NOT NULL,
--     guessid INT NOT NULL,
--     time TIMESTAMP NOT NULL,-- 
INSERT INTO round(exact, partial, guessid, time, gameid) VALUES
(2, 0, 1, '2000-01-24 03:04:01', 1),
(1, 0, 1, '2000-01-25 03:04:01', 1),
(3, 0, 2, '2000-01-26 03:04:01', 2),
(1, 0, 2, '2000-01-27 03:04:01', 2),
(2, 0, 1, '2000-01-28 03:04:01', 3);

select * 

from game g 
inner join round r on r.gameid = g.gameid 
inner join guess gu on r.guessid = gu.guessid
group by r.roundid
having r.gameid = 1
order by r.time;

select * 

from game g 
inner join round r on r.gameid = g.gameid 
inner join guess gu on r.guessid = gu.guessid
group by r.roundid
order by r.time;

