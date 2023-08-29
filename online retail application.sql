use durga;
-- Create table for employees and vendors
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50));
    -- Other employee-related fields


CREATE TABLE Vendors (
    VendorID INT PRIMARY KEY,
    VendorName VARCHAR(100),
    VendorType VARCHAR(50));
    -- Other vendor-related fields


-- Create table for customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20));
    -- Other customer-related fields


-- Create table for orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus VARCHAR(20),
    -- Other order-related fields
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create table for order items 
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    -- Other order item-related fields
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create table for products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(200),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT);
    -- Other product-related fields


-- Create table for product reviews
CREATE TABLE ProductReviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    ReviewText TEXT,
    ReviewDate DATE,
    -- Other review-related fields
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create table for delivery stages
CREATE TABLE DeliveryStages (
    StageID INT PRIMARY KEY,
    StageName VARCHAR(50),
    Description TEXT,
    -- Other delivery stage-related fields


-- Create table for delivery information CREATE TABLE DeliveryInformation (
    DeliveryID INT PRIMARY KEY,
    OrderID INT,
    StageID INT,
    UpdateDate DATETIME,
    -- Other delivery-related fields
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (StageID) REFERENCES DeliveryStages(StageID)
);