CREATE TABLE students (
student_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT,
gender VARCHAR(10),
city VARCHAR(50),
enrollment_date DATE
);

CREATE TABLE subjects (
subject_id SERIAL PRIMARY KEY,
subject_name VARCHAR(50) NOT NULL,
teacher_name VARCHAR(50),
max_marks INT
);

CREATE TABLE grades (
grade_id SERIAL PRIMARY KEY,
student_id INT REFERENCES students(student_id),
subject_id INT REFERENCES subjects(subject_id),
marks_obtained INT,
exam_date DATE
);


-- INSERT INTO students

INSERT INTO students (name, age, gender, city, enrollment_date) VALUES
('Aarav Sharma', 17, 'Male', 'Delhi', '2023-04-01'),
('Priya Gupta', 16, 'Female', 'Mumbai', '2023-04-03'),
('Rahul Verma', 18, 'Male', 'Delhi', '2022-06-15'),
('Sneha Patel', 15, 'Female', 'Lucknow', '2023-07-20'),
('Amit Singh', 17, 'Male', 'Jaipur', '2022-09-10'),
('Divya Nair', 16, 'Female', 'Chennai', '2023-01-05'),
('Karan Mehta', 18, 'Male', 'Delhi', '2021-11-22'),
('Anjali Yadav', 15, 'Female', 'Lucknow', '2023-03-18'),
('Vikram Joshi', 17, 'Male', 'Mumbai', '2022-08-30'),
('Neha Tiwari', 16, 'Female', 'Delhi', '2023-05-14');


SELECT * FROM students;

-- INSERT INTO subjects

INSERT INTO subjects (subject_name, teacher_name, max_marks) VALUES
('Mathematics', 'Mr. Rajesh Kumar', 100),
('Science', 'Mrs. Sunita Sharma', 100),
('English', 'Mr. Anil Verma', 80),
('History', 'Mrs. Pooja Mishra', 80),
('Computer', 'Mr. Deepak Singh', 100);

SELECT * FROM subjects;


--INSERT INTO grades

INSERT INTO grades (student_id, subject_id, marks_obtained, exam_date) VALUES
(1,1,88,'2024-03-10'), (1,2,76,'2024-03-11'), (1,3,65,'2024-03-12'),
(2,1,92,'2024-03-10'), (2,3,78,'2024-03-12'), (2,5,95,'2024-03-14'),
(3,2,55,'2024-03-11'), (3,4,60,'2024-03-13'), (3,5,70,'2024-03-14'),
(4,1,45,'2024-03-10'), (4,2,50,'2024-03-11'), (4,3,38,'2024-03-12'),
(5,1,80,'2024-03-10'), (5,4,74,'2024-03-13'), (5,5,88,'2024-03-14'),
(6,2,91,'2024-03-11'), (6,3,83,'2024-03-12'), (6,5,97,'2024-03-14'),
(7,1,33,'2024-03-10'), (7,2,40,'2024-03-11'), (7,4,28,'2024-03-13'),
(8,1,72,'2024-03-10'), (8,3,68,'2024-03-12'), (8,5,85,'2024-03-14'),
(9,2,60,'2024-03-11'), (9,4,55,'2024-03-13'), (9,5,78,'2024-03-14'),
(10,1,95,'2024-03-10'),(10,2,90,'2024-03-11'),(10,5,99,'2024-03-14');

SELECT * FROM grades;

/* Q1. students Table — SELECT & WHERE
Based on the students table, answer the following:
a) Retrieve the name, age, and city of all students who are from 'Delhi' and older than 16 years. Sort
the result by name in ascending order.
b) Display all distinct cities from which students have enrolled.
c) Fetch the complete details of all female students.
d) List all students who enrolled after 1st January 2023, ordered by enrollment_date in descending
order.
e) Show all students whose age is between 15 and 18 (inclusive). */

--(a)
SELECT name,age,city
FROM students
WHERE city = 'Delhi' 
AND age > 16
ORDER BY name ASC;

