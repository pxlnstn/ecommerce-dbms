-- Create DATABASE OnlineShopping;
use OnlineShopping;

CREATE TABLE USER (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Password VARCHAR(255),
    Sex ENUM('Male', 'Female', 'Other'),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    BirthDate DATE,
    RegDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Addresses TEXT,
    SFlag BOOLEAN DEFAULT FALSE,
    CFlag BOOLEAN DEFAULT FALSE,
    Premium BOOLEAN DEFAULT FALSE
);

CREATE TABLE ADDRESSES (
    UserID INT,
    AddressTitle VARCHAR(100),
    Country VARCHAR(50),
    City VARCHAR(50),
    District VARCHAR(50),
    Neighborhood VARCHAR(50),
    Address TEXT,
    ZipCod VARCHAR(10),
    FOREIGN KEY (UserID) REFERENCES USER(ID)
);

CREATE TABLE WISHLIST (
    CustomerID INT,
    Name VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES USER(ID)
);

CREATE TABLE ORDERS (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    Customer INT,
    Price DECIMAL(10, 2),
    TotalDiscount DECIMAL(10, 2),
    DeliveryPrice DECIMAL(10, 2),
    Status VARCHAR(50),
    Date DATE,
    Time TIME,
    TrackNo VARCHAR(50),
    DeliveryETA DATETIME,
    ActualDeliveryTime DATETIME,
    FOREIGN KEY (Customer) REFERENCES USER(ID)
);

CREATE TABLE PRODUCT (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Images TEXT,
    RatingAverage DECIMAL(3, 2),
    Brand VARCHAR(50),
    Description TEXT
);

CREATE TABLE SHOP (
    ShopID INT AUTO_INCREMENT PRIMARY KEY,
    SellerID INT,
    ShopName VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    RatingAverage DECIMAL(3, 2),
    Logistics TEXT
);

CREATE TABLE OFFERS (
    ShopID INT,
    ProductID INT,
    Price DECIMAL(10, 2),
    Stock INT,
    DefaultDisplaySeller BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (ShopID) REFERENCES SHOP(ShopID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

CREATE TABLE REVIEW (
    ReviewDate DATE,
    ProductID INT,
    CustomerID INT,
    Comment TEXT,
    Rating INT,
    Photos TEXT,
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES USER(ID)
);

CREATE TABLE PAYMENT_METHOD (
    PaymentMethodID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID)
);

CREATE TABLE CREDIT_CARD (
    PaymentMethodID INT,
    CardHolderName VARCHAR(100),
    ExpiryDate DATE,
    CardNumber VARCHAR(20),
    FOREIGN KEY (PaymentMethodID) REFERENCES PAYMENT_METHOD(PaymentMethodID)
);

CREATE TABLE WALLET (
    PaymentMethodID INT,
    Passcode VARCHAR(100),
    Balance DECIMAL(10, 2),
    FOREIGN KEY (PaymentMethodID) REFERENCES PAYMENT_METHOD(PaymentMethodID)
);
CREATE TABLE PROMOTION (
    PromotionID INT AUTO_INCREMENT PRIMARY KEY,
    PromotionType VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    DiscountAmount DECIMAL(10, 2),
    DiscountRate DECIMAL(5, 2)
);


CREATE TABLE CART (
    CartID INT AUTO_INCREMENT PRIMARY KEY,
    Customer INT,
    Promotion VARCHAR(100),
    TotalProductsPrice DECIMAL(10, 2),
    FOREIGN KEY (Customer) REFERENCES USER(ID)
);

CREATE TABLE C_STORES_P (
    CartID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CartID) REFERENCES CART(CartID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);
CREATE TABLE CONTAINS (
    OrderID INT,
    ProductID INT,
    Discount DECIMAL(5, 2),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);


CREATE TABLE SUBSCRIPTION_HISTORY (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    Customer INT,
    IsActive BOOLEAN DEFAULT TRUE,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (Customer) REFERENCES USER(ID)
);

CREATE TABLE LOGISTICS (
    LogisticsID INT AUTO_INCREMENT PRIMARY KEY,
    ProviderName VARCHAR(100),
    DeliveryOptions TEXT
);
CREATE TABLE CATEGORY (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    ParentID INT,
    FOREIGN KEY (ParentID) REFERENCES CATEGORY(CategoryID) -- Self-referencing for subcategories
);
CREATE TABLE REDEEMS (
    Customer INT,
    Coupon VARCHAR(50),
    FOREIGN KEY (Customer) REFERENCES USER(ID)
);
CREATE TABLE APPLIES_TO (
    PromotionID INT,
    ProductID INT,
    FOREIGN KEY (PromotionID) REFERENCES PROMOTION(PromotionID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);
CREATE TABLE `GROUPS` (
    Customer INT,
    Wishlist VARCHAR(100),
    ProductID INT,
    FOREIGN KEY (Customer) REFERENCES USER(ID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);
CREATE TABLE SAVES (
    Customer INT,
    PaymentMethodID INT,
    FOREIGN KEY (Customer) REFERENCES USER(ID),
    FOREIGN KEY (PaymentMethodID) REFERENCES PAYMENT_METHOD(PaymentMethodID)
);
