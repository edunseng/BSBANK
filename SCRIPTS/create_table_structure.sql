-- Create new schema 'scm_Branches', 'scm_Customers' and 'scm_Accounts'.
-- Drop schema if it already exists.
IF OBJECT_ID('scm_Branches', 'U') IS NOT NULL
DROP SCHEMA scm_Branches
GO
IF OBJECT_ID('scm_Customers', 'U') IS NOT NULL
DROP SCHEMA scm_Customers
GO
IF OBJECT_ID('scm_Accounts', 'U') IS NOT NULL
DROP SCHEMA scm_Accounts
GO
CREATE SCHEMA scm_Branches
GO
CREATE SCHEMA scm_Customers;
GO
CREATE SCHEMA scm_Accounts;

 /*
 creating following schema / table structure:


                      |   (A) scm_Accounts           |  (B)    scm_Customers               |  (C) scm_Branches  
 -------------------------------------------------------------------------------------------------------------------------
         2NF          |  tbl_Ref_Account_Status      |         tbl_Addresses               |      tbl_Banks
		              |  tbl_Ref_Account_Types       |                                     |      tbl_Ref_Branch_Types
					  |	 tbl_Ref_Transaction_Types   |                                     |
--------------------------------------------------------------------------------------------------------------------------
         3NF          |  tbl_Transactions            |         tbl_Customers               |      tbl_Branches
		              |  tbl_Accounts                |                                     |
 
*/


-- (A) scm_Accounts
 
-- Create a new table in schema 'scm_Accounts'
-- Drop the table if it already exists
IF OBJECT_ID('scm_Accounts.tbl_Ref_Account_Status', 'U') IS NOT NULL
DROP TABLE scm_Accounts.tbl_Ref_Account_Status
GO
IF OBJECT_ID('scm_Accounts.tbl_Ref_Account_Types', 'U') IS NOT NULL
DROP TABLE scm_Accounts.tbl_Ref_Account_Types
GO
IF OBJECT_ID('scm_Accounts.tbl_Ref_Transaction_Types', 'U') IS NOT NULL
DROP TABLE scm_Accounts.tbl_Ref_Transaction_Types
GO
IF OBJECT_ID('scm_Accounts.tbl_Transactions', 'U') IS NOT NULL
DROP TABLE scm_Accounts.tbl_Transactions
GO
IF OBJECT_ID('scm_Accounts.tbl_Accounts', 'U') IS NOT NULL
DROP TABLE scm_Accounts.tbl_Accounts
GO

-- 2NF:

CREATE TABLE scm_Accounts.tbl_Ref_Account_Status  
(
        account_status_code varchar(8) NOT NULL, -- primary key column,
        account_status_description char(20),
		CONSTRAINT Pk_tbl_Ref_Account_status_account_status_code PRIMARY KEY  ( account_status_code )
);
GO
CREATE TABLE scm_Accounts.tbl_Ref_Account_Types 
( 
	account_type_code varchar(8) NOT NULL, -- primary key column,
	account_type_description char(20)    ,
	CONSTRAINT Pk_tbl_Ref_Account_Types_account_type_code PRIMARY KEY  ( account_type_code )
 );
 GO
 CREATE TABLE scm_Accounts.tbl_Ref_Transaction_Types 
( 
	transaction_type_code varchar(8) NOT NULL, -- primary key column,
	transaction_type_description char(20)    ,
	CONSTRAINT Pk_tbl_Ref_Transaction_Types_transaction_type_code PRIMARY KEY  ( transaction_type_code )
 );
 GO

-- 3NF: 

CREATE TABLE scm_Accounts.tbl_Accounts ( 
	account_number       int NOT NULL   ,
	account_status_code  varchar(8)    ,
	account_type_code    varchar(8)    ,
	customer_id          int    ,
	current_balance      money    ,
	other_details        char(250)    ,
	CONSTRAINT Pk_tbl_Accounts_account_number PRIMARY KEY  ( account_number )
 );
 CREATE TABLE scm_Accounts.tbl_Transactions ( 
	transaction_id       bigint NOT NULL   ,
	account_number       int    ,
	merchant_id          int    ,
	transaction_type_code varchar(8)    ,
	transaction_date_time timestamp    ,
	transaction_amount   money    ,
	other_details        char(250)    ,
	CONSTRAINT Pk_tbl_Transactions_transaction_id PRIMARY KEY  ( transaction_id )
 );

 -- (B) scm_Customers:
 -- Create a new table in schema 'scm_Customers'. Drop the table if it already exists

IF OBJECT_ID('scm_Customers.tbl_Customers', 'U') IS NOT NULL
DROP TABLE scm_Customers.tbl_Customers
GO
IF OBJECT_ID('scm_Customers.tbl_Addresses', 'U') IS NOT NULL
DROP TABLE scm_Customers.tbl_Addresses
GO

-- Create the table in the specified schema
CREATE TABLE scm_Customers.tbl_Addresses
(
        address_id int NOT NULL, -- primary key column
        line1 nvarchar(50) ,
        line2 nvarchar(50) ,
        town_city nvarchar(50) ,
        zip_postcode nvarchar(10) ,
        state_province_country nvarchar(50) ,
        country nvarchar(30) ,
        other_details nvarchar(50) ,
        CONSTRAINT Pk_tbl_Addresses_address_id PRIMARY KEY  ( address_id )

);
GO
CREATE TABLE scm_Customers.tbl_Customers
(
        customer_id int NOT NULL , -- primary key column
		address_id int ,
		branch_id smallint ,
		personal_details char(50) ,
		contact_details char(50)
        CONSTRAINT Pk_tbl_Customers_customer_id PRIMARY KEY  ( customer_id )

);
GO