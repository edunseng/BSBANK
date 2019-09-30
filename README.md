<<<<<<< HEAD
# BSBANK T-SQL DATABASE PROJECT
Database Project - T-SQL Table Design and Programming.</br>
=======
# BSBANK</br>
#### <a href="http://drive-html-viewer.pansy.at/?state=%7B%22ids%22:%5B%221_TdjFnFvNpeZrGT9hW1f-rDsxVuQkoE-%22%5D,%22action%22:%22open%22,%22userId%22:%22109445521876338902169%22%7D">CLICK HERE TO VIEW THE DATABASE DESIGN</a>
### Britsh Standard Bank
### Database Development - T-SQL Table Design & Programming.</br>
>>>>>>> c8d9ebbf1c08feb5f1c12f95bee190d4d0964f44

<p>
 To test the design, restore the <a href="https://github.com/edunseng/BSBANK/blob/master/BSBANK.bak">database </a> directly from the backup file.</br>
 Create from source code with following scriptfiles:
 <li>
 <ol> 1. <a href="https://github.com/edunseng/BSBANK/blob/master/SCRIPTS/createsymlink_server.bat">createsymlink_server.bat</a>  - run this batch file to create the necessary filegroup-folder structure on your database server instance. Adapt the code to your needs by replacing the placeholder.</ol>
 <ol> 2. <a href="https://github.com/edunseng/BSBANK/blob/master/SCRIPTS/create_database.sql">create_database.sql</a> creates the databse BSBANK.</ol>
 <ol> 3. <a href="https://github.com/edunseng/BSBANK/blob/master/SCRIPTS/create_table_structure.sql">create_table_structure.sql</a> to create schemas and tables.  </ol>
 <ol> 4. <a href="https://github.com/edunseng/BSBANK/blob/master/SCRIPTS/create_relations.sql">create_relations.sql</a> creates the table relations.  </ol>
  <ol>5. <a href="https://github.com/edunseng/BSBANK/blob/master/SCRIPTS/remove_relations.sql">remove_relations.sql</a> removes relational structure.  </ol>
 </li>
 <p>
 For development create the git flow branches using these batch files:</br>
 <li>
 <ol> 1. <a href="https://github.com/edunseng/BSBANK/blob/master/gitflowstart.bat">gitflowstart.bat</a></br> will create these feature branches:</br>
STEP1: Database and Table design - Filegroups, Files, Schemas, Tables, Relations & Keys</br>
STEP2: Query Requirements - Joins, Combinations, Operators, Functions, Views, Sub Queries, Cursors, Set Operations, Pivot, Nested Queries</br>
STEP3: Programming  - Stored Procedures, Dynamic Data Inserts, Insertions with Data Security, Automated DMLs with DTC & Transactions. Lock Hints & Indexes</br>
STEP4: Insert and test data</br></ol>
 <ol> 2. <a href="https://github.com/edunseng/BSBANK/blob/master/gitflowstop.bat">gitflowstop.bat</a>.Script to finish development.</ol>
 </li>
 <p>
 HAPPY HACKING !
 </p>



