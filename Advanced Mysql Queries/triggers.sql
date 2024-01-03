/*
A MySQL trigger is a set of actions available in the form of a stored program. 
These set of actions are invoked automatically when certain events occur.

- CREATION
CREATE TRIGGER trigger_name
TRIGGER TYPE - INSERT, UPDATE OR DELETE
EXECUTE TYPE - BEFORE OR AFTER
ON table_name FOR EACH ROW
BEGIN
	TRIGGER LOGIC
END

- DELETION
DROP TRIGGER IF EXISTS schema_name.trigger_name

if a table is deleted/dropped from database, all the triggers associated with it also get deleted. 

Row level Trigger:
Invoked for every row inserted, updated or deleted in a table. 100 rows, 100 times trigger activation

Statement Level Trigger:
Invoked once for each action and it occurs just once, no matter how many rows are inserted, updated or deleted.alter

Before: trigger invoked before any action is performed on table row.
After: trigger invokd  after the action is performed on each row. 

Before Insert, After Insert
Before Update, After Update
Before Delete, After Delete


SHOW TRIGGERS
[{FROM | IN} database_name]
[LIKE 'pattern' | WHERE search_condition];

*/

-- BEFOR INSERT
DELIMITER //
CREATE TRIGGER OrderQtyCheck
BEFORE INSERT
ON orders FOR EACH ROW
BEGIN
	IF NEW.orderQty < 0 THEN
		SET NEW.orderQty = 0;
    END IF;
END; //
DELIMITER ;


-- AFTER INSERT
DELIMITER //
CREATE TRIGGER LogNewOrderInsert
AFTER INSERT
ON Orders FOR EACH ROW
INSERT INTO Audits VALUES('AFTER', 'A new order is inserted', 'INSERT');
DELIMITER ;


-- AFTER DELETE
DELIMITER //
CREATE TRIGGER AfterDeleteOrder
AFTER DELETE
ON Orders FOR EACH ROW
INSERT INTO Audits
VALUES ('AFTER', CONCAT('Order', OLD.OrderID, ' was deleted at ', CURRENT_TIME(), ' on ', CURRENT_DATE()), 'DELETE');
DELIMITER ;


