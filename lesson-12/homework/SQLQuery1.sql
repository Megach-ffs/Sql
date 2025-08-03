/*Task 1*/

CREATE TABLE Person (personId INT PRIMARY KEY, lastName varchar(50), firstName varchar(50))

CREATE TABLE Address (addressId INT PRIMARY KEY, personId INT , city VARCHAR(50), state VARCHAR(50))

INSERT INTO Person VALUES
(1, 'Wang', 'Allen'),
(2, 'Alice', 'Bob')

INSERT INTO Address VALUES
(1, 2, 'New York City', 'New York'),
(2, 3, 'Leetcode', 'California')

SELECT firstName, lastName, city, state FROM Person
LEFT JOIN Address ON Person.personId = Address.personId

/*Task 2*/

CREATE TABLE Employee (id INT PRIMARY KEY, name VARCHAR(255), salary INT, managerId INT)
INSERT INTO Employee VALUES 
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL)

SELECT * FROM Employee as e1
JOIN Employee as manager ON e1.managerId = manager.id
WHERE e1.salary > manager.salary

/*Task 3*/
CREATE TABLE Email (id INT PRIMARY KEY, email VARCHAR(255))
INSERT INTO Email VALUES 
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com')

SELECT email FROM Email
GROUP BY email
HAVING COUNT(email) >1 

/*Task 4*/
INSERT INTO Email VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com')

DELETE FROM Email
WHERE email = (SELECT email FROM Email
GROUP BY email
HAVING COUNT(email) >1)

SELECT * FROM Email

/*Task 5*/

CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

SELECT DISTINCT girls.ParentName FROM girls
Left JOIN boys ON girls.ParentName = boys.ParentName
WHERE boys.id is null


/*Task 6*/
select custid, sum( freight), min(freight) from Sales.Orders
group by custid
having sum(freight)>50

/*Task 7*/

DROP TABLE IF EXISTS Cart1;
DROP TABLE IF EXISTS Cart2;
GO

CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');

SELECT * FROM Cart1 as c1
FULL JOIN Cart2 as c2 ON c1.Item = c2.Item

/*Task 8*/

Create table Customers (id int, name varchar(255))
Create table Orders (id int, customerId int)
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

select c.name from Customers c
left join Orders o on c.id=o.customerId
where o.customerId is null

/*Task 9*/
Create table Students (student_id int, student_name varchar(20))
Create table Subjects (subject_name varchar(20))
Create table Examinations (student_id int, subject_name varchar(20))
Truncate table Students
insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob')
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex')
insert into Subjects (subject_name) values ('Math')
insert into Subjects (subject_name) values ('Physics')
insert into Subjects (subject_name) values ('Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Programming')
insert into Examinations (student_id, subject_name) values ('2', 'Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Programming')
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Math')

SELECT s.student_id, s.student_name, e.subject_name, ISNULL(COUNT(e.student_id), 0) FROM Students as s
LEFT JOIN Examinations as e ON s.student_id = e.student_id
GROUP BY e.subject_name, s.student_id, s.student_name