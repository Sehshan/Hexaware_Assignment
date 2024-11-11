CREATE DATABASE SISDB;
USE SISDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
);

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,

);

ALTER TABLE Courses
ADD CONSTRAINT FK_Courses_Teacher
FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id);
SELECT * FROM Courses

ALTER TABLE Enrollments
ADD CONSTRAINT FK_Enrollments_Students
FOREIGN KEY (student_id) REFERENCES Students(student_id);

ALTER TABLE Enrollments
ADD CONSTRAINT FK_Enrollments_Courses
FOREIGN KEY (course_id) REFERENCES Courses(course_id);
SELECT * FROM Enrollments

ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_Students
FOREIGN KEY (student_id) REFERENCES Students(student_id);
SELECT * FROM Payments

-- Inserting sample records into Students

TRUNCATE TABLE Students;

INSERT INTO Students VALUES
(1, 'John', 'Doe', '2000-05-15', 'john.doe@example.com', '1234567890'),
(2, 'Jane', 'Smith', '1999-07-22', 'jane.smith@example.com', '2345678901'),
(3, 'Alice', 'Johnson', '2001-01-30', 'alice.johnson@example.com', '3456789012'),
(4, 'Michael', 'Brown', '1998-03-10', 'michael.brown@example.com', '4567890123'),
(5, 'Emily', 'Davis', '2000-11-20', 'emily.davis@example.com', '5678901234'),
(6, 'Daniel', 'Wilson', '1997-09-25', 'daniel.wilson@example.com', '6789012345'),
(7, 'Sophia', 'Garcia', '2001-04-18', 'sophia.garcia@example.com', '7890123456'),
(8, 'James', 'Martinez', '2002-06-16', 'james.martinez@example.com', '8901234567'),
(9, 'Olivia', 'Hernandez', '1999-12-05', 'olivia.hernandez@example.com', '9012345678'),
(10, 'William', 'Lopez', '2000-08-14', 'william.lopez@example.com', '0123456789');

-- Inserting sample records into Courses

INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1, 'Introduction to Programming', 3, 1),
(2, 'Data Structures', 4, 2),
(3, 'Database Systems', 3, 1),
(4, 'Web Development', 3, 3),
(5, 'Operating Systems', 4, 2),
(6, 'Software Engineering', 3, 4),
(7, 'Computer Networks', 3, 3),
(8, 'Artificial Intelligence', 4, 1),
(9, 'Machine Learning', 3, 4),
(10, 'Mobile App Development', 3, 2);

-- Inserting sample records into Enrollments

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2024-08-01'),
(2, 1, 2, '2024-08-02'),
(3, 2, 1, '2024-08-03'),
(4, 2, 3, '2024-08-04'),
(5, 3, 2, '2024-08-05'),
(6, 3, 4, '2024-08-06'),
(7, 4, 5, '2024-08-07'),
(8, 5, 1, '2024-08-08'),
(9, 6, 3, '2024-08-09'),
(10, 7, 2, '2024-08-10');

-- Inserting sample records into Teacher

INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
(1, 'Sarah', 'Taylor', 'sarah.taylor@example.com'),
(2, 'David', 'Anderson', 'david.anderson@example.com'),
(3, 'Laura', 'Thomas', 'laura.thomas@example.com'),
(4, 'Robert', 'Jackson', 'robert.jackson@example.com'),
(5, 'Emily', 'White', 'emily.white@example.com');

-- Inserting sample records into Payments

INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
(1, 1, 500.00, '2024-08-01'),
(2, 1, 300.00, '2024-08-02'),
(3, 2, 400.00, '2024-08-03'),
(4, 3, 200.00, '2024-08-04'),
(5, 4, 450.00, '2024-08-05'),
(6, 5, 600.00, '2024-08-06'),
(7, 6, 350.00, '2024-08-07'),
(8, 7, 500.00, '2024-08-08'),
(9, 8, 300.00, '2024-08-09'),
(10, 9, 400.00, '2024-08-10');

SELECT * FROM Students;
SELECT * FROM Teacher;
SELECT * FROM Payments;
select * from Payments where student_id=2;

--1. Write an SQL query to insert a new student into the "Students" table with the following details:

Insert into Students(student_id, first_name, last_name, date_of_birth, email, phone_number) values
     ('11','Jhon','Doe','1995-08-15','jhon.doe@example.com','1234567890');

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and
--insert a record into the "Enrollments" table with the enrollment date

select * from Enrollments

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
	(11, 1, 1, '2024-08-01')

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
--modify their email address.

