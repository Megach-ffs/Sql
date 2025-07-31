/*Task 1*/
--Task: Show all orders placed after 2022 along with the names of the customers who placed them.
--Return: OrderID, CustomerName, OrderDate

SELECT o.OrderID, c.FirstName, o.OrderDate FROM Orders as o
JOIN Customers as c ON o.CustomerID = c.CustomerID AND YEAR(o.OrderDate) > '2022'

/*Task 2*/
--Task: Display the names of employees who work in either the Sales or Marketing department.
--Return: EmployeeName, DepartmentName

SELECT e.Name, d.DepartmentName FROM Employees as e
JOIN Departments as d ON e.DepartmentID = d.DepartmentID AND (d.DepartmentName = 'Sales' OR d.DepartmentName = 'Marketing')

/*Task 3*/
--Return: DepartmentName, MaxSalary
--Task: Show the highest salary for each department.
SELECT d.DepartmentName, MAX(e.Salary) FROM Departments as d
JOIN Employees as e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName

/*Task 4*/
--Return: CustomerName, OrderID, OrderDate
--Task: List all customers from the USA who placed orders in the year 2023.

SELECT * FROM Customers as c
JOIN Orders as o ON c.CustomerID =o.CustomerID AND c.Country = 'USA' AND YEAR(o.OrderDate) = '2023'

/*Task 5*/
--Return: CustomerName, TotalOrders
--Task: Show how many orders each customer has placed.

SELECT c.FirstName + ' ' + c.LastName, COUNT(o.OrderID) as Total_orders FROM Customers as c
LEFT JOIN Orders as o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName + ' ' + c.LastName

/*Task 6*/
--Return: ProductName, SupplierName
--Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.

SELECT * FROM Products as p
JOIN Suppliers as s on p.SupplierID = s.SupplierID AND s.SupplierName IN('Gadget Supplies','Clothing Mart')

/*Task 7*/
--Return: CustomerName, MostRecentOrderDate
--Task: For each customer, show their most recent order. Include customers who haven't placed any orders.

SELECT c.FirstName + ' ' + c.LastName, MAX(o.OrderDate) FROM Customers as c
LEFT JOIN Orders as o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName + ' ' + c.LastName


/*Task 8*/
--Return: CustomerName, OrderTotal
--Task: Show the customers who have placed an order where the total amount is greater than 500.

SELECT c.FirstName + ' ' + c.LastName, SUM(o.TotalAmount) FROM Customers as c
JOIN Orders as o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName + ' ' + c.LastName
HAVING SUM(o.TotalAmount) > 500

/*Task 9*/
--Return: ProductName, SaleDate, SaleAmount
--Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.

SELECT p.ProductName, s.SaleDate, s.SaleAmount FROM Products as p
JOIN Sales as s ON p.ProductID = s.ProductID AND YEAR(s.SaleDate) = '2022' AND s.SaleAmount > 400

/*Task 10*/
--Return: ProductName, TotalSalesAmount
--Task: Display each product along with the total amount it has been sold for.

SELECT p.ProductName, SUM(s.SaleAmount) FROM Products as p
JOIN Sales as s on p.ProductID = s.ProductID
GROUP BY p.ProductName

/*Task 11*/
--Return: EmployeeName, DepartmentName, Salary
--Task: Show the employees who work in the HR department and earn a salary greater than 60000.

SELECT * FROM Employees as e
JOIN Departments as d ON e.DepartmentID = d.DepartmentID AND d.DepartmentName = 'Human Resources' AND Salary > 60000

/*Task 12*/
--Return: ProductName, SaleDate, StockQuantity
--Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.

SELECT p.ProductName, s.SaleDate, p.StockQuantity FROM Products as p
JOIN Sales as s ON p.ProductID = s.ProductID AND YEAR(s.SaleDate) = '2023' AND p.StockQuantity > 100

/*Task 13*/
--Return: EmployeeName, DepartmentName, HireDate
--Task: Show employees who either work in the Sales department or were hired after 2020.

SELECT * FROM Employees as e
JOIN Departments as d ON e.DepartmentID =d.DepartmentID AND (d.DepartmentName = 'Sales' OR YEAR(e.HireDate) > 2020)

/*Task 14*/
--Return: CustomerName, OrderID, Address, OrderDate
---Task: List all orders made by customers in the USA whose address starts with 4 digits.

SELECT c.FirstName+' '+c.LastName, o.OrderID, c.Address, o.OrderDate FROM Customers as c
JOIN Orders as o ON c.CustomerID =o.CustomerID AND c.Country = 'USA' AND c.Address LIKE '[0-9][0-9][0-9][0-9]%'

/*Task 15*/
--Return: ProductName, Category, SaleAmount
--Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.

SELECT p.ProductName, p.Category, s.SaleAmount FROM Products as p
JOIN Sales as s ON p.ProductID = s.ProductID
JOIN Categories as c ON p.Category = c.CategoryID AND c.CategoryName = 'Electronics' AND s.SaleAmount > 350

/*Task 16*/
--Return: CategoryName, ProductCount
--Task: Show the number of products available in each category.

SELECT c.CategoryName, COUNT(p.ProductID) FROM Products as p
JOIN Categories as c ON p.Category = c.CategoryID
GROUP BY c.CategoryName

/*Task 17*/
--Return: CustomerName, City, OrderID, Amount
--Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.

SELECT c.FirstName + ' ' + c.LastName, c.City, o.OrderID, o.TotalAmount FROM Customers as c
JOIN Orders as o ON c.CustomerID = o.CustomerID AND c.City = 'Los Angeles' AND o.TotalAmount > 300

/*Task 18*/
--Return: EmployeeName, DepartmentName
--Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
SELECT e.Name, d.DepartmentName FROM Employees as e
JOIN Departments as d ON e.DepartmentID = d.DepartmentID AND (d.DepartmentName = 'Finance' OR e.Name = '%[AEIOUaeiou]%')

/*Task 19*/
--Return: EmployeeName, DepartmentName, Salary
--Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
SELECT e.Name, d.DepartmentName, e.Salary FROM Employees as e
JOIN Departments as d ON e.DepartmentID =d.DepartmentID AND d.DepartmentName IN('Sales', 'Marketing') AND e.Salary>60000