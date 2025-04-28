
# SQL Implementation

```sql
/*
This script creates tables for the "Small company" case database, and inserts test data in all tables
*/
-- ------------------------------------------------------------------
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS DEPARTMENT;
 
-- Table structure
CREATE TABLE DEPARTMENT (
  DepID int NOT NULL,
  Name varchar(16) NOT NULL,
  Code char(2) NOT NULL,
  PRIMARY KEY (DepID)
);

-- Inserting new records for table
INSERT INTO DEPARTMENT VALUES
(1, 'IT', 'IT'),
(2, 'Finance', 'FI'),
(3, 'Production', 'PR'),
(4, 'Sales', 'SA');
-- -----------------------------------------------------------------------
--
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS PERSON; 

-- Table structure
CREATE TABLE PERSON (
  PersonID char(4) NOT NULL,
  Department int,
  FName varchar(16) NOT NULL,
  LName varchar(32) NOT NULL,
  City varchar(16),
  Salary int,
  Tax decimal (3,1),
  SDate date,
  PRIMARY KEY (PersonID),
  FOREIGN KEY (Department) REFERENCES DEPARTMENT(DepID)
);

-- Inserting new records for table
INSERT INTO PERSON VALUES
('2222',3,'Mikko','Nieminen','Turku',2900,24.2,'2015-03-01'),
('2233',1,'Hannu','Virta','Turku',3100,32.3,'2005-10-10'),
('2234',4,'Liisa','Lehtipuu','Kerava',3200,33.0,'2004-12-1'),
('2333',3,'Katja','Kataja','Vantaa',2300,19.4,'2015-05-01'),
('2345',NULL,'Keijo','Kuusi','Kerava',2580,24.0,'2010-08-12'),
('3567',1,'Kari','Mänty','Helsinki',2650,22.3,'2007-09-15'),
('3568',3,'Hannu','Haapanen','Helsinki',3400,35.1,'2003-05-10');
-- -----------------------------------------------------------------------
--
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS PROJECT; 

-- Table structure
CREATE TABLE PROJECT (
  ProjID varchar(4) NOT NULL,
  Name varchar(32) NOT NULL,
  Priority smallint,
  Location varchar(32),
  PRIMARY KEY (ProjID)
);

-- Inserting new records for table
INSERT INTO PROJECT VALUES
('P1', 'Electronic billing', 2, 'Turku'),
('P2', 'Reporting upgrade', 1, 'Kerava'),
('P3', 'Statistics report', NULL, NULL),
('P4', 'Personnel training', 2, 'Turku'),
('P5', 'Customer service', 3, 'Joensuu'),
('P6', 'SAP implementation', 1, 'Helsinki');
-- -----------------------------------------------------------------------
--
-- Drop table in case it exist in the database
DROP TABLE IF EXISTS PROJECT_PERSON; 

-- Table structure
CREATE TABLE PROJECT_PERSON (
  Project varchar(4) NOT NULL,
  Person char(4) NOT NULL,
  HoursActual int,
  HoursPlanned int,
  PRIMARY KEY (Project,Person),
  FOREIGN KEY (Project) REFERENCES PROJECT(ProjID),
  FOREIGN KEY (Person) REFERENCES PERSON(PersonID)   
);

-- Inserting new records for table
INSERT INTO PROJECT_PERSON VALUES
('P1', '2222', 300, 300),
('P1', '2233', 150, 200),
('P1', '2333', 200, 200),
('P1', '2345', 100, 100),
('P2', '2222', 0, 100),
('P4', '2333', 150, NULL),
('P4', '2345', 200, 250),
('P4', '3567', 300, 200),
('P5', '2233', 500, 600),
('P5', '3567', 200, 200),
('P5', '2222', 10, 200);
-- -----------------------------------------------------------------------
 
```


# SQL Query
## Question and Answer

## SELECT with: ORDER BY, AS, FUNCTIONS, AGGREGATE FUNCTIONS, GROUP BY, HAVING


```shell
Questions 1
----------------
The project ID, Name, and Priority of all projects outside Helsinki listed in ascending order of
priority
```

```sql
Answer
---------
select projid, name, Priority, location from project
Where location != 'Helsinki'
order by Priority asc;
```

```shell
Questions 2
----------------
The project ID and person ID of all cases where the actual worked hours is greater than 90%
of the planned hours (per person, per project)
```

