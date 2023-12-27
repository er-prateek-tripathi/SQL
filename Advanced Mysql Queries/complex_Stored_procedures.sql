DELIMITER //
CREATE PROCEDURE GetProductSummary (OUT NumberOfLowPriceProducts INT, OUT NumberOfHighPriceProducts INT)
BEGIN
SELECT COUNT(ProductID) INTO NumberOfLowPriceProducts FROM Products WHERE Price < 50;
SELECT COUNT(ProductID) INTO NumberOfHighPriceProducts FROM Products WHERE Price >= 50;
END //
DELIMITER ;

Call GetProductSummary(@TotalNumberOfLowPriceProducts, @TotalNumberOfHighPriceProducts);
SELECT @TotalNumberOfLowPriceProducts, @TotalNumberOfHighPriceProducts;