use little_lemon;

select * from employees
where annualsalary > (
	select annualsalary
    from employees
    where role = 'Assistant Chef'
    );
    
-- multiple row sub query syntax
/*
select column_name(s)
from table_name
where expression operator > ALL (
	select column_name
    from table_name
    where column data type
    (value1, value2, value3,)
    );
*/

-- Exist/not exist operator sysntax
/*
select column_name
from table_name
where exists/not exists (
	select column_name
    from table_name 
    where conditon
    );
*/

select * from employees
where annualsalary <= all (
	select annuasalary
    from employees
    where role in ('manager', 'assistant manager', 'head chef', 'head waiter')
    );
    

select * from employees
where annualsalary >= any (
	select annuasalary
    from employees
    where role in ('manager', 'assistant manager', 'head chef', 'head waiter')
    );

select * from employees
where exists (
	select * from bookings
    where bookings.employeeid = employees.employeeid 
    and 
    role in ('head chef', 'head waiter')
    );
