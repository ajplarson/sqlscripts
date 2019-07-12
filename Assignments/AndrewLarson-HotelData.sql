use hotel;

insert into roomtype (roomtypename, roomtypeprice)
	VALUES ('Single', 149.99);
insert into roomtype(roomtypename, roomtypeprice)
	VALUES ('Double', 174.99),
    ('Suite', 399.99);
insert into amenities(amenityname, amenityprice)
	VALUES ('Jacuzzi', 25);
insert into amenities(amenityname)
	VALUES ('Kitchen'),
    ('Microwave'),
    ('Refrigerator'),
    ('Stove');
    
insert into room(roomnumber, isADA, roomtypeid) 
	VALUES ('201', false, (select roomtypeid from roomtype where roomtypename = 'Double')),
    ('202', true, (select roomtypeid from roomtype where roomtypename = 'Double')),
    ('203', false, (select roomtypeid from roomtype where roomtypename = 'Double')),
    ('204', true, (select roomtypeid from roomtype where roomtypename = 'Double')),
    ('205', false, (select roomtypeid from roomtype where roomtypename = 'Single')),
    ('206', true,  (select roomtypeid from roomtype where roomtypename = 'Single')),
    ('207', false, (select roomtypeid from roomtype where roomtypename = 'Single')),
    ('208', true, (select roomtypeid from roomtype where roomtypename = 'Single')),
	('301', false, (select roomtypeid from roomtype where roomtypename = 'Double')),
    ('302', true, (select roomtypeid from roomtype where roomtypename = 'Double')),
    ('303', false, (select roomtypeid from roomtype where roomtypename = 'Double')),
    ('304', true, (select roomtypeid from roomtype where roomtypename = 'Double')),
    ('305', false, (select roomtypeid from roomtype where roomtypename = 'Single')),
    ('306', true,  (select roomtypeid from roomtype where roomtypename = 'Single')),
    ('307', false, (select roomtypeid from roomtype where roomtypename = 'Single')),
    ('308', true, (select roomtypeid from roomtype where roomtypename = 'Single')),
	('401', true, (select roomtypeid from roomtype where roomtypename = 'Suite')),
    ('402', true, (select roomtypeid from roomtype where roomtypename = 'Suite'));
   
   
INSERT into location(address, city, state, zipcode) 
	VALUES ('379 Old Shore Street', 'Council Bluffs', 'IA', '51501'),
    ('750 Wintergreen Dr.',	'Wasilla',	'AK',	'99654'),
    ('9662 Foxrun Lane',	'Harlingen', 'TX', '78552'),
    ('9378 W. Augusta Ave.', 'West Deptford', 'NJ',	'08096'),
    ('762 Wild Rose Street', 'Saginaw',	'MI', '48601'),
	('7 Poplar Dr.', 'Arvada', 'CO', '80003'),
	('70 Oakwood St.', 'Zion','IL',	'60099'),
    ('7556 Arrowhead St.', 'Cumberland', 'RI', '02864'),
    ('77 West Surrey Street', 'Oswego', 'NY', '13126'),
    ('939 Linda Rd.', 'Burke', 'VA', '22015'),
    ('87 Queen St.', 'Drexel Hill',	'PA', '19026');

insert into guest(guestname, locationid, phonenumber)
	VALUES ('Mack Simmer', (SELECT locationid from location where address = '379 Old Shore Street'), '(291) 553-0508'),
    ('Bettyann Seery', (SELECT locationid from location where address = '750 Wintergreen Dr.'), '(478) 277-9632'),
    ('Duane Cullison', (SELECT locationid from location where address = '9662 Foxrun Lane'), '(308) 494-0198'),
    ('Karie Yang', (SELECT locationid from location where address = '9378 W. Augusta Ave.'), '(214) 730-0298'),
    ('Aurore Lipton', (SELECT locationid from location where address = '762 Wild Rose Street'), '(377) 507-0974'),
    ('Zachery Luechtefeld', (SELECT locationid from location where address = '7 Poplar Dr.'), '(814) 485-2615'),
    ('Jeremiah Pendergrass', (SELECT locationid from location where address = '70 Oakwood St.'), '(279) 491-0960'),
    ('Walter Holaway', (SELECT locationid from location where address = '7556 Arrowhead St.'), '(446) 396-6785'),
    ('Wilfred Vise', (SELECT locationid from location where address = '77 West Surrey Street'), '(834) 727-1001'),
    ('Maritza Tilton', (SELECT locationid from location where address = '939 Linda Rd.'), '(446) 351-6860'),
	('Joleen Tison', (SELECT locationid from location where address = '87 Queen St.'), '(231) 893-2755');

