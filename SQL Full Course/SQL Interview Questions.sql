create database SQL_IQ;
use SQL_IQ;
create table players (player_id int, name varchar(20), country varchar(20), goals int);
 insert into players (player_id, name, country, goals)
 values (101, 'Sam', 'USA', 6),
 (103, 'Daniel', 'England', 7),
 (104, 'Anthony', 'France', 10),
 (102, 'Bruno', 'Sweden', 6),
 (105, 'Alex', 'Wales', 5),
 (106, 'Matt', 'Scotland', 3);
select * from players;

  
select * from players where goals = (select min(goals) from players);
select * from players order by goals limit 1;
  
select * from players order by goals desc limit 1 offset 1;
Select * from (select * from players order by goals desc limit 2) as T order by goals limit 1;

create table customers (cust_id int, purchased_at datetime, item varchar(30));
describe customers;

insert into customers values(101, '2018-10-05','Bed'),
(102, '2018-10-07', 'Computer'),
(101, '2018-10-02', 'Phone'),
(103, '2018-10-05', 'Books'),
(102, '2018-10-05', 'Tablet');

select * from customers;

SELECT t.cust_id, t.purchased_at, t.item
FROM customers as t
INNER JOIN (
    SELECT cust_id, MIN(purchased_at) AS min_purchased_at
    FROM customers
    GROUP BY 1
) AS t1
    ON t.cust_id = t1.cust_id and
      t.purchased_at = t1.min_purchased_at;

create table email (name varchar(25), email varchar(20));

insert into email values ('Ammy', 'ammy.97@gmail.com'),
('Mack', 'mack_10@yahoo.in'), ('Jim', 'jim7@hotmail.com'), ('Sam', 'sam_1@gmail.com'),
('Mark', 'mark_90@hotmail.com');

select * from email;
#drop table email;

select distinct (substr (email, Instr (email,'@',1,1))) from email;

SELECT distinct substring_index(email, '@', -1), COUNT(*)
FROM email
GROUP BY substring_index(email, '@', -1);

SELECT distinct substring_index(email, '@', -1) as domain_name 
FROM email;

SELECT distinct SUBSTRING(email, LOCATE('@', email) + 1) AS domain
FROM email;

create table employee (name varchar(20), age int, salary float);

insert into employee values('Angela', 36, 70000), ('Mike', 30, 80000), 
('Danny', 28, 60000), ('Angela', 36, 70000), ('Karin', 35, 65000), ('Mike', 30, 80000); 

select * from employee;

alter table employee
add emp_id int primary key auto_increment;

SELECT 
    name, COUNT(name)
FROM
    employee
GROUP BY 
    name
HAVING 
    COUNT(name) > 1;

DELETE FROM employee
    WHERE emp_id NOT IN
    (
        SELECT MAX(emp_id) AS MaxRecordID
        FROM Employee
        GROUP BY name, age, salary
    );

select * from employee;

DELETE e1 FROM employee as e1, employee as e2 
WHERE
    e1.emp_id > e2.emp_id AND 
    e1.name = e2.name;

Delete from employee where emp_id in 
(Select emp_id from employee group by name, age, salary having count(*) > 1);

Delete from employee where emp_id not in (select max(emp_id) from employee group by name);

Select * from employee where emp_id in 
(select emp_id from employee group by emp_id, rownum having mod(rownum,2) = 0);

SELECT * FROM employee WHERE MOD (emp_id,2)!=0;

SELECT * FROM EMPLOYEE 
WHERE emp_id IN(SELECT emp_id FROM EMPLOYEE WHERE emp_id % 2 = 0);

create table weather (date_id int, date_val date, temperature float);
drop table weather;

insert into weather values (1, '2020-03-10', 32), (2, '2020-03-11', 31),
(3, '2020-03-12', 30.8), (4, '2020-03-13', 31.5), (5, '2020-03-14', 33), (5, '2020-03-15', 32.7);

select * from weather;
 
select A.date_Id from Weather as A, Weather as B 
where A.Temperature > B.Temperature and TO_DAYS(A.Date_val) = TO_DAYS(B.Date_val) + 1;

select A.date_Id from Weather as A, Weather as B 
where A.temperature > B.temperature and A.date_val = B.date_val + INTERVAL 1 DAY;

create table author (author_name varchar(30), book_name varchar(50));

insert into author values('author1', 'book1'), ('author1', 'book2'), ('author2', 'book3'),
('author2', 'book4'), ('author2', 'book5'), ('author3', 'book6'), ('author3', 'book7'), ('author3', 'book8');

select * from author;

create table books (book_name varchar(50), copies_sold int); 

insert into books values('book1', 10000), ('book2', 12500), ('book3', 3000), ('book4', 1200),
('book5', 5000), ('book6', 6500), ('book7', 2000), ('book8', 1500);

select * from books;

SELECT a.author_name, SUM(b.copies_sold) AS sum_sold
FROM author as a
JOIN books as b
ON b.book_name = a.book_name
GROUP BY a.author_name
ORDER BY sum_sold DESC
LIMIT 1 offset 1;