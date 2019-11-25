/*
Given a Weather table, write a SQL query to find all dates' Ids with 
higher temperature compared to its previous (yesterday's) dates.

+---------+------------------+------------------+
| Id(INT) | RecordDate(DATE) | Temperature(INT) |
+---------+------------------+------------------+
|       1 |       2015-01-01 |               10 |
|       2 |       2015-01-02 |               25 |
|       3 |       2015-01-03 |               20 |
|       4 |       2015-01-04 |               30 |
+---------+------------------+------------------+
For example, return the following Ids for the above Weather table:

+----+
| Id |
+----+
|  2 |
|  4 |
+----+
*/


IF OBJECT_ID('dbo.Weather', 'U') IS NOT NULL 
DROP Table Weather
GO
CREATE TABLE Weather (Id int,RecordDate Date,Temperature int)
GO
INSERT INTO Weather (Id,RecordDate,Temperature)  VALUES (1 ,'2015-01-01' , 10 ),(2 ,'2015-01-02' , 25 ),(3 ,'2015-01-03' , 20 ),(4 ,'2015-01-04' , 30 )

--INSERT INTO Weather (Id,RecordDate,Temperature)  VALUES (1 ,'2000-12-14' , 3 ),(2 ,'2000-12-16' , 5 )
GO
Select * FROM Weather
GO

Select distinct Id FROM (
    Select *,  
    lag(Temperature,1) OVER(Order By RecordDate) As YesterdayTemperature     
    ,lag(RecordDate,1) OVER(Order By RecordDate) As YesterdayRecordDate   
    FROM Weather
) As Tab
where CASE WHEN Temperature>YesterdayTemperature Then 1 ELSE 0 END=1
AND Datediff(day,YesterdayRecordDate,RecordDate)=1
Order by Id