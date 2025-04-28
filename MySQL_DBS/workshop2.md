The question [question](/files/Workshop2.pdf)



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