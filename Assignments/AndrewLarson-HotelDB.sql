DROP DATABASE IF EXISTS hotel;

CREATE DATABASE hotel;

USE hotel;

CREATE TABLE LOCATION (
    locationid INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zipcode VARCHAR(15) NOT NULL
);

CREATE TABLE ROOMTYPE (
    roomtypeid INT PRIMARY KEY AUTO_INCREMENT,
    roomtypename VARCHAR(20) NOT NULL,
    roomtypeprice DECIMAL NOT NULL
);

CREATE TABLE ROOM (
    roomnumber CHAR(50) PRIMARY KEY,
    isADA BOOL NOT NULL DEFAULT 0,
    roomtypeid INT NOT NULL,
    FOREIGN KEY fk_room_roomtype (roomtypeid)
        REFERENCES roomtype(roomtypeid)
);

CREATE TABLE AMENITIES (
    amenityid INT PRIMARY KEY AUTO_INCREMENT,
    amenityname VARCHAR(50),
    amenityprice DECIMAL NOT NULL DEFAULT 0
);

CREATE TABLE ROOMAMENITIES (
    roomnumber VARCHAR(50) NOT NULL,
    amenityid INT NOT NULL,
    PRIMARY KEY pk_roomamenities (roomnumber , amenityid),
    FOREIGN KEY fk_roomamenities_room (roomnumber)
        REFERENCES room(roomnumber),
    FOREIGN KEY fk_roomamenities_amenity (amenityid)
        REFERENCES amenities(amenityid)
);

CREATE TABLE GUEST (
    guestid INT PRIMARY KEY AUTO_INCREMENT,
    guestname VARCHAR(50) NULL,
    locationid INT NOT NULL,
    phonenumber VARCHAR(20) NOT NULL,
    FOREIGN KEY fk_guest_location (locationid)
        REFERENCES location (locationid)
);

CREATE TABLE RESERVATION (
    reservationid INT PRIMARY KEY AUTO_INCREMENT,
    guestid INT NOT NULL,
    FOREIGN KEY fk_reservation_guest (guestid)
        REFERENCES guest (guestid)
);

CREATE TABLE RESERVATIONROOM (
    reservationid INT NOT NULL,
    roomnumber VARCHAR(50) NOT NULL,
    numberofadults INT NOT NULL,
    numberofchildren INT NOT NULL,
    startdate DATE NOT NULL,
    enddate DATE NOT NULL,
    baseroomprice DECIMAL NOT NULL,
    PRIMARY KEY pk_reservationroom (reservationid , roomnumber),
    FOREIGN KEY fk_rr_reservation (reservationid)
        REFERENCES reservation (reservationid),
    FOREIGN KEY fk_rr_room (roomnumber)
        REFERENCES room (roomnumber)
);


