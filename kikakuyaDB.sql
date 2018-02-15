DROP DATABASE IF EXISTS KIKAKUYADEV;
CREATE DATABASE IF NOT EXISTS KIKAKUYADEV;
USE KIKAKUYADEV;
grant all on KIKAKUYADEV.* to 'admin'@'localhost' identified by 'admin'; 

CREATE TABLE Appointment (
  apptId       int(10) NOT NULL AUTO_INCREMENT, 
  apptDateTime date NOT NULL, 
  apptNotes    varchar(255), 
  UseruserId   int(10) NOT NULL,
  location    varchar(255),
  color varchar(6) NOT NULL,
  PRIMARY KEY (apptId));
CREATE TABLE Email (
	emailId int(10) NOT NULL AUTO_INCREMENT, 
	replyDue varchar(255) NOT NULL, 
  	mealChoiceBeef varchar(20),
    mealChoicePork varchar(20),
    mealChoiceChicken varchar(20),
    mealChoiceVeg varchar(20),
    mealChoiceFish varchar(20),
    mealChoiceKids varchar(20),
    EventeventId int(10) NOT NULL,
  	PRIMARY KEY (emailId));
CREATE TABLE Event (
  eventId    int(10) NOT NULL AUTO_INCREMENT, 
  eventName  varchar(255) NOT NULL, 
  eventDate  varchar(255), 
  UseruserId int(10),
  location varchar(255) NOT NULL, 
  PRIMARY KEY (eventId));
CREATE TABLE Good (
  goodId         int(10) NOT NULL AUTO_INCREMENT, 
  goodName       varchar(255) NOT NULL, 
  goodPrice      decimal(2, 0) DEFAULT 0, 
  VendorvendorId int(10) NOT NULL, 
  PRIMARY KEY (goodId));
CREATE TABLE Guest (
  guestId   int(10) NOT NULL AUTO_INCREMENT,
  token varchar(255) NOT NULL UNIQUE,
  firstName varchar(50) NOT NULL, 
  lastName  varchar(50) NOT NULL, 
  email     varchar(50) NOT NULL,
  isPresent   int(1),
  company varchar(50),
  kidsWith int(3),
  adultsWith int(3),
  kidsMax int(3),
  adultsMax int(3),
  specialRequests varchar(255),
  mealChoice varchar(50),
  EventeventId int(10) NOT NULL,
  PRIMARY KEY (guestId));
CREATE TABLE GuestPlusOne (
	guestPlusOneId int(10) NOT NULL AUTO_INCREMENT,
	fullName varchar(50) NOT NULL,
	mealChoice varchar(50),
	GuestguestId int(10) NOT NULL,
    category varchar(10) NOT NULL,
	PRIMARY KEY(guestPlusOneId));
CREATE TABLE Item (
  itemId     int(10) NOT NULL AUTO_INCREMENT, 
  itemName   varchar(255) NOT NULL, 
  itemStatus int(1) DEFAULT 0 NOT NULL, 
  ListlistId int(10) NOT NULL,
  itemNotes   varchar(255),
  PRIMARY KEY (itemId));
CREATE TABLE List (
  listId       int(10) NOT NULL AUTO_INCREMENT, 
  listTitle    varchar(50) NOT NULL UNIQUE, 
  listType     int(1) NOT NULL, 
  EventeventId int(10) NOT NULL, 
  PRIMARY KEY (listId));
CREATE TABLE `User` (
  userId   int(10) NOT NULL AUTO_INCREMENT, 
  userName     varchar(50) NOT NULL, 
  userPassword varchar(255) NOT NULL, 
  email    varchar(255) NOT NULL UNIQUE, 
  token    varchar(255),
  series varchar(255),
  PRIMARY KEY (userId));
CREATE TABLE Vendor (
  vendorId       int(10) NOT NULL AUTO_INCREMENT, 
  vendorName     varchar(60) NOT NULL, 
  vendorCategory varchar(50), 
  EventeventId   int(10) NOT NULL, 
  PRIMARY KEY (vendorId));
ALTER TABLE Good ADD INDEX FKGoodVendor (VendorvendorId), ADD CONSTRAINT FKGoodVendor FOREIGN KEY (VendorvendorId) REFERENCES Vendor (vendorId);
ALTER TABLE Vendor ADD INDEX FKVendorEvent (EventeventId), ADD CONSTRAINT FKVendorEvent FOREIGN KEY (EventeventId) REFERENCES Event (eventId);
ALTER TABLE Item ADD INDEX FKItemList (ListlistId), ADD CONSTRAINT FKItemList FOREIGN KEY (ListlistId) REFERENCES List (listId);
ALTER TABLE List ADD INDEX FKListEvent (EventeventId), ADD CONSTRAINT FKListEvent FOREIGN KEY (EventeventId) REFERENCES Event (eventId);
ALTER TABLE GuestPlusOne ADD INDEX FKGuestPlusOne (GuestguestId), ADD CONSTRAINT FKGuestPlusOne FOREIGN KEY (GuestguestId) REFERENCES Guest(guestId);
ALTER TABLE Event ADD INDEX FKEventUser (UseruserId), ADD CONSTRAINT FKEventUser FOREIGN KEY (UseruserId) REFERENCES `User` (userId);
ALTER TABLE Appointment ADD INDEX FKAppointmentUser (UseruserId), ADD CONSTRAINT FKAppointmentUser FOREIGN KEY (UseruserId) REFERENCES `User` (userId);
ALTER TABLE Guest ADD INDEX FKEventGuest (EventeventId), ADD CONSTRAINT FKEventGuest FOREIGN KEY (EventeventId) REFERENCES Event (eventId);
ALTER TABLE Email ADD INDEX FKEmailEvent (EventeventId), ADD CONSTRAINT FKEmailEvent FOREIGN KEY (EventeventId) REFERENCES `Event` (eventId);
