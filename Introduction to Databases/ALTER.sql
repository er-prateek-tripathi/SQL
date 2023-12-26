USE MANGATA_GALLO;
show columns from staff;
alter table staff
add column Role varchar(50) not null;
alter table staff drop column phonenumber;

USE LITTLE_LEMON;

CREATE TABLE FOODORDERS(
	OrderID INT,
    Quantity INT, 
    Order_Status VARCHAR(15), 
    Cost Decimal(4,2)
    );
    
SHOW COLUMNS FROM FOODORDERS;

/*

Task 1: Use the ALTER TABLE statement with MODIFY command to make 
the OrderID the primary key of the 'FoodOrders' table. 

*/

ALTER TABLE FOODORDERS
MODIFY ORDERID INT PRIMARY KEY;

SHOW COLUMNS FROM FOODORDERS;

/*

Task 2: Apply the NOT NULL constraint to the quantity and cost columns.

*/

ALTER TABLE FOODORDERS
MODIFY QUANTITY INT NOT NULL, MODIFY COST DECIMAL(4, 2) NOT NULL;

SHOW COLUMNS FROM FOODORDERS;

/*
Task 3: Create two new columns, OrderDate with a DATE datatype and CustomerID 
with an INT datatype. Declare both must as NOT NULL. Declare the CustomerID as a 
foreign key in the FoodOrders table to reference the CustomerID column existing 
in the Customers table.
*/

ALTER TABLE FOODORDERS
ADD COLUMN ORDERDATE DATE NOT NULL, ADD COLUMN CUSTOMERID INT NOT NULL,
ADD FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID);

SHOW COLUMNS FROM FOODORDERS;

/*

Task 4: Use the DROP command with ALTER statement to delete the OrderDate 
column from the 'FoodOrder' table. 

*/

ALTER TABLE FOODORDERS DROP ORDERDATE;
SHOW COLUMNS FROM FOODORDERS;

/*
Task 5: Use the CHANGE command with ALTER statement to rename the 
column Order_Status in the OrderStatus table to DeliveryStatus. 
*/

ALTER TABLE FOODORDERS
CHANGE ORDER_STATUS DILEVERYSTATUS VARCHAR(15);
SHOW COLUMNS FROM FOODORDERS;
