use OnlineShopping;

-- non-negative prices
ALTER TABLE PRODUCT
ADD CONSTRAINT chk_price_positive CHECK (Price > 0);

ALTER TABLE OFFERS
ADD CONSTRAINT chk_offer_price_positive CHECK (Price = 0);

-- stock levels remain zero or higher
ALTER TABLE OFFERS
ADD CONSTRAINT chk_stock_non_negative CHECK (Stock >= 0);

-- ratings should be restricted to 1 to 5 scale
ALTER TABLE REVIEW
ADD CONSTRAINT chk_rating_range CHECK (Rating BETWEEN 1 AND 5);
