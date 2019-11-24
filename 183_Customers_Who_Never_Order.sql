/*
Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

Table: Customers.

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Table: Orders.

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Using the above tables as example, return the following:

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
*/

IF OBJECT_ID('dbo.Customer', 'U') IS NOT NULL 
DROP Table Customer
GO
CREATE TABLE Customer (Id int,[Name] varchar(50))
GO
INSERT INTO Customer (Id,[Name])  VALUES (1  , 'Joe'),(2  , 'Henry'),(3,'Sam'),(4,'Max')
GO
Select * FROM Customer
GO

IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL 
DROP Table Orders
GO
CREATE TABLE Orders (Id int,CustomerId int)
GO
INSERT INTO Orders (Id,CustomerId)  VALUES (1  , 3),(2  ,1)
GO
Select * FROM Orders
GO

Select
    C.NAme as Customers    
FRom Customer as C
Left JOIN Orders as O
ON C.ID=O.CustomerID
WHERE O.CustomerID IS NULL
Order By C.Name

GO