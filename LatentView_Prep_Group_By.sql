show tables;
create table employees (Emp_ID int primary key, Emp_Name varchar(25), Age int, Gender char(1), DOJ date, Dept varchar (20), City varchar (25), Salary int);
describe employees;
insert into employees values 
(101, "Prateek", 23, "M", "2000-09-22", "Data Science", "New York", 200000),
(102, "Pragya", 23, "F", "2000-10-26", "Web Development", "New York", 100000),
(103, "Rahul", 28, "M", "1995-06-12", "Marketing", "Los Angeles", 150000),
(104, "Asha", 31, "F", "1992-03-18", "Finance", "Chicago", 180000),
(105, "Rajesh", 35, "M", "1988-11-30", "Engineering", "San Francisco", 220000),
(106, "Sneha", 27, "F", "1996-02-15", "Human Resources", "Boston", 90000),
(107, "Vivek", 29, "M", "1994-08-03", "Software Development", "Seattle", 180000),
(108, "Neha", 25, "F", "1998-05-27", "Design", "Austin", 120000),
(109, "Amit", 33, "M", "1988-09-05", "Product Management", "San Francisco", 250000),
(110, "Priya", 26, "F", "1997-11-09", "Data Analysis", "Los Angeles", 95000),
(111, "Saurabh", 30, "M", "1993-04-14", "Web Development", "New York", 160000),
(112, "Kavya", 24, "F", "1999-07-22", "Marketing", "Chicago", 110000),
(113, "Rohit", 32, "M", "1989-10-17", "Finance", "San Francisco", 200000),
(114, "Deepika", 29, "F", "1994-12-03", "Engineering", "Boston", 170000),
(115, "Aakash", 28, "M", "1995-03-27", "Human Resources", "Seattle", 95000),
(116, "Swati", 26, "F", "1997-01-18", "Software Development", "Austin", 140000),
(117, "Manoj", 34, "M", "1987-06-10", "Design", "San Francisco", 190000),
(118, "Ananya", 25, "F", "1998-09-14", "Product Management", "Los Angeles", 120000),
(119, "Arjun", 31, "M", "1992-12-12", "Data Analysis", "New York", 130000),
(120, "Riya", 27, "F", "1996-05-19", "Web Development", "Chicago", 110000),
(121, "Sameer", 29, "M", "1994-07-08", "Marketing", "Boston", 150000),
(122, "Pooja", 24, "F", "1999-11-30", "Finance", "Seattle", 90000),
(123, "Vikas", 31, "M", "1992-08-14", "Engineering", "San Francisco", 200000),
(124, "Kiran", 27, "F", "1996-10-02", "Human Resources", "Austin", 100000),
(125, "Ankit", 30, "M", "1993-02-26", "Software Development", "Los Angeles", 180000),
(126, "Meera", 26, "F", "1997-05-05", "Design", "New York", 110000),
(127, "Siddharth", 33, "M", "1988-11-21", "Product Management", "Chicago", 210000),
(128, "Alisha", 29, "F", "1994-04-16", "Data Analysis", "San Francisco", 140000),
(129, "Hitesh", 28, "M", "1995-03-09", "Web Development", "Boston", 170000),
(130, "Kavita", 25, "F", "1998-06-25", "Marketing", "Seattle", 95000);
select * from employees;
select distinct City from employees;
select distinct Dept from employees;
select avg(age) as "Average Age" from employees;
select Dept, round(avg(age), 1) as "Average Age" from employees group by Dept; -- finding rounded up average of age and then grouping it departemnt wise.
select Dept, sum(Salary) from employees group by Dept;
select * from employees;
select City, count(Emp_ID) from employees
group by City 
order by count(Emp_ID) desc;
select 
count(Emp_ID) as "No. Of Employees", 
year(DOJ) as "Joining Year" 
from employees 
group by year(DOJ); -- Finding number of joined employees in each year.
create table Sales (Product_ID int, Selling_Price float, Quantity_Sold int, State_of_Item Varchar(20));
insert into Sales
values
(121, 320.0, 3, "California"),
(123, 280.0, 2, "New York"),
(121, 450.0, 4, "Texas"),
(123, 520.0, 5, "Florida"),
(121, 380.0, 3, "Washington"),
(123, 300.0, 3, "Illinois"),
(121, 360.0, 4, "Massachusetts"),
(123, 250.0, 2, "New Jersey"),
(121, 420.0, 4, "Arizona"),
(123, 400.0, 4, "Colorado"),
(121, 340.0, 3, "Oregon"),
(123, 380.0, 3, "Nevada"),
(121, 290.0, 2, "Georgia"),
(123, 410.0, 4, "Michigan"),
(121, 350.0, 3, "Ohio"),
(123, 270.0, 2, "Indiana"),
(121, 370.0, 4, "Virginia"),
(123, 230.0, 2, "Maryland"),
(121, 390.0, 3, "North Carolina"),
(123, 440.0, 4, "Tennessee"),
(121, 330.0, 3, "Missouri"),
(123, 300.0, 3, "Minnesota"),
(121, 350.0, 3, "Wisconsin"),
(123, 260.0, 2, "Louisiana"),
(121, 410.0, 4, "Kentucky"),
(123, 320.0, 3, "Alabama"),
(121, 240.0, 2, "Oklahoma"),
(123, 370.0, 4, "Iowa"),
(121, 280.0, 2, "Arkansas"),
(123, 390.0, 3, "Mississippi");
select * from Sales;
select Product_ID, sum(Selling_Price*Quantity_Sold) as "Revenue" from Sales
group by Product_ID;
create table CP_Product (Product_ID int, Cost_Price float);
insert into CP_Product values
(121, 300.0),
(123, 400.0);
select * from CP_Product;
-- finding total profit by jining the tables
select c.Product_ID, 
sum((s.Selling_Price - c.Cost_Price)*s.Quantity_Sold) as Profit
from Sales as s inner join cp_product as c
where s.Product_ID = c.Product_ID
group by c.Product_ID;