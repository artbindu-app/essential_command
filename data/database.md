<!-- # Database Learning -->

## Database Learning

## Different type of database
There are different type of database structures:
1. Hierarchical database:
   Follow a ranking order or parent-child relationship to structure data.
   Example: Computer File System, IBM Information Management System(IMS).

2. Network database:
   It's similar to Hierarchical database. but it connects the child record with various parent records and allowing two-directional relationships.

3. Object-Oriented database:
   System stores information of this type of database is an object-like manner.

4. Relational database:
   It's table-oriented, where every bit of data is linked to every other bit of data.

5. Non-relational or NoSQL database:
   There are variety of format support in No-SQL database, such as documents, graphs, wide columns, etc., which offers excellent flexibility and scalability to a database design.

## Types of SQL Commands:
- DDL – Data Definition Language <br>
- DQL – Data Query Language
- DML – Data Manipulation Language
- DCL – Data Control Language
- TCL – Transaction Control Language


https://www.astera.com/type/blog/a-quick-overview-of-different-types-of-databases/

### DDL (Data Definition Language):
Set of SQL commands use to create, update and delete database structures but not data. <br>

List of DDL Commands:<br>
    1. Create: Used to create database or it's object<br>
        (Like: Table, View, index, function, procedure & triggers)<br>
    2. DROP: Used to delete database or it's object<br>
    3. ALTER: Used to alter the database<br>
    4. TRUNCATE: Used to delete all rows or remove all records from database table.<br>
    5. COMMENT: Used to add comments to the data dictionary<br>
    6. RENAME: Used to rename database objects.<br>


### DQL (Data Query Language):
This SQL commands allows to getting data out of the database to perform operations with it, used to show data imposing some order or grouping.<br>

List of DQL Commands:<br>
    1. SELECT: Used to retrive data from database<br>
        (We may retrive data with or with out condition and grouping, may renderding data with some orders)<br>

### DML (Data Manipulation Language):
Set of SQL commands deal with data manipulation into database table.<br>

List of DML Commands:<br>
    1. INSERT: Used to insert/add data into table<br>
    2. UPDATE: Used to updata existing data/rows into table with some condition<br>
    3. DELETE: Used to delete existing data/row in table with some condition<br>
    4. LOCK: Table control concurrency<br>
    5. CALL: Call a PL/pgSQL or JAVA Subprogram<br>
    6. EXPLAIN PLAN: Describe access path to data<br>

### DCL (Data Control Language):
This type of SQL commands used to give rights, permissions and other controls of the database system.<br>

List of DCL commands:<br>
    1. GRANT: Give users access privileges to db<br>
    2. REVOKE: Withdraws the users access privileges given by using the GRANT command.<br>

### TCL (Rransaction Control language):
Transaction group is a set of tasks in a single execution unit. Each transaction begins with a specific task and ends when all the takes in the group are successfully completed.<br> 
If any task fail, then whole transaction is failed. <br>
Therefore, every transaction has only two results: 'Success' or 'Failure'.<br>

List of TCL commands:<br>
    1. BEGIN: Opens a Transaction<br>
    2. COMMIT: Commits a Transaction<br>
    3. ROLLBACK: Rollbacks a transaction in case of any error occurs.<br>
    4. SAVEPOINT: Sets a save point within a transaction<br>




Refference:<br>
    1. [astera.com](https://www.astera.com/type/blog/a-quick-overview-of-different-types-of-databases/)<br>
    2. [GeeksforGeeks](https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/)<br>
    3. [javatpoint](https://www.javatpoint.com/dbms-sql-command)<br>
    4. 



