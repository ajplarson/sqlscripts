use hotel;

insert into roomtype(roomtypename, roomtypeprice)
	VALUES ('Single', 149.99), 
    ('Double', 174.99),
    ('Suite', 399.99);
insert into amenities(amenityname, amenityprice)
	VALUES ('Jacuzzi', 25); -- 1
insert into amenities(amenityname) -- all default to zero price
	VALUES ('Kitchen'), -- 2
    ('Microwave'), -- 3
    ('Refrigerator'), -- 4
    ('Oven'); -- 5
insert into room(roomnumber, isADA, roomtypeid) 
	VALUES (201, false, (select roomtypeid from roomtype where roomtypename = 'Double')),
    (202, true, (select roomtypeid from roomtype where roomtypename = 'Double')),
    (203, false, (select roomtypeid from roomtype where roomtypename = 'Double')),
    (204, true, (select roomtypeid from roomtype where roomtypename = 'Double')),
    (205, false, (select roomtypeid from roomtype where roomtypename = 'Single')),
    (206, true,  (select roomtypeid from roomtype where roomtypename = 'Single')),
    (207, false, (select roomtypeid from roomtype where roomtypename = 'Single')),
    (208, true, (select roomtypeid from roomtype where roomtypename = 'Single')),
	(301, false, (select roomtypeid from roomtype where roomtypename = 'Double')),
    (302, true, (select roomtypeid from roomtype where roomtypename = 'Double')),
    (303, false, (select roomtypeid from roomtype where roomtypename = 'Double')),
    (304, true, (select roomtypeid from roomtype where roomtypename = 'Double')),
    (305, false, (select roomtypeid from roomtype where roomtypename = 'Single')),
    (306, true,  (select roomtypeid from roomtype where roomtypename = 'Single')),
    (307, false, (select roomtypeid from roomtype where roomtypename = 'Single')),
    (308, true, (select roomtypeid from roomtype where roomtypename = 'Single')),
	(401, true, (select roomtypeid from roomtype where roomtypename = 'Suite')),
    (402, true, (select roomtypeid from roomtype where roomtypename = 'Suite'));
 
 
--  ('Jacuzzi', 25); -- 1
-- 	('Kitchen'), -- 2
--  ('Microwave'), -- 3
--  ('Refrigerator'), -- 4
--  ('Oven'); -- 5 
insert into roomamenities(roomnumber, amenityid)
	VALUES (201, 1), (201, 3),
    (202, 4),
    (203, 1), (203, 3),
    (204, 4),
    (205, 1), (205, 3), (205, 4),
    (206, 3), (206, 4),
    (207, 1), (207, 3), (207, 4),
    (208, 3), (208, 4),
    (301, 1), (301, 3),
    (302, 4),
    (303, 1), (303, 3),
    (304, 4),
    (305, 1), (305, 3), (305, 4),
    (306, 3), (306, 4),
    (307, 1), (307, 3), (307, 4),
    (308, 3), (308, 4),
    (401, 3), (401, 4), (401, 5),
    (402, 3), (402, 4), (402, 5);
    
   
insert into location(address, city, state, zipcode) 
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
    ('87 Queen St.', 'Drexel Hill',	'PA', '19026'),
    ('123 Main St.', 'Edina', 'MN', '55436');

insert into guest(guestname, locationid, phonenumber)
	VALUES ('Mack Simmer', (SELECT locationid from location where address = '379 Old Shore Street'), '(291) 553-0508'), -- 1
    ('Bettyann Seery', (SELECT locationid from location where address = '750 Wintergreen Dr.'), '(478) 277-9632'), -- 2 
    ('Duane Cullison', (SELECT locationid from location where address = '9662 Foxrun Lane'), '(308) 494-0198'), -- 3 
    ('Karie Yang', (SELECT locationid from location where address = '9378 W. Augusta Ave.'), '(214) 730-0298'), -- 4 
    ('Aurore Lipton', (SELECT locationid from location where address = '762 Wild Rose Street'), '(377) 507-0974'), -- 5
    ('Zachery Luechtefeld', (SELECT locationid from location where address = '7 Poplar Dr.'), '(814) 485-2615'), -- 6 
    ('Jeremiah Pendergrass', (SELECT locationid from location where address = '70 Oakwood St.'), '(279) 491-0960'), -- 7 
    ('Walter Holaway', (SELECT locationid from location where address = '7556 Arrowhead St.'), '(446) 396-6785'), -- 8 
    ('Wilfred Vise', (SELECT locationid from location where address = '77 West Surrey Street'), '(834) 727-1001'), -- 9 
    ('Maritza Tilton', (SELECT locationid from location where address = '939 Linda Rd.'), '(446) 351-6860'), -- 10
    ('Andrew Larson', (SELECT locationid from location where address = '123 Main St.'), '(952) 351-6860'), -- 11 
	('Joleen Tison', (SELECT locationid from location where address = '87 Queen St.'), '(231) 893-2755'); -- 12

