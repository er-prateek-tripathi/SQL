create table staff 
( 
	staffid int not null primary key, 
    phonenumber int not null unique,
    fullname varchar(100) not null
);

create table contractinfo 
(
	contractid int not null primary key,
    staffid int not null,
    salary decimal(7, 2) not null,
    location varchar(50) not null default 'Texas',
    stafftype varchar(20) not null check (stafftype = "Junior" OR stafftype = "Senior")
);

show columns from staff;
show columns from contractinfo;

ALTER TABLE ContractInfo 
ADD CONSTRAINT FK_StaffID_ContractInfo
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID);