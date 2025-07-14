CREATE TABLE regions (
region_id INT PRIMARY KEY,
region_name VARCHAR (25) DEFAULT NULL
)
---------
CREATE table countries( country_id char(2) Primary key,
country_name varchar(40) default null,
region_id int not null,
FOREIGN KEY (region_id) REFERENCES regions(region_id) 
on DELETE CASCADE
on UPDATE CASCADE
)
---------
CREATE table locations (location_id int Primary key,
street_address VARCHAR(40) default null,
postal_code varchar(12) DEFAULT null,
city VARCHAR(30) not NULL,
State_Province VARCHAR(25) DEFAULT NULL,
Country_ID char(2) not NULL,
foreign KEY(country_id) REFERENCES countries(country_id)
on DELETE cascade
on UPDATE CASCADE
)
---------
CREATE TABLE jobs ( job_id int Primary Key,
job_title varchar(35) not null,
min_salary DECIMAL(8,2) DEFAULT null,
max_salary decimal(8,2) default null)
---------
CREATE table departments(department_id INT PRIMARY KEY,
Department_Name VARCHAR(30) NOT NULL,
location_id int DEFAULT NULL,
FOREIGN KEY (location_id) REFERENCES locations(location_id)
on DELETE cascade
on UPDATE CASCADE
)
---------
CREATE table employees(employee_id int Primary key,
first_name varchar(20) default null,
last_name varchar(25) default null,
email varchar(100) not null,
phone_number varchar(20) default null,
hire_date date not null,
job_id int not null,
salary decimal (8,2) not null,
manager_id int default null,
department_id int default null,
foreign key (job_id) REFERENCES jobs(job_id)
on update cascade,
foreign key (department_id) REFERENCES departments(department_id)
on delete cascade
on update cascade,
foreign key (manager_id) REFERENCES employees(employee_id)
)
---------
CREATE table dependents(dependent_id int PRIMARY KEY,
first_name VARCHAR(50) not NULL,
last_name VARCHAR(50) not NULL,
relationship VARCHAR(25) not NULL,
employee_id int not NULL
foreign KEY (employee_id) REFERENCES employees(employee_id)
ON DELETE CASCADE
on UPDATE CASCADE
)
---------
