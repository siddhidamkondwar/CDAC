use northwind;

-- Case statement
select * from orders;

-- 0 then new order
-- 1 then processing
-- 2 shipped
-- 3 closed the order

select customer_id, order_date, 
case status_id
	when status_id = 0 then 'New Order'
    when status_id = 1 then 'Order is in process'
    when status_id = 2 then 'Package shipped'
    when status_id = 3 then 'Order is closed'
end as status_of_order
from orders;

-- Payments
-- Credit Card
-- card
-- cash

select customer_id, order_date, payment_type,
case payment_type
	when payment_type = 'Credit Card' then 'Payment made by card'
    when payment_type = 'cheque' then 'Payment made by cheque'
    when payment_type = 'Cash' then 'payment made by cash'
    else 'Others'
end as payment_type_mode
from orders;

-- Product table 
select product_name, category,
case 
	when category = 'Beverages' then 'Put it in drink section'
    when category = 'Canned Fruit & Vegetable' then 'Put it in fridge'
    when category = 'Candy' then 'then put it near cash counter'
    else 'Others'
end as cat_product
from products order by category;

-- Re-Order Level
select product_name, category,
case
	when reorder_level between 0 and 10 then 'Stop putting in the inventory'
    when reorder_level between 10 and 50 then 'make to medium stock'
    when reorder_level between 50 and 150 then 'make a high stock'
    else 'To be discussed'
end as cat_product
from products order by category;

select product_name, standard_cost, list_price,
case 
	when standard_cost = 3.00 and list_price = 3.500 then 'Dried plums'
    when standard_cost = 2.00 and list_price = 4.00 then 'Garnola'
    else 'To be discussed'
    end as match_con
from products;

select customer_id, order_date, payment_type, status_id, paid_date,
case
	when payment_type is null and paid_date is null and status_id=3 then 'stop the shipping'
    when payment_type = 'cash' and status_id = 0 then 'process order'
    when payment_type is null and paid_date is null then 'stop'
    else 'processthe shipping'
end as status_of_orer
from orders;

select order_id, paid_date,
case
	when payment_type is null and timestampdiff(day, order_date, now()) > 30 then 'Overdue'
    when payment_type is null and timestampdiff(day, order_date, now()) <= 30 then 'due soon'
    when payment_type is not null then 'paid'
    end as payment_status
from orders;

select expected_date,
case 
	when expected_date is null then 'No Date Set'
    when timestampdiff(day, expected_date, now()) > 30 then 'Overdue'
    when timestampdiff(day, expected_date, now()) > 7 then 'Urgent'
    when timestampdiff(day, expected_date, now()) <= 30 then 'Upcoming'
    else 'Planned'
    end urgency_level
from purchase_orders;

insert into purchase_orders(expected_date) values
('2026-04-03'),
('2026-03-13'),
('2026-01-23');

select 
	employee_id,
	count(case when status_id = 2 then 1 end) as shipped_orders,
    count(case when status_id < 2 then 1 end) as pending_orders
from orders
group by employee_id
order by employee_id;

# ------------------ UPDATE ----------------------
update products set list_price =
	case category
		when 'Beverages' then list_price * 0.9
		when 'Condiments' then list_price * 0.95
		when 'Seafood' then list_price * 0.85
		else list_price
	end
where discontinued = 0;
select * from products;

# --------------------IF Statement -----------------------
select 
	product_name, discontinued,
    if (discontinued=0, 'Discontinued', 'Available') as Status
from products;

select 
	id,
    shipping_fee,
    if(shipping_fee=0, 'Free', 'Paid') as shipping_type
from orders;

select id, shipped_date,
	if (shipped_date is null, 'Not shipped', 'Shipped') delivery_status
from orders;


select
	product_name,
    reorder_level,
    if(reorder_level <= 10, 'Reorder Required', 'No Reorder') reorder_status
from products;

-- orders
-- paydate is null -> unpaid
-- paydate is not null -> paid
select * from orders;

select 
	paid_date,
    if (paid_date is null, 'Unpaid', 'Paid') due_pay
from orders;

# -------------- Operators ---------------------
select employee_id, first_name, salary,
	case when employee_id % 2 = 0 then 'Even'
    else 'Odd'
    end as even_emp_id
from hr.employees
order by even_emp_id;

select employee_id, first_name, salary, hire_date
from hr.employees where hire_date='1987-06-17';

select employee_id, first_name, salary, department_id
from hr.employees where department_id != 90; -- except 90 
select employee_id, first_name, salary, department_id
from hr.employees where department_id <> 90; -- except 90 , same !=
select employee_id, first_name, salary, department_id
from hr.employees where department_id <=> 90; -- only 90 , same =

-- employees not hired in 1987
select first_name, last_name, hire_date
from hr.employees where year(hire_date) != '1987';
select first_name, last_name, hire_date
from hr.employees where year(hire_date) <> '1987';

select first_name, last_name, hire_date
from hr.employees where first_name between 'A' and 'E' order by first_name;   -- range is end at -1 index of end char

select employee_id, first_name, last_name, hire_date
from hr.employees where employee_id between 100 and 105 order by employee_id;  -- range is normal like start from 100 and end at 105, end to end value

select employee_id, first_name, last_name, hire_date
from hr.employees where hire_date between '1987-06-17' and '1987-06-21' order by employee_id;  -- end to end values

select employee_id, first_name, last_name, salary
from hr.employees where salary between 21000 and 250000;  -- between and operator are working same, check this and below example
select employee_id, first_name, last_name, salary
from hr.employees where salary >= 21000 and salary <= 250000;

select employee_id, first_name, last_name, salary
from hr.employees where salary not between 21000 and 250000 order by salary;
select employee_id, first_name, last_name, salary
from hr.employees where salary < 21000 or salary > 250000 order by salary;

select minimum_reorder_quantity from products where minimum_reorder_quantity is null;
select minimum_reorder_quantity from products where minimum_reorder_quantity between 5 and 30;

-- employees got hired from 1987-07-01 till 1987-08-31
select first_name, last_name, hire_date
from hr.employees where date(hire_date) between '1987-07-01' and '1987-08-31';

select 
	employee_id,
    first_name,
    last_name,
    salary,
    department_id,
    job_id
from hr.employees
where salary>10000
and department_id in (80, 90, 100)  -- similar to or operator
order by salary desc;

