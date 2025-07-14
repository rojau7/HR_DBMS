----TASK 1
/*Based on Above Database Solve the following Task:--

1)WRITE A QUERY FOR SELECT STATEMENTS :- Syntax of SELECT STATEMENT:-
SELECT
select_list FROM
table_name; */

-- A) To get data from all the rows and columns in the employees table:

SELECT*FROM employees

--B. To select data from the employee_id, first_name, last_name, and hire_date of all rows:

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE FROM employees

--C. To get the first name, last name, salary, and new salary:

SELECT first_name,last_name,salary,salary*1.10 as NewSalary from employees

--D. Increase the salary two times and named as New_SALARY from employees table

SELECT first_name,last_name, salary, salary*2.0 AS Newsalary from employees

/*2)WRITE A QUERY FOR ORDER BY STATEMENTS :-
Syntax of ORDER BY Statements:-
SELECT
select_list FROM
table_name
ORDER BY
sort_expression1 [ASC | DESC],
sort_expression 2[ASC | DESC];*/

--A.returns the data from the employee id, first name, last name, hire date, and salary column of the employees table: 

SELECT employee_id,first_name,last_name,hire_date,salary from employees

--B.to sort employees by first names in alphabetical order:

SELECT employee_id,first_name,last_name,hire_date,salary from employees
order by first_name ASC

--C.to sort the employees by the first name in ascending order and the last name in descending order:

SELECT employee_id,first_name,last_name,hire_date,salary from employees
order by first_name ASC,last_name DESC

--D.to sort employees by salary from high to low:

SELECT employee_id,first_name,last_name, hire_date,salary from employees
order by salary DESC

--E.to sort the employees by values in the hire_date column from:

SELECT employee_id,first_name,last_name,hire_date,salary from employees
order by hire_date ASC

--F.sort the employees by the hire dates in descending order:

SELECT employee_id,first_name,last_name,hire_date,salary from employees
order by hire_date DESC

/*3)WRITE A QUERY FOR DISTINCT STATEMENTS :- Syntax of DISTINCT Statements:-
SELECT DISTINCT
column1, column2, ... FROM
table1;*/

--A.selects the salary data from the salary column of the employees table and sorts them from high to low:

SELECT employee_id,first_name,last_name, salary from employees
order by salary DESC

--B.select unique values from the salary column of the employees table:

SELECT distinct salary from employees

--C.selects the job id and salary from the employees table:

SELECT job_id, salary from employees

--D.to remove the duplicate values in job id and salary:

select distinct job_id,salary from employees

--E.returns the distinct phone numbers of employees:

SELECT distinct phone_number from employees

/*4)WRITE A QUERY FOR TOP N STATEMENTS :- Syntax of TOP N Statements(N=Will be any nos) SELECT TOP N
column_list FROM
table1
ORDER BY column_list*/

--A. returns all rows in the employee table sorted by the first_name column

SELECT*from employees
order by first_name ASC

--B. to return the first 5 rows in the result set returned by the SELECT clause:

select top 5* from employees
order by employee_id

--C. to return five rows starting from the 4th row:

SELECT*from employees
ORDER by employee_id
OFFSET 3 rows 
fetch next 5 rows ONLY

--D. gets the top five employees with the highest salaries.

SELECT top 5 * from employees
order by salary DESC

--E. to get employees who have the 2nd highest salary in the company

SELECT*from employees
WHERE salary = (
    select distinct salary from employees
    order by salary DESC
    OFFSET 1 ROWS fetch next 1 rows ONLY
)

/*5)WRITE A QUERY FOR WHERE CLAUSE and COMPARISON OPERATORS :- Syntax of WHERE CLAUSE and COMPARISON OPERATORS:--
SELECT
column1, column2, ... FROM
table_name WHERE
condition;*/

--A.query finds employees who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order.

SELECT * from employees
WHERE salary > 14000
ORDER by salary DESC

--B. query finds all employees who work in the department id 5.

SELECT*from employees
WHERE department_id = 5

