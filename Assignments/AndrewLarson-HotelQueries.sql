use hotel;

-- 1. query that returns a list of reservations that end in July 2023,
-- including the name of the guest, the room number(s), and the reservation dates
SELECT
	(select guestname from guest where guestid = r.guestid) GuestName,
    rr.roomnumber RoomNumber,
    rr.startdate StartDate,
    rr.enddate EndDate
from roomreservation rr
inner join reservation r on rr.reservationid = r.reservationid
group by r.startdate 
having r.startdate between '2023-07-01' and '2023-07-31';
-- guestname       room  start      end
-- Walter Holaway	204	2023-07-13	2023-07-14
-- Wilfred Vise	401	2023-07-18	2023-07-21
-- Bettyann Seery	303	2023-07-28	2023-07-29


-- 2. query that returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.
SELECT
	(select guestname from guest where guestid = r.guestid) GuestName,
    rr.roomnumber RoomNumber,
    rr.startdate StartDate,
    rr.enddate EndDate
from roomreservation rr
inner join roomamenities ra on rr.roomnumber = ra.roomnumber
inner join room r on ra.roomnumber = r.roomnumber
inner join reservation res on res.reservationid = rr.reservationid
GROUP BY GuestName, RoomNumber, StartDate, EndDate
HAVING(ra.roomnumber = 1); -- 1 is the id for jacuzzi

-- 3. query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, 
-- the starting date of the reservation, and how many people were included in the reservation

-- 4. query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not there is a reservation associated with the room

-- 5. query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023

-- 6. query that returns a list of all guest names and the number of reservations per guest, 
-- sorted starting with the guest with the most reservations and then by the guest's last name

-- 7. query that displays the name, address, and phone number of a guest based on their phone number