```sql
Answer
---------
select Project, Person from project_person
where HoursActual > 0.9 * HoursPlanned
GROUP BY Person, Project;

-- for getting more information
select Project, Person, HoursActual,HoursPlanned from project_person
where HoursActual > 0.9 * HoursPlanned
GROUP BY Person, Project;
```


```shell
Questions 3
----------------
The new salary of all persons that started in the company earlier than 2023 will be increased
by 2,5%. Write a query that returns the person ID, first name, last name, and the new salary
of all affected persons. Use “AS” to properly name the column where the new salary is listed
```

```sql
Answer
---------
select PersonID,FName,LName, Salary * 1.025 AS new_salary from person
where SDate < '2023-01-01';


-- for getting more information
select PersonID,FName,LName,Salary as old_salary, Salary * 1.025 AS new_salary from person
where SDate < '2023-01-01';
```

```shell
Questions 4
----------------
How many departments there are in the company?
```

```sql
Answer
---------
select count(*) from Department


-- for getting more information
select count(*) as number_of_depart from Department
```

```shell
Questions 4
----------------
How many departments there are in the company?
```

```sql
Answer
---------
select count(*) from Department


-- for getting more information
select count(*) as number_of_depart from Department
-- or this method
select count(distinct DepID) as total_departments from Department
```


```shell
Questions 5
----------------
What’s the lowest tax rate among all persons?
```

```sql
Answer
---------
select  MIN(Tax) AS lowest_tax_rate from person

```

```shell
Questions 6
----------------
How many projects occurred in Turku?
```

```sql
Answer
---------
select  count(*) as number_of_project_in_turku from project
where Location = 'Turku';

-- teacher
SELECT COUNT(ProjID)
FROM smallcompany.PROJECT
WHERE Location = 'Turku';

```


```shell
Questions 7
----------------
For how many days Mikko Nieminen has been working in the company? Hint: use a function
called DATEDIFF() and CURRENT_DATE to help you finding the answer. “Google” “MySQL
DATEDIFF” to figure out how to set its parameters.

- Note : for finding the current date in mysql 
    use CURRENT_DATE
SELECT CURRENT_DATE();

For knowing the days between soem specific periods
SELECT DATEDIFF(CURRENT_DATE, "2024-12-24");
```


```sql
Answer
---------
select FName, LName, datediff(CURRENT_DATE, SDate) as days_worked from person
where FName = 'Mikko' AND LName = 'Nieminen';

```

```shell
Questions 8
----------------
The person id and the average amount of actual hours the person has worked in different
projects. Round the average values to one decimal, and sort the result by descending order
of average values
```


```sql
Answer
---------
select Person, round(Avg(HoursActual), 1) as average_hour_worked 
from project_person
group by  Person
order by average_hour_worked  desc;

```

```shell
Questions 9
----------------
The average salary paid in different cities with the corresponding city name. Round the
average values to integers (no decimals).
```


```sql
Answer
---------
select City, round(avg(Salary), 0) as ave_salary
from person
group by City;

-- for order by avg_salary asc
select City, round(avg(Salary), 0) as ave_salary
from person
group by City 
order by ave_salary asc;

```

```shell
Questions 10
----------------
The IDs of persons that have worked in only two projects
```
```sql
Answer
---------
select Person as Person_Id from project_person
group by Person_Id
having count(distinct Project) = 2;


--teacher's solution
SELECT Person
FROM smallcompany.PROJECT_PERSON
GROUP BY Person
HAVING count(Project) = 2;
```

```shell
Questions 11
----------------
The Department IDs and amount of persons that earn more than 3000 eur as a salary.
Exclude persons from Helsinki in this query. (HINT: You will need to use a WHERE clause here)
```
```sql
Answer
---------
select  Department, count(PersonID) as num_persons
from person
where Salary > 3000 and city != 'Helsinki'
group by Department;

---teacher's solution
SELECT Department, count(PersonID)
FROM smallcompany.PERSON
WHERE Salary > 3000 AND City <> 'Helsinki';
```

```shell
Questions 12
----------------
The ID of departments having more than 2 persons working in it
```
```sql
Answer
---------
select Department as Depart_Id from person
group by Depart_Id
having count(PersonID)> 2;

-- teacher's solution
SELECT Department
FROM PERSON
GROUP BY Department
HAVING count(PersonID) > 2;

```
