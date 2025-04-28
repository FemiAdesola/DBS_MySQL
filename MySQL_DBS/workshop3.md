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
select Project, Person, from project_person
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


Based on the Orders and Products  table generate 20 OrderDetails at least 2 OrderDetails should belenog to one order  and product

CREATE TABLE OrderDetails (
    OrderDetailID INT NOT NULL,
    OrderID INT,
    ProductID INT,
    Qunatity INT,
    Price DECIMAL,
    PRIMARY KEY (OrderDetailID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO Orders VALUES 
(1, 1, '2024-02-01 10:30:00', 450.00, 'Kilkallion 3 C23, Esppo'),
(2, 1, '2024-02-05 14:15:00', 120.50, 'Kilkallion 3 C23, Esppo'),

(3, 2, '2024-02-03 09:45:00', 300.00, 'kontulatie 4 A75, Helsinki'),
(4, 2, '2024-02-10 11:30:00', 85.99, 'kontulatie 4 A75, Helsinki'),

(5, 3, '2024-02-04 16:00:00', 600.00, 'Puistotie 9, Vantaa'),
(6, 3, '2024-02-08 13:45:00', 200.50, 'Puistotie 9, Vantaa'),

(7, 4, '2024-02-02 12:00:00', 150.00, 'Rautatieasema 3, Tampere'),

(8, 5, '2024-02-06 18:30:00', 75.25, 'Satamakatu 15, Turku'),
(9, 5, '2024-02-12 08:45:00', 320.75, 'Satamakatu 15, Turku'),

(10, 6, '2024-02-07 10:00:00', 99.99, 'Kauppatori 7, Oulu'),

(11, 7, '2024-02-03 14:15:00', 450.00, 'Rantakatu 21, Jyväskylä'),
(12, 7, '2024-02-09 09:30:00', 290.00, 'Rantakatu 21, Jyväskylä'),

(13, 8, '2024-02-05 11:45:00', 110.00, 'Asemakatu 8, Kuopio'),

(14, 9, '2024-02-04 13:00:00', 200.00, 'Linnankatu 11, Lahti'),
(15, 9, '2024-02-10 16:45:00', 180.50, 'Linnankatu 11, Lahti');


INSERT INTO Products VALUES 
    -- Electronics (CategoryID = 1)
    (1, 'Smartphone X200', 'High-performance smartphone with 128GB storage', 799.99, 1, 50),
    (2, 'Wireless Earbuds Pro', 'Noise-cancelling wireless earbuds with long battery life', 199.99, 1, 100),
    (3, 'Gaming Laptop Z15', '15-inch gaming laptop with RTX graphics', 1499.00, 1, 30),
    (4, 'Smartwatch Active', 'Fitness-focused smartwatch with heart rate monitor', 299.00, 1, 75),

    -- Home Appliances (CategoryID = 2)
    (5, 'Refrigerator CoolMax', 'Double-door refrigerator with energy-saving technology', 999.00, 2, 15),
    (6, 'Microwave Oven 900W', 'Compact microwave oven with grill function', 150.00, 2, 40),
    (7, 'Washing Machine ProClean', '7kg washing machine with quick wash feature', 599.00, 2, 20),
    (8, 'Vacuum Cleaner Turbo', 'Bagless vacuum cleaner with HEPA filter', 199.00, 2, 35),

    -- Clothing (CategoryID = 3)
    (9, 'Men\'s Winter Jacket', 'Waterproof winter jacket with insulation', 120.00, 3, 60),
    (10, 'Women\'s Running Shoes', 'Lightweight running shoes for outdoor use', 89.99, 3, 80),
    (11, 'Unisex Hoodie Classic', 'Comfortable cotton hoodie with front pocket', 59.99, 3, 90),
    (12, 'Sports Leggings', 'Stretchable leggings for gym and yoga', 45.00, 3, 100),

    -- Books (CategoryID = 4)
    (13, 'The Art of Programming', 'Comprehensive guide to algorithms and coding practices', 59.99, 4, 120),
    (14, 'Business Mastery', 'Strategies for success in modern business', 45.00, 4, 85),
    (15, 'Fiction: The Lost City', 'Adventure novel with an exciting plot', 25.00, 4, 150),
    (16, 'History of Europe', 'Detailed account of European history from ancient times', 35.00, 4, 70),

    -- Sports & Outdoors (CategoryID = 5)
    (17, 'Mountain Bike Pro', 'Durable mountain bike suitable for rough terrains', 850.00, 5, 10),
    (18, 'Yoga Mat EcoGrip', 'Eco-friendly non-slip yoga mat for daily workouts', 45.00, 5, 200);


Genrate reviews on the products ordered by customers

    CREATE TABLE Reviews (
    ReviewID INT,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    Comment TEXT,
    ReviewDate DATETIME,
    PRIMARY KEY (ReviewID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
);