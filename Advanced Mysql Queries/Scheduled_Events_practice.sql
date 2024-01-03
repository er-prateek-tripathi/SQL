USE lucky_shrub;

DELIMITER //
CREATE EVENT GenerateRevenueReport
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 12 HOUR
DO
BEGIN
	INSERT INTO ReportData (OrderID, ClientID, ProductID, Quantity, Cost, Date)
    SELECT *
    FROM Orders
    WHERE Date
    BETWEEN '2022-08-01' AND '2022-08-31';
END;

DELIMITER ;


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

DROP EVENT IF EXISTS DailyRestock;
