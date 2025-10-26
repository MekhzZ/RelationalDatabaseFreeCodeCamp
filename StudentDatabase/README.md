# Student Database
This project involves a set of Bash scripts and a PostgreSQL database setup designed to manage and perform analytical queries on student, major, and course information. It includes scripts for database creation, data insertion from CSV files, and data querying to extract specific information about students and courses, demonstrating foundational skills in shell scripting, SQL, and relational database management.

## Features
- **Database Setup:** SQL script (students.sql) to create the necessary tables (students, majors, courses, and majors_courses) with primary and foreign keys.

- **Data Import:** A Bash script (insert_data.sh) to read data from external CSV files (e.g., courses.csv and students.csv) and insert it into the PostgreSQL database.

- **Data Transformation:** Logic within the insertion script to handle and resolve foreign key dependencies by checking for existing majors and courses before inserting new records and linking them via the majors_courses table.

- **Complex SQL Queries:** A Bash script (student_info.sh) containing 11 distinct SQL queries to perform various data analyses, including aggregation, filtering, ordering, and joining across multiple tables.

## Technologies

- bash scripting, PostgreSQL, psql

## Project Structure

- **students.sql**: Database schema definition (DDL) and initial data population.

- **insert_data.sh**: Script to populate the database tables from external CSV files.

- **student_info.sh**: Script containing various analytical queries executed against the populated database.

## Database Schema

## Learnings

- **Shell Scripting for Database Automation:** Gained experience in using Bash to automate database tasks, including truncating tables and iterating over external data files for insertion.

- **PostgreSQL Querying:** Developed proficiency in writing complex SQL queries involving:

- **Filtering:** Using WHERE, ILIKE, LIKE, and logical operators (AND, OR).

- **Aggregation and Grouping:** Using COUNT, AVG, ROUND, GROUP BY, and HAVING.

- **Joining Tables:** Implementing JOIN, INNER JOIN, RIGHT JOIN, and FULL JOIN to retrieve related data across the schema.

- **Data Ordering and Limiting:** Using ORDER BY and LIMIT clauses.

- **Data Integrity and Foreign Keys:** Understanding the importance of foreign keys (major_id, course_id) and implementing logic in the insert_data.sh script to ensure relational integrity by creating master records before linking them.

- **Dynamic Data Handling:** Handling potential NULL values for foreign keys during data insertion (e.g., if a student has no major).