insert into reservation (guestid, startdate, enddate)
	values (1, '2023-02-02', '2023-02-04'), -- 1
    (2, '2023-02-05', '2023-02-10'), -- 2
    (3, '2023-02-22', '2023-02-24'), -- 3
    (4, '2023-03-06', '2023-03-07'), -- 4
    (11, '2023-03-17', '2023-03-20'), -- 5
    (5, '2023-03-18', '2023-03-23'), -- 6
    (6, '2023-03-29', '2023-03-31'), -- 7
    (7, '2023-03-31', '2023-04-05'), -- 8
    (8, '2023-04-09', '2023-04-13'), -- 9
    (9, '2023-04-23', '2023-04-24'), -- 10
    (10, '2023-05-30', '2023-06-02'), -- 11
    (12, '2023-06-10', '2023-06-14'), -- 12
    (12, '2023-06-10', '2023-06-14'), -- 13
    (5, '2023-06-17', '2023-06-18'), -- 14
    (11, '2023-06-28', '2023-07-02'), -- 15
    (8, '2023-07-13', '2023-07-14'), -- 16
    (9, '2023-07-18', '2023-07-21'), -- 17 
    (2, '2023-07-28', '2023-07-29'), -- 18
    (2, '2023-08-30', '2023-09-01'), -- 19
    (1, '2023-09-16', '2023-09-17'), -- 20
    (4, '2023-09-13', '2023-09-15'), -- 21
    (3, '2023-11-22', '2023-11-25'), -- 22
    (1, '2023-11-22', '2023-11-25'), -- 23
    (1, '2023-11-22', '2023-11-25'), -- 24
	(10, '2023-12-24', '2023-12-28'); -- 25
    
insert into roomreservation (reservationid, roomnumber, numberofadults, 
			numberofchildren, startdate, enddate, baseroomprice, baseroomaddition, extrapeople)
    values (1, 308, 1, 0, '2023-02-02', '2023-02-04', 149.99, 0, 0), -- 1
    (2, 203, 2, 1, '2023-02-05', '2023-02-10', 174.99, 10, 0), -- 2
    (3, 305, 2, 0, '2023-02-22', '2023-02-24', 149.99, 0, 0), -- 3
    (4, 201, 2, 2, '2023-03-06', '2023-03-07', 174.99, 10, 0), -- 4
    (5, 307, 1, 1, '2023-03-17', '2023-03-20', 149.99, 0, 0), -- 5
    (6, 302, 3, 0, '2023-03-18', '2023-03-23', 174.99, 10, 1), -- 6
    (7, 202, 2, 2, '2023-03-29', '2023-03-31', 174.99, 10, 0), -- 7
    (8, 304, 2, 0, '2023-03-31', '2023-04-05', 174.99, 10, 0), -- 8
    (9, 301, 1, 0, '2023-04-09', '2023-04-13', 174.99, 10, 0), -- 9
    (10, 207, 1, 1, '2023-04-23', '2023-04-24', 149.99, 0, 0), -- 10
    (11, 401, 2, 4, '2023-05-30', '2023-06-02', 399.99, 20, 0), -- 11
    (12, 206, 2, 0, '2023-06-10', '2023-06-14', 149.99, 0, 0), -- 12
    (13, 208, 1, 0, '2023-06-10', '2023-06-14', 149.99, 0, 0), -- 13
    (14, 304, 3, 0, '2023-06-17', '2023-06-18', 174.99, 10, 1), -- 14
    (15, 205, 2, 0, '2023-06-28', '2023-07-02', 149.99, 0, 0), -- 15
    (16, 204, 3, 1, '2023-07-13', '2023-07-14', 174.99, 10, 1), -- 16
    (17, 401, 4, 2, '2023-07-18', '2023-07-21', 399.99, 20, 1), -- 17 
    (18, 303, 2, 1, '2023-07-28', '2023-07-29', 174.99, 10, 0), -- 18
    (19, 305, 1, 0, '2023-08-30', '2023-09-01', 149.99, 0, 0), -- 19
    (20, 208, 2, 0, '2023-09-16', '2023-09-17', 149.99, 0, 0), -- 20
    (21, 203, 2, 2, '2023-09-13', '2023-09-15', 174.99, 10, 0), -- 21
    (22, 401, 2, 2, '2023-11-22', '2023-11-25', 399.99, 20, 0), -- 22
    (23, 206, 2, 0, '2023-11-22', '2023-11-25', 149.99, 0, 0), -- 23
    (24, 301, 2, 2, '2023-11-22', '2023-11-25', 174.99, 10, 0), -- 24
	(25, 302, 2, 0, '2023-12-24', '2023-12-28', 174.99, 10, 0); -- 25
    

    select * from guest;
    select * from reservation;
    select * from location;
    select * from room;
    select * from roomreservation;
    
    SET SQL_SAFE_UPDATES = 0;
    
	DELETE FROM roomreservation
    WHERE 
    reservationid = 8;
    
    DELETE FROM reservation
    WHERE
    guestid = (SELECT guestid FROM guest where guestname = 'Jeremiah Pendergrass');
    
    DELETE FROM guest
	WHERE
    guestname = 'Jeremiah Pendergrass';
    
    DELETE FROM Location
    WHERE
    address = '70 Oakwood St.';
	SET SQL_SAFE_UPDATES = 1;
    
	select * from guest;
    select * from reservation;
    select * from location;
    select * from room;
    select * from roomreservation;

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



    