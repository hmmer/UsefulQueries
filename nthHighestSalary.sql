USE AwesomeDelivery
Go

Declare @Nhighest int
set @Nhighest = 5;

WITH RESULT AS
(
    SELECT distinct TotalAmount,
           DENSE_RANK() OVER (ORDER BY TotalAmount DESC) AS DENSERANK,
		   OrderDate
    FROM [Order]
)
SELECT TOP 1 TotalAmount, OrderDate
FROM RESULT
WHERE DENSERANK = @Nhighest;

Select Top 1 * FROM 
(
SELECT Top 5 * FROM [Order] Order By TotalAmount DESC
) AS RESULT ORDER BY TotalAmount;


--SELECT TOP(5) * FROM [Order] ORDER BY TotalAmount DESC;
--DESNSE_RANK and RANK https://learn.microsoft.com/en-us/sql/t-sql/functions/dense-rank-transact-sql?view=sql-server-ver16 
