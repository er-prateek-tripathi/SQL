/*
CREATE EVENT [IF NOT EXISTS] event_name
ON SCHEDULE schedule_logic 
DO event_body

If ONE TIME EVENT -> 
CREATE EVENT [IF NOT EXISTS] event_name
ON SCHEDULE AT CURRENT_TIMESTAMP [+ INTERVAL] schedule_logic 
DO event_body

If Recurring Event ->
CREATE EVENT [IF NOT EXISTS] event_name
ON SCHEDULE schedule_logic 
EVERY interval STARTS timestamp [+INTERVAL] ENDS timestamp [+INTERVAL]
DO event_body

-- DROPPING
DROP EVENT [IF EXISTS] event_name;
*/


-- ONE TIME
DELIMITER //
CREATE EVENT GenerateRevenueReport
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 12 HOUR
DO
BEGIN
	INSERT INTO ReportData (OrderID, ClientID, Quantity, Cost, Date)
    SELECT *
    FROM Orders
    WHERE Date
    BETWEEN '2022-08-01' AND '2022-08-31';
END;

DELIMITER ;


-- RECURRING
DELIMITER //
CREATE EVENT DailyRestock
ON SCHEDULE
EVERY 1 DAY
DO
BEGIN
	IF Products.NumberOfTimes < 50 
    THEN UPDATE Products SET NumberOfTimes = 50;
    END IF;
END;
DELIMITER ;


