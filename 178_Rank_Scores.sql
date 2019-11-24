/*
Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. 
Note that after a tie, the next ranking number should be the next consecutive integer value. 
In other words, there should be no "holes" between ranks.
+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
For example, given the above Scores table, your query should generate the following report (order by highest score):
+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+
*/


IF OBJECT_ID('dbo.Scores', 'U') IS NOT NULL 
DROP Table Scores
GO
CREATE TABLE Scores (Id int,Score decimal(10,2))
GO
INSERT INTO Scores (Id,Score)  VALUES(1,3.50),(2,3.65),(3,4.00),(4,3.85),(5,4.00),(6,3.65)
GO
Select * FROM Scores
GO

Select Score, DENSE_RANK() OVER(Order by Score desc) as Rank FROM Scores