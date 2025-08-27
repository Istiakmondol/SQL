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
select department, round(avg(gpa),2) as max_dept_avg_gpa
from students
group by department
having round(avg(gpa),2)= (select max(dept_avg_gpa) from (select round(avg(gpa),2) as dept_avg_gpa from students group by department) as max_dept_avg);

-- write a query to find avg gpa in each department in ascending order by dept.
select department, round(avg(gpa),2) as avg_gpa
from students
group by department
order by department asc;

-- change all the grade from "A" to "O"
set sql_safe_updates=0; /*safe mode turnes off*/
update students
set gpa=1.99
where student_id=3;
set sql_safe_updates=1; /*safe mode turnes on*/

-- delete student whose gpa is less than 2.00
set sql_safe_updates=0;/*safe mode turnes off*/
delete from students
where gpa<2.00;
set sql_safe_updates=1;/*safe mode turnes on*/

-- FOREIGN KEYS
create table dept(
	id int primary key,
    name varchar(20)
);
create table teacher(
	id int primary key,
    name varchar(20),
    dept_id int,
    foreign key (dept_id) references dept(id)
    on update cascade
    on delete cascade
);

insert into dept
(id,name)
values
(101, "Bangla"),
(102, "English"),
(103, "Science");
select * from dept;

insert into teacher
(id,name,dept_id)
values
(1, "Bangla",101),
(2, "English",102),
(3, "Science",103),
(4, "English",102);
update dept
set id=104
where id=102;
/* Now in teacher table English dept_id has changed to 104 from 102 due to the "ON UPDATE CASCADE" command.*/
select * from teacher;














