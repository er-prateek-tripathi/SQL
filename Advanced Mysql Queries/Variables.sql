/* 
Variable Syntax
@variable_name = value;

Creating a variable inside and outside of a stored procedure
SET @variable_name = value;

Creating variable inside a stored procedure
DECLARE variable_name DATATYPE DEFAULT VALUE;

Assigning a variable in a SELECT statement
SELECT @variable_name := value;

Assigning value from a function
SELECT function() INTO variable_name FROM table_name;

IN Parameter : Default; To pass value in a procedure
CREATE PROCEDURE procedure_name(IN logic(value1, value2)) SELECT logic;
ex: CREATE PROCEDURE CalculateTax(IN Salary DECIMAL(10, 2)) SELECT Salary * 0.2 AS TAX;
CALL CalculateTax(10000);

OUT Paramaeter : Pass value to a varibale outside the procedure.
CREATE PROCEDURE GetLowestCost (OUT LowestCost DECIMAL(6, 2))
SELECT MIN(Cost) INTO LowestCost FROM Orders;
CALL GetLowestCost (@order_lowest_cost);
SELECT @order_lowest_cost;

INOUT Parameter : Pass argument to procedure and then pass result to outside. 
CREATE PROCEDURE SquareAnumber (INOUT aNumber INT)
BEGIN
	SET aNumber = aNumber * aNumber;
END
SET @x_number = 5;
CALL SquareAnumber (@x_number);
SELECT @x_number;

*/