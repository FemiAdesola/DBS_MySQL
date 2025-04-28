# SQL and Database

- Link to mysql [tutorial](https://dev.mysql.com/doc/refman/8.0/en/data-types.html)
- Link for [drawing](https://app.diagrams.net/?src=about)
- Link for [codercrunch](https://www.codercrunch.com/design/634265/designing-instagram)

- Data types for create table

# Table of contents
- [Creating databases and tables](#creating-databases-and-tables)
- [Adding New And Updating Existing Data](#adding-new-and-updating-existing-data)
- [Simple SELECT Queries](#simple-select-queries)
- [Sorting Results](#sorting-results)
- [SQL Aggregate Functions](#sql-aggregate-functions)
- [Aggreagte Functions And GROUP BY](#aggreagte-functions-and-group-by)
- [AS-keyword](#as-keyword)
- [JOINS And Multi-Table Queries](#joins-and-multi-table-queries)



Select quesry methods

![table](/img/create.png)


https://www.mysql.com/products/workbench/ 


## Introduction to SQL 
### Author

| |	Column	|Data type	|Nullable	|Default
|----|---------|---------|---------|---------|
|  PK |authorid	|integer	|not null	|
|   |surname	|character varying(32)	|not null	|
|   |forename	|character varying(32)	|not null	|

#### Table data for book author
--------------------------------
|authorid	|surname	|Forename
|----|---------|---------|
|201	|Savielle	|Ernesto
|202	|Adams	|Arthur
|203	|Schmidt	|Abigale
|204	|Weinstein-Welle	|Marie
|205	|Nordqvist	|Arvid
|206	|van Holstein	|Theodore
|207	|Annett	|Josephine


### Book
| |	Column	|Data type	|Nullable	|Default
|----|---------|---------|---------|---------|
|PK	|bookid	|integer	|not null	
|    |title	|character varying(48)	|not null	
|FK	|authorid	|integer		
|FK	|publisherid	|integer		
 |   |pages	|integer		
|    |price	|double precision		
 |   |published	|date
		
- FOREIGN KEY (publisherid) REFERENCES publisher (publisherid)
- FOREIGN KEY (authorid, authorid) REFERENCES book (authorid, bookid)

#### Table data for book
--------------------------------
|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02

### Publisher
| |	Column	|Data type	|Nullable	|Default
|----|---------|---------|---------|---------|
|PK	|publisherid	|integer	|not null	
|   |name	|character varying(32)	|not null	
|    |address	|character varying(32)	|null	
|   |postcode	|character varying(32)	|null	
|    |city	|character varying(32)		

#### Table data for Publisher
****************************************************************
|Publisherid	|name	|address	|postcode	|city
|----|-----|------|------|------|
|301	|Taylor & Wells	|17 Pine Road	|SN11017	|Little Town
|302	|Black Wolf Publishing	|100 A Hillside Way	|BF10071	|Dullville
|303	|Info Press	|2 High Street	|CD05020	|Forestwood
|304	|Classics4you	|10 Old Road	|YT98100	|Creek-on-Trent


### Stock 
| |Column	|Data type	|Nullable	|Default
|----|---------|---------|---------|---------|
|PK	|stockid	|integer	|not null	
|FK	|bookid	|integer	|null	
|   |instock	|integer	|not null
	
- FOREIGN KEY (bookid, bookid) REFERENCES book (authorid, bookid)

#### Table data for stock 
--------------------------------
|stockid	|bookid	|instock
|----|-------|-------|
|1001	|101	|175
|1002	|102	|252
|1003	|103	|15
|1004	|104	|244
|1005	|105	|53
|1006	|106	|102
|1007	|107	|10
|1008	|109	|5
|1009	|110	|0
|1010	|111	|34

## Introduction to SQL Question and Answer
```shell
Questions 4.2.1
----------------
Write an SQL query that fetches the title, price and the number of pages (in that order) for each book published prior to 1995. The books are to be ordered alphabetically by their names. 
```

```sql
Answer
---------
SELECT Title, Price, Pages
FROM Book
WHERE Published < '1995-01-01'
ORDER BY Title;
```
![421](/img/421.png)

```shell
Questions 4.2.2
----------------
Below is the SQL code from the previous exercise, but with three syntax errors introduced. Your task is to fix the syntactical problems in the code in order to to finish this exercise and this chapter. If you can't yet spot the problems off-hand, you may have a look at the answer of the previous exercise and compare. The three problems fixed here are amongst the most common, and when you face obscure errors while submitting the tasks, try and check first if you have indeed committed any of these mistakes you fixed in this exercise. 
```

```sql
Answer
---------
SELECT Title, Price, Pages
FROM Book
WHERE Published < '1995-01-01'
ORDER BY Title;
```
![421](/img/421.png)

## Creating databases and tables
###  Creating database and tables Question and Answer

```shell
Questions 5.2.1
----------------
Your task is write an SQL command that creates the table Student as shown below.

Note that the attributes have to be placed on the table in the same order as below.

STUDENT
Field name	Data type for the field	Other definitions
studentid	integer	not null primary key
forename	character varying(32)	not null
surname	character varying(60)	not null
address	character varying(100)	 
phonenum	character varying(15)	 
```
![521](/img/521.png)

```sql
Answer
---------
CREATE TABLE Student (
    studentid INTEGER NOT NULL PRIMARY KEY,
    forename CHARACTER VARYING(32) NOT NULL,
    surname CHARACTER VARYING(60) NOT NULL,
    address CHARACTER VARYING(100),
    phonenum CHARACTER VARYING(15)
);
```

```shell
Questions 5.2.2
----------------
Here your task is to create another table that will accompany the Student created in the previous exercise.

Again, create the table according to the description below. Again, retain the order of the attributes the same. We will later add some attributes to this table. 

COURSE
Field name	Data type for the field	Other definitions
courseid	integer	not null primary key
name	character varying(32)	not null
starts	date	 
```
![522](/img/522.png)

```sql
Answer
---------
CREATE TABLE Course (
    courseid INTEGER NOT NULL PRIMARY KEY,
    name CHARACTER VARYING(32) NOT NULL,
    starts DATE
);
```


```shell
Questions 5.2.3
----------------
With the tables Student and Course created, we are ready create a third table Grade "in between" the two. The table holds the grades having been awarded to a given student on a given course.

Note the composite key "StudentID" & "CourseID" that we need to use on this table.
Note also that StudentID and CourseID are foreign keys referencing to their respective attributes on Student and Course.

As previously, the order of the attributes must be as below. 

GRADE

Attribute    Datatype     Modifiers
------------------------------------------------------------------------------------
StudentID    integer      part of a composite key; foreign key to Student(StudentID)
CourseID     integer      part of a composite key; foreign key to Course(CourseID)
Grade        integer     
```
![523](/img/523.png)

```sql
Answer
---------
CREATE TABLE Grade (
    StudentID INTEGER,
    CourseID INTEGER,
    Grade INTEGER,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(studentid),
    FOREIGN KEY (CourseID) REFERENCES Course(courseid)
);
```


```shell
Questions 5.2.4
----------------
We have created the table Course with the following structure:

COURSE

Attribute     Datatype               Modifiers
------------------------------------------------
CourseID      integer                primary key
Name          character varying(32)  not null
Starts        date
Your task is now to add a new attribute called Lecturer onto the table. You can see its details below.

Attribute    datatype                 modifiers
------------------------------------------------------------------
Lecturer     character varying(32) 
```

```sql
Answer
---------
ALTER TABLE Course
ADD COLUMN Lecturer CHARACTER VARYING(32);
```
![524](/img/524.png)

```shell
Questions 5.2.5
----------------
With the database having been in use for a while, it has turned out that the attribute Lecturer is not needed. Your task is to remove this attribute from the table Course. Please specify your command such that the attribute is removed despite possible dependency issues imposed on it. 
```

```sql
Answer
---------
ALTER TABLE Course
DROP COLUMN Lecturer CASCADE;
```
![525](/img/525.png)

```shell
Questions 5.2.6
----------------
In this last exercise you have to delete the previously-created table Grade. Please remember that this table had foreign keys referencing attributes on other tables. 
```

```sql
Answer
---------
DROP TABLE Grade CASCADE;
```
![526](/img/526.png)


## Adding New And Updating Existing Data 

```shell
Questions 6.2.1
----------------
In the previous chapter we created three tables called Student, Grade and Course.

The structure of the table Student is provided below. Further below are shown the data for a single record that belongs to Student. Please write the command that inserts the record into the table. 

TABLE STUDENT

Attribute     Datatype                           Modifiers
------------------------------------------------------------
StudentID     integer			         primary key
Forename      character varying(32)   not null
Surname       character varying(60)   not null
Address       character varying(100)
PhoneNum      character varying(15)


THE RECORD TO BE INSERTED

Attribute    Value

StudentID     1
Forename      Jennifer
Surname       Brown
Address       12 Forest Road, AC53010, Littleville
PhoneNum      (no value inserted)
```

```sql
Answer
---------
INSERT INTO Student (StudentID, Forename, Surname, Address)
VALUES (1, 'Jennifer', 'Brown', '12 Forest Road, AC53010, Littleville'
);
```
![621](/img/621.png)


```shell
Questions 6.2.2
----------------
As in the previous exercise, add a new record, but this time onto the previously-created table Course, the structure of which is again shown below along with the values to be inserted. Note the date and its correct format. 

COURSE

Attribute       Datatype                Modifiers
---------------------------------------------------------------
CourseID        integer                 primary key
Name            character varying(32)   not null
Starts          date
Lecturer        character varying(40)   

THE RECORD TO BE INSERTED

Attribute       Value

CourseID        1021
Name            Introduction to databases
Starts          15th January, 2009
Lecturer        (no value inserted)
```

```sql
Answer
---------
INSERT INTO course (courseID, name, starts)
VALUES (1021, 'Introduction to databases', '2009-01-15'
);
```
![622](/img/622.png)


```shell
Questions 6.2.3
----------------
In the last exercise you added the course "Introduction to databases." It has been found, though, that the course start date was wrong. Also, there is now a lecturer appointed to the course, and his name needs to be added.

Update the record whose current data is shown below such that:
Start date is changed to: 16th January, 2009
Lecturer is changed to: Burroughs Anthony

Record data prior to update:

Attribute    Value

CourseID       1021
Name           Introduction to databases
Starts         15th January, 2009
Lecturer       No lecturer
```

```sql
Answer
---------
update course
set starts = '2009-01-16', lecturer = 'Burroughs Anthony'
where courseid = 1021
```
![623](/img/623.png)

```shell
Questions 6.2.4
----------------
On the Course table there is an old course that is no longer lectured and that has now been replaced with a newer one. Your task is to delete this old course from the table.

The details of the record to be removed are given below. NOTE: There is also another course with the same name now on the table--it is the newer course that replaces the to-be-deleted one. Make sure you do not remove this newer course while deleting the older one.

The old record to be deleted:

Attribute     Value

courseid       1010  (primary key value)
Name           Introduction to databases
Starts         2nd September, 2006
Lecturer       No lecturer 
```

```sql
Answer
---------
delete from course
where courseid = 1010
and starts = '2006-09-02'
```
![624](/img/624.png)

```shell
Questions 6.2.5
----------------
1. Create a table as described below so that the student number is generated automatically using SERIAL-syntax.

STUDENT
Field name	Data type for the field	Other definitions
StudentNro	integer	not null primary key
FirstiName	character varying(32)	not null
LastName	character varying(60)	 
Address	character varying(100)	 
Phone	character varying(15)	 
Note that the attributes must be placed into the table in the same order as shown above.
2. Add the people listed below to the table in this order using the INSERT statement; remember to leave the student number blank in the VALUES section.

Mary, Smith, Helsinki, 050 123456
Math, Smith, Helsinki, 050 123455
Kate, Smith, Helsinki, 050 123456
3. Enter the search function on its own row: Select * from student;

Write this Select-statement after the CREATE statement and the INSERT statement on its own row.
4. Finally, look at the list of rows you received in response.

Note that even if you did not enter a student number in the INSERT statement, each line has its own unique student number generated by the SERIAL function.
```

```sql
Answer
---------
CREATE TABLE Student (
    StudentNro SERIAL NOT NULL PRIMARY KEY,
    FirstName CHARACTER VARYING(32) NOT NULL,
    LastName CHARACTER VARYING(60),
    Address CHARACTER VARYING(100),
    Phone CHARACTER VARYING(15)
);
INSERT INTO Student (FirstName, LastName, Address, Phone)
VALUES 
	('Mary', 'Smith', 'Helsinki', '050 123456'),
	('Math', 'Smith', 'Helsinki', '050 123455'),
	('Kate', 'Smith', 'Helsinki', '050 123456');

SELECT * FROM Student;
```
![625](/img/625.png)


## Simple SELECT Queries
### And, Or, in, greater than, less than

```shell
Questions 7.2.1
----------------
 From here on, we use in the exercises the database whose description is provided in the references.

Write a query that lists all the data on all the books in the database.


```
|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02

```sql
Answer
---------
select * from book

```
![721](/img/721.png)


```shell
Questions 7.2.2
----------------
 Your task is to write a query that outputs the title and the price (in that order) for each book. 
```

```sql
Answer
---------
Select title, price from book

```
![722](/img/722.png)



```shell
Questions 7.2.3
----------------
Provide a query that lists the titles and the prices (in that order) of books that cost less than 20. 
```

```sql
Answer
---------
Select title, price from book
where price <= 20;

```
![723](/img/723.png)


```shell
Questions 7.2.4
----------------
Provide a query that lists the titles and prices (in that order) of the books that cost less than 20 after 5 has been subtracted from their price; that is, their price is decreased by 5, and if the price then is under 20, the book is included in the listing. 
```

```sql
Answer
---------
Select title, price from book
where price -5  <= 20;

```
![724](/img/724.png)



```shell
Questions 7.2.5
----------------
Write a query that fecthes all the data for authors who have "Theodore" as their first name. 
```
|authorid	|surname	|Forename
|----|---------|---------|
|201	|Savielle	|Ernesto
|202	|Adams	|Arthur
|203	|Schmidt	|Abigale
|204	|Weinstein-Welle	|Marie
|205	|Nordqvist	|Arvid
|206	|van Holstein	|Theodore
|207	|Annett	|Josephine

```sql
Answer
---------
select * from author
where forename= 'Theodore';

```
![725](/img/725.png)



```shell
Questions 7.2.6
----------------
Provide a query that displays, in the following order, the title, the number of pages, the price and the year published, for all books which have less than 500 pages but which cost more than 20. 
```

```sql
Answer
---------
select title, pages, price, published from book
where pages < 500 and price > 20;

```
![726](/img/726.png)



```shell
Questions 7.2.7
----------------
Write a query that lists all the data on publishers in "Little Town" and "Creek-on-Trent". 
```

```sql
Answer
---------
select * from publisher
where city in ('Little Town', 'Creek-on-Trent');

```
![727](/img/727.png)


```shell
Questions 7.2.8
----------------
In this last exercise your task is to provide a query that prints:

- The titles of books whose AuthorID is 204 and the number of pages more than 1000.
- And also the titles of books whose AuthorID is 202 and price higher than 20.0. 
```

```sql
Answer
---------
select title from book
where (authorid = 204 and pages > 1000) 
	or 
	(authorid = 202 and price > 20)

```
![728](/img/728.png)



## Sorting Results 

### Sorting, distinct, descending, ascending, count, order by


```shell
Questions 8.2.1
----------------
 In the exercises we again use the database whose description is provided in the references.

Your task is to print all the data on all the publishers, but so that the result table is ordered by the publishers' names. Use alphabetical ordering.
```

```sql
Answer
---------
select * from publisher
order by name asc

```
![821](/img/821.png)


```shell
Questions 8.2.2
----------------
Provide a query that prints the prices and titles (in that order) for all books, but so that the books are ordered by their price such that the most expensive book is first and the cheapest one is the last (i.e. decreasing order). 
```

```sql
Answer
---------
select price, title from book
order by price desc; 

```
![822](/img/822.png)


```shell
Questions 8.2.3
----------------
This task's first part is similar to the previous exercise:

Provide a query that prints the prices and titles (in that order) for all books, but so that the books are ordered by their price such that the most expensive book is the first and the cheapest one is the last (i.e. decreasing order).

IN ADDITION TO THIS omit all books that cost less than 30. 
```

```sql
Answer
---------
select price, title from book
where price > 30
order by price desc

```
![823](/img/823.png)



```shell
Questions 8.2.4
----------------
Write a query that that lists all the AuthorID's found on the table Book, but so, that each AuthorID is listed only once even if there are multiple instances of it. 
```

```sql
Answer
---------
select distinct authorid from book

```
![824](/img/824.png)




```shell
Questions 8.2.5
----------------
Write a query that lists AuthorID and title for each book (in that order), but so that the books are sorted by their AuthorID values in normal, increasing order. Books that share the same AuthorID value should be ordered by their title alphabetically. 
```

```sql
Answer
---------
select authorid, title from book
order by authorid asc, title asc;

```
![825](/img/825.png)



```shell
Questions 8.2.6
----------------
Your task is to provide a query that prints (as a number) how many authors there are in the database. 
 
```

```sql
Answer
---------
select count(authorid) from author

```
![826](/img/826.png)



```shell
Questions 8.2.7
----------------
In this last exercise, write a query that tells the number of titles by AuthorID 204. Include only books that have more than 300 pages. 
 
```

```sql
Answer
---------
select count(*) from book
where authorid = 204 and pages > 300;

```
![827](/img/827.png)






## SQL Aggregate Functions

### Sum, Min, Max, Average





```shell
Questions 11.3.1
----------------
Your first task is to provide a query that counts the total number of books in stock. 

```
|stockid	|bookid	|instock
|----|-------|-------|
|1001	|101	|175
|1002	|102	|252
|1003	|103	|15
|1004	|104	|244
|1005	|105	|53
|1006	|106	|102
|1007	|107	|10
|1008	|109	|5
|1009	|110	|0
|1010	|111	|34
```sql
Answer
---------
select sum(instock) from stock;
```



```shell
Questions 11.3.2
----------------
Write a query that prints the lowest book price. 

```
|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02
```sql
Answer
---------
select MIN(price) from book;
```
![1132](/img/1132.png)


```shell
Questions 11.3.3
----------------
Your task is to devise a query that prints the average number of pages for books that have more than 200 pages. 

```
|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02
```sql
Answer
---------
select AVG(pages) from Book
where pages > 200;
```
![1133](/img/1133.png)


```shell
Questions 11.3.4
----------------
Last, write a query that prints the average price, the highest price and the lowest price (in that order) for books that cost more than 20 but less than 30. You can add more aggregate functions in your SELECT the same way you would include more than one "normal" attribute in a standard SELECT. See the example output below: 

```
|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02
```sql
Answer
---------
select Avg(price) as avg, Max(price) as max, Min(price) as min from book
where price > 20 and price < 30;
```
![1134](/img/1134.png)




## Aggreagte Functions And GROUP BY

### Group by, having, order by

```shell
Questions 12.2.1
----------------
Your task is to write a query that prints for each author (Use AuthorID) the number of pages that author has written in total. In addition, have the AuthordID's listed in an increasing order. See the sample result table below: 

```
|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02
```sql
Answer
---------
select AuthorId, sum(pages) as sum from book
group by authorId
order by authorid;
```
![1221](/img/1221.png)


```shell
Questions 12.2.2
----------------
Your task is to write a query that prints for each row the following: AuthorID, followed by the average price of the books wirtten by the author, followed by the average number of pages in the author's books. Order the listing by AuthorID's in a decreasing order. See the sample result table below.  

(Note: We see in the following chapter how aggregated results can be renamed from, say, "avg" to something more descriptive) 

```
|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02
```sql
Answer
---------
select authorid, avg(price) as avg, avg(pages) as pages from book
group by authorid
order by authorid desc;
```
![1222](/img/1222.png)




```shell
Questions 12.2.3
----------------
Write a query that tells how many books each author has written. On each row provide first the authorid, followed by the number of books. Order the listing so that the author with the most books written is at the top, and at the bottom are those that have written the fewest number of books. The authors that the same number of books written are further ordered by their AuthorID's in an increasing order. See the sample output below. 

```
|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02
```sql
Answer
---------
--it needs to be arrange in this order to get results
select  authorid,count (*) as count from book
group by authorid
order by count desc, authorid asc;
```
![1223](/img/1223.png)



```shell
Questions 12.2.4
----------------
In this last exercise, provide the AuthorID for each author that has written more than 200 pages in total. Order the authors in an increasing order.

```
|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02
```sql
Answer
---------
--it needs to be arrange in this order to get results
select authorid from book
group by authorid
having  sum(pages) > 200
order by authorid asc;
```
![1224](/img/1224.png)



## AS-keyword 

### As, COALESCE


```shell
Questions 13.2.1
----------------
In this last exercise, provide the AuthorID for each author that has written more than 200 pages in total. Order the authors in an increasing order.

```
|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02
```sql
Answer
---------
--it needs to be arrange in this order to get results
select authorid, sum(pages) as "Pages in total" from book
group by authorid
order by authorid asc;
```
![1321](/img/1321.png)

```sql
Questions 13.2.2
----------------
Your task is to write a query that prints for each author (Use AuthorID) the number of pages the author has written in total, and the average price for their books. Have the column that shows the total number of pages labeled "Pages in total" (Note the capital 'P'), and have the column that shows the average price for the author's books labeled "Book price average" (Note the capital 'B')

Include only authors who have written more than 200 pages in total. Also, have the AuthordID's listed in an increasing order. See the sample result table below:  

```

```sql
Answer
---------
--it needs to be arrange in this order to get results
select authorid, sum(pages) as "Pages in total", avg(price) as "Book price average" from book
group by authorid
having sum(pages) > 200
order by authorid asc;
```
![1322](/img/1322.png)




```sql
Questions 13.2.3
----------------
Write a query that shows how many books each author has written. Provide the following kind of format for the result table, including two explanatory columns:

The result table, ordered by AuthordID: 

```
![alttext](/img/imag.png)

```sql
Answer
---------
--it needs to be arrange in this order to get results
select authorid, 'has written' as "Exp1", count(*) as count, 'book(s)' as "Exp2" from book
group by authorid
order by authorid asc;

```
![1323](/img/1323.png)


```sql
Questions 13.2.4
----------------
Your task is to write a query that provides the following kind of result table. That is, provide the number of books that whose price is higher than 20.

```

```sql
Answer
---------
--it needs to be arrange in this order to get results
select 
	'There are' as "Exp1", 
	count(*) as count, 
	'books that cost more than 20' as "Exp2" from book
where price > 20;
```
![1324](/img/1324.png)



```sql
Questions 13.2.5
----------------
In this last exercise, your task is to write a query that provides the following result table:

* Renaname bookid as Book ID (note the white space and capitalised letters)
* Add the explanatory columns with the same, capitalised names.
* Order by bookid
* The column "Discount price" shows the price of the book with 5 subtracted. That is, the price minus 5, so that a book that costs 20 gets 15 as its new price.

(Hint: see the last example in 13.1.3) 

```

```sql
Answer
---------
--it needs to be arrange in this order to get results
select 
	'The new price for book' as "Exp1", 
	Bookid as "Book ID",
	'is' as "Exp2",
	(price - 5 ) as  "Discount price"
from book
order by bookid asc;
```
![1325](/img/1325.png)



## JOINS And Multi-Table Queries

### inner, left, right

N:B. for seen everything use left join

```sql

Questions 14.2.1
----------------
Write a query that lists for each book its title and the name of its publisher. Order the listing alphabetically by the books' titles. Rename the columns as shown on the result table below. 

```


|bookid	|title	|authorid	|publisherid	|pages	|price	|published
|------|-------|-------|-------|-------|-------|-------|
|101	|Three Bearded Men and the Sea	|202	|304	|333	|21.8	|1983-12-04
|102	|The Ghost of the Moor	|202	|301	|310	|23.1	|1980-12-01
|103	|How Computers Work	|205	|303	|870	|16.8	|1999-03-14
|104	|The Hound and other short stories	|204	|302	|475	|35.5	|2000-01-01
|105	|Let's Play Poker and Chess!	|201	|303	|125	|10.5	|2006-04-19
|106	|My life as I see it	|204	|301	|782	|55.2	|1990-10-10
|107	|Upside-down and other children's stories	|204	|301	|245	|20.8	|1970-11-20
|108	|The Winter Everlasting	|204	|301	|1156	|46.8	|1975-12-01
|109	|There and Never Back Again	|206	|302	|370	|29.9	|1998-09-30
|110	|The Crime that never was	|202	|304	|555	|16.4	|2004-03-10
|111	|Learn to Knit	|207	|303	|75	|10.2	|1995-11-02



```sql
Answer
---------
--it needs to be arrange in this order to get results
select 
    book.title as "Book", 
    publisher.name as "Publisher" 
from book
inner join publisher
on book.publisherid = publisher.publisherid
order by book.title asc;
```
![1421](/img/1421.png)


```sql
Questions 14.2.2
----------------
Your task is to write a similar query as in the previous exercise, but in addition to this, you must include in the listing each book's author's last name. Rename the author column "Author". See the result table below: 

```

```sql
Answer
---------
--it needs to be arrange in this order to get results
select 
    book.title as "Book", 
    publisher.name as "Publisher" 
from book
inner join publisher
on book.publisherid = publisher.publisherid
order by book.title asc;
```
![1422](/img/1422.png)


```sql
Questions 14.2.3
----------------
Provide a query that prints each book's title plus how many copies are now in stock. Do not include books that are out of stock. (i.e. zero copies in stock). Order the listing such that the book that has most copies in stock is printed first, and the book with lowest stock is printed last. Further order books with the same number of copies in stock by their title, alphabetically.

Rename the columns as shown on the result table below: 

```

```sql
Answer
---------
--it needs to be arrange in this order to get results
select 
	book.title as "Book", 
	stock.instock as "copies in stock" 
from book
inner join stock
on book.bookid = stock.bookid
where stock.instock >0
order by stock.instock desc;
```
![1423](/img/1423.png)

```sql
Questions 14.2.4
----------------
Write a query that provides the following information for all books published by Taylor & Wells and Classics4you: The book title, named as "Book"; the book price, named as "Price"; the number of pages, named as "Pages"; and finally, the author's surname, named as "Author". Order the listing by the book's title, alphabetically. See the result table below and note the capitalised column names: 

```

```sql
Answer
---------
--it needs to be arrange in this order to get results
select 
	book.title as "Book",
	book.price as "Price",
	book.pages as "Pages",
	author.surname as "Author"
From book
inner join publisher
on publisher.publisherid = book.publisherid
inner join author
on book.authorid = author.authorid
where publisher.name = 'Taylor & Wells' or publisher.name = 'Classics4you'
order by book.title;
```
![1424](/img/1424.png)

```sql
Questions 14.2.5 left join
---------------------------
In this last exercise, write a query that lists in the following order: The author's surname, named as "Surname", the author's forename, named as "Forename", and the number of books wirtten by the author, named as "Books written". NOTE: There may be authors that have not written a single book, and they must not be left out. Order the result table by the authors' surnames, alphabetically. 

```

```sql
Answer
---------
--it needs to be arrange in this order to get results
select 
	author.surname as "Surname",
	author.forename as "Forename",
	count(book.bookid) as "Books written"
from author
left join book
on author.authorid = book.authorid
group by author.authorid
order by author.surname;
```
![1425](/img/1425.png)




## Views And Relations

### create view 

```sql
Questions 15.2.1 
---------------------------
In this first exercise, you've been provided with a query--the code of which is shown below--and your task is to make this query a view. The view should be named BPA. (from Book - Publisher - Author)

Query:

SELECT Book.Title AS Book, Publisher.Name AS Publisher, Author.Surname
AS Author 
   FROM (Book INNER JOIN Author ON Book.AuthorID = Author.AuthorID)
       INNER JOIN Publisher ON Book.PublisherID = Publisher.PublisherID
   ORDER BY Book.Title;

```

```sql
Answer
---------
--it needs to be arrange in this order to get results
Create view BPA as 
SELECT 
	Book.Title AS Book,
	Publisher.Name AS Publisher, 
	Author.Surname AS Author 
FROM Book 
INNER JOIN Author ON Book.AuthorID = Author.AuthorID
INNER JOIN Publisher ON Book.PublisherID = Publisher.PublisherID
ORDER BY Book.Title;
```
![1521](/img/1521.png)


```sql
Questions 15.2.2 
---------------------------
Your task is to create a view that lists in an alphabetical order the titles of the books written by Weinstein-Welle. Name the view WW_Books. Note: The view you created in the previous exercise is available in the database. Use it as a source for the new view. For reference, the old and the to-be-created views are shown below, queried:

The view BPA, created in the first exercise: select * from bpa;

                   Book                   |       Publisher       |     Author
------------------------------------------+-----------------------+-----------------
 How Computers Work                       | Info Press            | Nordqvist
 Learn to Knit                            | Info Press            | Annett
 Let's Play Poker and Chess!              | Info Press            | Savielle
 My life as I see it                      | Taylor & Wells        | Weinstein-Welle
 The Crime that never was                 | Classics4you          | Adams
 The Ghost of the Moor                    | Taylor & Wells        | Adams
 The Hound and other short stories        | Black Wolf Publishing | Weinstein-Welle
 There and Never Back Again               | Black Wolf Publishing | van Holstein
 The Winter Everlasting                   | Taylor & Wells        | Weinstein-Welle
 Three Bearded Men and the Sea            | Classics4you          | Adams
 Upside-down and other children's stories | Taylor & Wells        | Weinstein-Welle
(11 rows)
The view WW_Books that is to be created: select * from WW_Books;

                   Book
------------------------------------------
 My life as I see it
 The Hound and other short stories
 The Winter Everlasting
 Upside-down and other children's stories
(4 rows)

```

```sql
Answer
---------
--it needs to be arrange in this order to get results
create view WW_Books as
select book from bpa
where author = 'Weinstein-Welle'
order by book;
```
![1522](/img/1522.png)


```sql
Questions 15.2.3 
---------------------------
In the database is found, alongside the previoisly-created BPA, a new view BooksInStock. Both views' result tables are shown below:

select * from BPA;

                   book                   |      publisher       |     author
------------------------------------------+-----------------------+-----------------
 How Computers Work                       | Info Press            | Nordqvist
 Learn to Knit                            | Info Press            | Annett
 Let's Play Poker and Chess!              | Info Press            | Savielle
 My life as I see it                      | Taylor & Wells        | Weinstein-Welle
 The Crime that never was                 | Classics4you          | Adams
 The Ghost of the Moor                    | Taylor & Wells        | Adams
 The Hound and other short stories        | Black Wolf Publishing | Weinstein-Welle
 There and Never Back Again               | Black Wolf Publishing | van Holstein
 The Winter Everlasting                   | Taylor & Wells        | Weinstein-Welle
 Three Bearded Men and the Sea            | Classics4you          | Adams
 Upside-down and other children's stories | Taylor & Wells        | Weinstein-Welle
(11 rows)
select * from BooksInStock;

                    book                   | copies in stock
------------------------------------------+-----------------
 The Ghost of the Moor                    |             252
 The Hound and other short stories        |             244
 Three Bearded Men and the Sea            |             175
 My life as I see it                      |             102
 Let's Play Poker and Chess!              |              53
 Learn to Knit                            |              34
 How Computers Work                       |              15
 Upside-down and other children's stories |              10
 There and Never Back Again               |               5
 The Crime that never was                 |               0
(10 rows)
Write a SELECT query that prints exactly the same results as the view BPA, and similarly ordered, but such that books that are out of stock (copies in stock = 0 or stock number missing) are not included. You may find the query easier to write if you make use of the above views . See the result table below:

```

```sql
Answer
---------
--it needs to be arrange in this order to get results
select 
	BPA.book,
	BPA.Publisher,
	BPA.Author
From BPA
inner join BooksInStock
on BPA.Book = BooksInStock.book
where "copies in stock" > 0
order by BPA.book asc;
```
![1523](/img/1523.png)




```sql
Questions 15.2.4 
---------------------------
By using the views BPA and BooksInStock, create a new view that displays the total number of books published by Info Press that are currently in stock. Name the view InfoPressStock. Again, see the view's result table below: The result attribute is named "stock total".

select * from infopressstock;
stock total
-------------
         102
(1 row)
```

```sql
Answer
---------
--it needs to be arrange in this order to get results
create view InfoPressStock as
select 
	sum("copies in stock") as "stock total"
from BPA
inner join booksinstock 
on bpa.book = booksinstock.book
where 
	bpa.publisher = 'Info Press' and "copies in stock" >0;
```
![1524](/img/1524.png)




```sql
Questions 15.2.5
---------------------------
Last, write the command that removes the view BPA from the database despite all the views that you have created to depend on it. 
```

```sql
Answer
---------
--it needs to be arrange in this order to get results
drop View bpa;
```
![1525](/img/1525.png)





```shell
Questions 6.2.4
----------------
 
```







```sql
Answer
---------

```
![624](/img/624.png)