
-- Customers and their orders
SELECT u.FirstName, u.LastName, o.OrderID, o.Price
FROM USER u
JOIN ORDERS o ON u.ID = o.Customer;


-- Products offered by Shops
SELECT p.Name, s.ShopName, o.Price, o.Stock
FROM PRODUCT p
JOIN OFFERS o ON p.ProductID = o.ProductID
JOIN SHOP s ON o.ShopID = s.ShopID;


-- Customer Reviews for Products
SELECT u.FirstName, p.Name, r.Comment, r.Rating
FROM USER u
JOIN REVIEW r ON u.ID = r.CustomerID
JOIN PRODUCT p ON r.ProductID = p.ProductID;


-- Total Sales per Shop
SELECT s.ShopName, SUM(o.Price) AS TotalSales
FROM SHOP s
JOIN OFFERS o ON s.ShopID = o.ShopID
JOIN CONTAINS c ON o.ProductID = c.ProductID
JOIN ORDERS o2 ON c.OrderID = o2.OrderID
GROUP BY s.ShopName;


-- Customers, Their Orders, and Payment Methods
SELECT u.FirstName, u.LastName, o.OrderID, pm.PaymentMethodID
FROM USER u
JOIN ORDERS o ON u.ID = o.Customer
JOIN PAYMENT_METHOD pm ON o.OrderID = pm.OrderID;

