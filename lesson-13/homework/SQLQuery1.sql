--task 1
SELECT CONCAT(EMPLOYEE_ID, '-',FIRST_NAME, LAST_NAME) AS Name FROM employees;

--task 2
UPDATE Employees
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER,124,999);

--task 3
SELECT FIRST_NAME, LEN(FIRST_NAME) lenth_name
FROM Employees
WHERE FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'J%' OR FIRST_NAME LIKE 'M%';

--task 4
SELECT FIRST_NAME + ' ' + LAST_NAME AS Name, SUM(SALARY) AS total_salary FROM Employees
GROUP BY FIRST_NAME + ' ' + LAST_NAME;

--task 5
SELECT *, GREATEST(max1,Max2,Max3) AS TestMax FROM TestMax;

--task 6
SELECT id, movie, description FROM cinema
WHERE id % 2 = 1 AND description = 'boring';

--task 7
SELECT * FROM SingleOrder
ORDER BY CASE WHEN id = 0 THEN 100000 ELSE id END;

--task 8
SELECT COALESCE(ssn, passportid, itin)
FROM person;

--task 9
SELECT SUBSTRING(FullName, 1, CHARINDEX(' ', FullName)-1) AS FirstName,
SUBSTRING(Fullname, CHARINDEX(' ', FullName )+1, CHARINDEX(' ', FullName, CHARINDEX(' ', FullName)+1) - CHARINDEX(' ', FullName)) AS MiddleName,
SUBSTRING(FullName, CHARINDEX(' ', FullName, CHARINDEX(' ', FullName )+1 )+1, LEN(fullname)) AS LastName
FROM Students;

--task 10
SELECT * FROM Orders
WHERE DeliveryState = 'TX' AND CustomerID IN (SELECT CustomerID FROM Orders
WHERE DeliveryState = 'CA');

--task 11
SELECT STRING_AGG(String, ' ') AS query FROM DMLTable;

--task 12
SELECT FIRST_NAME + ' ' + LAST_NAME AS fullname FROM Employees
WHERE FIRST_NAME + ' ' + LAST_NAME LIKE '%a%a%a%';

--task 13
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS totalem, COUNT(EMPLOYEE_ID)*100/(SELECT COUNT(EMPLOYEE_ID) FROM Employees WHERE YEAR(GETDATE())- YEAR(HIRE_DATE) > 3) FROM Employees
WHERE YEAR(GETDATE()) - YEAR(HIRE_DATE) > 3
GROUP BY DEPARTMENT_ID;

--task 14
SELECT MIN(MissionCount) AS [min], MAX(MissionCount) AS [max], JobDescription FROM Personal
GROUP BY JobDescription;

--task 16
SELECT *, (SELECT SUM(Grade) FROM Students AS s1 WHERE s1.StudentID <= Students.StudentID) FROM Students;

--task 18
SELECT * FROM Student AS s1
CROSS JOIN student AS s2
WHERE s1.Birthday = s2.Birthday AND s1.StudentName != s2.StudentName;

--task 19
SELECT GREATEST(PlayerA,PlayerB) AS p1, LEAST(PlayerA, PlayerB) AS p2, SUM(Score) FROM PlayerScores
GROUP BY GREATEST(PlayerA,PlayerB), LEAST(PlayerA, PlayerB);