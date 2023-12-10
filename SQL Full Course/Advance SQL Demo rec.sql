# Subqueries

use lucky_shrub;

select * from employees;

select EmployeeName, Department, AnnualSalary
from employees where AnnualSalary > (select avg(AnnualSalary) from employees);

select EmployeeName, Department, AnnualSalary
from employees where AnnualSalary >
(select AnnualSalary from employees where EmployeeName = 'Maria Carter');

-- Implementing SubQueries

use classicmodels;

select * from products;

select * from orderdetails;

select productcode, productname, msrp from products
where productcode in (select productcode from orderdetails
where priceeach < 100);

#Stored Procedure

use sql_iq;
select * from players;

delimiter &&
create procedure top_players()
begin
select name, country, goals
from players where goals>6;
End &&
delimiter ; -- semi-colon means this SP is declared default

call top_players();

#SP using IN parameter, now we  need to pass arguments while caling stored procedure.
use sql_intro;
delimiter //
create procedure sp_sortBySalary(IN var int)
begin
select name, age, salary from emp_details
order by salary desc limit var;
end //
delimiter ;

call sp_sortBySalary(5);

delimiter //
create procedure update_salary(IN temp_name varchar(20), in
new_salary float)
begin
update emp_details set
salary = new_salary where name=temp_name;
end; //

select * from emp_details;

call update_salary('Marry', 80000);

#SP using OUT

delimiter //
create procedure sp_CountEmployees(OUT Total_Emps int)
begin
select count(name) into Total_Emps from emp_details
where sex='F';
end //
delimiter ;

call sp_CountEmployees(@F_emp);
select @F_emp as female_emps;

# Trigger in SQL

create table student
(st_roll int, age int, name varchar(30), mark float);

delimiter //
create trigger marks_verify_st
before insert on student
for each row
if new.mark < 0 then set new.mark=50;
end if; //

insert into student
values(501,10,'Ruth', 75.0),
(502,12, 'Mike', -20.5),
(503, 13, 'Dave', 90.0),
(504, 10, "Jacobs", -12.5);

select * from student;

-- dropping a trigger
drop trigger marks_verify_st; 

-- dropping a stored procedure
drop procedure update_salary;

# Views in SQL

use classicmodels; 
select * from customers;

create view cust_details
as
select customerName, phone, city
from customers;

select * from cust_details;

select * from productlines;

-- Creating views using joins
create view product_description
as
select productName, quantityinstock,msrp,textdescription
from products as p inner join productlines as pl
on p.productline = pl.productline;

select * from product_description;

#Rename description
rename table product_description 
to vehicle_description; 

#Display views
show full tables
where table_type = 'VIEW';

#Delete view 

-- drop view cust_details;

#Windows function

use sql_intro;
select * from emp_details;

select name,age,city,
sum(salary) over (partition by city) as total_salary
from emp_details;

# Row number helps us to find duplicates

select row_number() over(order by salary) as row_num,
name, salary from emp_details order by salary;

create table demo (st_id int, st_name varchar(20));

insert into demo
values(101,'Shane'),
(102,'Bradley'),
(103,'Herath'),
(103,'Herath'),
(104, 'Nathan'),
(105,'Kevin'),
(105,'Kevin');

select * from demo;

select st_id, st_name, row_number() over 
(partition by st_id, st_name order by st_id) as row_num
from demo;

# Rank function

create table demo1(var_a int);

insert into demo1
value(101),(102),(103),(103),(104),(105),(106),(106),(107);

select var_a,
rank() over (order by var_a) as test_rank
from demo1;

#First value()

select name, age, salary, first_value(name)
over (order by salary desc) as highest_salary from emp_details;

select name, city, salary, first_value(name)
over (partition by city order by salary desc) as highest_salary
from emp_details;

create database Mysql_Python;



