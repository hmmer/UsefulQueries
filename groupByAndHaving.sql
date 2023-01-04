  USE AwesomeDelivery
  Go
  --SELECT * FROM Customer WHERE CITY = 'London';  
  --SELECT * FROM [dbo].[Order];
  

  -- 1) simple group by
  SELECT Country,
  SUM(TotalAmount) AS TotalAmount
  FROM [ORDER] AS O 
  JOIN Customer AS C
  ON O.CustomerId = C.Id
  GROUP BY Country
  ORDER BY Country;

  
  -- 2) multiple aggregate group by
  SELECT Country,
  SUM(TotalAmount) AS TotalAmount, 
  COUNT(O.Id) AS TotalOrderFromCountry
  FROM [ORDER] AS O 
  JOIN Customer AS C
  ON O.CustomerId = C.Id
  GROUP BY Country
  ORDER BY Country;


  -- 3) multiple column group by
  SELECT Country, City, 
  SUM(TotalAmount) AS TotalAmount
  FROM [ORDER] AS O 
  JOIN Customer AS C
  ON O.CustomerId = C.Id
  GROUP BY Country, City
  ORDER BY Country, City;


  -- 4) multiple coloum, multiple aggregate group by
  SELECT Country, City, 
  SUM(TotalAmount) AS TotalAmount,
  COUNT(O.Id) AS [Total Order from City]
  FROM [ORDER] AS O 
  JOIN Customer AS C
  ON O.CustomerId = C.Id
  GROUP BY Country, City
  ORDER BY Country, City;


  /*
  Having Clause
  */

  SELECT Country,
  SUM(TotalAmount) AS TotalAmount
  FROM [ORDER] AS O 
  JOIN Customer AS C
  ON O.CustomerId = C.Id
  GROUP BY Country
  HAVING Country like '%land%'
  ORDER BY Country;

  --can be done in select also
  SELECT Country,
  SUM(TotalAmount) AS TotalAmount
  FROM [ORDER] AS O 
  JOIN Customer AS C
  ON O.CustomerId = C.Id
  WHERE Country like '%land%'
  GROUP BY Country
  ORDER BY Country;

  /*
	  in where, filters happens first and then, group by happens
	  in having, first gets all the group by data then, filters happens 
	  it is advised to use where over having (see estimated cost in excecution plan)
	  but in where clause cant use aggregate expression 
  */
  
  SELECT Country,
  SUM(TotalAmount) AS TotalAmount
  FROM [ORDER] AS O 
  JOIN Customer AS C
  ON O.CustomerId = C.Id
  GROUP BY Country
  HAVING SUM(TotalAmount) > 100000
  ORDER BY Country;

