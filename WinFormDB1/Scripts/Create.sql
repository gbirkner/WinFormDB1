IF OBJECT_ID('InvoicePositions', 'U') IS NOT NULL
	DROP TABLE InvoicePositions;

IF OBJECT_ID('Products', 'U') IS NOT NULL
	DROP TABLE Products;

IF OBJECT_ID('Invoices', 'U') IS NOT NULL
	DROP TABLE Invoices;

IF OBJECT_ID('CustomerAddresses', 'U') IS NOT NULL
	DROP TABLE CustomerAddresses;

IF OBJECT_ID('Connections', 'U') IS NOT NULL
	DROP TABLE Connections;

IF OBJECT_ID('ConnectionTypes', 'U') IS NOT NULL
	DROP TABLE ConnectionTypes;

IF OBJECT_ID('Addresses', 'U') IS NOT NULL
	DROP TABLE Addresses;

IF OBJECT_ID('AddressTypes', 'U') IS NOT NULL
	DROP TABLE AddressTypes;

IF OBJECT_ID('Cities', 'U') IS NOT NULL
	DROP TABLE Cities;
	
IF OBJECT_ID('Countries', 'U') IS NOT NULL
	DROP TABLE Countries;

IF OBJECT_ID('BankDetails', 'U') IS NOT NULL
	DROP TABLE BankDetails;

IF OBJECT_ID('Customers', 'U') IS NOT NULL
	DROP TABLE Customers;

CREATE TABLE Customers (
	CustomerID		int NOT NULL IDENTITY,
	FName			nvarchar(255) NULL,
	LName			nvarchar(255) NOT NULL,
	Birthday		smalldatetime NULL,
	
	CONSTRAINT pk_Customers PRIMARY KEY (CustomerID)
);

CREATE TABLE Countries (
	CountryID	char(2) NOT NULL,
	Title		nvarchar(100) NOT NULL,
	IntTitle	nvarchar(100) NULL,
	ShortTitle	nvarchar(10),
	Capital		nvarchar(255) NULL,
	Continent	nvarchar(255) NULL,
	Currency	nvarchar(5) NULL,
	Domain		nvarchar(5) NULL,
	CountryCode nvarchar(10) NULL,
	CONSTRAINT pk_Countries PRIMARY KEY (CountryID)
);

CREATE TABLE Cities (
	CountryID	char(2) NOT NULL,
	PLZ			int NOT NULL,
	City		nvarchar(255) NOT NULL,

	CONSTRAINT pk_Cities PRIMARY KEY (CountryID, PLZ, City),
	CONSTRAINT fk_CitiesCountryID FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

CREATE TABLE AddressTypes (
	AddressTypeID	char(1) NOT NULL,
	Title			nvarchar(100),

	CONSTRAINT pk_AdressTypes PRIMARY KEY (AddressTypeID)
);

CREATE TABLE Addresses (
	AddressID		int NOT NULL IDENTITY,
	CountryID		char(2) NOT NULL,
	PLZ				int NOT NULL,
	City			nvarchar(255) NOT NULL,
	Street			nvarchar(255) NULL,
	StreetNr		nvarchar(20) NULL,

	CONSTRAINT pk_Addresses PRIMARY KEY (AddressID),
	CONSTRAINT fk_AddressesCity FOREIGN KEY (CountryID, PLZ, City) REFERENCES Cities (CountryID, PLZ, City)	
);

CREATE TABLE CustomerAddresses (
	CustomerID		int NOT NULL,
	AddressID		int NOT NULL,
	AddressTypeID	char(1) NOT NULL,
	AddressTypeNr	int NOT NULL DEFAULT 0,

	CONSTRAINT pk_CustomerAddresses PRIMARY KEY (CustomerID, AddressID, AddressTypeID),
	CONSTRAINT fk_CustomerAddressesAddress FOREIGN KEY (AddressID) REFERENCES Addresses(AddressID),
	CONSTRAINT fk_CustomerAddressesCustomer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT fk_CustomerAddressesType FOREIGN KEY (AddressTypeID) REFERENCES AddressTypes(AddressTypeID)
);

Create TABLE BankDetails (
	IBAN			nvarchar(34) NOT NULL,
	BIC				nvarchar(11) NULL,
	CustomerID		int NOT NULL,
	BankDetailNr	int NOT NULL DEFAULT 0,
	CONSTRAINT pk_BankDetails PRIMARY KEY (IBAN),
	CONSTRAINT fk_BankDetailsCustomer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE ConnectionTypes (
	ConnectionTypeID	int NOT NULL IDENTITY,
	Title				nvarchar(100),
	TitleShort			nvarchar(10),

	CONSTRAINT pk_ConnectionTypes PRIMARY KEY (ConnectionTypeID)
);

CREATE TABLE Connections (
	ConnectionID		int NOT NULL IDENTITY,
	ConnectionTypeID	int NOT NULL,
	ConnectionNr		int NOT NULL DEFAULT 0,
	CustomerID			int NOT NULL,
	Connection			nvarchar(255) NOT NULL,
	CONSTRAINT pk_Connections PRIMARY KEY (ConnectionID),
	CONSTRAINT fk_ConnectionsTypeID FOREIGN KEY (ConnectionTypeID) REFERENCES ConnectionTypes(ConnectionTypeID),
	CONSTRAINT fk_ConnectionsCustomer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Invoices (
	InvoiceID			int NOT NULL IDENTITY,
	InvDate				smalldatetime NOT NULL DEFAULT GETDATE(),
	CustomerID			int NOT NULL,
	IBAN				nvarchar(34) NULL,
	DelAddressID		int NULL,
	DelAddressTypeID	char(1) NULL,
	InvAddressID		int NULL,
	InvAddressTypeID	char(1) NULL,
	Discount			real NOT NULL DEFAULT 0,
	Delivered			bit NOT NULL DEFAULT 0,
	Paid				bit NOT NULL DEFAULT 0,
	Cancelled			bit NOT NULL DEFAULT 0,

	CONSTRAINT pk_Invoices PRIMARY KEY (InvoiceID),
	CONSTRAINT fk_InvoicesCustomer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT fk_InvoicesDelAddress FOREIGN KEY (CustomerID, DelAddressID, DelAddressTypeID) REFERENCES CustomerAddresses(CustomerID, AddressID, AddressTypeID),
	CONSTRAINT fk_InvoicesInvAddress FOREIGN KEY (CustomerID, InvAddressID, InvAddressTypeID) REFERENCES CustomerAddresses(CustomerID, AddressID, AddressTypeID)
);

CREATE TABLE Products (
	ProductID		int NOT NULL IDENTITY,
	Title			nvarchar(30) NOT NULL,
	Amount			real NOT NULL DEFAULT 0,
	Description		nvarchar(254) NOT NULL

	CONSTRAINT pk_Products PRIMARY KEY (ProductID)
);

CREATE TABLE InvoicePositions (
	InvoiceID		int NOT NULL,
	PositionNr		int NOT NULL,
	ProductID		int NOT NULL,
	Quantity		int NOT NULL DEFAULT 1,
	Discount		real NOT NULL DEFAULT 0,
	Amount			real NOT NULL DEFAULT 0,

	CONSTRAINT pk_InvoicePositions PRIMARY KEY (InvoiceID, PositionNr),
	CONSTRAINT fk_InvoicePositionsProduct FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

