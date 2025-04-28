/*
This script creates tables for the "Ambulance" case database, and inserts test data in all tables
*/
-- -----------------------------------------------------------------------
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS CUSTOMER; 

-- Table structure for table CUSTOMER
CREATE TABLE CUSTOMER (
  CustomerID int NOT NULL,
  FName varchar(16) NOT NULL,
  LName varchar(32) NOT NULL,
  PhoneNr varchar(16) NOT NULL,
  PRIMARY KEY (CustomerID)
);

-- Inserting new records for table
INSERT INTO CUSTOMER VALUES
(1, 'Robert', 'Smith', '035-444673'),
(2, 'Maria', 'Gimenez', '044778901'),
(3, 'Markku', 'Nieminen', '+3582298976'),
(4, 'Patrick', 'Johansson', '09120987');
-- -----------------------------------------------------------------------
--
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS EMPLOYEE; 

-- Table structure for table EMPLOYEE
CREATE TABLE EMPLOYEE (
  EmployeeID int NOT NULL,
  Fname varchar(16) NOT NULL,
  Lname varchar(32) NOT NULL,
  PhoneNr varchar(16) NOT NULL,
  JobTitle varchar(32) NOT NULL,
  PRIMARY KEY (EmployeeID)
);

-- Inserting new records for table
INSERT INTO EMPLOYEE VALUES
(101, 'Julia', 'Farnandez', '0987465534', 'Nurse'),
(102, 'Tommi', 'Mäkinen', '0357787653', 'Driver'),
(103, 'Ella', 'Jokinen', '+3589876223', 'Driver'),
(104, 'Hoang', 'Nguyen', '0976353423', 'Doctor'),
(105, 'Julius', 'Nyqvist', '045-98764524', 'Nurse'),
(106, 'Eveliina', 'Järvinen', '035-998567', 'Doctor');
-- -----------------------------------------------------------------------
--
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS AMBULANCE; 

-- Table structure for table AMBULANCE
CREATE TABLE AMBULANCE (
  PlateNr varchar(7) NOT NULL,
  Type varchar(16) NOT NULL,
  PRIMARY KEY (PlateNr)
);

-- Inserting new records for table
INSERT INTO AMBULANCE VALUES
('IXC-233', 'Basic'),
('KJM-001', 'Emergency'),
('FCE-873', 'Emergency');
-- -----------------------------------------------------------------------
--
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS RESERVATION; 

-- Table structure for table RESERVATION
CREATE TABLE RESERVATION (
  ReservationID int NOT NULL,
  CustomerID int NOT NULL,
  ReservationDate date NOT NULL,
  StartTime time NOT NULL,
  EndTime time NOT NULL,
  PlateNr varchar(7) NOT NULL,
  PRIMARY KEY (ReservationID),
  FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (PlateNr) REFERENCES AMBULANCE(PlateNr) ON UPDATE CASCADE ON DELETE CASCADE  
);

-- Inserting new records for table
INSERT INTO RESERVATION VALUES
(2334,4, '2024-01-20','08:00', '09:00', 'IXC-233'),
(3442,4,'2024-02-03', '14:00', '15:30','IXC-233' ),
(1101, 1,'2024-03-05' ,'13:15', '14:00','KJM-001' ),
(4565, 3,'2024-04-30', '21:40' ,'22:30', 'FCE-873');
-- -----------------------------------------------------------------------
--
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS CREW_RIDE; 

-- Table structure for table CREW_RIDE
CREATE TABLE CREW_RIDE (
  ReservationID int NOT NULL,
  EmployeeID int NOT NULL,
  PRIMARY KEY (ReservationID,EmployeeID),
  FOREIGN KEY (ReservationID) REFERENCES RESERVATION(ReservationID) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Inserting new records for table
INSERT INTO CREW_RIDE VALUES
(2334, 102),
(3442, 102),
(1101, 103),
(1101, 104),
(1101, 105),
(4565, 102),
(4565, 105);
-- -----------------------------------------------------------------------
