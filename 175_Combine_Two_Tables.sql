/*
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+
PersonId is the primary key column for this table.
Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
AddressId is the primary key column for this table.
 

Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
*/

IF OBJECT_ID('dbo.Person', 'U') IS NOT NULL 
DROP Table Person,[Address]

GO
IF OBJECT_ID('dbo.Address', 'U') IS NOT NULL 
DROP Table [Address]

GO

CREATE TABLE Person (PersonId int,FirstName VARCHAR(50),LastName varchar(50))
CREATE TABLE [Address] (AddressId  int,PersonId int, City varchar(50), [state] varchar(50))


Select P.FirstName,P.LastName,ad.City,Ad.State
From Person as P
LEFT JOIN Address as ad
on P.PersonId=ad.PersonId

GO