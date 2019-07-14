drop database if exists rpg;

create database rpg;

use rpg;

create table players (
	playerid int primary key auto_increment,
    `name` varchar(100)  not null
);

create table characters (
	characterid int primary key auto_increment,
    playerid int null,
	firstname varchar(100) not null,
    lastname varchar(100) null,
    dexterity int null,
    strength int null,
    intelligence int null,
    FOREIGN KEY fk_characters_playerid (playerid)
		references players(playerid)
);

create table classes (
	classid int primary key auto_increment,
    class varchar(100) not null
);

create table races (
	raceid int primary key auto_increment,
	race varchar(100) not null
);

create table characterraces (
	characterid int not null,
    raceid int not null,
	primary key pk_characterraces (characterid, raceid),
    foreign key fk_characterraces_charactersid (characterid)
		references characters(characterid),
	foreign key fk_characterraces_racesid (raceid)
		references races(raceid)
);

create table characterclasses (
	characterid int not null,
    classid int not null,
    isprimary bool default false,
	primary key pk_characterclasses (characterid, classid),
    foreign key fk_characterclasses_charactersid (characterid)
		references characters(characterid),
	foreign key fk_characterclasses_classesid (classid)
		references classes(classid)	
);
insert into players (playerid, `name`)
	values (1, 'Brianna');
insert into players (`name`) 
	values 
    ('Saffron'),
    ('Brand'),
    ('Jesse'),
    ('Sierra'),
    ('Imarie'),
    ('Julius'),
    ('Kuang'),
    ('Sajia'),
    ('Tamali'),
    ('Xavier');
    
insert into characters(characterid, playerid, firstname, lastname)
	values (1, 10, 'Cherry', 'Strongbow');
insert into characters(playerid, firstname, lastname) 
	values (4, 'Susan', 'Sto Helit'),
    (2, 'Sam', 'Vimes'),
    (6, 'Tiffany', 'Aching'),
    (8, 'Nobby', 'Nobbs'),
    (8, 'Rob', 'Anybody');
insert into characters(playerid, firstname)
	values (3, 'Cohen');
insert into characters(playerid, firstname, lastname)
	values (5, 'Angua', 'von Uberwald');
    
insert into characters(playerid, firstname)
	values (7, 'Carrot');
insert into characters(firstname, lastname) 
	values ('The', 'Luggage');
insert into characters(playerid, firstname)
	values (11, 'Rincewind');

insert into classes(classid, class) 
	values (1, 'Barbarian');
insert into classes(class) 
	values ('Bard'),
    ('Cleric'),
    ('Druid'),
    ('Fighter'),
    ('Monk'),
    ('Paladin'),
    ('Ranger'),
    ('Rogue'),
    ('Sorcerer'),
    ('Wizard'),
    ('Alchemist'),
    ('Cavalier'),
    ('Gunslinger'),
    ('Inquisitor'),
    ('Magus'),
    ('Oracle'),
    ('Summoner'),
    ('Witch'),
    ('Antipaladin'),
    ('Ninja'),
    ('Samurai'),
    ('CheeseMaker'),
    ('Watchman'),
    ('Ingrate'),
    ('King of Dwarves');

insert into races(raceid, race)
	values (1, 'Aasimar'),
    (3, 'Drow'),
    (4, 'Dwarf'),
    (5, 'Elf'),
    (7, 'Gnome'),
    (8, 'Goblin'),
    (9, 'Half-Elf'),
    (10, 'Half-Orc'),
    (11, 'Halfling'),
    (12, 'Hobgoblin'),
    (13, 'Human'),
    (15, 'Kobold'),
    (16, 'Orc'),
    (22, 'Werewolf'),
    (26, 'Ratfolk'),
    (27, 'Sylph'),
    (28, 'Tengu'),
    (30, 'Tiefling'),
    (31, 'Undine'),
    (32, 'Oread'),
    (36, 'Tian'),
    (39, 'Nac Mac Feegle'),
    (40, 'Nobby'),
    (42, 'Pot o Pinks'),
    (112, 'Sapient Pearwood'),
    (113, 'Robot');
    
insert into characterraces(characterid, raceid) 
	values (1, 4),
    (3, 13),
    (4, 13),
    (7, 13),
    (6, 39),
    (5, 40),
    (8, 22),
    (8, 28),
    (9, 13),
    (10, 112),
    (11, 13);

insert into characterclasses(characterid, classid, isprimary) 
	values (4, 19, true),
    (4, 23, false),
    (7, 1, true),
    (1, 24, false),
    (1, 5, true),
    (5, 24, false),
    (3, 24, true),
    (8, 24, true),
    (9, 24, true),
    (9, 26, false),
    (11, 11, false);
    
-- select * from classes;
-- select * from races;
-- select * from characterclasses;
-- select * from characterraces;
-- select * from players;
-- select * from characters;

    
    