REM This will create symlinks from SQL Server to any desired storage location.

mklink /D "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_log2" "\\DSKP50\Users\hector\CODIZ LIMITED\Codehub - Projects\sqlschool\TSQL_BANKING_PROJECT\LOGFILES"
mklink /D "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_FG_accounts" "\\DSKP50\Users\hector\CODIZ LIMITED\Codehub - Projects\sqlschool\TSQL_BANKING_PROJECT\FILEGROUPS\FG_accounts"
mklink /D "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_FG_customers" "\\DSKP50\Users\hector\CODIZ LIMITED\Codehub - Projects\sqlschool\TSQL_BANKING_PROJECT\FILEGROUPS\FG_customers"
mklink /D "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\STORAGE\BSBANK_OLTP_FG_branches" "\\DSKP50\Users\hector\CODIZ LIMITED\Codehub - Projects\sqlschool\TSQL_BANKING_PROJECT\FILEGROUPS\FG_branches"