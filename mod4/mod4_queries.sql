-- select all columns for customers in OH, ordered by name
select * from customer
where state = 'OH'
order by name desc; -- 'desc' returns in descending order

select 1;

-- select name and credit limit columns, all rows
select name 'Name', creditLimit as 'Credit Limit' from customer;

-- select name and credit limit columns, all rows, using table alias
select c.name 'Name', c.creditLimit as 'Credit Limit'
from customer c;

select customer.name
from customer;

-- join view - all columns
select *
	from customer
    join orders
		on customer.id = orders.customerID;
        
        
-- join view - report format - customer name,
-- 							order date, total
select c.name 'Customer Name', date_format(o.date, "%M %d %Y") as 'Order Date',
				concat('$', o.total) as 'Order Total'
	from customer c
    join orders o
		on c.id = customerID
	order by c.name;
    
-- join view - report format, subselect
select c.name 'Customer Name', date_format(o.date, "%M %d %Y") as 'Order Date',
				concat('$', o.total) as 'Order Total'
	from customer c
    join orders o
	on c.id = customerID
    where o.total > (select avg(total) from orders)
	order by c.name;
    
-- get the average order total
select avg(total) as 'Average Total'
	from orders;
    
-- sum of all orders
select sum(total) as 'Sum Total'
	from orders;
    
-- get sum of all orders by customer
select c.name, sum(total) as 'Sum Total'
	from orders o
    join customer c
    on c.id = customerID
    group by c.name;
    
select c.name 'Customer Name', date_format(o.date, "%M %d %Y") as 'Order Date',
				concat('$', o.total) as 'Order Total'
	from customer c
    join orders o
	on c.id = customerID
    where o.total > (select avg(total) from orders)
	order by c.name;

-- customer name and order total
select customerID 'Customer ID', c.name 'Name', sum(total) as 'Sum Total'
	from orders o
    join customer c
		on c.id = o.customerID
    group by customerID
    order by customerID;
    
-- count function
select max(total)
	from orders;
    
-- select a row by id
select * from customer
where state = 'OH';

-- insert a new customer = adds a single row to the table
insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Dummy', 'Dummy', 'DY', 0, 500000);

select * from customer;

-- insert customer shortcut
insert into customer 
values (10, 'Dummy2', 'Dummy', 'DY', 0, 555, 1);

-- insert multiple
insert into customer (name, city, state, isCorpAcct, creditLimit)
values
	('Dummy3', 'Dummy', 'DY', 0, 5555.55),
	('Dummy4', 'Dummy', 'DY', 0, 5555.55),
    ('Dummy5', 'Dummy', 'DY', 0, 5555.55)
;

-- update statement
update customer 
	set name = 'Dummy1'
    where id = 8;
    
select * from customer;

select *
from customer
	where id in (11, 12, 14);

-- delete three records
delete
from customer
where id in (11, 12, 14);

select * from customer;

delete from customer
	where id = 7;