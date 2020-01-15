-- create and select database
drop database if exists hero_db;
create database hero_db;
use hero_db;

create table hero (
	id				int				not null primary key auto_increment,
    name			varchar(20)		not null,
    secretID		varchar(20)		not null,
    intelligence	double			not null,
    strength		double			not null,
    durability		double			not null,
    speed			double			not null,
    energyPro		double			not null,
    fightSkill		double			not null
);

Insert into hero (id, name, secretID, intelligence, strength, durability, speed, energyPro, fightSkill)
values (1, 'Superman', 'Clark Kent', 5, 7, 7, 7, 6, 4);
Insert into hero (id, name, secretID, intelligence, strength, durability, speed, energyPro, fightSkill)
values (2, 'Batman', 'Bruce Wayne', 6, 4, 3, 2, 2, 7);
Insert into hero (id, name, secretID, intelligence, strength, durability, speed, energyPro, fightSkill)
values (3, 'Wonder Woman', 'Diana Prince', 4, 7, 7, 7, 2, 7);

DROP USER IF EXISTS hero_db_user@localhost;
CREATE USER hero_db_user@localhost IDENTIFIED BY 'Martha';
GRANT SELECT, INSERT, DELETE, UPDATE ON hero_db.* TO hero_db_user@localhost;