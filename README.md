# 💼 HR_DBMS – SQL-Based Human Resource Database Project

This project is a complete **Human Resource Database Management System** developed using **MS SQL Server** and **Azure Data Studio**. It simulates real-world HR operations by managing employees, departments, jobs, locations, and more within a normalized relational schema.

This project was created as part of my SQL learning journey to practice real-life database design, foreign key relationships, and multi-layered SQL queries for business reporting and analysis.

---

## 📦 What’s Inside

- `schema.sql` – Table creation scripts for regions, countries, locations, departments, jobs, employees, and dependents
- `sample_data.sql` – Sample `INSERT` statements used to populate the HR schema
- `queries.sql` – SQL practice covering `SELECT`, `JOIN`, `ORDER BY`, `DISTINCT`, `TOP N`, `WHERE`, subqueries, and foreign key demos
- `README.md` – Project overview and usage guide

---

## ⚙️ Tools & Technologies

- **SQL Server Management Studio (SSMS)** / **Azure Data Studio** 
- **T-SQL (Transact-SQL)**  
- ERD-based relational schema  
- Normalization and foreign key constraints

---

## 🧠 What I Learned

✔ Designing relational schemas with proper normalization  
✔ Applying constraints like `PRIMARY KEY`, `FOREIGN KEY`, `ON DELETE CASCADE`, and `ON UPDATE CASCADE`  
✔ Writing efficient SQL queries for data retrieval, sorting, and filtering  
✔ Using joins, subqueries, `OFFSET-FETCH`, and aggregate functions  
✔ Understanding referential integrity in database systems

---

## 🗂 Schema Overview

- **Regions** → Contains region_id and region_name  
- **Countries** → Connected to regions via `region_id`  
- **Locations** → Linked to countries via `country_id`  
- **Departments** → Linked to locations  
- **Jobs** → Defines job roles and salary ranges  
- **Employees** → Central table with references to job, department, and self (manager)  
- **Dependents** → Linked to employees

---
---

## 📌 Use Case

This project replicates a real-world HR system in a simplified academic context.  
It serves as a strong foundation for:

- 📐 Database design principles  
- 🧪 SQL querying practice  
- 🎯 Interview preparation for data and business analyst roles

---

## 📝 License

This project is licensed under the **MIT License**.  
You are free to use, modify, and distribute this code with credit.

For full license terms, see the [LICENSE](./LICENSE) file.

---

## 🙋‍♀️ About Me

I'm learning SQL through hands-on projects to strengthen my skills in data analysis and relational database design.  
Connect with me if you'd like to exchange ideas or collaborate on similar learning journeys!

-----

## 🧪 Sample SQL Highlights

```sql
-- Get top 5 highest-paid employees
SELECT TOP 5 * FROM employees ORDER BY salary DESC;

-- Employees with salary > 14000
SELECT first_name, last_name, salary FROM employees WHERE salary > 14000;

-- Find second highest salary using subquery
SELECT * FROM employees
WHERE salary = (
  SELECT MAX(salary) FROM employees
  WHERE salary < (SELECT MAX(salary) FROM employees)
);

------


