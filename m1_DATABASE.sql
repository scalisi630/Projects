CREATE DATABASE PracticeMarch1



--DROP DATABASE PracticeMarch1

USE PracticeMarch1

CREATE TABLE Invoice (
	InvoiceNumber INT IDENTITY (1,1) PRIMARY KEY,
	INVOICEDATE DATE NOT NULL,
);

CREATE TABLE Vendor (
	VendorCode CHAR(4) PRIMARY KEY,
	VendorName VARCHAR(30) NOT NULL,
);

--DROP TABLE PRODUCT

CREATE TABLE Product (
	ProductCode CHAR(4) PRIMARY KEY,
	ProducatLabel VARCHAR(30) NOT NULL,
	ProductPrice MONEY CHECK (ProductPrice <= 999.99),
	VendorCode CHAR(4), 
	FOREIGN KEY (VendorCode) REFERENCES VENDOR (VendorCode)
	ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE InvoiceItem (
	InvoiceNumber INT,
	ProductNumber CHAR(4),
	QtySold INT NOT NULL,
	PRIMARY KEY (InvoiceNumber, ProductNumber), --composite PK
	FOREIGN KEY (InvoiceNumber) REFERENCES  Invoice (InvoiceNumber)
	ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (ProductNumber) REFERENCES Product (ProductCode)
	ON UPDATE CASCADE ON DELETE CASCADE,
);


--adding new column to table- vendor

ALTER TABLE Vendor
ADD VendorCategory VARCHAR(30) DEFAULT 'Office Supplies'

ALTER TABLE Vendor 
ALTER COLUMN VendorName VARCHAR(40) NOT NULL









