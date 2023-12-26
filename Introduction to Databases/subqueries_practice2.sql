CREATE TABLE LowCostMenuItems
(ItemID INT, Name VARCHAR(200), Price INT, PRIMARY KEY(ItemID));

/*
Task 1: Find the minimum and the maximum average prices at which the customers can purchase food and drinks.

Hint: In this task, you must write subqueries using the FROM clause. Your subquery would find the average 
prices of menu items by their type. The subquery result will be the input for the outer query to find the 
minimum and maximum average prices.
*/

SELECT ROUND(MIN(avgPrice),2), ROUND(MAX(avgPrice),2) 
FROM (SELECT Type,AVG(Price) AS avgPrice
FROM MenuItems 
GROUP BY Type) AS aPrice;

/*
Task 2: Insert data of menu items with a minimum price based on the 'Type' into the LowCostMenuItems table.

Hint: In this task, you must write subqueries in INSERT statements. Your subquery would find the details of 
menu items with a minimum price based on the 'Type' of menu item. In other words, GROUP BY Type. Then you can 
insert the data retrieved from the subquery into the LowCostMenuItems table using an INSERT INTO SELECT statement.
*/

INSERT INTO LowCostMenuItems 
SELECT ItemID,Name,Price 
FROM MenuItems 
WHERE Price =ANY(
	SELECT MIN(Price) 
    FROM MenuItems 
    GROUP BY Type
    );
SELECT * FROM LOWCOSTMENUITEMS;

/*
Task 3: Delete all the low-cost menu items whose price is more than the minimum price of menu items that 
have a price between $5 and $10.

Hint: You need to write subqueries in DELETE statements in this task. Your subquery will be placed in the WHERE 
clause of the DELETE statement to find the minimum prices of menu items that have a price between $5 and $10. 
Use the ALL operator in the outer query to find matches from the values returned from the subquery. Delete those 
records with matching prices from the LowCostMenuItems table.
*/

DELETE FROM LowCostMenuItems 
WHERE Price > ALL(SELECT MIN(Price) as p 
FROM MenuItems 
GROUP BY Type 
HAVING p BETWEEN 5 AND 10);