create database School;
use school;

create table students(
	s_id int primary key,
    s_name varchar(20),
    age int not null
);

insert into students value(011,"Istiak",24);
insert into students value(012,"Mondol",25);
insert into students value(013,"Nayem",26);

select * from students;

create table puple(
	p_id int primary key,
    p_name varchar(20)
);

insert into puple
(p_id, p_name)
values
(1,"Nayem"),
(2,"Mondol");

select * from puple;

show databases;
show tables;
