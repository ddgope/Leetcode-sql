/*
The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
*/


IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL 
DROP Table Employee
GO
CREATE TABLE Employee (Id int,[Name] varchar(50),Salary int,DepartmentId int)
GO
INSERT INTO Employee (Id,[Name],Salary,DepartmentId)  VALUES ( 1  , 'Joe'   , 70000  , 1),( 2  , 'Jim'   , 90000  , 1),( 3  , 'Henry' , 80000  , 2),( 4  , 'Sam'   , 60000  , 2),( 5  , 'Max'   , 90000  , 1)
GO
Select * FROM Employee
GO

IF OBJECT_ID('dbo.Department', 'U') IS NOT NULL 
DROP Table Department
GO
CREATE TABLE Department (Id int,[Name] varchar(50))
GO
INSERT INTO Department (Id,[Name])  VALUES ( 1  , 'IT' ),( 2  , 'Sales')
GO
Select * FROM Department
GO

SELECT Department,Employee,Salary FROM (
    Select
    d.Name As Department,E.Name as Employee,E.Salary 
    , DENSE_RANK() OVER(Partition By D.Name Order By E.Salary DESC) as HighestSalary
    from EMployee as e
    INNER join department as d
    on e.departmentid=d.id
) AS Tab
WHERE HighestSalary=1

GO