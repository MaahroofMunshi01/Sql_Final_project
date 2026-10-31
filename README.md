# 🎓 Final SQL Project – University Database Management System

## 📌 Project Overview
This project focuses on designing and managing a **University Database Management System** using MySQL. It stores and manages information about students, departments, courses, instructors, and student enrollments.

The project demonstrates practical SQL skills, including database creation, table relationships, data manipulation, joins, aggregate functions, subqueries, date functions, and window functions.

## 🎯 Objectives
- Create a relational database for university management.
- Store student, department, course, instructor, and enrollment information.
- Perform CRUD operations to insert and update records.
- Retrieve information using SQL queries.
- Analyze student enrollments and course statistics.
- Practice basic and advanced SQL concepts.

## 🛠️ Technologies Used
- **Database:** MySQL
- **Tool:** MySQL Workbench
- **Language:** SQL

## 🗄️ Database Structure
**Database Name:** `final_project`

The project contains five tables:

| Table Name | Description |
|---|---|
| `Departments` | Stores department IDs and department names. |
| `Students` | Stores student details, including names, email addresses, birth dates, and enrollment dates. |
| `Courses` | Stores course names, department IDs, and credit values. |
| `Instructors` | Stores instructor details, department assignments, email addresses, and salaries. |
| `Enrollments` | Stores student course enrollments and enrollment dates. |

## 🔗 Table Relationships
- Each department can have multiple courses.
- Each department can have multiple instructors.
- Students can enroll in multiple courses.
- Each course can have multiple students.
- The `Enrollments` table connects students and courses through foreign keys.
- A unique constraint prevents the same student from enrolling in the same course more than once.

## 📚 SQL Concepts Covered

### 1. Database and Table Creation
- `CREATE DATABASE`
- `CREATE TABLE`
- Primary keys
- Foreign keys
- `AUTO_INCREMENT`
- `NOT NULL`
- `UNIQUE`
- `DEFAULT`
- Constraints

### 2. CRUD Operations
- **Create:** Insert new students, courses, instructors, and enrollments.
- **Read:** Retrieve records using `SELECT`.
- **Update:** Modify student emails, course credits, instructor salaries, enrollment dates, and department names.

### 3. Filtering and Sorting
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `IN`

### 4. Joins
- `INNER JOIN`
- `LEFT JOIN`

### 5. Aggregate Functions
- `COUNT()`
- `AVG()`
- `MAX()`
- `ROUND()`

### 6. Grouping and Filtering Groups
- `GROUP BY`
- `HAVING`
- `COUNT(DISTINCT ...)`

### 7. String Functions
- `CONCAT()`

### 8. Date and Time Functions
- `CURDATE()`
- `DATEDIFF()`
- `YEAR()`
- `MONTH()`
- `MONTHNAME()`
- `DATE_FORMAT()`

### 9. Subqueries
- Find students enrolled in courses with more than 10 students.

### 10. Window Functions
- `COUNT() OVER()`
- Running total calculation using `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`.

### 11. Conditional Logic
- `CASE WHEN` to classify students as Senior or Junior based on enrollment duration.

## 📊 Project Queries and Tasks

The project includes 16 numbered question sections covering the following tasks:

| Question | Task |
|---|---|
| Q1 | Perform CRUD operations on students, courses, instructors, and enrollments. |
| Q2 | Retrieve students enrolled after December 31, 2022. |
| Q3 | Display the first five Mathematics courses with their department names and credits. |
| Q4 | Find courses with more than five student enrollments. |
| Q5 | Find students enrolled in both Introduction to SQL and Data Structures. |
| Q6 | Retrieve students enrolled in Introduction to SQL or Data Structures. |
| Q7 | Calculate the average credits of all courses. |
| Q8 | Find the maximum instructor salary in the Computer Science & Engineering department. |
| Q9 | Count distinct enrolled students in each department. |
| Q10 | Display students and their enrolled courses using inner joins. |
| Q11 | Display all students, including those without course enrollments. |
| Q12 | Find students enrolled in courses having more than 10 students. |
| Q13 | Extract enrollment year and month using date functions. |
| Q14 | Display instructor IDs, names, and full names. |
| Q15 | Calculate a running total of enrollment records. |
| Q16 | Calculate enrollment duration and classify students as Senior or Junior. |

## ⚙️ How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your MySQL server.
3. Open the `Final_project.sql` file.
4. Execute the SQL script to create the database, tables, and sample records.
5. Run the queries individually to explore the results.

**Note:** Execute the script in the correct order because some queries depend on records inserted or updated by earlier statements.

## 📈 Learning Outcomes
Through this project, I practiced:
- Designing relational database schemas.
- Establishing relationships using primary and foreign keys.
- Performing CRUD operations.
- Retrieving data from multiple tables.
- Applying aggregate and date functions.
- Using subqueries and conditional statements.
- Calculating running totals using window functions.
- Analyzing student enrollment and course information.

## 👨‍💻 Author
**Maahroof Munshi**

---

⭐ *This project demonstrates my practical SQL knowledge and my ability to work with relational databases using MySQL.*
