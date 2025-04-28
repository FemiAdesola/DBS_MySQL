
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
## Question and Answers

## SELECT with: INNER JOIN, LEFT JOIN, RIGHT JOIN


```shell
Questions 1
----------------
The project id, project name, person id working in the project, for all projects in the database
```

```sql
Answer
---------
select 
    ProjID as 'Project Id', 
    Name  as 'Project Name', 
    Person as 'Person Id'
from project inner join project_person 
on  ProjID = Project
order by Person
```


```shell
Questions 2
----------------
The department name and the amount of persons working in each department. HINT: you
will need to use the aggregate function Count() and GROUP BY
```

```sql
Answer
---------
select 
    Department.Name as 'Department Name', 
    Count(PersonID) as 'Number of person working in dept'
from department left join person
on  Department.DepID = person.Department
group by Department.DepID;
```

```shell
Questions 3
----------------
For each project: the project name, the current amount of actual hours (sum from all
persons), and sum of planned hours (sum from all persons working on the project)
```

```sql
Answer
---------
select  
    project.Name as 'Project Name', 
    sum(HoursActual) as 'Total Hours',
    sum(HoursPlanned) as 'Total Planned hours'
from project left join project_person
on ProjID = Project
group by project.Name;

--another method
select  
    project.Name as 'Project Name', 
    sum(project_person.HoursActual) as 'Total Hours',
    sum(project_person.HoursPlanned) as 'Total Planned hours'
from project left join project_person
on project.ProjID = project_person.Project
group by project.Name;
```

```shell
Questions 4
----------------
Write a query that allows you to identify the project names with no persons working on it.
Note, your query can return other results than the one you are specifically looking for. From
the results however, you will be able to find your answer. HINT: one possible solution can be
written using “PROJECT_PERSON RIGHT JOIN PROJECT

```

```sql
Answer
---------
select  
	project.Name as 'Project Name', 
    ProjID as 'Project Id'
from  project_person 
right join project
on Project =  ProjID
where Project is null;

-- another way
select  
	project.Name as 'Project Name', 
    ProjID as 'Project Id'
from  project_person 
right join project
on Project =  ProjID
where Project is null
order by ProjID desc;
```

```sql
--- left join remove what is null from right table
select Fname, LName,  Department.name from person
left join department 
on person.department = department.depid

--right join remove only what is nun in the left table 
select Fname, LName,  Department.name from person
right join department 
on person.department = department.depid

-- inner joint remove evrything that is not common 
select Fname, LName,  Department.name from person
inner join department 
on person.department = department.depid


```
