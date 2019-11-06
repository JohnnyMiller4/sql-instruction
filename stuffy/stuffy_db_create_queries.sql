-- list all stuffies
select * from stuffy;

-- stuffy color
select * from stuffy
where color = 'pink';

-- stuffy Medium size
select * from stuffy
where size = 'M';

-- select Porg stuffies
select *
	from stuffy
		where type like '%Porg%';
        
-- Stuffy with least amount of limbs
select * from stuffy
    order by limbs;

-- add a 'Dummy' stuffy
insert into stuffy (type, color, size, limbs)
	values ('Dummy', 'Brown', 'M', 3);
    
-- Update that new record
update stuffy 
	set type = 'ThreeDog'
    where type = 'Dummy';

-- Delete 'ThreeDog'
delete from stuffy
	where type = 'ThreeDog';