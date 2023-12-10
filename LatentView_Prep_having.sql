-- Having Clause
-- Syntax
-- select column_names
-- from table_name
-- where condition
-- group by column names
-- having condition
-- order by column names
select * from employees;
-- finding average salary with a cndition
select Dept, avg(Salary) as "Average Salary" from employees 
group by Dept having avg(Salary) > 80000;
-- finding city with total salary condition
select city, sum(Salary) as  "total Salary" from employees
group by City having sum(Salary) > 500000;
-- find department which have more than 2 employees
select Dept, count(*) as "Employee count" from employees 
group by Dept
having count(*) >3;
-- finding employee count for 
-- all the cities except houston
select city, count(*) as "Employee Count"
from employees
where city != "Houston"
group by city
having count(*) > 3;
-- finding total number of employees for each department 
-- who have average alary > 90000
select dept, count(*) as "No. Of Employees", 
avg(Salary) as "Average Salary"
from employees
group by dept
having avg(Salary) > 150000;