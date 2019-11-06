-- Select all students
select *
from student;

-- Select all courses
select *
	from course;

-- Select all courses
select count(*)
	from enrolled;

-- Stidemts w/o middle name    
select concat(firstName, " ", lastName) 'Name', address 'Address', state 'State', zip 'Zip Code', date_format(birthday, "%M %d %Y") 'Birthdate'
		from student
        where middleInitial is null;

-- How many students in Ohio?
select count(*)
	from student
    where state = 'OH';
    
-- Oldest student?
select concat(firstName, " ", lastName) 'Name', date_format(birthday, "%M %d %Y") 'Birthdate'
	from student
    where birthday = (select min(birthday) from student);

-- Youngest student?
select concat(firstName, " ", lastName) 'Name', date_format(birthday, "%M %d %Y") 'Birthdate'
	from student
    where birthday = (select max(birthday) from student);

-- age of oldest student (trial)
select birthday, year(birthday), curdate(), year(curdate())
	from student;
    
-- age of oldest student (real)
select concat(firstName, " ", lastName) 'Name', (year(curdate()) - year(birthday)) as Age
	from student
    where birthday = (select min(birthday) from student);

-- trying to add name
select concat(s.firstName, " ", s.lastName), /*max(*/s.birthday/*)*/
	from student s
    order by s.birthday;

-- How many social studies courses?
select count(subject) 'Number of Social Studies courses'
	from course
    where subject = 'socialStudies';

-- How many math courses?
select count(subject) 'Number of Math courses'
	from course
    where subject = 'math';

-- list all subjects starting with the letter 'm'
select id 'Course ID', subject 'Subject', credits 'Credits'
	from course
		where subject like 'm%';
        
-- list all subjects with the letter 'e' in them
select id 'Course ID', subject 'Subject', credits 'Credits'
	from course
		where subject like '%e%';

-- Inner Join of all three (only shows enrolled students)
select s.id 'Student ID', concat(s.firstName, " ", s.lastName) 'Student Name', c.id 'Course ID', c.name 'Course Name', c.subject 'Subject', 'Student Name', e.grade 'Grade'
	from student s
		join enrolled e
			on e.studentID = s.id
        join course c
			on e.courseID = c.id
	order by s.id;
    
-- Outer Join of all three (shows all students, even ones who aren't enrolled)
select s.id 'Student ID', concat(s.firstName, " ", s.lastName) 'Student Name', c.id 'Course ID', c.name 'Course Name', c.subject 'Subject', 'Student Name', e.grade 'Grade'
	from student s
		left join enrolled e
			on e.studentID = s.id
        left join course c
			on e.courseID = c.id
	order by s.id;
    
    -- if needed, replace 'left' with 'outer' on assessment. For a full outer join, type 'union all' between joins