--C. query finds the employee whose last name is Chen

SELECT*from employees
WHERE last_name like 'chen'

--D. To get all employees who joined the company after January 1st, 1999

SELECT*from employees
 WHERE hire_date = '1999-01-01'

--E. to find the employees who joined the company in 1999,

SELECT*from employees
where YEAR(hire_date) = 1999

--F. statement finds the employee whose last name is Himuro

SELECT*from employees
WHERE last_name like 'Himuro'

--G. the query searches for the string Himuro in the last_name column of the employees table.

SELECT*from employees
WHERE last_name like '%Himuro%'

--H. to find all employees who do not have phone numbers:

SELECT*from employees
WHERE phone_number is null or phone_number = ' '

--I. returns all employees whose department id is not 8.

SELECT*from employees
WHERE department_id <> 8

--J. finds all employees whose department id is not eight and ten.

SELECT*from employees
WHERE department_id not in (8,10)

--K. to find the employees whose salary is greater than 10,000

SELECT*from employees
WHERE salary>10000

--L. finds employees in department 8 and have the salary greater than 10,000:

SELECT*from employees
WHERE department_id = 8 and  salary > 10000

--M. the statement below returns all employees whose salaries are less than 10,000:

SELECT*from employees
WHERE salary<10000

--N. finds employees whose salaries are greater than or equal 9,000:

SELECT*From employees
WHERE salary>= 9000

--O. finds employees whose salaries are less than or equal to 9,000:

SELECT*from employees
where salary<= 9000

/*6)WRITE A QUERY FOR:- courses*/

create table courses(course_id int Primary key, course_name varchar(100))

--A. adds a new column named credit_hours to the courses table 

alter table courses
ADD credit_hours INT

--B. adds the fee and max_limit columns to the courses table and places these column after the course_name column

alter table courses
add fee DECIMAL(10,2),max_limit INT

--C. changes the attribute of the fee column to not null 

alter table courses
add fee DECIMAL(10,2) not NULL

--D. to remove the fee column of the course table 

alter table courses 
drop column fee 

--F. remove the max_limit and credit_hours of the courses table. 

ALTER table courses
drop column max_limit,credit_hours

/*6) write a query for SQL foreign key constraints
SQL foreign key constraints examples 
the following tables projects and project_assignments tables */

--Create the projects table (parent table)

CREATE table projects( project_id int Primary key,
project_name varchar(255),
[start_date] date not null,
end_date date not null)

--Then create the project_milestones table (child table)

CREATE table project_milestones(milestone_id int Primary key,
project_id int,milestone_name varchar(100),
FOREIGN key (project_id) REFERENCES projects(project_id)
on update CASCADE
on DELETE CASCADE
)

--OR IF project_milestones table already exists

alter table project_milestones
add CONSTRAINT FK_project_milestones_project
FOREIGN KEY (project_id)
REFERENCES project(project_id)
on update CASCADE
on DELETE CASCADE

-------TASK 2:
/*Logical Operators and Special Operators
1)WRITE A QUERY FOR LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:- 
*/
--Part 1:-

--A.finds all employees whose salaries are greater than 5,000 and less than 7,000:

SELECT*FROM employees
WHERE salary > 5000 and salary < 7000

--B. finds employees whose salary is either 7,000 or 8,000:

SELECT*from employees
where salary in (7000,8000)

--C. finds all employees who do not have a phone number:

SELECT*from employees
WHERE phone_number is NULL

--D. finds all employees whose salaries are between 9,000 and 12,000.

SELECT*from employees
WHERE salary BETWEEN 9000 and 12000

--E. finds all employees who work in the department id 8 or 9.

SELECT*From employees
where department_id in (8,9)

--F. finds all employees whose first name starts with the string jo

SELECT*From employees 
where first_name like 'jo%'

--G. finds all employees with the first names whose the second character is h

SELECT*from employees
where first_name LIKE '_h%'

--H. finds all employees whose salaries are greater than all salaries of employees in the department 8:

