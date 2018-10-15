/*Following drills used with zoo db setup, based on Functions 1.sql
at https://github.com/KShen92/TA-SQL-Basic */

use db_zoo

/* Drill 1 */
select * from tbl_habitat;

/*Drill 2*/
select species_name from tbl_species where species_order = 3;

/*Drill 3*/
select nutrition_type from tbl_nutrition where nutrition_cost <= 600;

/*Drill 4*/
select
	a1.species_name, a1.species_nutrition
	from tbl_species a1
	inner join tbl_nutrition a2 on a2.nutrition_id = a1.species_nutrition
	where a1.species_nutrition between 2202 and 2206
;

/*Drill 5*/
select
	a1.species_name "Species Name:", a2.nutrition_type "Nutrition Type:"
	from tbl_species a1
	inner join tbl_nutrition a2 on a2.nutrition_id = a1.species_nutrition
;

/*Drill 6*/
select
	a1.species_name "Species", a3.specialist_fname "First Name", a3.specialist_lname "Last Name", a3.specialist_contact "Phone"
	from tbl_species a1
	inner join tbl_care a2 on a1.species_care = a2.care_id
	inner join tbl_specialist a3 on a2.care_specialist = a3.specialist_id
	where a1.species_name = 'penguin'
;

/*Drill 7*/
create database drill7;
use drill7

CREATE TABLE drill7_table1 (
	tbl1_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	tbl1_fname VARCHAR(50) NOT NULL,
	tbl1_lname VARCHAR(50) NOT NULL,
);

insert into drill7_table1
	(tbl1_fname, tbl1_lname)
	values
	('Ken', 'Shen'),
	('Ken', 'Son of Shen'),
	('General', 'Ken-obi')
;

CREATE TABLE drill7_table2 (
	tbl2_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	tbl2_phone VARCHAR(50) NOT NULL,
	tbl2_address VARCHAR(50) NOT NULL,
	fk_tbl1 int foreign key references drill7_table1(tbl1_id)
);

insert into drill7_table2
	(tbl2_phone, tbl2_address)
	values
	('518-123-4567', 'upstate ny'),
	('horse', 'bumfuck middle earth'),
	('mindfuck telepathy', 'boundless void of space')
;

select
	a1.tbl1_fname "First Name", a1.tbl1_lname "Last Name", a2.tbl2_phone "Phone", a2.tbl2_address "Address"
	from drill7_table1 a1
	inner join drill7_table2 a2 on tbl1_id = tbl2_id
;
