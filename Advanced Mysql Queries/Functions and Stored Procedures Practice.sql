/*
Task 1: 
Create a SQL function that prints the cost value of a specific order 
based on the user input of the OrderID. 
*/

DELIMITER //

CREATE FUNCTION FindCost(order_id INT) 
RETURNS DECIMAL (5,2) DETERMINISTIC 
RETURN (SELECT Cost FROM Orders WHERE OrderID = order_id);

DELIMITER ;

SELECT FindCost(5);

/* 
Task 2
Create a stored procedure called GetDiscount. This stored procedure must return the 
final cost of the customer's order after the discount value has been deducted. 

The discount value is based on the order's quantity. The stored procedure must have 
the following specifications: 

The procedure should take one parameter that accepts a user input value of an OrderID. 

The procedure must find the order quantity of the specific OrderID. 

If the value of the order quantity is more than or equal to 20 then the procedure should 
return the new cost after a 20% discount. 

If the value of the order quantity is less than 20 and more than or equal to 10 then the 
procedure should return the new cost after a 10% discount.
*/

DELIMITER //
CREATE PROCEDURE GetDiscount(order_id INT)
	BEGIN
		DECLARE CostAfterDiscount DECIMAL(7, 2);
        DECLARE CurrentCost DECIMAL(7, 2);
        DECLARE order_Quantity INT;
        SELECT Quantity into order_Quantity FROM Orders WHERE OrderID = order_id;
        SELECT Cost INTO CurrentCost FROM Orders WHERE OrderID = order_id;
	IF order_Quantity >= 20 THEN
		SET CostAfterDiscount = CurrentCost - (CurrentCost * 0.2);
	ELSEIF order_Quantity >= 10 THEN
		SET CostAfterDiscount = CurrentCost - (CurrentCost * 0.1);
	ELSE SET CostAfterDiscount = CurrentCost;
	END IF;
SELECT CostAfterDiscount;
END //

DELIMITER ;

CALL GetDiscount(5);
