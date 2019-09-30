-- Drop schema 'scm_Branches' if it already exists.
IF OBJECT_ID('scm_Branches.tbl_Banks', 'U') IS NOT NULL
DROP TABLE scm_Branches.tbl_Banks
GO
IF OBJECT_ID('scm_Branches.tbl_Ref_Branch_Types', 'U') IS NOT NULL
DROP TABLE scm_Branches.tbl_Ref_Branch_Types
GO
IF OBJECT_ID('scm_Branches.tbl_Branches', 'U') IS NOT NULL
DROP TABLE scm_Branches.tbl_Branches
GO
IF OBJECT_ID('scm_Branches', 'U') IS NULL
DROP SCHEMA scm_Branches
GO

-- Drop schema 'scm_Customers' if it already exists.
IF OBJECT_ID('scm_Customers.tbl_Customers', 'U') IS NOT NULL
DROP TABLE scm_Customers.tbl_Customers
GO
IF OBJECT_ID('scm_Customers.tbl_Addresses', 'U') IS NOT NULL
DROP TABLE scm_Customers.tbl_Addresses
GO
IF OBJECT_ID('scm_Customers', 'U') IS NULL 
DROP SCHEMA scm_Customers
GO

-- Drop schema 'scm_Accounts' if it already exists.
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
IF OBJECT_ID('scm_Accounts', 'U') IS NULL 
DROP SCHEMA scm_Accounts
GO


 /*
 creating the following schema / table structure:


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
-------------------------------------------------------------------------------------------

-- 2NF:
CREATE SCHEMA scm_Accounts
GO
CREATE TABLE scm_Accounts.tbl_Ref_Account_Status  
(
        account_status_code varchar(8) NOT NULL, -- (PK),
        account_status_description char(50),
		CONSTRAINT Pk_tbl_Ref_Account_status_account_status_code PRIMARY KEY  ( account_status_code )
);
GO


CREATE TABLE scm_Accounts.tbl_Ref_Account_Types 
( 
	account_type_code varchar(8) NOT NULL, -- (PK)
	account_type_description char(50)    ,
	CONSTRAINT Pk_tbl_Ref_Account_Types_account_type_code PRIMARY KEY  ( account_type_code )
 );
 GO
 CREATE TABLE scm_Accounts.tbl_Ref_Transaction_Types 
( 
	transaction_type_code varchar(8) NOT NULL, -- (PK),
	transaction_type_description char(50)    ,
	CONSTRAINT Pk_tbl_Ref_Transaction_Types_transaction_type_code PRIMARY KEY  ( transaction_type_code )
 );
 GO

-- 3NF: 

CREATE TABLE scm_Accounts.tbl_Accounts ( 
	account_number       int NOT NULL   , --(PK)
	account_status_code  varchar(8) NOT NULL   ,-- (FK)
	account_type_code    varchar(8) NOT NULL   ,-- (FK)
	customer_id          int NOT NULL , --(FK)
	current_balance      money    ,
	other_details        char(50)    ,
	CONSTRAINT Pk_tbl_Accounts_account_number PRIMARY KEY  ( account_number )
 );
 GO

 CREATE TABLE scm_Accounts.tbl_Transactions ( 
	transaction_id       bigint NOT NULL   , --(PK)
	account_number       int NOT NULL   , -- (FK)
	merchant_id          int NOT NULL   , -- (FK)
	transaction_type_code varchar(8) NOT NULL   , -- (FK)
	transaction_date_time datetime    ,
	transaction_amount   money    ,
	other_details        char(50)    ,
	CONSTRAINT Pk_tbl_Transactions_transaction_id PRIMARY KEY  ( transaction_id )
 );
 GO


 -- (B) scm_Customers:
 -------------------------------------------------------------------------------------------
CREATE SCHEMA scm_Customers
GO
-- 2NF
CREATE TABLE scm_Customers.tbl_Addresses 
(
        address_id int NOT NULL, -- (PK)
        line1 nvarchar(50) , 
        line2 nvarchar(50) ,
        town_city nvarchar(50) ,
        zip_postcode nvarchar(10) ,
        state_province_country nvarchar(50) ,
        country nvarchar(50) ,
        other_details nvarchar(50) ,
        CONSTRAINT Pk_tbl_Addresses_address_id PRIMARY KEY  ( address_id )

);
GO
--3NF
CREATE TABLE scm_Customers.tbl_Customers
(
        customer_id int NOT NULL , -- (PK)
		address_id int NOT NULL, --(FK)
		branch_id smallint NOT NULL, --(FK)
		personal_details char(50) ,
		contact_details char(50)
        CONSTRAINT Pk_tbl_Customers_customer_id PRIMARY KEY  ( customer_id )

);
GO

-- (C) scm_Branches 
-------------------------------------------------------------------------------------------
--2NF

CREATE SCHEMA scm_Branches
GO

CREATE TABLE scm_Branches.tbl_Banks
(
	bank_id smallint NOT NULL , -- (PK)
	bank_details char(50) ,
	CONSTRAINT Pk_tbl_Banks_bank_id PRIMARY KEY  ( bank_id )
);
GO
CREATE TABLE scm_Branches.tbl_Ref_Branch_Types
(
	branch_type_code varchar(8) NOT NULL , -- (PK)
	branch_type_description char(50) ,
	CONSTRAINT Pk_tbl_Ref_Branch_branch_type_code PRIMARY KEY  ( branch_type_code )
);
GO

--3NF
CREATE TABLE scm_Branches.tbl_Branches
(
	branch_id  smallint NOT NULL, -- (PK)
	address_id int NOT NULL,  -- (FK)
	bank_id smallint NOT NULL , -- (FK)
	branch_type_code varchar(8) NOT NULL , -- (FK)
	branch_details char(50) ,
	CONSTRAINT Pk_tbl_Branches_branch_id PRIMARY KEY  ( branch_id )
);
GO