Update Teacher set email='sneha.patale@changed.com' where teacher_id=4;

--4.Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
--an enrollment record based on the student and course.

Delete from Enrollments where student_id=2 And course_id=3;

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
--teacher from the respective tables.
 
 select * from Courses

 UPDATE Courses Set teacher_id = 2 where course_id = 1;
 
--6. Delete a specific student from the "Students" table and remove all their enrollment records
--from the "Enrollments" table. Be sure to maintain referential integrity

 Delete from Enrollments  where student_id=2 ;
 Delete from Payments  where student_id=2 ;
 Delete from Students  where student_id=2 ;

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
--payment record and modify the payment amount.

Update Payments Set amount=1000.999 Where payment_id=9;

--Task 3.

/*Aggregate functions, Having, Order By, GroupBy and Joins:

1. Write an SQL query to calculate the total payments made by a specific student. You
will need to
join the "Payments" table with the "Students" table based on the student's ID.*/

select * from Students;
select * from Payments

Select s.student_id ,sum(amount) as Total from Students s
LEFT JOIN Payments p on s.student_id=p.student_id group by s.student_id;

/* 2. Write an SQL query to retrieve a list of courses along with the count of students
enrolled in each
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table. */

Select course_name , COUNT(e.enrollment_id) as Student_Count from Courses c
Left Join Enrollments e on c.course_id=e.course_id Group By c.course_name ;

/*3. Write an SQL query to find the names of students who have not enrolled in any
course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
without enrollments.*/

Select CONCAT_WS(' ',s.first_name,s.last_name) as Student_Name  , s.student_id from Students s
Left Join Enrollments e On s.student_id=e.student_id
where e.student_id is Null;

select student_id  from Students
except
Select student_id from Enrollments group by student_id order by student_id asc;

/* 4. Write an SQL query to retrieve the first name, last name of students, and the names
of the courses they are enrolled in. Use JOIN operations between the "Students" table and the
"Enrollments" and "Courses" tables.
*/

Select
 s.first_name,
 s.last_name,
 c.course_name
from Students s
Join Enrollments e ON s.student_id = e.student_id
Join Courses c ON e.course_id = c.course_id;

select first_name, last_name, course_name from Students s
join Enrollments e on s.student_id=e.student_id 
join Courses c  on e.course_id=c.course_id  group by c.course_name, s.first_name,s.last_name;

/* 5. Create a query to list the names of teachers and the courses they are assigned to.
Join the "Teacher" table with the "Courses" table.*/

Select CONCAT_WS(' ',t.first_name,t.last_name) as Teacher_Name, course_name from Teacher t 
left join Courses c on t.teacher_id=c.teacher_id ;

Select CONCAT_WS(' ',t.first_name,t.last_name) as Name , C.Course_name from Teacher t
Join Courses c on c.teacher_id=t.teacher_id Order By Name Asc;

/*6. Retrieve a list of students and their enrollment dates for a specific course. You'll
need to join the "Students" table with the "Enrollments" and "Courses" tables
*/

select first_name, last_name, enrollment_date, course_name from Students s
join Enrollments e on s.student_id=e.student_id
join Courses c on c.course_id=e.course_id ;

Select
 s.first_name,
 s.last_name,
 c.course_name,
e.enrollment_date
from Students s
Join Enrollments e ON s.student_id = e.student_id
Join Courses c ON e.course_id = c.course_id where c.course_id=3;

/* 7. Find the names of students who have not made any payments. Use a LEFT JOIN between
the "Students" table and the "Payments" table and filter for students with NULL payment
records */

select first_name, last_name from Students s
left join Payments p on s.student_id=p.student_id where amount is null ;	-- student_id

/* 8. Write a query to identify courses that have no enrollments. You'll need to use a
LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL
enrollment records.*/

select course_name from Courses c
left join Enrollments e on c.course_id=e.course_id where e.course_id is null ;

select * from Courses ;
select * from Enrollments ;

/* 9. Identify students who are enrolled in more than one course. Use a self-join on the
"Enrollments" table to find students with multiple enrollment records.*/

select * from Enrollments;
select e.student_id from Enrollments e
left join Enrollments en on e.student_id = en.student_id group by e.student_id having count(e.student_id) > 1;


select * from Students;
select * from Enrollments;
select student_id from Enrollments group by student_id ;


/* 10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the
"Teacher" table and the "Courses" table and filter for teachers with NULL course assignments. */

