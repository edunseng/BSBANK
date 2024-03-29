-- Accounts 
ALTER TABLE scm_Accounts.tbl_Accounts 
DROP CONSTRAINT Fk_tbl_Accounts_tbl_Customers;

ALTER TABLE scm_Accounts.tbl_Accounts 
DROP CONSTRAINT Fk_tbl_Accounts_tbl_Ref_Account_Status;

ALTER TABLE scm_Accounts.tbl_Accounts 
DROP CONSTRAINT Fk_tbl_Accounts_tbl_Ref_Account_Types;

ALTER TABLE scm_Accounts.tbl_Transactions 
DROP CONSTRAINT Fk_tbl_Transactions_tbl_Accounts;

ALTER TABLE scm_Accounts.tbl_Transactions 
DROP CONSTRAINT Fk_tbl_Transactions_tbl_Ref_Transaction_Types;

--Branches
ALTER TABLE scm_Branches.tbl_Branches 
DROP CONSTRAINT Fk_tbl_Branches_tbl_Addresses;

ALTER TABLE scm_Branches.tbl_Branches 
DROP CONSTRAINT Fk_tbl_Branches_tbl_Banks;

ALTER TABLE scm_Branches.tbl_Branches 
DROP CONSTRAINT Fk_tbl_Branches_tbl_Ref_Branch_Types;

-- Customers
ALTER TABLE scm_Customers.tbl_Customers 
DROP CONSTRAINT Fk_tbl_Customers_tbl_Addresses;

ALTER TABLE scm_Customers.tbl_Customers 
DROP CONSTRAINT Fk_tbl_Customers_tbl_Branches;
