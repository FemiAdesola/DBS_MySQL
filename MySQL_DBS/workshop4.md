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
