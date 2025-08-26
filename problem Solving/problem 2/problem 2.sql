create database if not exists UniversityDB;
use UniversityDB;
create table students(
	student_id int primary key auto_increment,
	name varchar(50) not null,
    age int check (age>=18),
    email varchar(100) unique,
    department varchar(50) default "CSE",
    gpa decimal(3,2) check (gpa between 0.00 and 4.00)
);

insert into students
(name, age, email, department, gpa)
values
('Alice Johnson', 20, 'alice.johnson@example.com', 'CSE', 3.85),
('Bob Smith', 22, 'bob.smith@example.com', 'EEE', 3.60),
('Charlie Brown', 19, 'charlie.brown@example.com', 'BBA', 2.95),
('Diana Prince', 21, 'diana.prince@example.com', 'CSE', 3.95),
('Ethan Hunt', 23, 'ethan.hunt@example.com', 'EEE', 3.20),
('Frank Castle', 24, 'frank.castle@example.com', 'BBA', 3.40);
/*This will fail due to duplicate email
	('gfctur jghvy', 39, 'bob.smith@example.com', 'EEE', 3.26);
*/

-- all students from CSE department
select *
from students
where department="CSE";

-- students whose gpa is greater than 3.5
select *
from students
where gpa>3.5;

-- students sorted by gpa in descending order
select *
from students
order by gpa desc;

-- number of students in each department
select department, count(*) as student_count
from students
group by department
order by student_count asc;

-- Get the top 3 students by GPA
select *
from students
order by gpa desc
limit 3;

-- students who belong to the CSE department and have a GPA greater than 3.50.
select *
from students
where department="CSE" and gpa>3.50;

-- names and GPAs of students who are not in the BBA department.
select name, gpa
from students
where department!="BBA";

-- All the unique departments.
select distinct department
from students;

-- Show all students whose names start with D.
select *
from students
where name like 'D%';

-- Get all students whose GPA is between 3.00 and 3.80.
select *
from students
where gpa between 3.00 and 3.80;

-- Count how many students are in each department
select department, count(*) as no_of_student
from students
group by department
order by no_of_student desc;

-- Find the highest GPA in each department
select department, max(gpa) as height_GPA
from students
group by department;

-- List the top 3 students based on GPA
select *
from students
order by gpa desc
limit 3;

-- Find the second highest GPA in the entire table
select *
from students
where gpa=(select max(gpa) from students where gpa<(select max(gpa) from students));

select *
from students
where gpa=(select DISTINCT gpa from students order by gpa desc limit 1 offset 1);

-- Get all students whose GPA is above the average GPA of all students
select *
from students
where gpa > (select avg(gpa) from students);

-- Show students from the same department as "Alice 	Johnson"
SELECT name
FROM students
WHERE department = (
    SELECT department
    FROM students
    WHERE name = 'Alice Johnson'
);

-- Find students older than 20 who are in the EEE or Law department
select *
from students
where age > 20 and (department="EEE" or department="BBA");

-- Sort all students by department (A–Z) and GPA (high to low).
select *
from students
order by department asc, gpa desc;

-- Get the department with the highest average GPA
select department, round(avg(gpa),2) as dept_avg_gpa
from students
group by department
having avg(gpa)= (select max(avg_gpa) from (select round(avg(gpa),2) as avg_gpa from students group by department) as dept_avg);












