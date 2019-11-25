/*
Write a SQL query to delete all duplicate email entries in a table named Person, 
keeping only unique emails based on its smallest Id.

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
*/

IF OBJECT_ID('dbo.Person', 'U') IS NOT NULL 
DROP Table Person
GO
CREATE TABLE Person (Id int,Email varchar(50))
GO
INSERT INTO Person (Id,Email)  VALUES (1  , 'john@example.com'),(2  , 'bob@example.com'),(3,'john@example.com')
GO
Select * FROM Person
GO

;WITH CTE (Id,Email,RK) AS (
    SELECT Id,Email, ROW_NUMBER() OVER(Partition by Email Order by Id) AS RK
    From Person
)
SELECT Id,Email FROM CTE
WHERE RK=1
Order by Id


--Another solution. 
delete p1 from Person p1 inner join Person p2
on p1.email = p2.email and p1.id > p2.id