SELECT*from employees
WHERE salary > ALL(
    select salary FROM employees
     where department_id = 8
)

--Part 2:-

--A. finds all employees whose salaries are greater than the average salary of every department:

select*from employees
WHERE salary > (
    select AVG(salary) from employees
)

--B. finds all employees who have dependents:

SELECT*from employees
WHERE employee_id in (
    select employee_id from departments
)

--C. to find all employees whose salaries are between 2,500 and 2,900:

SELECT*from employees 
where salary BETWEen 2500 and 2900

--D. to find all employees whose salaries are not in the range of 2,500 and 2,900:

SELECT*from employees 
where salary not BETWEEN 2500 and 2900

--E. to find all employees who joined the company between January 1, 1999, and December 31, 2000:

SELECT*From employees
WHERE hire_date BETWEEN '1999-01-01' and '2000-12-31'

--F. to find employees who have not joined the company from January 1, 1989 to December 31, 1999:

SELECT*from employees
where hire_date not BETWEEN  '1989-01-01' and '1999-12-31'

--G. to find employees who joined the company between 1990 and 1993:

SELECT*from employees
where hire_date BETWEEN '1990-01-01' and '1993-12-31'

--Part 3:-

--A. to find all employees whose first names start with Da 

select*From employees
where first_name LIKE 'Da%'

--B. to find all employees whose first names end with er

SELECT*from employees
where first_name like '%er'

--C. to find employees whose last names contain the word an:

SELECT*From employees
WHERE last_name LIKE '%an%'

--D. retrieves employees whose first names start with Jo and are followed by at most 2 characters:

SELECT*from employees
WHERE first_name like 'Jo%' or first_name LIKE 'Jo__'

--E. to find employees whose first names start with any number of characters and are followed by at most one character:

SELECT*From employees
WHERE LEN(first_name) < = 2

--F. to find all employees whose first names start with the letter S but not start with Sh:

SELECT*From employees
where first_name like 's%'
and first_name not like 'sh%'

--Part 4:-

--A. retrieves all employees who work in the department id 5.

SELECT*From employees 
WHERE department_id = 5

--B. To get the employees who work in the department id 5 and with a salary not greater than 5000.

SELECT*From employees
WHERE department_id = 5
and salary < = 5000

--C. statement gets all the employees who are not working in the departments 1, 2, or 3.

SELECT*from employees
where department_id not IN (1,2,3)

--D. retrieves all the employees whose first names do not start with the letter D.

SELECT*from employees
WHERE first_name not like 'D%'

--E. to get employees whose salaries are not between 5,000 and 1,000.

SELECT*From employees
where salary not BETWEEN 5000 and 1000

--Part 5:-

--A. Write a query to get the employees who do not have any dependents by above image

SELECT e.*from employees e 
left join dependents d 
on e.employee_id = d.employee_id
WHERE d.employee_id is null 

--B. To find all employees who do not have the phone numbers

SELECT*from employees
where phone_number is null

--C. To find all employees who have phone numbers

SELECT*from employees
where phone_number is not NULL

--TASK 3: JOINS:-
 
--1) write a query to 

--A. To get the information of the department id 1,2 and 3

SELECT*from departments 
where department_id in (1,2,3)

--B. To get the information of employees who work in the department ID 1,2, and 3

SELECT*from employees
WHERE department_id in (1,2,3)

--C. write a query to get the first_name, last_name, job_title, and department name of employees who work in department id 1,2 and 3

SELECT e.first_name,e.last_name,j.job_title,d.department_id
from employees e 
join departments d 
on e.department_id = d.department_id
join jobs j 
on j.job_id = e.job_id
WHERE e.department_id in (1,2,3)

--SQL LEFT JOIN: Wite a Query :--

--A. To query the country names of US, UK, and China

SELECT*From countries
WHERE country_name in ('US','UK','CHINA')

--B. query retrieves the locations located in the US, UK and China:

