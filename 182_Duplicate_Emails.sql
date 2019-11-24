/*
Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+
*/

IF OBJECT_ID('dbo.Person', 'U') IS NOT NULL 
DROP Table Person
GO
CREATE TABLE Person (Id int,Email varchar(50))
GO
INSERT INTO Person (Id,Email)  VALUES (1  , 'a@b.com'),(2  , 'c@d.com'),(3,'a@b.com')
GO
Select * FROM Person
GO

SELECT Email
FROM Person
GROUP BY Email
HAVING count(Email) > 1

GO