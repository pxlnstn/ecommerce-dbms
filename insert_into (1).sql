use OnlineShopping;	
INSERT INTO USER (FirstName, LastName, Password, Sex, PhoneNumber, Email, BirthDate)
VALUES ('John', 'Doe', 'hashedpassword1', 'Male', '555-0101', 'john.doe@email.com', '1985-05-15'),
       ('Jane', 'Smith', 'hashedpassword2', 'Female', '555-0102', 'jane.smith@email.com', '1990-08-25');

INSERT INTO ADDRESSES (UserID, AddressTitle, Country, City, District, Neighborhood, Address, ZipCod)
VALUES
(1, 'Home', 'TR', 'İzmir', 'Torbalı', 'Alpkent', '1030 sokak', '11215'),
(2, 'Work', 'TR', 'İzmir', 'Buca', 'Atatürk', '1050 sokak', '90015');
INSERT INTO WISHLIST (CustomerID, Name)
VALUES
(1, 'John\'s Wishlist'),
(2, 'Jane\'s Wishlist');

INSERT INTO PRODUCT (Name, Images, RatingAverage, Brand, Description)
VALUES
('Laptop', 'laptop_image.jpg', 4.5, 'BrandX', 'A high-performance laptop for professionals.'),
('Smartphone', 'smartphone_image.jpg', 4.2, 'BrandY', 'A budget-friendly smartphone with great features.');
INSERT INTO SHOP (SellerID, ShopName, PhoneNumber, Email, RatingAverage, Logistics)
VALUES
(1, 'TechShop', '111-222-3333', 'techshop@example.com', 4.8, 'Next-day delivery'),
(2, 'GadgetStore', '444-555-6666', 'gadgetstore@example.com', 4.2, 'Standard shipping');
INSERT INTO ORDERS (Customer, Price, TotalDiscount, DeliveryPrice, Status, Date, Time, TrackNo, DeliveryETA, ActualDeliveryTime)
VALUES
(1, 200.00, 10.00, 15.00, 'Shipped', '2025-01-10', '10:00:00', 'TRK12345', '2025-01-15 14:00:00', '2025-01-15 13:45:00'),
(2, 150.00, 5.00, 10.00, 'Delivered', '2025-01-11', '12:30:00', 'TRK67890', '2025-01-16 15:00:00', '2025-01-16 14:50:00');
INSERT INTO OFFERS (ShopID, ProductID, Price, Stock, DefaultDisplaySeller)
VALUES
(1, 1, 999.99, 50, TRUE),  -- TechShop offering the Laptop
(2, 2, 199.99, 100, TRUE);  -- GadgetStore offering the Smartphone
INSERT INTO PAYMENT_METHOD (OrderID)
VALUES
(1),  -- Payment method for John’s order
(2);  -- Payment method for Jane’s order
INSERT INTO CREDIT_CARD (PaymentMethodID, CardHolderName, ExpiryDate, CardNumber)
VALUES
(1, 'John Doe', '2026-05-30', '1234567812345678'),  -- John’s credit card
(2, 'Jane Doe', '2027-11-20', '9876543298765432');  -- Jane’s credit card
INSERT INTO CART (Customer, Promotion, TotalProductsPrice)
VALUES
(1, 'Winter Sale', 220.00),  -- John’s cart
(2, 'Holiday Offer', 160.00);  -- Jane’s cart

INSERT INTO C_STORES_P (CartID, ProductID, Quantity)
VALUES
(1, 1, 1),  -- John’s cart with 1 Laptop
(2, 2, 2);  -- Jane’s cart with 2 Smartphones

INSERT INTO CONTAINS (OrderID, ProductID, Discount, Quantity)
VALUES
(1, 1, 10.00, 1),  -- John’s order contains 1 Laptop with a discount of $10
(2, 2, 5.00, 2);  -- Jane’s order contains 2 Smartphones with a discount of $5 each

INSERT INTO SUBSCRIPTION_HISTORY (Customer, IsActive, StartDate, EndDate)
VALUES
(1, TRUE, '2025-01-01', '2025-12-31'),  -- John’s active subscription
(2, FALSE, '2024-06-01', '2025-01-01');  -- Jane’s inactive subscription

INSERT INTO LOGISTICS (ProviderName, DeliveryOptions)
VALUES
('FastDelivery', 'Express shipping'),
('ShipNow', 'Standard shipping');

INSERT INTO CATEGORY (Name, ParentID)
VALUES
('Electronics', NULL),  -- Main category: Electronics
('Laptops', 1);  -- Subcategory: Laptops under Electronics

INSERT INTO PROMOTION (PromotionType, StartDate, EndDate, DiscountAmount, DiscountRate)
VALUES
('Seasonal Sale', '2025-01-01', '2025-01-31', 50.00, 10.00),  -- Seasonal sale promotion with a fixed discount
('Black Friday', '2025-11-23', '2025-11-30', 100.00, 20.00); -- Black Friday sale promotion with both fixed and percentage discount


INSERT INTO REDEEMS (Customer, Coupon)
VALUES
(1, 'DISCOUNT10'),  -- John redeemed coupon DISCOUNT10
(2, 'HOLIDAY20');  -- Jane redeemed coupon HOLIDAY20

INSERT INTO APPLIES_TO (PromotionID, ProductID)
VALUES
(1, 1),  -- Promotion applies to Laptop
(2, 2);  -- Promotion applies to Smartphone

INSERT INTO `GROUPS` (Customer, Wishlist, ProductID)
VALUES
(1, 'John\'s Wishlist', 1),  -- John saved Laptop in his wishlist
(2, 'Jane\'s Wishlist', 2);  -- Jane saved Smartphone in her wishlist

INSERT INTO SAVES (Customer, PaymentMethodID)
VALUES
(1, 1),  -- John saved Payment Method 1
(2, 2);  -- Jane saved Payment Method 2
