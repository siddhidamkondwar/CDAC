use hr;
 
#write a quary to display country_id and no_of_emp works in each country that has more than 5 emp

select country_id, count(*) no_of from employees e
inner join departments d
on e.department_id=d.department_id
inner join locations l
on d.location_id=l.location_id
group by l.country_id
having no_of<5;

-- from -- join-- order by -- having--select--order by

#write a quary to find department whith more than 5 emp and avg salary > 5000

SELECT department_id, COUNT(*) AS total_employees, 
	AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
	HAVING COUNT(*) > 5 
    AND AVG(salary) > 5000;
    
# give the count of emp and avg salary per dept where dept are IT,Finance and sales
select d.department_id,d.department_name,count(*) no_of, avg(salary)
from employees e
inner join departments d
on e.department_id=d.department_id
where department_name in('IT','Finance','Sales')
group by d.department_id
order by no_of;

-- from -- where -- join --grpup --count --select --order by

#find all the no executive manager who lead the teams of 3 or more emp earning --
#above 4000 where the avg salary exceed 5000
select e1.MANAGER_ID,d.department_id,department_name,concat(e.first_name, ' ', e.last_name),count(*) no_of,avg(e.salary) from employees e 
inner join employees e1
on e.employee_id = e1.manager_id
inner join departments d
on e1.department_id = d.department_id
where d.department_name != 'Executive' and e.salary>4000
group by e1.manager_id,d.department_id
having no_of>=3 and avg(e.salary)>5000
order by no_of;
 
 #as hr city level breakdown of job roles across america region 
 #you need to see each city in america should have distinct job and you have to fin dtotal no of emp and avg salary for cities
 #having more than 2 emp and avg sal= 5000+ you need to exclude emp salary less than 3000
select l.city,r.region_name,
count(e.employee_id) no_of,count(distinct e.job_id), AvG(salary)as avg_sal
from employees e inner join departments d
on e.department_id=d.departnent_id
inner join locations l 
on d.location_id=l.location_id
inner join countries c
on c.country_id=l.country_id
inner join regions r
on r.regions_id=l.reginons_id
inner join jobs j
on j.job_id=l.job_id
where region_name like '%America%'
and e.salary>=3000
group by l.city,r.regions_name
having no_of>2 and avg_sal >5000
order by no_of;

  -- from
  select department_name from
  (select department_name from departments 
  where department_id=100) as dept_table;
  select department_name from departments
  where department_id=100;
  
  select count(*) from employees
  where department_id=90;
  
  select first_name ,(select count(*) from employees
  where department_id=90) as no_of_emp_dept
  from employees;
  
    select first_name ,(select department_name from departments
  where department_id=90) as no_of_emp_dept
  from employees;
  
  #find teh emp with same job id as emp id 100
  select job_id from employees where employee_id=100;
  
  select concat(first_name,'',last_name) job_id,department_id
  from employees where job_id=( select job_id from employees where employee_id=100);
  
   #find the emp working in dept located in new york
   select location_id from locations where STATE_PROVINCE='Taxes';
   select department_id from departments where location_id=1400;
   select employee_id,first_name,department_id from employees where department_id=60;
   
select employee_id,first_name,department_id from employees where department_id=
 (select department_id from departments where location_id=
 (select location_id from locations where STATE_PROVINCE='Taxes'));
 
 select * from locations;
 
 select employee_id,first_name,department_id from employees 
 where department_id=
  (select department_id from departments d
  inner join locations l
  on d.location_id=l.location_id
  where STATE_PROVINCE='Taxas');
  
  #find the 3ed higest salary
  
  # we need to find emp working in dept which is locatted on seatle
 select location_id from locations where STATE_PROVINCE='Seattle';
   select department_id from departments where location_id=1400;
   select employee_id,first_name,department_id from employees where department_id=60;
   
select employee_id,first_name,department_id from employees where department_id=
 (select department_id from departments where location_id=
 (select location_id from locations where STATE_PROVINCE='Seattle'));
 
  select employee_id,first_name,department_id from employees 
 where department_id=
  (select department_id from departments d
  inner join locations l
  on d.location_id=l.location_id
  where STATE_PROVINCE='Seattle');
  
  #find emp who has past job records
  -- select * from job_history;
