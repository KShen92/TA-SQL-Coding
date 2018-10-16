create database lms_sqlfinal;
use lms_sqlfinal

create table Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(255) NOT NULL,
	BranchAddress VARCHAR(255) NOT NULL,
);

insert into Library_Branch
	(BranchName, BranchAddress)
	values
	('Sharpstown', 'Sharpstown Rd'),
	('Central', 'Amestris'),
	('Northern HQ', 'Snowy Amestris')
;

create table Publisher (
	PublisherID int not null identity (1,1),
	PublisherName varchar(255) not null,
	PublisherAddress varchar(255) not null,
	Phone varchar(50) not null,
	constraint PubNameID primary key (PublisherID, PublisherName)
);

create table Books (
	BookID int primary key not null identity (1,1),
	Title varchar(255) not null,
	PublisherName varchar(255) foreign key references Publisher(PubNameID)
);

insert into Books (
	(Title)
	values
	('The Lost Tribe'),
	('It'),
	('Dreamcatcher'),
	('Cell'),
	('The Dark Tower'),
	('Carrie'),
	('Misery'),
	('The Long Walk'),
	('The Mist'),
	('The Shining'),
	('Doctor Sleep'),
	('Cujo'),
	('Pet Sematary'),
	('Under the Dome'),
	('The Green Mile'),
	('Filler1'),
	('Filler2'),
	('Filler3'),
	('Filler4'),
	('Filler5')
;

create table Book_Authors (
	BookID int foreign key references Books(BookID),
	AuthorName varchar(255) not null
);

insert into table Book_Authors (
	(AuthorName)
	values
	('

create table Book_Copies (
	BookID int foreign key references Books(BookID),
	BranchID int foreign key references Library_Branch(BranchID),
	Number_Of_Copies int not null
);

create table Borrower (
	CardNo int primary key not null identity (1.1),
	Name varchar(255) not null,
	BorrowerAddress varchar(255) not null,
	Phone varchar(50) not null
);

create table Book_Loans (
	BookID int foreign key references Books(BookID),
	BranchID int foreign key references Library_Branch(BranchID),
	CardNo int foreign key references Borrower(CardNo),
	DateOut date not null,
	DateDue date not null
);

