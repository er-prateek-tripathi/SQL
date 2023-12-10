# create database highradius_tasks;
create table department
(
dept_id int primary key,
dept_name varchar(20),
count_doc int
);
create table doctor
(
doc_id int primary key,
doc_name varchar(20),
dept_id int,
specialization varchar(20),
age int,
DOB date,
foreign key(dept_id) references department(dept_id)
);
create table patient
(
p_id int primary key,
p_name varchar(20),
age int,
DOB date,
boodgrp varchar(5),
d_id int,
foreign key(d_id) references doctor(dept_id)
);
create table receptionist
(
sno int ,
dept_id int,
doc_id int,
s_tatus varchar(20),
p_id int,
foreign key(dept_id) references department(dept_id),
foreign key(doc_id) references doctor(doc_id),
foreign key(p_id) references patient(p_id)
);