--(b)
SELECT DISTINCT city
FROM students;

--(c)
SELECT *
FROM students
WHERE gender = 'Female';

--(d)
SELECT * 
FROM students
WHERE enrollment_date > '2023-01-01'
ORDER BY enrollment_date DESC;

--(e)
SELECT *
FROM students
WHERE age BETWEEN 15 AND 18;

/* Q2. students Table — DISTINCT & LIKE
Based on the students table, answer the following:
a) Retrieve the name and city of all students whose name starts with 'A'.
b) Find all students whose city ends with the letter 'i'.
c) Display all distinct gender values present in the table.
d) List students whose name contains the word 'Kumar' anywhere.
e) Retrieve the first 5 students (by student_id) from the table. */


--(a)
SELECT name,city
FROM students
WHERE name LIKE  'A%';

--(b)
SELECT city
FROM students
WHERE name LIKE '%i' ;

--(c)
SELECT DISTINCT gender
FROM students;

--(d)
SELECT *
FROM students
WHERE name LIKE '%Kumar%';

--(e)
SELECT * 
FROM students
ORDER BY student_id ASC
LIMIT 5;

/* Q3. subjects Table — Filtering & Sorting
Based on the subjects table, answer the following:
a) Retrieve all subjects where max_marks is 100.
b) Display subject_name and teacher_name sorted alphabetically by subject_name.
c) Find all subjects taught by teachers whose name starts with 'Mr.'.
d) List all subjects where max_marks is less than 100.
e) Show all distinct max_marks values available in the subjects table.*/

--(a)
SELECT *
FROM subjects
WHERE max_marks = 100;

--(b)
SELECT subject_name, teacher_name
FROM subjects
ORDER BY subject_name ASC;

--(c)
SELECT *
FROM subjects
WHERE teacher_name LIKE 'Mr.%';

--(d)
SELECT *
FROM subjects
WHERE max_marks < 100;

--(e)
SELECT DISTINCT max_marks
FROM subjects;

/* Q4. grades Table — Basic Queries
Based on the grades table, answer the following:
a) Retrieve all grade records where marks_obtained > 80.
b) Display all records where marks_obtained < 50 (failing students).
c) Fetch all grade records for exam_date '2024-03-10'.
d) List all grade records where marks_obtained is between 60 and 90.
e) Show all grade records ordered by marks_obtained descending. Display only the top 5 */

--(a)
SELECT *
FROM grades
WHERE marks_obtained > 80;

--(b)
SELECT *
FROM grades
WHERE marks_obtained < 50;

--(c)
SELECT *
FROM grades
WHERE exam_date = '2024-03-10';

--(d)
SELECT *
FROM grades
WHERE marks_obtained BETWEEN 60 AND 90;

--(e)
SELECT *
FROM grades
ORDER BY marks_obtained DESC
LIMIT 5;

/* Q5. students Table — ORDER BY & LIMIT
Based on the students table, answer the following:
a) Retrieve the name and enrollment_date of the 3 most recently enrolled students.
b) Display all male students from 'Delhi', sorted by age descending.
c) List all students whose age is NOT 17.
d) Show students from either 'Mumbai' or 'Lucknow'.
e) Write a query to display all students where city is NULL */

--(a)
SELECT name, enrollment_date
FROM students
ORDER BY enrollment_date DESC
LIMIT 3;

--(b)
SELECT *
FROM students
WHERE gender = 'Male'
  AND city = 'Delhi'
ORDER BY age DESC;

--(c)
SELECT *
FROM students
WHERE age <> 17;

--(d)
SELECT *
FROM students
WHERE city IN ('Mumbai', 'Lucknow');

--(e)
SELECT *
FROM students
WHERE city IS NULL;


/* Q6. grades Table — Aggregate Functions
Based on the grades table, answer the following:
a) Find the total number of grade records in the table.
b) Calculate the average marks_obtained across all records.
c) Find the highest marks_obtained in the entire table.
d) Find the lowest marks_obtained in the entire table.
e) Calculate the sum of marks_obtained for student_id = 2. */