insert into reservation (guestid, startdate, enddate)
	values ((select guestid from guest where guestname = 'Mack Simmer'), '2023-02-02', '2023-02-04'),
    ((select guestid from guest where guestname = 'Bettyann Seery'), '2023-02-05', '2023-02-10'),
    ((select guestid from guest where guestname = 'Duane Collison'), '2023-02-22', '2023-02-24'),
    ((select guestid from guest where guestname = 'Karie Yang'), '2023-03-06', '2023-03-07'),
    ((select guestid from guest where guestname = 'Andrew Larson'), '2023-03-17', '2023-03-20'),
    ((select guestid from guest where guestname = 'Aurore Lipton'), '2023-03-18', '2023-03-23'),
    ((select guestid from guest where guestname = 'Zachery Luechtefeld'), '2023-03-29', '2023-03-31'),
    ((select guestid from guest where guestname = '	Jeremiah Pendergrass'), '2023-03-31', '2023-04-05'),
    ((select guestid from guest where guestname = '	Walter Holaway'), '2023-04-09', '2023-04-13'),
    ((select guestid from guest where guestname = 'Wilfred Vise'), '2023-04-23', '2023-04-24'),
    ((select guestid from guest where guestname = 'Maritza Tilton'), '2023-05-30', '2023-06-02'),
    ((select guestid from guest where guestname = 'Joleen Tison'), '2023-06-10', '2023-06-14'),
    ((select guestid from guest where guestname = 'Joleen Tison'), '2023-06-10', '2023-06-14'),
    ((select guestid from guest where guestname = 'Aurore Lipton'), '2023-06-17', '2023-06-18'),
    ((select guestid from guest where guestname = 'Andrew Larson'), '2023-06-28', '2023-07-02'),
    ((select guestid from guest where guestname = 'Walter Holaway'), '2023-07-13', '2023-07-14'),
    ((select guestid from guest where guestname = 'Wilfred Vise'), '2023-07-18', '2023-07-21'),
    ((select guestid from guest where guestname = 'Bettyann Seery'), '2023-07-28', '2023-07-29'),
    ((select guestid from guest where guestname = 'Bettyann Seery'), '2023-08-30', '2023-09-01'),
    ((select guestid from guest where guestname = 'Mack Simmer'), '2023-09-16', '2023-09-17'),
    ((select guestid from guest where guestname = 'Karie Yang'), '2023-09-13', '2023-09-15'),
    ((select guestid from guest where guestname = 'Duane Cullison'), '2023-11-22', '2023-11-25'),
    ((select guestid from guest where guestname = 'Mack Simmer'), '2023-11-22', '2023-11-25'),
    ((select guestid from guest where guestname = 'Mack Simmer'), '2023-11-22', '2023-11-25'),
	((select guestid from guest where guestname = 'Maritza Tilton'), '2023-12-24', '2023-12-28');


-- Mack Simmer	379 Old Shore Street	Council Bluffs	IA	51501	(291) 553-0508
-- Bettyann Seery	750 Wintergreen Dr.	Wasilla	AK	99654	(478) 277-9632
-- Duane Cullison	9662 Foxrun Lane	Harlingen	TX	78552	(308) 494-0198
-- Karie Yang	9378 W. Augusta Ave.	West Deptford	NJ	08096	(214) 730-0298
-- Aurore Lipton	762 Wild Rose Street	Saginaw	MI	48601	(377) 507-0974
-- Zachery Luechtefeld	7 Poplar Dr.	Arvada	CO	80003	(814) 485-2615
-- Jeremiah Pendergrass	70 Oakwood St.	Zion	IL	60099	(279) 491-0960
-- Walter Holaway	7556 Arrowhead St.	Cumberland	RI	02864	(446) 396-6785
-- Wilfred Vise	77 West Surrey Street	Oswego	NY	13126	(834) 727-1001
-- Maritza Tilton	939 Linda Rd.	Burke	VA	22015	(446) 351-6860
-- Joleen Tison	87 Queen St.	Drexel Hill	PA	19026	(231) 893-2755



    