/*Task 1*/
--Using Products, Suppliers table List all combinations of product names and supplier names.

SELECT * FROM Products as p
CROSS JOIN Suppliers as s

/*Task 2*/
--Using Departments, Employees table Get all combinations of departments and employees.
SELECT * FROM Employees as e
CROSS JOIN Departments as d


/*Task 3*/
--Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
SELECT s.SupplierName, p.ProductName FROM Products as p
JOIN Suppliers as s ON p.SupplierID =s.SupplierID

/*Task 4*/
--Using Orders, Customers table List customer names and their orders ID.

SELECT c.FirstName + ' ' + c.LastName, o.OrderID FROM Customers as c
JOIN Orders as o ON c.CustomerID = o.CustomerID

/*Task 5*/
--Using Courses, Students table Get all combinations of students and courses.
SELECT * FROM Students
CROSS JOIN Courses

/*Task 6*/
--Using Products, Orders table Get product names and orders where product IDs match.
SELECT p.ProductName, o.OrderID FROM Products as p
JOIN Orders as o ON p.ProductID = o.ProductID

/*Task 7*/
--Using Departments, Employees table List employees whose DepartmentID matches the department.
SELECT e.Name, d.DepartmentName FROM Employees as e
JOIN Departments as d ON e.DepartmentID =d.DepartmentID

/*Task 8*/
--Using Students, Enrollments table List student names and their enrolled course IDs.
SELECT s.Name, e.CourseID FROM Students as s
JOIN Enrollments as e ON s.StudentID = e.StudentID

/*Task 9*/
--Using Payments, Orders table List all orders that have matching payments.
SELECT * FROM Orders as o
JOIN Payments as p ON o.OrderID = p.OrderID

/*Task 10*/
--Using Orders, Products table Show orders where product price is more than 100.
SELECT * FROM Products as p
JOIN Orders as o ON p.ProductID = o.ProductID
WHERE p.Price > 100

/*Task 11*/
--Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.
SELECT e.Name, d.DepartmentName FROM Employees as e
JOIN Departments as d ON e.DepartmentID <>d.DepartmentID


/*Task 12*/
--Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
SELECT * FROM Orders as o
JOIN Products as p ON o.ProductID = p.ProductID
WHERE o.Quantity > p.StockQuantity

/*Task 13*/
--Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
SELECT c.FirstName + ' ' + c.LastName, s.ProductID FROM Customers As c
JOIN Sales as s ON c.CustomerID=s.CustomerID
WHERE s.SaleAmount >= 500

/*Task 14*/
--Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.

SELECT s.Name, c.CourseName FROM Students as s
JOIN Enrollments as e ON s.StudentID = e.EnrollmentID
JOIN Courses as c ON e.CourseID = c.CourseID

/*Task 15*/
--Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.

SELECT * FROM Products as p
JOIN Suppliers as s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%'

/*Task 16*/
--Using Orders, Payments table Show orders where payment amount is less than total amount.

SELECT * FROM Orders as o
JOIN Payments as p ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount


/*Task 17*/
--Using Employees and Departments tables, get the Department Name for each employee.

SELECT e.Name, d.DepartmentName FROM Employees as e
JOIN Departments as d ON e.DepartmentID =d.DepartmentID

/*Task 18*/
--Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
SELECT * FROM Products as p
JOIN Categories as c ON p.Category = c.CategoryID
WHERE c.CategoryName in ('Electronics', 'Furniture')

/*Task 19*/
--Using Sales, Customers table Show all sales from customers who are from 'USA'.
SELECT * FROM Customers as c
JOIN Sales as s ON c.CustomerID = s.CustomerID
WHERE c.Country = 'USA'

/*Task 20*/
--Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
SELECT * FROM Customers as c
JOIN Orders as o ON c.CustomerID =o.OrderID
WHERE c.Country = 'Germany' AND o.TotalAmount > 100

/*Task 21*/
--Using Employees table List all pairs of employees from different departments.
SELECT * FROM Employees as e1
JOIN Employees as e2 ON e1.EmployeeID < e2.EmployeeID
WHERE e1.DepartmentID <> e2.DepartmentID

/*Task 22*/
--Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
SELECT * FROM Payments as pa
JOIN Orders as o ON o.OrderID = pa.OrderID
JOIN Products as po ON o.ProductID = po.ProductID
WHERE pa.Amount <> o.Quantity * po.Price

/*Task 23*/
--Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
SELECT s.Name, c.CourseName FROM Students as s
FULL JOIN Enrollments as e ON s.StudentID = e.EnrollmentID
FULL JOIN Courses as c ON e.CourseID = c.CourseID

/*Task 24*/
--Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.
SELECT * FROM Employees as e1
JOIN Employees as e2 ON e1.EmployeeID = e2.ManagerID
WHERE e1.Salary <= e2.Salary

/*Task 25*/
--Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
SELECT * FROM Orders as o
LEFT JOIN Payments as p ON o.OrderID = p.OrderID
JOIN Customers as c ON o.CustomerID = c.CustomerID
WHERE p.PaymentID is null