-- Inner Join : Returns all the rows from multiple tables
-- as long as the conditions are met.
-- Syntax
-- Select column_names from Table A 
-- inner join Table B on
-- A.key = B.key
create database sql_joins;
show databases;
use sql_joins;

create table cricket (cricket_id int AUTO_INCREMENT,
name varchar(30), primary key(cricket_id));

create table football (football_id int AUTO_INCREMENT,
name varchar(30), primary key(football_id));

insert into cricket (name)
values ('Stuart'), ('Michael'), ('Johnson'),
('Hayden'), ('Fleming');

select * from cricket;

insert into football (name)
values ('Stuart'), ('Johnson'),
('Hayden'), ('Langer'), ('Astle');

select * from football;

-- finding students that are part of both cricket and football team

select * from cricket as c
inner join football as f
on c.name = f.name;

-- Left Join : returns all the rows from the left table 
-- and matching rows from the right table.
-- Syntax
-- select coblumn_names from Table A
-- left join Table B 
-- on A.key = B.key

-- Right Join : Returns all the rows from the right table
-- and matching rows from left table.
-- select column_names from Table A 
-- right jjoin Table B 
-- on A.key = B.key 

