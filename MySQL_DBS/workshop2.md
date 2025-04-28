The question [question](/files/Workshop2.pdf)

# SQL Implementation
```sql
/*
This script creates tables for the "Ambulance" case database, and inserts test data
in all tables
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
  FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
  FOREIGN KEY (PlateNr) REFERENCES AMBULANCE(PlateNr)   
);
-- Inserting new records for table
INSERT INTO RESERVATION VALUES
(2334, 4, '2024-01-20', '08:00', '09:00', 'IXC-233'),
(3442, 4, '2024-02-03', '14:00', '15:30', 'IXC-233'),
(1101, 1, '2024-03-05', '13:15', '14:00', 'KJM-001'),
(4565, 3, '2024-04-30', '21:40', '22:30', 'FCE-873');
-- -----------------------------------------------------------------------
--
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS CREW_RIDE; 
-- Table structure for table CREW_RIDE
CREATE TABLE CREW_RIDE (
  ReservationID int NOT NULL,
  EmployeeID int NOT NULL,
  PRIMARY KEY (ReservationID,EmployeeID),
  FOREIGN KEY (ReservationID) REFERENCES RESERVATION(ReservationID),
  FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
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
```

# SQL Query 
## Question and Answer
```shell
Questions 1
----------------
The first name and last name of all the customers currently stored in the database 
```

```sql
Answer
---------
Select FName, LName from customer;
```

```shell
Questions 2
----------------
The phone number of the employee named Eveliina Järvinen
```

```sql
Answer
---------
select PhoneNr from employee
where Fname = 'Eveliina' and Lname = 'Järvinen';
```

```shell
Questions 3
----------------
The customer ID(s) of all customers that made reservations for the date of 05.Mar.2024
```

```sql
Answer
---------
select customerID from reservation 
where reservationdate >= '2024-03-05';

or this one
select customerID, reservationdate from reservation 
where reservationdate >= '2024-03-05';
```


```shell
Questions 4
----------------
The start time and end time of the reservation with ID 4565
```


```sql
Answer
---------
select starttime,endtime from reservation 
where reservationid = 4565;
```


```shell
Questions 5
----------------
The employee ID(s) of all nurses currently working for the company
```

```sql
Answer
---------
select employeeid from employee 
where jobtitle = 'nurse';

/*for add name in employee*/

select employeeid, fname, lname from employee 
where jobtitle = 'nurse';
```

```shell
Questions 6
----------------
The ID(s) of all reservations having a start time between 10:00 and 14:00
```

```sql
Answer
---------
select reservationid, starttime from reservation
WHERE starttime BETWEEN '10:00' AND '14:00';
```

```shell
Questions 7
----------------
The ID(s) of all employees allocated to the reservation having ID 1101
```

```sql
Answer
---------
select employeeid  from crew_ride
WHERE reservationid = 1101


/*for add name in reservationid to the output*/
select employeeid, reservationid  from crew_ride
WHERE reservationid = 1101

```

```shell
Questions 8
----------------
The ID(s) of all reservations having start time earlier than 09:00 or later than 16:00
```

```sql
Answer
---------
select reservationid  from reservation
WHERE starttime < '09:00' OR starttime > '16:00';


/*for add in customerid to the output*/
select reservationid, customerid  from reservation
WHERE starttime < '09:00' OR starttime > '16:00';

```

```shell
Questions 9
----------------
The ID(s) of all reservations allocated to ambulance IXC-233 made by the customer with ID
equal to 4
```

```sql
Answer
---------
select reservationid, platenr  from reservation
WHERE customerid = 4 and  platenr = 'IXC-233';

```

```shell
Questions 10
----------------
The first name and last name of all doctors and drivers
```

```sql
Answer
---------
select fname,lname from employee
WHERE jobtitle = 'doctor' or jobtitle = 'driver'


/*for add name in jobtitle to the output*/ 
select fname,lname, jobtitle from employee
WHERE jobtitle = 'doctor' or jobtitle = 'driver'

```

```shell
Questions 11
----------------
The ID(s) of all reservations made for the mornings (start time between 06:00 and 12:00) 
#of the month of '2024-01-01' and '2024-12-31' 
```

```sql
Answer
---------
select reservationid, starttime from reservation
WHERE starttime between '6:00' and '12:00' 
--And reservationdate between '2024-01-01' and '2024-12-31' 

-- another methdo
select reservationid, starttime from reservation
WHERE starttime >='6:00' and starttime <= '12:00' 

```


```shell
UPDATE queries: For each of the items below, write a query that changes …
Questions 12
----------------
The phone number of customer Markku Nieminen to “0452234165”
```

```sql
Answer
---------
UPDATE customer
SET phonenr = '0452234165' 
WHERE customerid = 4;

select * from customer

```

```shell
UPDATE queries: For each of the items below, write a query that changes …
Questions 13
----------------
The end time of reservation having ID 4565 to 23:00
```

```sql
Answer
---------
UPDATE  reservation
SET endtime = '23:00:00' 
WHERE ReservationID = 4565;

select * from reservation

```

```shell
UPDATE queries: For each of the items below, write a query that changes …
Questions 14
----------------
All reservations scheduled for dates earlier than or the same as 30 April of 2024
```

```sql
Answer
---------
SET SQL_SAFE_UPDATES = 0;
DELETE FROM reservation
WHERE DATE(ReservationDate) <= '2024-04-30';
SET SQL_SAFE_UPDATES = 1;

select * from reservation

```