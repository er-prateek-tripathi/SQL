use lucky_shrub;
show tables in lucky_shrub;
select * from client_orders;

/*
Task 1: Write a SQL statement that creates a stored procedure called 'GetOrdersData' 
which retrieves all data from the Orders table.

After executing the query, call the “GetOrdersData” to show all orders on the MySQL terminal.
*/

create procedure GetOrdersData()
select * from client_orders;
call GetOrdersData();

/*
Task 2: Write a SQL statement that creates a stored procedure called “GetListOfOrdersInRange”. 
The procedure must contain two parameters that determine the range of retrieved data based on 
the user input of two cost values “MinimumValue” and “MaximumValue”.

Once you have executed the query, call the “GetListOfOrdersInRange” to display the data of 
orders that cost between $150 and $600.
*/

create procedure GetListOfOrdersInRange( MinimumValue decimal, MaximumValue decimal)
select * from client_orders
where cost >= MinimumValue and cost <= MaximumValue;
call GetListOfOrdersInRange(150, 600);