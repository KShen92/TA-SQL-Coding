create database drillSP;

use drillSP

CREATE TABLE drillSP_table1 (
	tbl1_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	tbl1_fname VARCHAR(50) NOT NULL,
	tbl1_lname VARCHAR(50) NOT NULL,
);

insert into drillSP_table1
	(tbl1_fname, tbl1_lname)
	values
	('Ken', 'Shen'),
	('Ken', 'Son of Shen'),
	('General', 'Ken-obi'),
	('ULTIMATE', 'CHAD'),
	('needmore', 'filler')
;

CREATE TABLE drillSP_table2 (
	tbl2_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	tbl2_phone VARCHAR(50) NOT NULL,
	tbl2_address VARCHAR(50) NOT NULL,
	fk_tbl1 int foreign key references drillSP_table1(tbl1_id)
);

insert into drillSP_table2
	(tbl2_phone, tbl2_address)
	values
	('518-123-4567', 'upstate ny'),
	('horse', 'bumfuck middle earth'),
	('mindfuck telepathy', 'boundless void of space'),
	('111-111-1111', 'jersey'),
	('111-111-1111', 'also jersey')
;

CREATE TABLE drillSP_table3 (
	tbl3_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	tbl3_style VARCHAR(50) NOT NULL,
	tbl3_weapon VARCHAR(50) NOT NULL,
	tbl3_genre VARCHAR(50) NOT NULL,
);


insert into drillSP_table3
	(tbl3_style, tbl3_weapon, tbl3_genre)
	values
	('straight brawlin', 'MY ENTIRE BODY', 'reality'),
	('outland ranger hacknslash', 'sword of ghost pirates', 'fantasy'),
	('jedi bushido', 'like 6 lightsabers', 'sci-fi'),
	('straight brawlinnnn', 'weaponized narcissism', 'reality'),
	('jedi bushido', 'crippling lethargy', 'reality')
;

create procedure dbo.uspDrillSP @tbl3_style nvarchar(50) = NULL, @tbl3_genre nvarchar(50) = NULL
	as
	select
	a1.tbl1_fname "First Name", a1.tbl1_lname "Last Name", a2.tbl2_phone "Phone", a2.tbl2_address "Address", a3.tbl3_style "Fighting Style", a3.tbl3_style "Weapon", a3.tbl3_genre "Your Reality"
	from drillSP_table1 a1
	inner join drillSP_table2 a2 on tbl1_id = tbl2_id
	inner join drillSP_table3 a3 on tbl1_id = tbl3_id
	where tbl3_style like '%' + ISNULL(@tbl3_style, tbl3_style) + '%'
	and tbl3_genre like '%' + ISNULL(@tbl3_genre, tbl3_genre) + '%'
	go
	;
