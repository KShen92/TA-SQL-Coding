/* Setup Code*/
create database lms_sqlfinal
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
	('Northern HQ', 'Snowy Amestris'),
	('Southern HQ', 'Sunny Amestris')
;

create table Publisher (
	PublisherName varchar(255) primary key not null,
	PublisherAddress varchar(255) not null,
	Phone varchar(50) not null,
);

insert into Publisher
	(PublisherName, PublisherAddress, Phone)
	values
	('Pub 1', 'Pub Address 1', '111-111-1111'),
	('Pub 2', 'Pub Address 2', '222-222-2222'),
	('Pub 3', 'Pub Address 3', '333-333-3333')
;

create table Books (
	BookID int primary key not null identity (1,1),
	Title varchar(255) not null,
	PublisherName varchar(255) not null constraint fk_Books_Publisher foreign key references Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

insert into Books
	(Title, PublisherName)
	values
	('The Lost Tribe', 'Pub 1'),
	('It', 'Pub 1'),
	('Dreamcatcher', 'Pub 1'),
	('Cell', 'Pub 1'),
	('The Dark Tower', 'Pub 1'),
	('Carrie', 'Pub 1'),
	('Misery', 'Pub 1'),
	('The Long Walk', 'Pub 1'),
	('The Mist', 'Pub 1'),
	('The Shining', 'Pub 1'),
	('Doctor Sleep', 'Pub 2'),
	('Filler1', 'Pub 2'),
	('Filler2', 'Pub 2'),
	('Filler3', 'Pub 2'),
	('Filler4', 'Pub 2'),
	('Filler5', 'Pub 3'),
	('Filler6', 'Pub 3'),
	('Filler7', 'Pub 3'),
	('Filler8', 'Pub 3'),
	('Filler9', 'Pub 3')
;

create table Book_Authors (
	BookID int not null constraint fk_Book_Authors_Books foreign key references Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName varchar(255) not null
);

insert into Book_Authors
	(BookID, AuthorName)
	values
	(1, 'Stefan Kang'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'Stephen King'),
	(5, 'Stephen King'),
	(6, 'Stephen King'),
	(7, 'Stephen King'),
	(8, 'Stephen King'),
	(9, 'Stephen King'),
	(10, 'Stephen King'),
	(11, 'Stephen King'),
	(12, 'Filler Fillet1'),
	(13, 'Filler Fillet2'),
	(14, 'Filler Fillet3'),
	(15, 'Filler Fillet4'),
	(16, 'Filler Fillet5'),
	(17, 'Filler Fillet6'),
	(18, 'Filler Fillet7'),
	(19, 'Filler Fillet8'),
	(20, 'Filler Fillet9')
;

create table Book_Copies (
	BookID int not null constraint fk_Book_Copies_Books foreign key references Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID int not null constraint fk_Book_Copies_Library_Branch foreign key references Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies int not null
);

insert into Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	values
	(1, 1, 20),
	(2, 1, 30),
	(3, 1, 40),
	(4, 1, 20),
	(5, 1, 30),
	(6, 1, 40),
	(7, 1, 20),
	(8, 1, 30),
	(9, 1, 40),
	(10, 1, 20),
	(2, 2, 20),
	(4, 2, 30),
	(6, 2, 40),
	(8, 2, 20),
	(10, 2, 30),
	(12, 2, 40),
	(14, 2, 20),
	(16, 2, 30),
	(18, 2, 40),
	(20, 2, 20),
	(1, 3, 20),
	(3, 3, 30),
	(5, 3, 40),
	(7, 3, 20),
	(9, 3, 30),
	(11, 3, 40),
	(13, 3, 20),
	(15, 3, 30),
	(17, 3, 40),
	(19, 3, 20),
	(1, 4, 20),
	(2, 4, 30),
	(3, 4, 40),
	(4, 4, 20),
	(5, 4, 30),
	(6, 4, 40),
	(7, 4, 20),
	(8, 4, 30),
	(9, 4, 40),
	(10, 4, 20)
;

create table Borrower (
	CardNo int primary key not null,
	Name varchar(255) not null,
	BorrowerAddress varchar(255) not null,
	Phone varchar(50) not null
);

insert into Borrower
	(CardNo, Name, BorrowerAddress, Phone)
	values
	(111111, 'Bors 1', 'BorsAdd 1', '123-111-1111'),
	(222222, 'Bors 2', 'BorsAdd 2', '123-222-2222'),
	(333333, 'Bors 3', 'BorsAdd 3', '123-333-3333'),
	(444444, 'Bors 4', 'BorsAdd 4', '123-444-4444'),
	(555555, 'Bors 5', 'BorsAdd 5', '123-555-5555'),
	(666666, 'Bors 6', 'BorsAdd 6', '123-666-6666'),
	(777777, 'Bors 7', 'BorsAdd 7', '123-777-7777'),
	(888888, 'Bors 8', 'BorsAdd 8', '123-888-8888')
;

create table Book_Loans (
	BookID int not null constraint fk_Book_Loans_Books foreign key references Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID int not null constraint fk_Book_Loans_Library_Branch foreign key references Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo int not null constraint fk_Book_Loans_Borrower foreign key references Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut date not null,
	DateDue date not null
);

insert into Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	values
	(1, 1, 111111, '20180716', '20181016'),
	(2, 1, 111111, '20180816', '20181116'),
	(3, 1, 111111, '20180916', '20181216'),
	(4, 1, 111111, '20180716', '20181016'),
	(5, 1, 111111, '20180816', '20181116'),
	(6, 1, 111111, '20180916', '20181216'),
	(7, 1, 111111, '20180716', '20181016'),
	(8, 1, 111111, '20180816', '20181116'),
	(9, 1, 111111, '20180916', '20181216'),
	(10, 1, 111111, '20180716', '20181016'),
	(2, 2, 111111, '20180716', '20181016'),
	(4, 2, 111111, '20180816', '20181116'),
	(6, 2, 111111, '20180916', '20181216'),
	(8, 2, 111111, '20180716', '20181016'),
	(10, 2, 111111, '20180816', '20181116'),
	(12, 2, 111111, '20180916', '20181216'),
	(14, 2, 111111, '20180716', '20181016'),
	(16, 2, 111111, '20180816', '20181116'),
	(18, 2, 111111, '20180916', '20181216'),
	(20, 2, 111111, '20180716', '20181016'),
	(1, 3, 111111, '20180716', '20181016'),
	(3, 3, 111111, '20180816', '20181116'),
	(5, 3, 111111, '20180916', '20181216'),
	(7, 3, 111111, '20180716', '20181016'),
	(9, 3, 111111, '20180816', '20181116'),
	(11, 3, 111111, '20180916', '20181216'),
	(13, 3, 111111, '20180716', '20181016'),
	(15, 3, 111111, '20180816', '20181116'),
	(17, 3, 111111, '20180916', '20181216'),
	(19, 3, 111111, '20180716', '20181016'),
	(1, 4, 111111, '20180716', '20181016'),
	(2, 4, 111111, '20180816', '20181116'),
	(3, 4, 111111, '20180916', '20181216'),
	(4, 4, 111111, '20180716', '20181016'),
	(5, 4, 111111, '20180816', '20181116'),
	(6, 4, 111111, '20180916', '20181216'),
	(7, 4, 111111, '20180716', '20181016'),
	(8, 4, 111111, '20180816', '20181116'),
	(9, 4, 111111, '20180916', '20181216'),
	(10, 4, 111111, '20180716', '20181016'),
	(1, 1, 222222, '20180716', '20181016'),
	(2, 1, 222222, '20180816', '20181116'),
	(3, 1, 222222, '20180916', '20181216'),
	(4, 1, 222222, '20180716', '20181016'),
	(5, 1, 222222, '20180816', '20181116'),
	(6, 1, 222222, '20180916', '20181216'),
	(7, 1, 222222, '20180716', '20181016'),
	(8, 1, 222222, '20180816', '20181116'),
	(9, 1, 222222, '20180916', '20181216'),
	(10, 1, 222222, '20180716', '20181016'),
	(2, 2, 222222, '20180716', '20181016'),
	(4, 2, 222222, '20180816', '20181116'),
	(6, 2, 222222, '20180916', '20181216'),
	(8, 2, 222222, '20180716', '20181016'),
	(10, 2, 222222, '20180816', '20181116'),
	(12, 2, 222222, '20180916', '20181216'),
	(14, 2, 222222, '20180716', '20181016'),
	(16, 2, 222222, '20180816', '20181116'),
	(18, 2, 222222, '20180916', '20181216'),
	(20, 2, 222222, '20180716', '20181016'),
	(1, 3, 222222, '20180716', '20181016'),
	(3, 3, 222222, '20180816', '20181116'),
	(5, 3, 222222, '20180916', '20181216'),
	(7, 3, 222222, '20180716', '20181016'),
	(9, 3, 222222, '20180816', '20181116'),
	(11, 3, 222222, '20180916', '20181216'),
	(13, 3, 222222, '20180716', '20181016'),
	(15, 3, 222222, '20180816', '20181116'),
	(17, 3, 222222, '20180916', '20181216'),
	(19, 3, 222222, '20180716', '20181016'),
	(1, 4, 222222, '20180716', '20181016'),
	(2, 4, 222222, '20180816', '20181116'),
	(3, 4, 222222, '20180916', '20181216'),
	(4, 4, 222222, '20180716', '20181016'),
	(5, 4, 222222, '20180816', '20181116'),
	(6, 4, 222222, '20180916', '20181216'),
	(7, 4, 222222, '20180716', '20181016'),
	(8, 4, 222222, '20180816', '20181116'),
	(9, 4, 222222, '20180916', '20181216'),
	(10, 4, 222222, '20180716', '20181016')
;

/*Procedure 1*/
create procedure msl_proc1
	as
	select
	a1.BranchName, a2.Title, a3.Number_Of_Copies
	from Library_Branch a1
	inner join Book_Copies a3 on a1.BranchID = a3.BranchID
	inner join Books a2 on a2.BookID = a3.BookID
	where Title = 'The Lost Tribe'
	and BranchName = 'Sharpstown'
	go
;

/*Procedure 2*/
create procedure msl_proc2
	as
	select
	a1.BranchName, a2.Title, a3.Number_Of_Copies
	from Library_Branch a1
	inner join Book_Copies a3 on a1.BranchID = a3.BranchID
	inner join Books a2 on a2.BookID = a3.BookID
	where Title = 'The Lost Tribe'
	go
;

/*Procedure 3*/
create procedure msl_proc3
	as
	select distinct a1.CardNo, a1.Name
	from Borrower a1
	where a1.CardNo not in
	(select a2.CardNo from Book_Loans a2) 
	and a1.CardNo is not null
	and a1.CardNo != ''
	go
; 

/*Procedure 4*/
create procedure msl_proc4
	as
	select a2.Title, a4.Name, a4.BorrowerAddress
	from Library_Branch a1
	inner join Book_Loans a3 on a1.BranchID = a3.BranchID
	inner join Books a2 on a2.BookID = a3.BookID
	inner join Borrower a4 on a4.CardNo = a3.CardNo
	where a1.BranchName = 'Sharpstown'
	and a3.DateDue = convert (date, SYSDATETIME())
	go
;

/*Procedure 5*/
create procedure msl_proc5
	as
	select a1.BranchName, count(a1.BranchID) "Number of Books Loaned"
	from Library_Branch a1
	inner join Book_Loans a2 on a1.BranchID = a2.BranchID
	group by a1.BranchName
	go
;

/*Procedure 6*/
create procedure msl_proc6
	as
	select a2.Name, a2.BorrowerAddress, count(a1.CardNo) "Number of Books Out"
	from Book_Loans a1
	inner join Borrower a2 on a1.CardNo = a2.CardNo
	group by a2.Name, a2.BorrowerAddress
	having count(a1.CardNo) > 5
	go
;

/*Procedure 7*/
create procedure msl_proc7
	as
	select a2.Title, a3.AuthorName, a1.BranchName, a4.Number_Of_Copies
	from Library_Branch a1
	inner join Book_Copies a4 on a1.BranchID = a4.BranchID
	inner join Books a2 on a2.BookID = a4.BookID
	inner join Book_Authors a3 on a2.BookID = a3.BookID
	where AuthorName = 'Stephen King'
	and BranchName = 'Central'
	go
;
