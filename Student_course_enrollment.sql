CREATE DATABASE IF NOT EXISTS EnrollmentSystem;
USE EnrollmentSystem;

CREATE TABLE students(
student_id int PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
email VARCHAR(50)
);

CREATE TABLE courses(
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(50),
instructor VARCHAR(20)
);

CREATE TABLE enrollments(
enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT,
FOREIGN KEY (student_id) REFERENCES students(student_id),
course_id INT,
FOREIGN KEY (course_id) REFERENCES courses(course_id),
enrollment_date DATE
);


INSERT INTO students(name,email) VALUES
('Dhruv','dhruv@gmail.com'),
('Jatin','jatin@gmail.com'),
('Anaya','anaya@gmail.com'),
('Harsh','harsh@gmail.com');

INSERT INTO courses(course_name,instructor) VALUES 
('Maths','Neleema'),
('Psychology','Viraj'),
('Buisness','Kartik');

SELECT * FROM courses;

INSERT INTO enrollments (student_id,course_id,enrollment_date) VALUES 
(1,1,'2025-05-20'),
(2,2,'2025-04-13'),
(3,3,'2025-02-01');

-- Queries
-- 1. view all the students with thier enrolled course

SELECT  s.name ,c.course_name
FROM students as s
JOIN enrollments AS e ON s.student_id=e.student_id
JOIN courses AS c ON c.course_id=e.course_id; 

-- 2. Count how many students are in each course

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses AS c
JOIN enrollments AS e ON c.course_id=e.course_id
GROUP BY c.course_name;

-- 3. Find students not enroll any course 

SELECT s.name
FROM students AS s
LEFT JOIN enrollments AS e ON s.student_id=e.student_id
WHERE e.course_id IS NULL;

-- 4. List all courses with no enrolled students

SELECT c.course_name
FROM courses AS c
LEFT JOIN enrollments AS e ON c.course_id=e.course_id
WHERE e.course_id IS NULL;

-- 5. Show full enrollment details

SELECT s.name,s.email,c.course_name,e.enrollment_date
FROM students AS s
JOIN enrollments AS e ON s.student_id=e.student_id
JOIN courses AS c ON c.course_id=e.course_id;
