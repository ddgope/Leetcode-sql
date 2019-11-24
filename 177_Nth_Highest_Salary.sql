/*
Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200. 
If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
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

ALTER FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
         Select top 1 ISNULL(Salary,Null) As salary from (
            SELECT Salary, DENSE_RANK() OVER( Order by Salary desc ) as RN
            FROm Employee
        ) as TAB    
        where RN=@N
    );
END
GO

SELECT dbo.getNthHighestSalary(1)
GO

SELECT dbo.getNthHighestSalary(2)
GO

SELECT dbo.getNthHighestSalary(3)
GO
SELECT dbo.getNthHighestSalary(4)
GO