create table ACCOUNT (
	ACCOUNT_ID integer not null auto_increment,
    AVAIL_BALANCE float,
    CLOSE_DATE date,
    LAST_ACTIVITY_DATE date,
    OPEN_DATE date not null,
    PENDING_BALANCE float,
    STATUS varchar(10),
    CUST_ID integer ,
    OPEN_BRANCH_ID integer not null,
    OPEN_EMP_ID integer not null,
    PRODUCT_ID varchar(10) not null,
    primary key (ACCOUNT_ID)
);