SELECT l.*
from locations l 
join countries c 
on l.Country_ID = c.country_id 
WHERE c.country_name in ('us','uk','china')

--C. To join the countries table with the locations table

SELECT c.country_name,l.*
from countries c 
LEFT join locations l 
on c.country_id = l.Country_ID

--D. to find the country that does not have any locations in the locations table

SELECT c.*
from countries c 
LEFT join locations l 
ON c.country_id = l.Country_ID
WHERE l.Country_ID is NULL

--E. Write a query to join 3 tables: regions, countries, and locations

SELECT r.region_name,c.country_name,l.City,l.street_Address
FROM regions r 
join countries c 
on r.region_id = c.region_id
LEFT join locations l 
on c.country_id = l.Country_ID

--SQL self-join

/* 1.The manager_id column specifies the manager of an employee. Write a query statement to joins the employees 
table to itself to query the information of who reports to whom.*/

SELECT e.employee_id as Emp_id,
e.first_name as EmpName,
m.employee_id as mgr_id,
m.first_name as mgrName
from employees e 
inner JOIN employees m  
on e.employee_id = m.employee_id

/* 2. The president does not have any manager. In the employees table, the manager_id of the row that contains the president is NULL. */

SELECT e.employee_id as emp_id,
e.first_name as EmpName,
m.employee_id as mgrID,
m.first_name as mgrName
from employees e 
left join employees m 
on e.employee_id = m.employee_id

--SQL FULL OUTER JOIN clause

--1. create table fruits 

create table fruits(
    fruit_id int Primary KEY,
    fruit_name VARCHAR(255) not NULL,
    basket_id INTEGER
)
--2. create table baskets

create table baskets(
    basket_id int PRIMARY KEY,
    basket_name VARCHAR(255) not null
)
--3. insert some sample data into the baskets and fruits tables.

insert into baskets values (1,'A'),(2,'B'),(3,'C')

insert into fruits values (1, 'Apple', 1),(2, 'Orange', 1),
(3, 'Banana', 2),(4, 'Strawberry', NULL)

--Question:-

/*A. Write a query to each fruit that is in a basket and each basket that has a fruit, but also returns each fruit that is not in any basket 
and each basket that does not have any fruit.*/

SELECT b.basket_id,b.basket_name,
f.fruit_id, f.fruit_name
from baskets b
full OUTER JOIN fruits f 
on b.basket_id = f.basket_id

--B. Write a query to find the empty basket, which does not store any fruit

SELECT b.basket_id,b.basket_name
from baskets b
left join fruits f
on b.basket_id = f.basket_id
WHERE fruit_id is NULL

--C. Write a query which fruit is not in any basket

SELECT f.fruit_id,f.fruit_name
from fruits f 
LEFT join  baskets b 
on f.basket_id = b.basket_id 
WHERE f.basket_id is NULL or b.basket_id is NULL

--SQL CROSS JOIN clause

--1. create table sales_organisation 

create table sales_organisation(
    sales_org_id int PRIMARY KEY,
    sales_org VARCHAR(255)
)

--2. create table sales_channel

create table sales_channel(
    channel_id int PRIMARY KEY,
    channel VARCHAR(255)
)
--3. insert some sample data into the sales_organisation and sales_channel tables.

insert into sales_organisation VALUES (1, 'Domestic'),(2, 'Export')

INSERT into sales_channel VALUES(1, 'Wholesale'),(2, 'Retail'),
(3, 'eCommerce'),(4, 'TV Shopping')

--Question:-

--1.Write a Query To find the all possible sales channels that a sales organization

SELECT so.sales_org_id,so.sales_org,sc.channel
from sales_organisation so 
cross join sales_channel sc 

/*TASK 4:

SQL GROUP BY clause

Questions:- */

--A. to group the values in department_id employees table:

SELECT department_id from employees
GROUP by department_id

--B. to count the number of employees by department:

SELECT department_id, COUNT(*) as employee_count
from employees
group by department_id

--C. returns the number of employees by department

SELECT department_id, COUNT(*) as employee_count
from employees
GROUP by department_id

--D. to sort the departments by headcount:

SELECT department_id, count(*) as headcount
from employees
GROUP by department_id 
order BY headcount DESC

--E. to find departments with headcounts are greater than 5:

SELECT department_id, count(*) as headcount
from employees
GROUP by department_id
HAVING COUNT(*) > 5

--F. returns the minimum, maximum and average salary of employees in each department.

SELECT department_id,
MIN(salary) as minisalary,
MAX(salary) as maxsalary,
avg(salary) as averagesalary
from employees
group by department_id

--G. To get the total salary per department,

SELECT department_id, SUM(salary) as totalSalary from employees
GROUP by department_id

/*H. groups rows with the same values both department_id and job_id columns in the same group then
return the rows for each of these groups*/

SELECT department_id, job_id,
COUNT(*) as employee_count
from employees
GROUP by department_id,job_id

--SQL HAVING clause Questions:- Write a Query

--1. To get the managers and their direct reports, and to group employees by the managers and to count the direct reports.

SELECT manager_id, count(*) as directReport from employees
WHERE manager_id is not NULL
GROUP by manager_id

--2. To find the managers who have at least five direct reports

SELECT manager_id, count(*) as direct_reports from employees
where manager_id is not NULL 
GROUP by manager_id
having COUNT(*) > = 5


--3. Calculate the sum of salary that the company pays for eacb department and selects only the department with the sum of salary between 20000 and 30000

SELECT department_id, SUM(salary) as total_salary from employees
GROUP by department_id
having SUM(salary) BETWEEN 20000 and 30000

--4. To find the department that has employees with the lowest salary greater than 10000

SELECT department_id, min(salary) as lowest_salary from employees
GROUP by department_id
having MIN(salary) > = 10000

--5. To find the departments that have the average salaries of employees between 5000 and 7000

SELECT department_id, AVG(salary) as averageSalary from employees
GRoup by department_id
having AVG(salary) BETWEEN 5000 and 7000

/*TASK 5 (Other Queries)
1)SQL UNION operator Quetsion:- */

--Write a Query to combine the first name and last name of employees and dependents

SELECT first_name + ' ' + last_name as FullName from employees

UNION

SELECT first_name + ' ' + last_name as FullName from dependents 

--2)SQL INTERSECT operator Question :-

--Write a Query to Applies the INTERSECT operator to the A and B tables and sorts the combined result set by the id column in descending order.

select employee_id from employees

INTERSECT

SELECT employee_id from dependents

--3)SQL EXISTS operator Write a Query

--A. finds all employees who have at least one dependent.

SELECT*from employees e 
WHERE exists (
    select 1 from dependents d 
    WHERE d.employee_id = e.employee_id 
)

--B . finds employees who do not have any dependents:

SELECT*from employees e 
WHERE not exists(
    select 1 from dependents d 
    where d.employee_id = e.employee_id
)

--4) SQL CASE expression Questions:-

--A. Suppose the current year is 2000. How to use the simple CASE expression to get the work anniversaries of employees by

SELECT employee_id,
first_name + ' ' + last_name as FullName,
YEAR(hire_Date) as Hire_year,
2000-YEAR(hire_date) as Year_Worked,
case 
when 2000-YEAR(hire_date) = 1 then '1st Year Anniversary'
when 2000-YEAR(hire_Date) = 5 then '2nd Year Anniversary'
when 2000-YEAR(hire_Date) = 10 then '10th Year Anniversary'
Else 'Other'
END AS work_anniversary
from employees

/*B. Write a Query if the salary is less than 3000, the case expression returns "low" if the salary is between 3000 and 5000, 
it returns “average”. When the salary is greater than 5000, the CASE expression returns “High”.*/

SELECT employee_id,
first_name + ' ' + last_name as FullName,
salary,
CASE 
WHEN salary < 3000 then 'Low'
WHEN Salary BETWEEN 3000 and 5000 then 'Average'
WHEN salary > 5000 then 'High'
END AS Salary_Band
from employees

