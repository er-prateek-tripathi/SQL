show databases; -- displaying all the databses available in the system
use world; -- using a particular database
show tables;
select * from city;
describe city;
create database sql_intro;
use sql_intro; -- selecting a table from a database
create table emp_details (Name varchar (25), Age int, Gender char (1), DOJ date, city varchar (25), salary float);
describe emp_details; -- describing a table includes data about all the columns
insert into emp_details
values ("Jimmy", 35, "M", "2005-05-30", "Chicago", 70000),
("Alice", 28, "F", "1994-09-12", "New York", 50000),
("John", 42, "M", "1981-07-03", "Los Angeles", 80000),
("Emily", 31, "F", "1990-12-18", "San Francisco", 65000),
("Michael", 39, "M", "1984-03-26", "Seattle", 75000),
("Sarah", 33, "F", "1988-11-02", "Boston", 60000),
("David", 45, "M", "1978-06-14", "Houston", 90000),
("Jessica", 27, "F", "1996-04-09", "Phoenix", 48000),
("Robert", 41, "M", "1982-01-23", "Dallas", 78000),
("Amy", 32, "F", "1989-08-11", "Atlanta", 63000),
("William", 38, "M", "1985-10-17", "San Diego", 72000),
("Megan", 30, "F", "1991-05-14", "Philadelphia", 58000),
("Christopher", 44, "M", "1979-04-28", "Washington, D.C.", 85000);
select * from emp_details;
select distinct city from emp_details; -- displaying distinct values
select count(name) as "number of names" from emp_details; -- counting the number of characters for each row in the selected column
select sum(salary) as salary from emp_details; -- finding sum of all the values in salary column
select avg(salary) as avg_salary from emp_details; -- finding average of the values present in the salary column
select name, age, city from emp_details; -- selecting particular columns from a table
select * from emp_details where age > 40; -- selecting all the values from the table which satisfy the given age condition
select name, gender, city from emp_Details where gender = "F"; 
select * from emp_details where city = "New York" or city = "Chicago"; -- using or function
select * from emp_details where city in ("Chicago", "New York"); -- in function works the same way as or function.
select * from emp_details where DOJ between "1980-01-01" and "1990-12-31";
select * from emp_details where age > 30 and gender = "M";
select gender, sum(salary) as "total Salary" from emp_details group by gender;
select * from emp_details order by salary desc;
select (20+50) as addition;
select (20-50) as subtraction;
select (20*50) as multiplication;
select (20/50) as division;
select length("PXYSPTXLTLK") as total_length;
select repeat('@', 10); -- repeating @ 10 times
select upper("Pragya");
select lower("PRATEEK");
select curdate(); -- currnt date
select day(curdate()); -- todays day
select now(); -- current date and time
select replace(" Orange is a vegetable ", "vegetable", "fruit");
select trim("                      India                                "); -- trimming empty space
select ltrim("                      India                                "); -- trimming empty space in left
select rtrim("                      India                                "); -- trimming empty space in right
select position("fruit" in "Orange is a fruit"); -- gives the location of first character of given word from the beginning of the string.
select ascii('p'); -- finding ascii value of a given character
