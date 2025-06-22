use OnlineShopping;	
DELIMITER $$

CREATE TRIGGER after_review_insert
AFTER INSERT ON REVIEW
FOR EACH ROW
BEGIN
    DECLARE avg_rating DECIMAL(3,2);

    
    SELECT AVG(Rating) INTO avg_rating
    FROM REVIEW
    WHERE ProductID = NEW.ProductID;

    -- Update the product's average rating
    UPDATE PRODUCT
    SET RatingAverage = avg_rating
    WHERE ProductID = NEW.ProductID;
END; $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_order_created
AFTER INSERT ON CONTAINS
FOR EACH ROW
BEGIN
    -- Decrease the stock for the product in the OFFERS table
    UPDATE OFFERS
    SET Stock = Stock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;

    -- Optional: Check if stock goes below 0 and handle it
    IF (SELECT Stock FROM OFFERS WHERE ProductID = NEW.ProductID) < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock cannot be negative.';
    END IF;
END; $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_product_added_to_order
AFTER INSERT ON CONTAINS
FOR EACH ROW
BEGIN
    DECLARE product_price DECIMAL(10,2);

    -- Get the price of the product from the PRODUCT table
    SELECT Price INTO product_price
    FROM OFFERS
    WHERE ProductID = NEW.ProductID;

    -- Update the total order price
    UPDATE `ORDER`
    SET Price = Price + (product_price * NEW.Quantity) - NEW.Discount
    WHERE OrderID = NEW.OrderID;
END; $$

DELIMITER ;

