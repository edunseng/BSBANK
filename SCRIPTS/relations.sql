-- Adding relations to scm_Customers
ALTER TABLE scm_Customers.tbl_Customers ADD 
CONSTRAINT Fk_tbl_Customers_tbl_Addresses 
FOREIGN KEY ( address_id ) REFERENCES scm_Customers.tbl_Addresses( address_id ) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE scm_Customers.tbl_Customers ADD 
CONSTRAINT Fk_tbl_Customers_tbl_Branches 
FOREIGN KEY ( branch_id ) REFERENCES scm_Branches.tbl_Branches( branch_id ) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Adding relations to scm_Accounts
ALTER TABLE scm_Accounts.tbl_Accounts ADD 
CONSTRAINT Fk_tbl_Accounts_tbl_Ref_Account_Status FOREIGN KEY ( account_status_code ) 
REFERENCES scm_Accounts.tbl_Ref_Account_Status( account_status_code ) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE scm_Accounts.tbl_Accounts ADD 
CONSTRAINT Fk_tbl_Accounts_tbl_Ref_Account_Types 
FOREIGN KEY ( account_type_code ) REFERENCES scm_Accounts.tbl_Ref_Account_Types( account_type_code ) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE scm_Accounts.tbl_Accounts ADD 
CONSTRAINT Fk_tbl_Accounts_tbl_Customers 
FOREIGN KEY ( customer_id ) REFERENCES scm_Customers.tbl_Customers( customer_id ) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE scm_Accounts.tbl_Transactions ADD 
CONSTRAINT Fk_tbl_Transactions_tbl_Accounts 
FOREIGN KEY ( account_number ) REFERENCES scm_Accounts.tbl_Accounts( account_number ) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE scm_Accounts.tbl_Transactions ADD 
CONSTRAINT Fk_tbl_Transactions_tbl_Ref_Transaction_Types 
FOREIGN KEY ( transaction_type_code ) REFERENCES scm_Accounts.tbl_Ref_Transaction_Types( transaction_type_code ) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Adding relations to scm_Branches
ALTER TABLE scm_Branches.tbl_Branches ADD 
CONSTRAINT Fk_tbl_Branches_tbl_Addresses 
FOREIGN KEY ( address_id ) REFERENCES scm_Customers.tbl_Addresses( address_id ) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE scm_Branches.tbl_Branches ADD 
CONSTRAINT Fk_tbl_Branches_tbl_Banks 
FOREIGN KEY ( bank_id ) REFERENCES scm_Branches.tbl_Banks( bank_id ) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE scm_Branches.tbl_Branches ADD 
CONSTRAINT Fk_tbl_Branches_tbl_Ref_Branch_Types 
FOREIGN KEY ( branch_type_code ) REFERENCES scm_Branches.tbl_Ref_Branch_Types( branch_type_code ) 
ON DELETE NO ACTION ON UPDATE NO ACTION;


