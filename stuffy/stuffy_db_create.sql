-- create and select database
drop database if exists stuffy_db;
create database stuffy_db;
use stuffy_db;

-- The above three lines should only exist in a database *once*

-- Create movie table
-- DROP TABLE IF EXISTS movie;
create table stuffy (
	id 				int 			not null primary key auto_increment,
	type 			varchar(255) 	not null unique,
	color 			varchar(20) 	not null,
	size			varchar(2) 		not null,
	limbs	 		int			 	not null,
    
    CONSTRAINT unq_stuffy unique (type)
);

-- Add stuffys
Insert into stuffy (id, type, color, size, limbs)
values (1, 'Porg', 'Orange', 'S', 4);
Insert into stuffy (id, type, color, size, limbs)
values (2, 'Krypto', 'White', 'XS', 4);
Insert into stuffy (id, type, color, size, limbs)
values (3, 'Robin', 'Red', 'M', 4);
Insert into stuffy (id, type, color, size, limbs)
values (4, 'Superboy', 'Blue', 'L', 4);
Insert into stuffy (id, type, color, size, limbs)
values (5, 'Dolphin', 'Gray', 'L', 4);
Insert into stuffy (id, type, color, size, limbs)
values (6, 'Otter', 'Brown', 'M', 4);
Insert into stuffy (id, type, color, size, limbs)
values (7, 'Fish', 'Blue', 'S', 0);
Insert into stuffy (id, type, color, size, limbs)
values (8, 'Cat', 'Black', 'M', 4);
Insert into stuffy (id, type, color, size, limbs)
values (9, 'Female Porg', 'Gray', 'S', 4);
Insert into stuffy (id, type, color, size, limbs)
values (10, 'Jawa', 'Brown', 'XL', 4);

-- create a user and grant privileges to that user
DROP USER IF EXISTS stuffy_user@localhost;
CREATE USER stuffy_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON stuffy_db.* TO stuffy_user@localhost;