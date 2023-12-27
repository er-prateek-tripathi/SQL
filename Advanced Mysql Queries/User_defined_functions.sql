/*
User Defined Functions

CREATE FUNCTION function_name()
RETURNS datatype DETERINISTIC(Same Results for same parameters)
RETURN

*/

SELECT * FROM client_orders;

DELIMITER //
CREATE FUNCTION FindTotalCost (Cost DECIMAL(5, 2))
RETURNS DECIMAL (5, 2) DETERMINISTIC 
BEGIN IF (Cost >= 100 AND Cost < 500)
THEN SET Cost = Cost - (Cost * 0.1);
ELSEIF (Cost >= 500) 
THEN SET Cost = (Cost * 0.2);
END IF;
RETURN (Cost);
END //
DELIMITER ;

SELECT FindTotalCost(500);

DROP FUNCTION FindTotalCost;
