use OnlineShopping;
-- List premium customers
SELECT FirstName, LastName, Email FROM USER WHERE Premium = TRUE;


-- Products about to stock out (Stock less than 10)
SELECT p.Name, o.Stock 
FROM PRODUCT p
JOIN OFFERS o ON p.ProductID = o.ProductID
WHERE o.Stock < 10;


-- Average rating and total reviews for each Product
SELECT p.Name, AVG(r.Rating) AS AvgRating, COUNT(r.ReviewDate) AS TotalReviews
FROM PRODUCT p
JOIN REVIEW r ON p.ProductID = r.ProductID
GROUP BY p.Name;


-- List all orders with delivery delays
SELECT o.OrderID, o.DeliveryETA, o.ActualDeliveryTime 
FROM ORDERS o
WHERE o.ActualDeliveryTime > o.DeliveryETA;


-- List the Most Popular Product by Total Sales
SELECT p.Name, SUM(c.Quantity) AS TotalSold
FROM PRODUCT p
JOIN CONTAINS c ON p.ProductID = c.ProductID
GROUP BY p.Name
ORDER BY TotalSold DESC
LIMIT 1;
