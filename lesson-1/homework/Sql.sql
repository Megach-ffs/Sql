-- Easy tasks

/* 1. Define the following terms: data, database, relational database, and table.

Data are a collection of discrete or continious values that convey information,
describing the quantity, quality, fact, statistics, other basic units of meaning, or simply
sequences of symbols that may be futher analysed

A database is an organized collection of structured information,
or data, typically stored electronically in a computer system. 

A relational database is a type of database that stores and provides access
to data points that are related to one another.
Relational databases are based on the relational model,an intuitive,
straightforward way of representing data in tables.

In a database, a table is a collection of related data organized in table format;
consisting of columns and rows.
*/



/* 2. List five key features of SQL Server.
Uses TSQL
Relational Database Management
Easy integration with other microsoft products
Has helpful amount of System Stored procedures
Easy to scale
*/

/* 3. What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

There are 2 modes of authentication to connect: Windows Authentication and Mixed mode

Windows Authentication connects to Sql server using Windows user account,
Sql Server valdites password and name using windows principal token,
thus Sql server doesnt ask for password

Mixed Mode allows to connect Sql server using logins that are created in Sql server
and that are not based on Windows. In order to be able to connect to the Sql server,
user must provide correct username and password every time they try to log in
*/

-------------------------------------------------------------------------------------------------------

-- Medium tasks

/* 4. Create a new database in SSMS named SchoolDB. */

CREATE DATABASE SchoolDB
USE SchoolDB

/* 5. Write and execute a query to create a table called Students with columns:
StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).*/

CREATE TABLE Students (StudentID INT, Name VARCHAR(50), Age INT)
SELECT * FROM Students

/* 6. Describe the differences between SQL Server, SSMS, and SQL.
Sql Server - tool that is used to manage relational database management system developed by Microsoft

SSMS (Sql Server Management Studio) - Graphical User Interface to manage Sql Server

Sql (Structured Query Language) - programming language used to manage data
and used in relational database management systems.
*/

-------------------------------------------------------------------------------------------------------

-- Hard tasks

/* 7. Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.

DQL (Data Query Language) statements are used to retrieve data from database.
Example: SELECT ... FROM ... WHERE ... ORDER BY ...

DML (Data Manipulation Language) commands deal with existing data within database (data inside rows)
Example: UPDATE ... SET ... WHERE ...

DDL (Data Definition Language) commands that can be used to define, alter and delete
database structures: tables, indexes and schemas
Example: TRUCANTE ...

DCL (Data Control Language) commands that deal with rights and permission of the database system
Example: GRANT ... ON ... TO ...

TCL (Transaction Control Language) commands put task into a single
session that can be undid or closed by committing
Example: ROLLBACK

*/

/* 8. Write a query to insert three records into the Students table.*/

INSERT INTO Students 
VALUES 
(1, 'Tom', 16),
(2, 'Peter', 23),
(3, 'John', 18)

/* 9. Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit)
You can find the database from this link:
https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak

1-Step: Download the file
2-Step: Locate the file
3-Step: Copy the file to "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup" folder
4-Step: Right click folder called "Databases" in "Object Explorer"
5-Step: Choose "Restore Database" option
6-Step: Click on "Device" and then on "..." (three dots) in source
7-Step: Add the file
8-Step: Press "Ok" and "Ok"
9-Step: Database is successfully restored
*/
