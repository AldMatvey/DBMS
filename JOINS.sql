--(1)
--SELECT SUM(UnitPrice) 
--FROM sales JOIN sales_items ON sales.salesid = sales_items.SalesId 
--WHERE ShipCountry = 'USA' AND (SalesDate LIKE '%2012-01%' OR  SalesDate LIKE '%2012-02%' OR SalesDate LIKE '%2012-03%')
--
--SELECT SUM(UnitPrice) 
--FROM sales_items
--WHERE SalesId IN (SELECT SalesId FROM sales WHERE ShipCountry = 'USA' AND (SalesDate LIKE '%2012-01%' OR  SalesDate LIKE '%2012-02%' OR SalesDate LIKE '%2012-03%'))
--
--(2)
--SELECT customers.FirstName 
--FROM customers LEFT JOIN employees
--ON customers.FirstName = employees.FirstName 
--WHERE employees.FirstName IS NULL
--GROUP BY customers.FirstName 
--
--SELECT customers.FirstName 
--FROM customers
--WHERE customers.FirstName NOT IN (SELECT FirstName FROM employees)
--GROUP BY customers.FirstName 
--
--SELECT FirstName FROM customers
--EXCEPT
--SELECT FirstName FROM employees
--
--(3)
--Эта команда делает сначала LEFT JOIN, а потом выбирает из получившейся таблицы только те строки, где SalesID = 4  
--SELECT * FROM sales_items si LEFT JOIN sales s ON si.SalesId  = s.SalesId WHERE si.SalesId = 4

--Эта команда делает LEFT JOIN, заполняя NULL все присоединившиеся строки, если в них SalesID != 4
--SELECT * FROM sales_items si LEFT JOIN sales s ON si.SalesId  = s.SalesId AND si.SalesId = 4
--
--(4)
--SELECT COUNT(TRACKID), Title 
--FROM tracks JOIN albums
--ON tracks.AlbumId  = albums.AlbumId 
--GROUP BY tracks.AlbumId 
--
--SELECT COUNT(TRACKID), 
--(SELECT Title FROM albums
--WHERE tracks.AlbumId = albums.AlbumId)
--FROM tracks
--GROUP BY tracks.AlbumId
--
--(5)
--SELECT LastName, FirstName FROM customers JOIN sales ON customers.CustomerId = sales.CustomerId  WHERE customers.Country = 'Germany' AND sales.ShipCity = 'Berlin'
--GROUP BY LastName, FirstName 

--(6)
--SELECT LastName
--FROM customers JOIN sales JOIN sales_items ON customers.CustomerId = sales.CustomerId AND sales_items.SalesId = sales.SalesId
--GROUP BY LastName
--HAVING SUM(sales_items.Quantity) > 30

--SELECT (SELECT (SELECT LastName FROM customers WHERE sales.CustomerId = customers.CustomerId)FROM sales WHERE sales.SalesId = sales_items.SalesId) AS t FROM sales_items GROUP BY t HAVING SUM(Quantity) > 30

--(7)
--SELECT genres.Name, AVG(unitPrice)  FROM genres JOIN tracks ON tracks.GenreId = genres.GenreId 
--GROUP BY genres.Name 

--(8)
--
--SELECT (SELECT genres.Name FROM genres WHERE tracks.GenreId = genres.GenreId) FROM tracks GROUP BY tracks.GenreId HAVING AVG(tracks.unitPrice) > 1