--(a)
SELECT COUNT(*) AS total_grade_records
FROM grades;

--(b)
SELECT AVG(marks_obtained) AS average_marks
FROM grades;

--(c)
SELECT MAX(marks_obtained) AS highest_marks
FROM grades;

--(d)
SELECT MIN(marks_obtained) AS lowest_marks
FROM grades;

--(e)

SELECT SUM(marks_obtained) AS total_marks
FROM grades
WHERE student_id = 2;

/* Q7. grades Table — GROUP BY
Based on the grades table, use GROUP BY:
a) Find the total marks scored by each student (group by student_id).
b) Find the average marks scored per subject (group by subject_id).
c) Count how many exams each student has appeared in.
d) Find the maximum marks scored by each student across all subjects.
e) Find the minimum marks scored in each subject. */

--(a)
SELECT student_id,
       SUM(marks_obtained) AS total_marks
FROM grades
GROUP BY student_id;

--(b)
SELECT subject_id,
       AVG(marks_obtained) AS average_marks
FROM grades
GROUP BY subject_id;

--(c)
SELECT student_id,
       COUNT(*) AS exams_appeared
FROM grades
GROUP BY student_id;

--(d)
SELECT student_id,
       MAX(marks_obtained) AS highest_marks
FROM grades
GROUP BY student_id;

--(e)
SELECT subject_id,
       MIN(marks_obtained) AS lowest_marks
FROM grades
GROUP BY subject_id;


/* Q8. grades Table — HAVING Clause
Based on the grades table, use GROUP BY + HAVING:
a) Find all students whose total marks are greater than 200.
b) Find subjects where the average marks are above 70.
c) List students who have appeared in more than 2 exams.
d) Find subjects where the maximum marks scored is greater than 90.
e) Find students whose average marks across all subjects is less than 60. */

--(a)
SELECT student_id,
       SUM(marks_obtained) AS total_marks
FROM grades
GROUP BY student_id
HAVING SUM(marks_obtained) > 200;

--(b)
SELECT subject_id,
       AVG(marks_obtained) AS average_marks
FROM grades
GROUP BY subject_id
HAVING AVG(marks_obtained) > 70;

--(c)
SELECT student_id,
       COUNT(*) AS exams_appeared
FROM grades
GROUP BY student_id
HAVING COUNT(*) > 2;

--(d)
SELECT subject_id,
       MAX(marks_obtained) AS highest_marks
FROM grades
GROUP BY subject_id
HAVING MAX(marks_obtained) > 90;

--(e)
SELECT student_id,
       AVG(marks_obtained) AS average_marks
FROM grades
GROUP BY student_id
HAVING AVG(marks_obtained) < 60;

/*Q9. subjects Table — COUNT & AVG
Based on the subjects table, answer the following:
a) Count the total number of subjects available.
b) Find the average max_marks across all subjects.
c) Find the subject with the highest max_marks.
d) Count how many subjects have max_marks = 100.
e) List each teacher name and count how many subjects they teach.*/

--(a)
SELECT COUNT(*) AS total_subjects
FROM subjects;

--(b)
SELECT AVG(max_marks) AS average_max_marks
FROM subjects;

--(c)
SELECT *
FROM subjects
ORDER BY max_marks DESC
LIMIT 1;

--(d)
SELECT COUNT(*) AS subjects_with_100_marks
FROM subjects
WHERE max_marks = 100;

--(e)
SELECT teacher_name,
       COUNT(*) AS subjects_taught
FROM subjects
GROUP BY teacher_name;

/* Q10. students Table — Aggregates + Filters
Based on the students table, answer the following:
a) Count the total number of students enrolled.
b) Count students grouped by city.
c) Count students grouped by gender.
d) Find the average age of all students.
e) Find all cities that have more than 2 students enrolled. */

--(a)
SELECT COUNT(*) AS total_students
FROM students;

