use lucky_shrub;

/*
Task 1: Write a SQL statement to create the OrdersView Virtual table based on the Orders 
table. The table must include the following columns: Order ID, Quantity and Cost. Once 
you have executed the query, select all data from the OrdersView table.
*/

create view ordersview 
as
select orderid, quantity, cost
from client_orders;

select * from ordersview;

/*
Task 2: Write a SQL statement that utilizes the ‘OrdersView’ virtual table to Update the 
base Orders table. In the UPDATE TABLE statement, change the cost to 200 where the order 
id equals 2. Once you have executed the query, select all data from the OrdersView table.
*/

update ordersview
set cost = 200
where orderid = 2;
select * from ordersview;

/*
Task 3: Write a SQL statement that changes the name of the ‘OrdersView’ virtual table to ClientsOrdersView.
*/

rename table ordersview to clientordersview;

/*
Task 4: Write a SQL statement to delete the Orders virtual table.
*/

drop view clientordersview;