/*5) SQL UPDATE statement
Suppose the employee id 192 Sarah Bell changed her last name from Bell to Lopez and you need to update her record in the employees table.
Write a Query to update Sarah’s last name from Bell to Lopez*/

--1. How to make sure that the last names of children are always matched with the last name of parents in the employees table,

UPDATE d 
set d.last_name = e.last_name
from dependents d
inner join employees e 
on d.employee_id = e.employee_id

/*FINAL TASK (Advanced Queries) SQL SUBQUERY

Consider the following employees and departments tables from the sample database
Suppose you have to find all employees who locate in the location with the id 1700. You might come up with the following solution.*/

--1. find all departments located at the location whose id is 1700:

SELECT*from departments
WHERE location_id = 1700

--2. find all employees that belong to the location 1700 by using the department id list of the previous query:

SELECT employee_id,first_name,last_name from employees
WHERE department_id IN (1,3,8,10,11)
ORDER by first_name, last_name

/* 
This solution has two problems:

1) It manually looks up department IDs to find those at location_id = 1700, but the original question refers to location — not departments.
2) Manually checking or hardcoding department IDs isn't scalable. If the location changes, you have to rewrite the query.

➡️ A better solution is to use a subquery to dynamically find departments based on location_id.
Subqueries are more efficient, dynamic, and ideal for large datasets.

In this task, we focus on SELECT statements using subqueries.
*/

--Question: Write a Query :-

/*A. Combine Above two queries using subquery in order find all departments located at the location whose id is 1700 
and find all employees that belong to the location 1700 by using the department id list of the previous query*/

SELECT employee_id,first_name,last_name from employees
WHERE department_id in (
    SELECT department_id from departments
    where location_id = 1700
)
order by first_name,last_name

--B. to find all employees who do not locate at the location 1700:

SELECT employee_id,first_name,last_name from employees
WHERE department_id not in (
    SELECT department_id from departments
    where location_id = 1700
)

--C. finds the employees who have the highest salary:

SELECT employee_id,first_name,last_name,salary from employees
WHERE salary = (
    SELECT MAX(salary) from employees
)

--D. finds all employees who salaries are greater than the average salary of all employees:

SELECT employee_id,first_name,last_name,salary from employees
where Salary > (
    select AVG(salary) from employees
)

--E. find all departments which have atleast one employee with the salary is greater than 10000:

SELECT DISTINCT department_id from employees
where salary>10000

--F. finds all departments that do not have any employee with the salary greater than 10,000:

SELECT department_id from departments
where department_id NOT IN(
    SELECT department_id from employees
    WHERE salary>10000
)

--G. to find the lowest salary by department:

SELECT department_id,min(salary) as min_salary from employees
GROUP by department_id

--H. find all employees whose salaries are greater than the lowest salary of every department:

select employee_id,first_name,last_name,salary from employees
where salary > ALL (
    select MIN(salary) from employees
    group by department_id
)

--I. finds all employees whose salaries are greater than or equal to the highest salary of every department

select employee_id,first_name,last_name,salary from employees
WHERE salary >= All (
    select MAX(salary) from employees
    group by department_id
) 

--J. returns the average salary of every department

select department_id, AVG(salary) as AvgSalary from employees
group by department_id

--K. to calculate the average of average salary of departments :

SELECT AVG(avg_salary) as Avg_of_avg_Salary 
from (
    SELECT department_id, AVG(salary) as Avg_Salary
    from employees 
    group by department_id
) AS dept_avg

--L. find the salaries of the employees, their average salary, and the difference between the salary of each employee and the average salary. 

SELECT employee_id,first_name,last_name,salary,
(SELECT AVG(salary) from employees e2
WHERE e2.department_id = e1.department_id) as AvgSalary,

salary - (select AVG(salary) from employees e2
WHERE e2.department_id = e1.department_id) AS diff_fromavg
from employees e1