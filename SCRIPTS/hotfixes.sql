-- ISSUE: Time inserts to tbl_Transactions.transaction_date_time throwing errors.
-- HOTFIX1. changing column type: timestamp to datetime:

ALTER TABLE scm_Accounts.tbl_Transactions 
DROP COLUMN transaction_date_time
GO
ALTER TABLE scm_Accounts.tbl_Transactions
    ADD transaction_date_time datetime  NOT NULL 
GO