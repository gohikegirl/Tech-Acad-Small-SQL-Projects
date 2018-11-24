USE db_zooTest2

SELECT * FROM tbl_habitat

SELECT * FROM tbl_species

SELECT species_name FROM tbl_species WHERE species_order=3

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <=600

SELECT a1.species_name, a2.nutrition_id
	FROM tbl_species a1
	INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
	WHERE nutrition_id BETWEEN 2202 AND 2206

SELECT a1.species_name AS 'Species Name', a2.nutrition_type AS 'Nutrition Type'
	FROM tbl_species a1
	INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition

SELECT a1.specialist_fname, a1.specialist_lname, a1.specialist_contact,a2.care_id,a3.species_name 
	FROM tbl_specialist a1
	INNER JOIN tbl_care a2 ON a2.care_specialist = a1.specialist_id
	INNER JOIN tbl_species a3 ON a3.species_care = a2.care_id
	WHERE species_name = 'penguin'

CREATE DATABASE TechAcadDB
USE TechAcadDB


CREATE TABLE tbl_owner(
	owner_id int PRIMARY KEY NOT NULL IDENTITY (100,1),
	owner_fname varchar(50),
	owner_lname varchar(50),
	owner_email varchar(100), 
);

CREATE TABLE tbl_pet (
	pet_id int PRIMARY KEY NOT NULL IDENTITY (1,1),
	pet_name varchar(50),
	pet_species varchar(50),
	pet_breed varchar(50),
	pet_owner int NOT NULL CONSTRAINT FK_owner_id FOREIGN KEY REFERENCES tbl_owner(owner_id) ON UPDATE CASCADE ON DELETE CASCADE,
);

INSERT INTO tbl_owner (owner_fname, owner_lname,owner_email)
	VALUES 
	('Alex', 'Aguilera', 'aa@gmail.com'),
    ('Michelle', 'Lee', 'mgl@gmail.com'),
	('Jennifer', 'Chen', 'jchen@gmail.com'),
	('Karen', 'Hughey', 'khughey@gmail.com')
	;

INSERT INTO tbl_pet(pet_name, pet_species, pet_breed, pet_owner)
	VALUES 
	('Jarvis', 'dog', 'Welsh Pembroke Corgi', 100),
    ('Peewee', 'dog', 'Westie Terrier', 101),
	('Nugget', 'dog', 'Norwich Terrier', 101),
	('Pepsi', 'dog', 'Doodle', 102),
	('Fennel', 'cat', 'unknown', 103)
	;

SELECT a1.pet_name, a2.owner_fname, a2.owner_lname
	FROM tbl_pet a1
	INNER JOIN tbl_owner a2 ON a2.owner_id = a1.pet_owner
	WHERE owner_fname = 'Michelle'
	;


