create database if not exists college;
use college;
create table students(
	roll_no int,
    name varchar(20),
    mark int not null,
    grade varchar(1) default 'F',
    city varchar(10),
    primary key (roll_no)
);

insert into students
(roll_no, name, mark, grade, city)
value
(101, "Shimanto", 97, "A", "Dhaka"),
(102, "John", 93, "C", "Khulna"),
(103, "Nayem", 85, "B", "Rajshahi"),
(104, "Utso", 95, "A", "Dhaka"),
(105, "Eco", 12, "C", "Dhaka"),
(106, "Showrov", 53, "F", "Rajshahi"),
(107, "Rabbi", 79, "B", "Khulna"),
(108, "Siam", 80, "C", "Rajshahi"),
(109, "Siam", 60, "A", "Dhaka");
select * from students;

select name, mark, city from students
where mark>80 and city in ("Khulna","Dhaka");

select *
from students
where (mark+10) between 81 and 90;

select *
from students
limit 3;

select *
from students
where city="Dhaka"
limit 2;

select *
from students
where city="Dhaka"
limit 2;

select *
from students
order by name;

select *
from students
where grade not in ("F","C")
order by roll_no desc;

select *
from students
where mark>60
order by mark desc
limit 5;

select *
from students
where city="Rajshahi"
order by mark desc
limit 2;

