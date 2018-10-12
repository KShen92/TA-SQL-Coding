use db_zoo

/* Drill 1 */
select * from tbl_habitat;

/*Drill 2*/
select species_name from tbl_species where species_order = 3;

/*Drill 3*/
select nutrition_type from tbl_nutrition where nutrition_cost <= 600;

/*Drill 4*/