--(b)
SELECT city,
       COUNT(*) AS student_count
FROM students
GROUP BY city;

--(c)
SELECT gender,
       COUNT(*) AS student_count
FROM students
GROUP BY gender;

--(d)
SELECT AVG(age) AS average_age
FROM students;

--(e)
SELECT city,
       COUNT(*) AS student_count
FROM students
GROUP BY city
HAVING COUNT(*) > 2;


/* Q11. JOIN — students + grades
Perform JOIN operations between the students and grades tables:
a) Display each student's name along with their marks_obtained and exam_date. (INNER JOIN)
b) List all students and their total marks. Include students with no grade records. (LEFT JOIN)
c) Find the name of the student who scored the highest marks_obtained overall.
d) Show all students from 'Delhi' along with their marks in each exam.
e) Count the number of exams each student appeared in, and show the student name alongside the
count. */

--(a)
SELECT s.name,
       g.marks_obtained,
       g.exam_date
FROM students s
INNER JOIN grades g
ON s.student_id = g.student_id;

--(b)
SELECT s.name,
       COALESCE(SUM(g.marks_obtained), 0) AS total_marks
FROM students s
LEFT JOIN grades g
ON s.student_id = g.student_id
GROUP BY s.student_id, s.name;

--(c)
SELECT s.name,
       g.marks_obtained
FROM students s
JOIN grades g
ON s.student_id = g.student_id
ORDER BY g.marks_obtained DESC
LIMIT 1;

--(d)
SELECT s.name,
       g.marks_obtained,
       g.exam_date
FROM students s
JOIN grades g
ON s.student_id = g.student_id
WHERE s.city = 'Delhi';

--(e)
SELECT s.name,
       COUNT(g.grade_id) AS exams_appeared
FROM students s
LEFT JOIN grades g
ON s.student_id = g.student_id
GROUP BY s.student_id, s.name;


/* Q12. JOIN — students + grades + subjects (3-table JOIN)
Perform 3-table JOIN operations across students, grades, and subjects:
a) Display each student's name, subject_name, and marks_obtained.
b) Find all students who scored more than 80 in 'Mathematics'. Show student name and marks.
c) List all subjects along with the average marks scored by students in that subject.
d) Show names of students who scored above the average marks in 'Computer'.
e) Display full result: student name, subject name, marks obtained, exam date — sorted by student
name, then subject name */

--(a)
SELECT s.name,
       sub.subject_name,
       g.marks_obtained
FROM students s
JOIN grades g
ON s.student_id = g.student_id
JOIN subjects sub
ON g.subject_id = sub.subject_id;

--(b)
SELECT s.name,
       g.marks_obtained
FROM students s
JOIN grades g
ON s.student_id = g.student_id
JOIN subjects sub
ON g.subject_id = sub.subject_id
WHERE sub.subject_name = 'Mathematics'
  AND g.marks_obtained > 80;

--(c)
SELECT sub.subject_name,
       AVG(g.marks_obtained) AS average_marks
FROM subjects sub
JOIN grades g
ON sub.subject_id = g.subject_id
GROUP BY sub.subject_name;

--(d)
SELECT s.name,
       g.marks_obtained
FROM students s
JOIN grades g
ON s.student_id = g.student_id
JOIN subjects sub
ON g.subject_id = sub.subject_id
WHERE sub.subject_name = 'Computer'
  AND g.marks_obtained >
      (
        SELECT AVG(g2.marks_obtained)
        FROM grades g2
        JOIN subjects sub2
        ON g2.subject_id = sub2.subject_id
        WHERE sub2.subject_name = 'Computer'
      );

--(e)
SELECT s.name,
       sub.subject_name,
       g.marks_obtained,
       g.exam_date
FROM students s
JOIN grades g
ON s.student_id = g.student_id
JOIN subjects sub
ON g.subject_id = sub.subject_id
ORDER BY s.name, sub.subject_name;

SELECT * FROM students;
SELECT * FROM subjects;
SELECT * FROM grades;