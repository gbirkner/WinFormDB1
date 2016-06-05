
DELETE FROM Customers;
DBCC CHECKIDENT ('Customers', RESEED, 0);
INSERT INTO Customers 
	VALUES	( 'Gert', 'Birkner', '08/23/1990' ),
			( 'Arthur', 'Fuetsch', '12/01/1991' ),
			( 'Alen', 'Baric', '04/23/1993' ),
			( 'Daniel', 'Dohne', '08/04/1994' ),
			( 'Markus', 'Donner', '10/18/1995' ),
			( 'Manuel', 'Jordan', '11/11/1996' ),
			( 'Christoph', 'Mellauner', '09/21/1997' ),
			( 'Nikolas', 'Pacik', '10/23/1998' ),
			( 'Mathias', 'Wichenthaler-Sternbach', '01/30/1999' );

DELETE FROM BankDetails;
INSERT INTO BankDetails
	VALUES  ( 'AT124000498493088', 'VVVVVVHHHD', 1, 1),
			( 'AT983409000032423', 'JJJJJJHHHH', 2, 1),
			( 'AT988282828282423', 'TTTTTRRRRR', 3, 1),
			( 'AT777777770032423', 'ZAZAAZAZAZ', 4, 1),
			( 'AT983434567873423', 'MSMSMMSMSM', 5, 1),
			( 'AT983408888333883', 'LLLKLDLDLD', 6, 1),
			( 'AT966666888888222', 'WERTWERHGG', 7, 1),
			( 'AT983466666644444', 'SDFGGFFFFF', 8, 1),
			( 'AT987777777474747', 'ERTZHEHTTT', 9, 1);

DELETE FROM AddressTypes;
INSERT INTO AddressTypes
	VALUES	( 'P', 'Privat' ),
			( 'H', 'Hauptsitz' ),
			( 'R', 'Rechnungsadresse' ),
			( 'L', 'Lieferadresse' );


DELETE FROM Countries;
BULK INSERT Countries
FROM 'D:\Data\Documents\RePos\WinFormDB1\WinFormDB1\Scripts\countrylist.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	TABLOCK
);

DELETE FROM Cities;
INSERT INTO Cities
	VALUES	( 'AT', 6020, 'Innsbruck' ),
			( 'AT', 6060, 'Hall in Tirol' ),
			( 'AT', 6410, 'Telfs' ),
			( 'DE', 81929, 'München' );

DELETE FROM Addresses;
DBCC CHECKIDENT ('Addresses', RESEED, 0);
INSERT INTO Addresses
	VALUES	( 'AT', 6020, 'Innsbruck', 'Lohbachweg', '6' ),
			( 'AT', 6060, 'Hall in Tirol', 'Rosengasse', '12a' ),
			( 'AT', 6410, 'Telfs', 'Anton-Auerstrasse', '43' ),
			( 'DE', 81929, 'München',  'Lindwurmstrasse', '110');

DELETE FROM CustomerAddresses;
INSERT INTO CustomerAddresses
	VALUES	( 1, 3, 'P', 1 ),
			( 1, 1, 'L', 1 ),
			( 2, 2, 'H', 1 ),
			( 3, 1, 'R', 1 ),
			( 4, 4, 'L', 1 ),
			( 5, 3, 'R', 1 ),
			( 6, 2, 'H', 1 ),
			( 7, 1, 'R', 1 ),
			( 8, 3, 'L', 1 ),
			( 8, 1, 'L', 2 ),
			( 9, 1, 'R', 1 );

DELETE FROM ConnectionTypes;
DBCC CHECKIDENT ('ConnectionTypes', RESEED, 0);
INSERT INTO ConnectionTypes 
	VALUES  ( 'Telelfon', 'Tel.' ),
			( 'Email', 'Email' );

DELETE FROM Connections;
DBCC CHECKIDENT ('Connections', RESEED, 0);
INSERT INTO Connections 
	VALUES  ( 1, 1, 1, '+43 89349 843849499' ),
			( 1, 1, 2, '+43 345 345543 544' ),
			( 2, 1, 1, 'g.birkner@tsn.at' ),
			( 2, 2, 1, 'a.fuetsch@tsn.at' ),
			( 2, 3, 1, 'a.baric@tsn.at' );

DELETE FROM Products;
DBCC CHECKIDENT ('Products', RESEED, 0);
INSERT INTO Products
	VALUES  ( 'Mouse 3X', 10.99, 'opt. Mouse, 2400dpi' ),
			( 'Tastatur 2.0', 56.99, 'aölsdkfjöalskdfjöalsdkf' ),
			( 'Monitor 24"', 189.0, 'asdl k fl sdaköfj ' ), 
			( 'Joystick 3D', 63.80, ' iuoiourteretiou rteiuo' )

DELETE FROM Invoices;
DBCC CHECKIDENT ('Invoices', RESEED, 0);
INSERT INTO Invoices
	VALUES	( '04/15/2016', 1, 'AT124000498493088', 1, 'L', 3, 'P', 10, 1, 1, 0 ),
			( '04/30/2016', 1, 'AT124000498493088', 1, 'L', 3, 'P', 0, 1, 1, 0 ),
			( '05/08/2016', 1, 'AT124000498493088', 1, 'L', 3, 'P', 0, 1, 0, 0 ),
			( '06/02/2016', 1, 'AT124000498493088', 1, 'L', 3, 'P', 5, 0, 0, 0 );

DELETE FROM InvoicePositions;
INSERT INTO InvoicePositions
	VALUES	( 1, 1, 1, 3, 0, 10.99 ),
			( 1, 2, 2, 1, 5, 56.99 ),
			( 1, 3, 4, 5, 5, 63.80 ),
			( 2, 1, 1, 10, 15, 10.99 ),
			( 3, 1, 3, 5, 10, 189.0 ),
			( 3, 2, 4, 3, 5, 63.80 ),
			( 4, 1, 1, 2, 0, 10.99 ),
			( 4, 2, 2, 4, 0, 56.99 ),
			( 4, 3, 3, 10, 15, 189.0 ),
			( 4, 4, 4, 3, 5, 63.80 );