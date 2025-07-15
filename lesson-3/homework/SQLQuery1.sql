-- Easy-Level tasks (10)

/* 1. Define and explain the purpose of BULK INSERT in SQL Server.
BULK INSERT is a Transact-SQL (T-SQL) command used in SQL Server to quickly import large volumes of data
from a data file into a SQL Server table. It is designed for high-performance loading of data
and is commonly used when transferring data from external files into the database.*/

/* 2. List four file formats that can be imported into SQL Server.
CSV, TXT, XML, JSON
*/

/* 3. Create a table Products with columns:ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).*/

CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2))

/* 4. Insert three records into the Products table using INSERT INTO.*/

INSERT INTO Products
VALUES (1, 'Ruler', 10),(2, 'Pen', 2.49),(3, 'Notebook', 3.49)

/* 5. Explain the difference between NULL and NOT NULL.
NULL is a data type that represents missing, unkonow or undefined data
NOT NULL makes sure that a value must be provided
*/

/* 6. Add a UNIQUE constraint to the ProductName column in the Products table.*/

ALTER TABLE Products
ADD CONSTRAINT cool UNIQUE (ProductName )

/* 7. Write a comment in a SQL query explaining its purpose.
There are 2 ways of creating comments in sql, 
1st is single line via "--"
2nd is multiple line using "/**/" (the comment must be entered between stars)
*/

/* 8. Add CategoryID column to the Products table.*/

ALTER TABLE Products
ADD CategoryID INT

/* 9. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.*/

CREATE TABLE Categories (CategoryID INT PRIMARY KEY, CategoryName VARCHAR(50) UNIQUE)

/* 10. Explain the purpose of the IDENTITY column in SQL Server.
The IDENTITY column in sql is used to create unique numeric values for a column,
and most of the times used for primary key
*/

-- Medium-Level Tasks (7)

/* 11. Use BULK INSERT to import data from a text file into the Products table.*/

BULK INSERT Products
FROM 'C:\trash\test.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 1)

SELECT * FROM Products

/* 12. Create a FOREIGN KEY in the Products table that references the Categories table.*/

ALTER TABLE Products
ADD CONSTRAINT lul FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)

/* 13. Explain the differences between PRIMARY KEY and UNIQUE KEY.
PRIMARY KEY - uniquely identifies each row in a table and NULL not allowed (every value must be NOT NULL)
UNIQUE KEY - Ensures all values in a column (or combo) are unique but  Allows one NULL
*/

/* 14. Add a CHECK constraint to the Products table ensuring Price > 0.*/

ALTER TABLE Products
ADD CONSTRAINT lll CHECK(Price>0)

/* 15. Modify the Products table to add a column Stock (INT, NOT NULL).*/
ALTER TABLE Products
ADD Stock INT NOT NULL

/* 16. Use the ISNULL function to replace NULL values in Price column with a 0.*/

SELECT ProductID, ISNULL(Price, 0) AS Price
FROM Products;

/* 17. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
A foreign key is a set of attributes in a table that refers
to the primary key of another table, linking these two tables and createing relationships.
*/

--Hard-Level Tasks (6)

/* 18. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.*/

CREATE TABLE Customers (CustomerID INT PRIMARY KEY, Name VARCHAR(50), Balance INT, Age INT CHECK(AGE>= 18))

/* 19. Create a table with an IDENTITY column starting at 100 and incrementing by 10.*/

CREATE TABLE Orders (OrderID INT PRIMARY KEY IDENTITY(100,10), CustomerID INT, OrderDate DATE)

/* 20. Write a query to create a composite PRIMARY KEY in a new table OrderDetails.*/
CREATE TABLE OrderDetails (OrderID INT, CustomerID INT, Quantity INT, Price DECIMAL (10,2), PRIMARY KEY(OrderID, CustomerID))

/* 21. Explain the use of COALESCE and ISNULL functions for handling NULL values.

ISNULL is used for simple cases where you want to replace a single NULL value.
COALESCE is used when you need to check multiple columns or expressions and get the first non-NULL value.
*/

/* 22. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.*/
CREATE TABLE Employees (EmpID INT, Email VARCHAR(50), PRIMARY KEY(EmpID, Email))

/*23. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.*/
CREATE TABLE OrderDetails (OrderDetailsID INT PRIMARY KEY,OrderID INT, CustomerID INT, Quantity INT, Price DECIMAL (10,2),
FOREIGN KEY(OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE)
