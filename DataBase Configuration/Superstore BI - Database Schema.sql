CREATE DATABASE IF NOT EXISTS superstore;

USE superstore;

# Criação da entidade Customer e seus atributos e relações

CREATE TABLE Customer(
	CustomerID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Segment ENUM("Consumer", "Corporate", "Home Office") NOT NULL
);

CREATE TABLE Country(
	CountryID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE PostalCode(
	PostalCodeID INT PRIMARY KEY AUTO_INCREMENT,
    Code VARCHAR(255) NOT NULL
);

CREATE TABLE City(
	CityID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE State(
	StateID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Region(
	RegionID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Customer_Country(
	CustomerID VARCHAR(255) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY(CustomerID, CountryID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

CREATE TABLE Customer_PostalCode(
	CustomerID VARCHAR(255) NOT NULL,
    PostalCodeID INT NOT NULL,
    PRIMARY KEY(CustomerID, PostalCodeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (PostalCodeID) REFERENCES PostalCode(PostalCodeID)
);

CREATE TABLE Customer_City(
	CustomerID VARCHAR(255) NOT NULL,
    CityID INT NOT NULL,
    PRIMARY KEY(CustomerID, CityID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (CityID) REFERENCES City(CityID)
);

CREATE TABLE Customer_State(
	CustomerID VARCHAR(255) NOT NULL,
    StateID INT NOT NULL,
    PRIMARY KEY(CustomerID, StateID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (StateID) REFERENCES State(StateID)
);

CREATE TABLE Customer_Region(
	CustomerID VARCHAR(255) NOT NULL,
    RegionID INT NOT NULL,
    PRIMARY KEY (CustomerID, RegionID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

# Criação da entidade product e seus atributos

CREATE TABLE Product(
	ProductID VARCHAR(255) PRIMARY KEY,
    CategoryID INT NOT NULL,
    SubCategoryID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (SubCategoryID) REFERENCES SubCategory(SubCategoryID)
);

CREATE TABLE Category(
	CategoryID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name Varchar(255) NOT NULL
);

CREATE TABLE SubCategory(
	SubCategoryID INT PRIMARY KEY AUTO_INCREMENT,
    Name Varchar(255) NOT NULL
);

# Criação da Entidade Transaction

CREATE TABLE Transaction(
	TransactionID INT PRIMARY KEY AUTO_INCREMENT,
	OrderID VARCHAR(255),
    CustomerID VARCHAR(255) NOT NULL,
    ProductID VARCHAR(255) NOT NULL,
    Discount DECIMAL(5, 4),
    ShipMode VARCHAR(255),
    ShipDate DATE NOT NULL,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    Profit DECIMAL(10, 3),
    Sales DECIMAL(10, 3),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);