CREATE TABLE Client_Orders (
	OrderID INT NOT NULL PRIMARY KEY, 
    ClientID VARCHAR(10), 
    ProductID VARCHAR(10), 
    Quantity INT, 
    Cost DECIMAL(6,2)
    );
    
INSERT INTO Client_Orders (OrderID, ClientID, ProductID, Quantity, Cost) 
VALUES 
	(1, "Cl1", "P1", 10, 500), 
	(2, "Cl2", "P2", 5, 100), 
    (3, "Cl3", "P3", 20, 800), 
    (4, "Cl4", "P4", 15, 150), 
    (5, "Cl3", "P3", 10, 450), 
    (6, "Cl2", "P2", 5, 800), 
    (7, "Cl1", "P4", 22, 1200), 
    (8, "Cl1", "P1", 15, 150);
    
REPLACE INTO Client_Orders (OrderID, ClientID, ProductID, Quantity, Cost) 
VALUES (9, 'Cl1', 'P1', 10, 5000)
	   , (10, 'Cl2', 'P2', 5, 100);

REPLACE INTO Client_Orders SET OrderID = 9, ClientID = 'Cl1', ProductID = 'P1', Quantity = 10, Cost = 500;

