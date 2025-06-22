use OnlineShopping;
-- USER
INSERT INTO USER (FirstName, LastName,Password,Sex,PhoneNumber, Email , BirthDate) 
VALUES ('Alice', 'Smith','securepassword','Female', '555-0103','alice@example.com' ,'1999-06-14');

UPDATE USER 
SET Password = 'newsecurepassword' 
WHERE Email = 'alice@example.com';

DELETE FROM USER WHERE Email = 'alice@example.com';




-- PRODUCT
INSERT INTO PRODUCT (Name, Brand, Description, RatingAverage) 
VALUES ('Smartphone X', 'TechBrand', 'Latest model with advanced features', 4.5);

UPDATE PRODUCT 
SET RatingAverage = 4.7 
WHERE Name = 'Smartphone X'
LIMIT 1;

DELETE FROM PRODUCT WHERE Name = 'Smartphone X' LIMIT 1;


-- ORDERS
INSERT INTO ORDERS (Customer, Price, TotalDiscount, Status) 
VALUES (1, 299.99, 20.00, 'Processing');

UPDATE ORDERS 
SET Status = 'Shipped' 
WHERE OrderID = 1;

DELETE FROM ORDERS WHERE OrderID = 1;

