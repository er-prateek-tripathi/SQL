use jewelrystore_db;

CREATE TABLE clients (
	ClientID int NOT NULL, 
	ClientName varchar(255) DEFAULT NULL, 
	Address varchar(255) DEFAULT NULL, 
	ContactNo varchar(10) DEFAULT NULL, 
	PRIMARY KEY (ClientID)
    );

INSERT INTO clients VALUES 
	(1, 'Kishan Hughes','223 Golden Hills, North Austin, TX','387986345'), 
	(2, 'Indira Moncada','119 Silver Street, Bouldin Creek, TX','334567243'), 
	(3, 'Mosha Setsile','785 Bronze Lane, East Austin, TX','315642597'), 
	(4, 'Laura Mills','908 Diamond Crescent, South Lamar, TX','300842509'), 
	(5, 'Henrik Kreida','345, Golden Hills, North Austin, TX','358208983'), 
	(6, 'Millicent Blou','812, Diamond Crescent, North Burnet, TX','347898755');

CREATE TABLE client_orders ( 
	OrderID INT NOT NULL, 
	ClientID INT DEFAULT NULL, 
	ItemID INT DEFAULT NULL, 
	Cost INT DEFAULT NULL, 
	PRIMARY KEY (OrderID)
    );
    
INSERT INTO client_orders VALUES 
	(1,1,1,2500), 
	(2,2,2,400), 
	(3,3,3,350), 
	(4,4,4,1250), 
	(5,5,5,800), 
	(6,6,6,1500), 
	(7,2,4,400), 
	(8,3,4,1250), 
	(9,4,2,400), 
	(10,1,3,350); 

/*
Task 1:    
Use the MySQL CEIL function to express the cost after the discount in the form of the smallest 
integer as follows:

Give a 5% discount to the clients who have ordered luxury watches. Express the cost after the 
discount in the form of the smallest integer, which is not less than the value shown in the 
afterDiscount column in the result table given below. Use the MySQL CEIL function to do this.
*/

SELECT ClientID, OrderID, ceil((Cost -(Cost * 5 /100))) As afterDiscount 
FROM client_orders 
WHERE ItemID = 4;

/*
Task 2:
 Format the afterDiscount column value from the earlier result for 5% discount in '#,###,###.##' 
 format rounded to 2 decimal places using the FORMAT function.
 */
 
 SELECT ClientID, OrderID, format((Cost -(Cost * 5 /100)), 2) As afterDiscount 
FROM client_orders 
WHERE ItemID = 4;
 
 /*
 Task 3: Find the expected delivery dates for their orders. The scheduled delivery date 
 is 30 days after the order date. Use the ADDDATE function.
 */
 
 SELECT ADDDATE(OrderDate,INTERVAL 30 DAY) AS ExpectedDelDate 
FROM mg_orders;

SELECT ADDDATE(OrderDate,30) AS ExpectedDelDate FROM mg_orders;

/*
Task 4: Generate data required for a report with details of all orders that have not 
yet been delivered. The DeliveryDate column has a NULL value for orders not yet delivered. 
It would help if you showed a value of 'NOT DELIVERED' instead of showing NULL for orders that 
are not yet delivered. Use the COALESCE function to do this.
*/

SELECT OrderID, ItemID, Quantity, Cost, OrderDate,COALESCE (DeliveryDate,'NOT DELIVERED'), OrderStatus 
FROM mg_orders;

/*
Task 5: Generate data required for the report by retrieving a list of M&G orders that are 
yet to be delivered. These are the orders with a status of 'In Progress', using the NULLIF 
function. This is the query that gives the desired result, using the COALESCE function.
*/

SELECT OrderID, NULLIF(OrderStatus,'In Progress') AS status 
FROM mg_orders;
