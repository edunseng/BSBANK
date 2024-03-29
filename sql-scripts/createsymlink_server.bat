[createsymlinks.bat]
ECHO OFF
REM create folder structure for files & filegroups
mkdir "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_log2"
mkdir "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_FG_accounts" 
mkdir "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_FG_customers" 
mkdir "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_FG_branches"

REM creating symlinks to storage device for data storage
"mklink /D "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_log2" "<YOUR_STORAGE_PATH>"
"mklink /D "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_FG_accounts" "<YOUR_STORAGE_PATH>"
"mklink /D "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_FG_customers" "<YOUR_STORAGE_PATH>"
"mklink /D "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_FG_branches" "<YOUR_STORAGE_PATH>"