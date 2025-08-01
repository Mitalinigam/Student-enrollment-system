#  Student Course Enrollment System (MySQL Project)

This project is a simple SQL-based database system designed to manage student enrollments in various courses. It demonstrates core concepts like relational tables, primary/foreign keys, and SQL queries for data manipulation and analysis.

---

## Features

- Add and manage **Students**, **Courses**, and **Enrollments**
- Perform **JOIN operations** to relate data
- Run queries to:
  - View student enrollments
  - Count students per course
  - Find students not enrolled in any course
  - List courses with no students
  - Show full enrollment details

---

## Technologies Used

- **Database**: MySQL
- **Query Language**: SQL

---

##  Database Schema

- **Students**
  - `student_id` (PK)
  - `name`
  - `email`

- **Courses**
  - `course_id` (PK)
  - `course_name`
  - `instructor`

- **Enrollments**
  - `enrollment_id` (PK)
  - `student_id` (FK → Students)
  - `course_id` (FK → Courses)
  - `enrollment_date`

---

## Sample Queries

1. **List Students with Their Enrolled Courses**
   ```sql
   SELECT s.name AS student_name, c.course_name
   FROM Students s
   JOIN Enrollments e ON s.student_id = e.student_id
   JOIN Courses c ON c.course_id = e.course_id;
