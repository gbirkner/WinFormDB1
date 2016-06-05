
IF OBJECT_ID('Countries', 'U') IS NOT NULL
	DROP TABLE Countries;

IF OBJECT_ID('Customers', 'U') IS NOT NULL
	DROP TABLE Customers;

IF OBJECT_ID('Cities', 'U') IS NOT NULL
	DROP TABLE Cities;

IF OBJECT_ID('AddressTypes', 'U') IS NOT NULL
	DROP TABLE AddressTypes;

IF OBJECT_ID('Addresses', 'U') IS NOT NULL
	DROP TABLE Addresses;

IF OBJECT_ID('CustomerAddresses', 'U') IS NOT NULL
	DROP TABLE CustomerAddresses;

IF OBJECT_ID('BankDetails', 'U') IS NOT NULL
	DROP TABLE Countries;

IF OBJECT_ID('CustomerBankDetails', 'U') IS NOT NULL
	DROP TABLE Customers;

IF OBJECT_ID('ConnectionTypes', 'U') IS NOT NULL
	DROP TABLE Cities;

IF OBJECT_ID('Connections', 'U') IS NOT NULL
	DROP TABLE Countries;

IF OBJECT_ID('CustomerConnections', 'U') IS NOT NULL
	DROP TABLE Customers;

IF OBJECT_ID('Invoices', 'U') IS NOT NULL
	DROP TABLE Invoices;

IF OBJECT_ID('InvoicePositions', 'U') IS NOT NULL
	DROP TABLE InvoicePositions;

IF OBJECT_ID('Products', 'U') IS NOT NULL
	DROP TABLE Products;

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
	IBAN	nvarchar(34) NOT NULL,
	BIC		nvarchar(11) NULL,

	CONSTRAINT pk_BankDetails PRIMARY KEY (IBAN)
);

CREATE TABLE CustomerBankDetails (
	CustomerID		int NOT NULL,
	IBAN			nvarchar(34) NOT NULL,
	BankDetailNr	int NOT NULL DEFAULT 0,

	CONSTRAINT pk_CustomerBankDetails PRIMARY KEY (CustomerID, IBAN),
	CONSTRAINT fk_CustomerBankDetailsCustomer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT fk_CustomerBankDetailsIBAN FOREIGN KEY (IBAN) REFERENCES BankDetails(IBAN)
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

	CONSTRAINT pk_Connections PRIMARY KEY (ConnectionID),
	CONSTRAINT fk_ConnectionsTypeID FOREIGN KEY (ConnectionTypeID) REFERENCES ConnectionTypes(ConnectionTypeID)
);

CREATE TABLE CustomerConnections (
	CustomerID		int NOT NULL,
	ConnectionID	int NOT NULL,
	
	CONSTRAINT pk_CustomerConnections PRIMARY KEY (CustomerID, ConnectionID),
	CONSTRAINT fk_CustomerConnectionsCustomer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT fk_CustomerConnectionsConnection FOREIGN KEY (ConnectionID) REFERENCES Connections(ConnectionID)
);

CREATE TABLE Invoices (


);

CREATE TABLE InvoicePositions (

);

CREATE TABLE Products (


);