--   select employee_id first_name, department_id
--   from employees where employee_id in(
--   select e.employee_id from job_history j;
--   join employees e-- 
  
  with emp_grt_total_avg_sal as (
  select avg(salary) from employees
  )
  select first_name, avg_sal,department_id
  from 
  employees, emp_grt_total_avg_sal s
  where salary > s.avg_sal;
  
  -- find dept more than  5 emp using city 
  
  with more_5_emp as 
  (
  select count(employee_id) no_of, department_id from employees
  group by department_id
  )
  select m.department_id,m.no_of
  from employees , more_5_emp m
  where m.no_of >5;
  
  #find the higest salalry in each department
with abc as(
select max(salary),department_id from employees
group by department_id)
select first_name,salary,department_id
from employees e , abc a 
where e.department_id=a.department_id; 


with sal_band as (
 select first_name,salary,
 case 
   when salary <10000 then 'Low salary'
   when salary >=10000 and salary < 15000 then 'mid range salary'
   when salary >=15000 and salary < 30000 then 'high range salary'
   else 'other'
   end as salary_band
   from employees
 )
 select count(*),salary_band
from sal_band
group by salary_band;

#find the emp who are earning more than there manger 
with mang_sal as(
 select employee_id mang_id,first_name, salary,manager_id from employees
 
)
select e.first_name,e.salary,concat(m.first_name) as manager_name,m.salary
from employees e
join mang_sal m
on mang_id=e.manager_id
where e.salary > m.salary;

#find emp who earn more than avg salary
#and having been in the company more than the avg 


# find the products where unit price < recorded level , 
-- show product name ,stock how many units short they have 
 use northwind;
 
 show tables;
  
-- with product_data as(
--  select id,product_name,category,reorder_level
--  from products),
--  ord_quantity as (select unit_price,product_id,quantity from order_details)
--  select distinct p.id,product_nmae,p.reorder_level,
--  o.unit_price,o.quantity,(o.quantity-p)
--  -- 
 
 -- compute total revenu/month and then compute each mmonth to 
 -- previous month ,flag the months when the revenue decline 
 
 select * from purchase_orders;
 select * from orders;
 select * from order_details;
 
 SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month ,
    SUM(unit_price) AS total_revenue
FROM orders_details
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;
 
 select  shipping_fee from orders;
 
 use hr;
 with emp as (
 select employee_id,first_name ,
 salary,department_id from employees
 )
 select (select count(*) as no_of_emp from emp) as no_emp,
		(select avg(salary) as avg_sal from emp) as avg_sal, 
        (select sum(salary) as sum_sal from emp) as sum_sal;
        
create table dept_Wfk_ex(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_Wfk_ex(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int
);

insert into dept_wfk_ex(dept_name,emp_id ,project_id) value('IT',103,'P_01'),
('Admin',104,'P_02'),('HR',105,'P_011');

insert into emp_wfk_ex(emp_name,p_id ,department_id )
values('A','P_02',3),('B','P_02',1),('AA','P_03',4);


select * from dept_wfk_ex;
select * from emp_wfk_ex;


delete from emp_wfk_ex where department_id =1;
delete from dept_wfk_ex where dept_id =3;


WITH RECURSIVE rec AS (
    -- Start date (min date from orders)
    SELECT MIN(DATE(order_date)) AS dt
    FROM orders

    UNION ALL

    -- Generate next dates
    SELECT dt + INTERVAL 1 DAY
    FROM rec
    WHERE dt < (SELECT MAX(DATE(order_date)) FROM orders)
),

order_day AS (
    SELECT DATE(o.order_date) AS od_da, COUNT(*) AS no_od_od
    FROM order_details od
    join orders o
    on o.id=od.id
    WHERE YEAR(order_date) = 2006
    GROUP BY DATE(order_date)
)

SELECT 
    r.dt,
    DAYNAME(r.dt) AS day_name,
    COALESCE(od.no_od_od, 0) AS total_orders
FROM rec r
LEFT JOIN order_day od 
    ON r.dt = od.od_da
ORDER BY total_orders desc;

use hr;


############# WINDOW FUNCTION #####################


select department_id, count(*)
from employees
group by department_id;

select employee_id,first_name,department_id,salary,
count(salary)over (partition by department_id) as_dept
from employees;

select employee_id,first_name,department_id,salary,
sum(salary)over (partition by department_id) as_dept
from employees;

select employee_id,first_name,department_id,salary,
min(salary)over (partition by department_id) as_dept
from employees;

select employee_id,first_name,department_id,salary,
max(salary)over (partition by department_id) as_dept
from employees;

select employee_id,first_name,department_id,salary,
avg(salary)over (partition by department_id) as_dept
from employees;

select employee_id,first_name,department_id,salary,
min(salary)over (order by salary) as_dept
from employees;

select employee_id,first_name,department_id,salary,
count(*)over (partition by department_id order by salary) as_dept
from employees;

select employee_id,first_name,department_id,salary,
row_number()over (order by salary) as_dept
from employees;

select employee_id,first_name,department_id,salary,
row_number()over (partition by department_id) as_row
from employees;


select employee_id,first_name,department_id,salary,
row_number()over (partition by department_id order by salary desc) as_salary
from employees;
#where as_salary<=2;

with snd_hi as(
select employee_id,first_name,department_id,salary,
row_number() over(partition by department_id order by salary desc)
 as_salary
from eployees
)
select * from snd_hi where as_salary<=2;


-- where you need to find newly latest join employees in each department
  with lat_joi as(
 select employee_id,first_name,department_id,hire_date,
 row_number() over(partition by department_id  )
 as_hire
 from employees
 )
 select * from lat_joi where as_hire=1;
 
 
 -- remove employee + department duplicate ()read
 
 with lat_joi as(
 select employee_id,first_name,department_id,hire_date,
 row_number() over(partition by first_name, department_id)
 as_rem
 from employees
 )
 select * from lat_joi where as_rem>=2;
 
 select employee_id, salary ,department_id, first_name,
 dense_rank () over (partition by department_id order by salary desc) as dense_num
  from employees;
 select employee_id, salary ,department_id, first_name,
 row_number () over (partition by department_id order by salary desc) as row_num
  from employees;
  select employee_id, salary ,department_id, first_name,
 rank () over (partition by department_id order by salary desc) as rank_num
  from employees;

 
 
 

 
 
 
 
 
 
 
 
 
 
 
 