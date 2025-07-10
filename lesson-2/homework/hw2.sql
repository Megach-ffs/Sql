--Basic-Level Tasks 

-- 1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
CREATE TABLE Employees (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))

-- 2. Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
-- Single row insert
INSERT INTO Employees
VALUES (1, 'Crown', 2000)


-- Multiple row insert
INSERT INTO Employees
VALUES
(2, 'Snape', 1800),
(3, 'Getsby', 1700),
(4, 'Forger', 8000)

-- 3. Update the Salary of an employee to 7000 where EmpID = 1.
UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1

-- 4. Delete a record from the Employees table where EmpID = 2.
DELETE Employees
WHERE EmpID = 2

/* 5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
DELETE is a DML command, and it is used to delete records within table,
and can be specified what to delete

TRUNCATE is a DDL command, and it is used to delete all records from table

DROP is a DDL command, and it is used to delete objects from the database
*/
-- 6. Modify the Name column in the Employees table to VARCHAR(100). 
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100)

-- 7. Add a new column Department (VARCHAR(50)) to the Employees table.
ALTER TABLE Employees
ADD Department VARCHAR(50)

-- 8. Change the data type of the Salary column to FLOAT.
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT

-- 9. Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
CREATE TABLE Departments (DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50))

-- 10. Remove all records from the Employees table without deleting its structure.
TRUNCATE TABLE Employees


--Intermediate-Level Tasks 

-- 11. Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
INSERT INTO Departments
VALUES 
(1, 'HR'),
(2, 'IT'),
(3, 'Management')

-- 12. Update the Department of all employees where Salary > 5000 to 'Management'. 

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 7000

-- 13. Write a query that removes all employees but keeps the table structure intact.
DELETE Employees

-- 14. Drop the Department column from the Employees table.
ALTER TABLE Employees
DROP COLUMN Department

-- 5. Rename the Employees table to StaffMembers using SQL commands. 
EXEC sp_rename 'Departments', 'StaffMembers';

-- 16. Write a query to completely remove the Departments table from the database.
DROP TABLE Departments


-- Advanced-Level Tasks 

-- 17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
-- 18. Add a CHECK constraint to ensure Price is always greater than 0.
CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(100),Category VARCHAR(50), Price DECIMAL(10, 2), Place VARCHAR(50), CHECK (Price > 0))

-- 19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.
ALTER TABLE Products
ADD StockQuantity INT DEFAULT(50)


-- 20. Rename Category to ProductCategory 
EXEC sp_rename 'Products.Category',  'ProductCategory', 'COLUMN'; 

-- 21. Insert 5 records into the Products table using standard INSERT INTO queries.
INSERT INTO Products
VALUES
(1, 'Apple', 'Food', 1.49, 'Market', 40),
(2, 'Samsung', 'Phone', 459.49, 'Amazon', 15),
(3, 'Nvidia RTX4090', 'Computer', 789.49, 'Store', 10),
(4, 'Water dispenser', 'Electronics', 11.49, 'Water distributor', 100),
(5, 'Photoshop', 'App', 201.49, 'Adobe Shop',50)

-- 22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data. 
SELECT * INTO Products_Backup FROM Products

-- 23. Rename the Products table to Inventory.
EXEC sp_rename 'Products', 'Inventory';

-- 24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT. 
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT

-- 25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5)