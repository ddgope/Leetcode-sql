/*
The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

+----------+
| Employee |
+----------+
| Joe      |
+----------+
*/


IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL 
DROP Table Employee
GO
CREATE TABLE Employee (Id int,[Name] varchar(50),Salary int, ManagerId int)
GO
INSERT INTO Employee (Id,[Name],Salary,ManagerId)  VALUES (1  , 'Joe'   , 70000  , 3),(2  , 'Henry' , 80000  , 4),(3  , 'Sam'   , 60000  ,null ),(4  , 'Max'   , 90000  ,null )  
GO
Select * FROM Employee
GO

SELECT
  M.Name As Employee
FROM
    EMPLOYEE AS M    
INNER JOIN Employee as E
on M.ManagerId=E.ID
and m.salary>e.salary
