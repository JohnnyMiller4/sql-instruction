select * from hero;

select avg from hero
where name = 'Superman';

insert into hero (id, name, secretID, intelligence, strength, durability, speed, energyPro, fightSkill)
values (4, 'Darkseid', 'Is', 7, 7, 7, 5, 7, 6);

delete from hero where id = 4;

select intelligence, strength, durability, speed, energyPro, fightSkill from hero where id = 1;