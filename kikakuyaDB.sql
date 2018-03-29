DROP DATABASE IF EXISTS kikakuyadb;
CREATE DATABASE IF NOT EXISTS kikakuyadb;
USE kikakuyadb;
grant all on kikakuyadb.* to 'admin'@'localhost' identified by 'admin'; 
CREATE TABLE Appointment (
  apptId       int(10) NOT NULL AUTO_INCREMENT, 
  apptTitle		varchar(50) NOT NULL,
  apptDateTime datetime NOT NULL, 
  apptNotes    varchar(255), 
  EventeventId   int(10) NOT NULL,
  location    varchar(255),
  color varchar(16) NOT NULL,
  PRIMARY KEY (apptId));
CREATE TABLE Email (
	emailId            int(10) NOT NULL AUTO_INCREMENT, 
	replyDue           varchar(255) NOT NULL, 
  mealChoiceBeef     varchar(20),
  mealChoicePork     varchar(20),
  mealChoiceChicken  varchar(20),
  mealChoiceVeg      varchar(20),
  mealChoiceFish     varchar(20),
  mealChoiceKids     varchar(20),
  EventeventId       int(10) NOT NULL,
  PRIMARY KEY (emailId));
CREATE TABLE Event (
  eventId     int(10) NOT NULL AUTO_INCREMENT, 
  eventName   varchar(255) NOT NULL, 
  eventDate   varchar(255), 
  UseruserId  int(10),
  location    varchar(255) NOT NULL,
  totalBudget decimal(9,2) DEFAULT 0.0, 
  PRIMARY KEY (eventId));
CREATE TABLE VendorEvent (
  vendorEventId   int(10) NOT NULL AUTO_INCREMENT,
  EventeventId    int(10) NOT NULL,
  VendorvendorId  int(10) NOT NULL,
  vendorCategory  varchar(100),
  PRIMARY KEY (vendorEventId));
CREATE TABLE Good (
  goodId         int(10) NOT NULL AUTO_INCREMENT, 
  goodName       varchar(255) NOT NULL, 
  goodPrice      decimal(10, 2), 
  VendorEventvendorEventId int(10) NOT NULL, 
  PRIMARY KEY (goodId));
CREATE TABLE Guest (
  guestId   int(10) NOT NULL AUTO_INCREMENT,
  token varchar(255) NOT NULL,
  firstName varchar(50) NOT NULL, 
  lastName  varchar(50) NOT NULL, 
  email     varchar(50) NOT NULL UNIQUE,
  isPresent   int(1),
  company varchar(50),
  kidsWith int(3),
  adultsWith int(3),
  kidsMax int(3),
  adultsMax int(3),
  specialRequests varchar(255),
  mealChoice varchar(50),
  notes varchar(255),
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
  listTitle    varchar(50) NOT NULL, 
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
  vendorName     varchar(60) NOT NULL UNIQUE, 
  website varchar(255),
  phone varchar(50),
  address varchar(255),
  PRIMARY KEY (vendorId));
ALTER TABLE Good ADD INDEX FKGoodVendorEvent (VendorEventvendorEventId), ADD CONSTRAINT FKGoodVendorEvent FOREIGN KEY (VendorEventvendorEventId) REFERENCES VendorEvent (vendorEventId) ON DELETE CASCADE;
ALTER TABLE VendorEvent ADD INDEX FKVendorVendorEvent (VendorvendorId), ADD CONSTRAINT FKVendorVendorEvent FOREIGN KEY (VendorvendorId) REFERENCES Vendor (vendorId) ON DELETE CASCADE;
ALTER TABLE VendorEvent ADD INDEX FKEventVendorEvent (EventeventId), ADD CONSTRAINT FKEventVendorEvent FOREIGN KEY (EventeventId) REFERENCES Event (eventId) ON DELETE CASCADE;
ALTER TABLE Item ADD INDEX FKItemList (ListlistId), ADD CONSTRAINT FKItemList FOREIGN KEY (ListlistId) REFERENCES List (listId) ON DELETE CASCADE;
ALTER TABLE List ADD INDEX FKListEvent (EventeventId), ADD CONSTRAINT FKListEvent FOREIGN KEY (EventeventId) REFERENCES Event (eventId);
ALTER TABLE GuestPlusOne ADD INDEX FKGuestPlusOne (GuestguestId), ADD CONSTRAINT FKGuestPlusOne FOREIGN KEY (GuestguestId) REFERENCES Guest(guestId);
ALTER TABLE Event ADD INDEX FKEventUser (UseruserId), ADD CONSTRAINT FKEventUser FOREIGN KEY (UseruserId) REFERENCES `User` (userId);
ALTER TABLE Appointment ADD INDEX FKAppointmentEvent (EventeventId), ADD CONSTRAINT FKAppointmentEvent FOREIGN KEY (EventeventId) REFERENCES Event (eventId) ON DELETE CASCADE;
ALTER TABLE Guest ADD INDEX FKEventGuest (EventeventId), ADD CONSTRAINT FKEventGuest FOREIGN KEY (EventeventId) REFERENCES Event (eventId);
ALTER TABLE Email ADD INDEX FKEmailEvent (EventeventId), ADD CONSTRAINT FKEmailEvent FOREIGN KEY (EventeventId) REFERENCES `Event` (eventId);
