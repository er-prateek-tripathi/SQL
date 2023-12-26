use little_lemon;

CREATE TABLE Starters(
	StarterName VARCHAR(100) NOT NULL PRIMARY KEY, 
    Cost Decimal(3,2), 
    StarterType VARCHAR(100) DEFAULT 'Mediterranean'
    );
    
replace into Starters
Values ('Cheese bread', 9.50, 'Indian');

replace into starters
set StarterName = 'Cheese bread', Cost = 9.75, StarterType = 'Indian';