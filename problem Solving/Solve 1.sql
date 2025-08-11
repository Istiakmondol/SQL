create database if not exists XYZ;
use XYZ;
create table employee_info(
	id int primary key,
    name varchar(20),
    salary int not null
);
insert into employee_info
(id,name,salary)
values
(1,"Adam",25000),
(2,"Bob",30000),
(3,"casey",40000);
select * from employee_info
