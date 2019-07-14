use hotel;

-- 1. query that returns a list of reservations that end in July 2023,
-- including the name of the guest, the room number(s), and the reservation dates
-- SELECT -- BEGIN UNCOMMENT HERE
-- 	(select guestname from guest where guestid = r.guestid) GuestName,
--     rr.roomnumber RoomNumber,
--     rr.startdate StartDate,
--     rr.enddate EndDate
-- from roomreservation rr
-- inner join reservation r on rr.reservationid = r.reservationid
-- group by r.startdate 
-- having r.startdate between '2023-07-01' and '2023-07-31'; -- END UNCOMMENT HERE
-- guestname       room  start      end
-- Walter Holaway	204	2023-07-13	2023-07-14
-- Wilfred Vise	401	2023-07-18	2023-07-21
-- Bettyann Seery	303	2023-07-28	2023-07-29


-- 2. query that returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.
-- SELECT --BEGIN UNCOMMENT HERE
-- 	(select guestname from guest where guestid = res.guestid) GuestName,
--     rr.roomnumber RoomNumber,
--     rr.startdate StartDate,
--     rr.enddate EndDate,
--     ra.amenityid Jacuzzi
-- from roomreservation rr
-- inner join roomamenities ra on rr.roomnumber = ra.roomnumber
-- inner join room r on ra.roomnumber = r.roomnumber
-- inner join reservation res on res.reservationid = rr.reservationid
-- GROUP BY GuestName, RoomNumber, StartDate, EndDate, Jacuzzi
-- HAVING(amenityid = 1); -- 1 is the id for jacuzzi END UNCOMMENT HERE
-- Andrew Larson	205	2023-06-28	2023-07-02	1
-- Wilfred Vise	207	2023-04-23	2023-04-24	1
-- Duane Cullison	305	2023-02-22	2023-02-24	1
-- Bettyann Seery	305	2023-08-30	2023-09-01	1
-- Andrew Larson	307	2023-03-17	2023-03-20	1
-- Karie Yang	201	2023-03-06	2023-03-07	1
-- Bettyann Seery	203	2023-02-05	2023-02-10	1
-- Karie Yang	203	2023-09-13	2023-09-15	1
-- Walter Holaway	301	2023-04-09	2023-04-13	1
-- Mack Simmer	301	2023-11-22	2023-11-25	1
-- Bettyann Seery	303	2023-07-28	2023-07-29	1

-- 3. query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, 
-- the starting date of the reservation, and how many people were included in the reservation
-- select -- BEGIN UNCOMMENT HERE
-- 	(select guestname from guest where guestid = res.guestid) GuestName,
--     rr.roomnumber Room,
--     rr.startdate StartDate,
--     SUM(rr.numberofadults + rr.numberofchildren) NumberOfPeople
-- from reservation res
-- 	inner join roomreservation rr on res.reservationid = rr.reservationid
-- group by GuestName, Room, StartDate; -- END UNCOMMENT HERE
-- Mack Simmer	308	2023-02-02	1
-- Bettyann Seery	203	2023-02-05	3
-- Duane Cullison	305	2023-02-22	2
-- Karie Yang	201	2023-03-06	4
-- Andrew Larson	307	2023-03-17	2
-- Aurore Lipton	302	2023-03-18	3
-- Zachery Luechtefeld	202	2023-03-29	4
-- Walter Holaway	301	2023-04-09	1
-- Wilfred Vise	207	2023-04-23	2
-- Maritza Tilton	401	2023-05-30	6
-- Joleen Tison	206	2023-06-10	2
-- Joleen Tison	208	2023-06-10	1
-- Aurore Lipton	304	2023-06-17	3
-- Andrew Larson	205	2023-06-28	2
-- Walter Holaway	204	2023-07-13	4
-- Wilfred Vise	401	2023-07-18	6
-- Bettyann Seery	303	2023-07-28	3
-- Bettyann Seery	305	2023-08-30	1
-- Mack Simmer	208	2023-09-16	2
-- Karie Yang	203	2023-09-13	4
-- Duane Cullison	401	2023-11-22	4
-- Mack Simmer	206	2023-11-22	2
-- Mack Simmer	301	2023-11-22	4
-- Maritza Tilton	302	2023-12-24	2


-- 4. query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not there is a reservation associated with the room

-- 5. query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023
select -- BEGIN UNCOMMENT HERE
	(select guestname from guest where guestid = res.guestid) GuestName,
    rr.roomnumber Room,
    rr.startdate StartDate,
    rr.enddate EndDate,
    SUM(rr.numberofadults + rr.numberofchildren) NumberOfPeople
from reservation res
	inner join roomreservation rr on res.reservationid = rr.reservationid
group by GuestName, Room, StartDate
HAVING (NumberOfPeople >= 3) AND ((StartDate BETWEEN '2023-04-01' AND '2023-04-30') OR (EndDate BETWEEN '2023-04-01' AND '2023-04-30')); -- END UNCOMMENT HERE
-- 6. query that returns a list of all guest names and the number of reservations per guest, 
-- sorted starting with the guest with the most reservations and then by the guest's last name

-- 7. query that displays the name, address, and phone number of a guest based on their phone number