/*
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
*/


IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL 
DROP Table Employee
GO
CREATE TABLE Employee (Id int,salary int)
GO
INSERT INTO Employee (Id,salary)  VALUES(1,100),(2,200),(3,300)
GO
Select * FROM Employee
GO

select max(salary) as SecondHighestSalary
from Employee
where salary < (SELECT MAX(Salary) from EMployee)