select t.teacher_id , CONCAT_WS(' ',t.first_name,t.last_name)as Teacher_Name from Teacher t
Left Join Courses c
On t.teacher_id=c.teacher_id
where c.teacher_id is Null;

-- Task - 4 
/*1. Write an SQL query to calculate the average number of students enrolled in each course. Use 
aggregate functions and subqueries to achieve this*/ 

SELECT course_id, Avg(student_count) AS average_students 
FROM ( 
SELECT course_id, COUNT(student_id) AS student_count 
FROM enrollments 
GROUP BY course_id 
) AS course_enrollment_counts 
GROUP BY course_id; 

/*2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
payment amount and then retrieve the student(s) associated with that amount.*/ 

Select  Top 1 student_id, Max(Student_payment) from 
(Select Student_id , Sum(amount) as Student_payment from payments Group by Student_id) As 
Max_Payments Group by Student_id ; 

/*3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
course(s) with the maximum enrollment count.*/ 

Select * from Enrollments 
Select Enrollments_No_Max.Course_id ,c.course_name, Max(Enroll) As Enrollment  from 
(Select course_id, Count(Enrollment_id) as Enroll from Enrollments Group by course_id) As 
Enrollments_No_Max  
Left join Courses c on Enrollments_No_Max.course_id=c.course_id  
group by Enrollments_No_Max.course_id , c.course_name 
order by Enrollment desc  
; 

/*4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum 
payments for each teacher's courses.*/ 

Select  CONCAT_WS(' ',t.first_name,t.last_name) as teacher_name, 
(select Sum(p.amount) from  Enrollments e 
join Payments p on e.student_id=p.student_id 
join Courses c on e.course_id=c.course_id 
where t.teacher_id=c.teacher_id  
) As Sum_of_Amount_teacher_made from teacher t ; 

/* 5. Identify students who are enrolled in all available courses. Use subqueries to compare a 
student's enrollments with the total number of courses*/ 

Select e.student_id , CONCAT_WS(' ',s.first_name,s.last_name) as Name, Count(e.course_id) as 
No_of_Course from Enrollments e 
join Students s on e.student_id=s.student_id 
group by e.student_id ,s.first_name,s.last_name 
having count(course_id)=(Select count(*) from Courses ) 

/*6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
find teachers with no course assignments.*/ 

select * from Teacher t  
where t.teacher_id Not In (select c.teacher_id from Courses c); 

/*7. Calculate the average age of all students. Use subqueries to calculate the age of each student 
based on their date of birth. 
*/ 

Select 
AVG(age) as average_age 
From ( 
Select 
DATEDIFF(YEAR, date_of_birth, GETDATE())  AS age 
From  
Students 
) as student_ages; 

/* 8. Identify courses with no enrollments. Use subqueries to find courses without enrollment 
records */ 

Select * from Courses c 
where c.course_id not In ( select e.course_id from Enrollments e  group by e.course_id ); 

/*9. Calculate the total payments made by each student for each course they are enrolled in. Use 
subqueries and aggregate functions to sum payments.*/ 

select s.Student_id ,CONCAT_WS(' ',first_name,last_name) as [Name],c.course_name, 
(Select SUM(p.amount) from Payments p where p.student_id=s.student_id) as Amt  from Students s 
join Enrollments e on s.student_id=e.student_id 
join Courses c on e.course_id=c.course_id 

/* 10. Identify students who have made more than one payment. Use subqueries and aggregate 
functions to count payments per student and filter for those with counts greater than one.*/ 

Select * from Students  
where student_id In (select student_id from Enrollments group by student_id having 
count(enrollment_id)>1); 

/*11. Write an SQL query to calculate the total payments made by each student. Join the "Students" 
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each 
student*/ 

select s.student_id ,s.first_name, Sum(p.amount) from Students s  
left join Payments p on s.student_id=p.student_id  group by s.student_id,s.first_name; 

/* 12. Retrieve a list of course names along with the count of students enrolled in each course. Use 
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to 
count enrollments.*/ 

Select c.Course_id , c.Course_name , count(e.student_id) as No_of_Count  from Courses c 
left join Enrollments e on c.course_id=e.course_id  group by c.Course_id , c.Course_name ; 

/* 13. Calculate the average payment amount made by students. Use JOIN operations between the 
"Students" table and the "Payments" table and GROUP BY to calculate the average.*/ 

Select s.student_id , s.first_name , avg(p.amount) as Avg_Amount from Students s 
left join Payments p on s.student_id=p.student_id group by s.student_id , s.first_name ;