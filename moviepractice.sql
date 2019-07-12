drop database if exists movies;

create database movies;
use movies;

CREATE TABLE genre (
    genreid INT PRIMARY KEY AUTO_INCREMENT,
    genrename VARCHAR(30) NOT NULL
);

CREATE TABLE director (
    directorid INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    birthdate DATE NULL
);

CREATE TABLE rating (
    ratingid INT PRIMARY KEY AUTO_INCREMENT,
    ratingname VARCHAR(5) NOT NULL
);

CREATE TABLE actor (
    actorid INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    birthdate DATE NULL
);



CREATE TABLE movie (
    movieid INT PRIMARY KEY AUTO_INCREMENT,
    genreid INT NOT NULL,
    directorid INT NOT NULL,
    ratingid INT NOT NULL,
    title VARCHAR(128) NOT NULL,
    releasedate DATE NULL,
    FOREIGN KEY (genreid)
        REFERENCES genre (genreid),
    FOREIGN KEY (directorid)
        REFERENCES director (directorid),
    FOREIGN KEY (ratingid)
        REFERENCES rating (ratingid)
);

CREATE TABLE castmember (
    castmemberid INT PRIMARY KEY AUTO_INCREMENT,
    actorid INT NOT NULL,
    movieid INT NOT NULL,
    role VARCHAR(50) NOT NULL,
    FOREIGN KEY (actorid)
        REFERENCES actor (actorid),
    FOREIGN KEY (movieid)
        REFERENCES movie (movieid)
);


insert into genre(genrename) 
	values ('Musical'),
    ('Drama'),
    ('Horror'),
    ('Comedy'),
    ('Thriller'),
    ('Action'),
    ('Fantasy'),
    ('Sci-fi');

insert into director(firstname, lastname) 
	values ('Peter', 'Farrelly'),
    ('Guillermo', 'del Toro'),
    ('Damien', 'Chazelle'),
    ('Barry', 'Jenkins');
    
insert into actor(firstname, lastname)
	values ('Viggo', 'Mortensen'),
    ('Mahershala', 'Ali'),
    ('Linda', 'Cardellini'),
    ('Sally', 'Hawkbird'),
    ('Michael', 'Shannon'),
    ('Richard', 'Jenkins'),
    ('Octavia', 'Spencer'),
    ('Ryan', 'Gosling'),
    ('Emma', 'Stone'),
    ('Amiee', 'Conn'),
    ('Shariff', 'Earp'),
    ('Duan', 'Sanderson'),
    ('Janelle', 'Monae');
    
insert into rating(ratingname)
	values ('PG-13'),
    ('R'),
    ('PG'),
    ('NC-17'),
    ('G');
    
insert into movie (genreid, directorid, ratingid, title)
	values ((select genreid from genre where genrename = 'Drama'),
    (select directorid from director where firstname = 'Peter'),
    (select ratingid from rating where ratingname = 'PG-13'),
    'Green Book'),
    ((select genreid from genre where genrename = 'Drama'),
    (select directorid from director where firstname = 'Guillermo'),
    (select ratingid from rating where ratingname = 'NC-17'),
    'The Shape of Water'),
    ((select genreid from genre where genrename = 'Drama'),
    (select directorid from director where firstname = 'Damien'),
    (select ratingid from rating where ratingname = 'PG-13'),
    'La La Land');
    set sql_safe_updates = 0;
	UPDATE actor 
SET 
    birthdate = '1994-04-01';
    set sql_safe_updates = 1;
	
    
	set sql_safe_updates = 0;
	UPDATE movie 
SET 
    releasedate = '1011-12-25';
	set sql_safe_updates = 1;

	
    set sql_safe_updates = 0;
	UPDATE actor 
SET 
    lastname = 'Hawkins'
WHERE
    firstname = 'Sally';
	set sql_safe_updates = 1;
    
    insert into castmember (actorid, movieid, role)
		values((select actorid from actor where firstname = 'Viggo'),
        (select movieid from movie where directorid = (select directorid from director where firstname = 'Peter')),
        'Tony Lip'),
        ((select actorid from actor where firstname = 'Mahershala'),
        (select movieid from movie where directorid = (select directorid from director where firstname = 'Peter')),
        'Dr. Donald Shirley'),
        ((select actorid from actor where firstname = 'Linda'),
        (select movieid from movie where directorid = (select directorid from director where firstname = 'Peter')),
        'Dolores'),
        ((select actorid from actor where firstname = 'Sally'),
        (select movieid from movie where directorid = (select directorid from director where firstname = 'Guillermo')),
        'Elisa Esposito'),
        ((select actorid from actor where firstname = 'Michael'),
        (select movieid from movie where directorid = (select directorid from director where firstname = 'Guillermo')),
        'Richard Strickland'),
        ((select actorid from actor where firstname = 'Richard'),
        (select movieid from movie where directorid = (select directorid from director where firstname = 'Guillermo')),
        'Giles'),
        ((select actorid from actor where firstname = 'Octavia'),
        (select movieid from movie where directorid = (select directorid from director where firstname = 'Guillermo')),
        'Zelda Fuller'),
        ((select actorid from actor where firstname = 'Ryan'),
        (select movieid from movie where directorid = (select directorid from director where firstname = 'Damien')),
        'Sebastian'),
        ((select actorid from actor where firstname = 'Emma'),
        (select movieid from movie where directorid = (select directorid from director where firstname = 'Damien')),
        'Mia'),
        ((select actorid from actor where firstname = 'Amiee'),
        (select movieid from movie where directorid = (select directorid from director where firstname = 'Damien')),
        'Famous Hacktress');
        
        set sql_safe_updates = 0;
UPDATE castmember
SET 
    role = 'Famous Actress'
WHERE
    actorid = (select actorid from actor where firstname = 'Amiee');
	set sql_safe_updates = 1;  
    
    -- select * from castmember;
    
      set sql_safe_updates = 0;
	delete from castmember where movieid = (select movieid from movie where title = 'La La Land');
	delete from movie where title = 'La La Land';
	set sql_safe_updates = 1;
    
    -- select * from movie;
    
    insert into movie (genreid, directorid, ratingid, title) 
		values ((select genreid from genre where genrename = 'Drama'),
        (select directorid from director where firstname = 'Barry'),
        (select ratingid from rating where ratingname = 'R'),
        'Moonlight');
        
	insert into castmember(actorid, movieid, role)
		values ((select actorid from actor where firstname = 'Mahershala'),
        (select movieid from movie where title = 'Moonlight'),
        'Juan'),
        ((select actorid from actor where firstname = 'Shariff'),
        (select movieid from movie where title = 'Moonlight'),
        'Terrence'),
        ((select actorid from actor where firstname = 'Duan'),
        (select movieid from movie where title = 'Moonlight'),
        'Azu'),
        ((select actorid from actor where firstname = 'Janelle'),
        (select movieid from movie where title = 'Moonlight'),
        'Teresa');
        
        select * from castmember where movieid = (select mprojectworkerovieid from movie where title = 'Moonlight');
    
    
	


    
    
    

    