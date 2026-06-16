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



create table to_check_auto(
 id int auto_increment primary key,
 e_name varchar(30),
 email varchar(50),
 ph_no int
);

insert into to_check_auto(e_name,email,ph_no) values
('A', ' a@g.com', 12345),
('B', ' b@g.com', 67890);

select * from to_check_auto ;

alter table to_check_auto drop primary key,
add primary key(ph_no);

#0	35	11:49:45	alter table to_check_auto drop primary key,
#add primary key(ph_no)	Error Code: 1075. 
#Incorrect table definition; there can be only one auto column and it must be defined as a key	0.000 sec


alter table to_check_auto drop primary key;

alter table to_check_auto modify column id int;
alter table to_check_auto 
add primary key (ph_no);


-- update 
select * from employees;

update employees set email='steven@gmail.com'
where employee_id=100;

update employees set email='Neena@gmail.com', hire_date=curdate()
where employee_id=101;

update employees set salary = salary + 25000;

update employees set salary=salary(salary*.15)
where timestampdiff(year,curdate(),hire_date)>20;

select timestampdiff(year,hire_date, curdate()) from employees;
select * from employees 
where timestampdiff(year,curdate(),hire_date)<=20;

update employees set job_desc='Working in IT', hire_date=curdate()
where department_id in (90,100,40,70);



select * from employees;
update employees set av1='Non active'
where COMMISSION_PCT=0.00 and av1='active';

create table emp_update select * from employees;
truncate emp_update;
desc emp_update;
alter table emp_update modify email varchar(50 )null, modify phone_number int null;
alter table emp_update add primary key (employee_id);

insert into emp_update(employee_id,phone_number,last_name,email,hire_date,job_id)
values(101,123,'a','a@','1987-09-11','ag');
insert into emp_update(employee_id,phone_number,last_name,email,hire_date,job_id)
values(10,12,'a',null,'1987-09-11','hh');

select * from emp_update;

update emp_update set email=concat(employee_id,last_name,'@','gmail.com')
where email is null or email=' ';

use northwind;

SELECT 5 = NULL;
SELECT 'ab' = NULL;
SELECT TRUE = NULL;
SELECT NULL = NULL;
SELECT CONCAT('hi', NULL);

SELECT ' 'and null; 

######FUNctIONS#######
#1AGGRIGATE 
# min,max,avg,sum,count

#STRING 
# concat,substring,left/right 

#windows 
# rank,lag,rollno

#maths
# absolute,celing,floor

#control
#case,if 

-- count 
SELECT count(*) from employees;
select count (employee_id) from employees;

select minimum_reorder_quantity from products;

select * from orders ;
select count(distinct employees_id) from orders;

#count the number of customes from city new york 

select * from employees;
select count(distinct customer_id) 
from orders where ship_city='new york';

select * from orders;

select sum(shipping_fee) from orders;


select sum(shipping_fee) from employees;

#find the total revenu genretated by company 
 
-- avg 

select avg(salary) from hr.employees;

select * from orders;

select avg(unit_price) as avg_unit from northwind.order_details;

select * from order_details;
select avg(quantity) as avg_unit from northwind.order_details;

-- min,max

select min(unit_price) as minum_unit, max(unit_price) as max_unit
from northwind.order_details;

###GROUP BY #########
select count(DEPARTMENT_ID) no_of_emp_dept
from hr.employees
group by DEPARTMENT_ID;

select salary, count(*)
from hr.employees
group by salary;

select salary, count(*)
from hr.employees
where salary=17000.00
group by salary;

select count(*) n0_of_product_cat, category
from products
where category='Beverages'
group by category
order by n0_of_product_cat desc ;


#find the total no of order placed by each customeber 

select customer_id ,count(id) 
from orders
group by customber_id;


#find the total revenu for each products
select products_id, sum(quatity*unit_price) as gross
from orders
group by product_id
order by gross desc;


#find the no of emp who has been haired before year 1988  for each dept 
use hr;
SELECT 
    department_id, COUNT(*) AS no_of
FROM
    hr.employees
WHERE
    YEAR(hire_date) < 1988
GROUP BY department_id
ORDER BY no_of
;
 
SELECT 
    department_id, MAX(salary) AS max_salary
FROM
    hr.employees
WHERE
    YEAR(hire_date) < 1988
GROUP BY department_id
ORDER BY max_salary
;

    

SELECT 
    department_id, MIN(salary) AS min_salary
FROM
    hr.employees
WHERE
    YEAR(hire_date) < 1988
GROUP BY department_id
ORDER BY min_salary
;
    
    
   # find the min and max salary for each job id where the dept id is 80
   select * from employees;
   SELECT 
    department_id, MIN(salary) AS min_salary
    
FROM
    hr.employees
   group by
   order by 
   ;
   
   #find the no of dist job role in each department 
   select  
   from 
   group by
   order by 
   ;
   
   CREATE TABLE Department_jn (
    dept_id INT PRIMARY KEY,
    manager_id INT,
    department_name VARCHAR(50)
);

CREATE TABLE Employee_jn (
    emp_id INT PRIMARY KEY,
    e_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department_jn(dept_id)
);


INSERT INTO Department_jn (dept_id, manager_id, department_name) 
VALUES
    (1, 101, 'Engineering'),
    (2, 102, 'Sales'),
    (3, 103, 'Marketing'),
    (4, 104, 'Other');


INSERT INTO Employee_jn (emp_id, e_name, salary, department_id) 
VALUES
    (201, 'John Doe', 60000.00, 1),
    (202, 'Jane Smith', 55000.00, 1),
    (203, 'Michael Johnson', 62000.00, 2),
    (204, 'Emily Davis', 58000.00, 2),
    (205, 'Chris Brown', 63000.00, 3),
    (206, 'Amanda Wilson', 60000.00, 3);


select * from Department_jn;
select * from Employee_jn;

INSERT INTO Department_jn (dept_id, manager_id, department_name) 
VALUES
    (5, null, null);
    
INSERT INTO Employee_jn (emp_id, e_name, salary, department_id) 
VALUES
    (20, 'Doe', 66000.00, null);
    
select e.emp_id,e.e_name,e.department_id,d.department_name from employee_jn e
inner join
department_jn d on d.dept_id=e.department_id;


use northwind ;
SELECT 
    *
FROM
    orders,
    customers;
SELECT 
    c.first_name, c.city, o.shipped_date, o.order_date
FROM
    orders o
        INNER JOIN
    customers c ON c.id = o.customer_id;
    
    
SELECT 
    *
FROM
    orders,
    employees;
SELECT e.first_name,concat_ws("-",e.city,e.country_region),
o.shipped_date,o.order_date
from
orders o inner join employees e
on o.employee_id=e.id
order by e.first_name;

use hr;
select * from hr.department;
SELECT * FROM hr.locations;
SELECT * FROM hr.countries;
SELECT * FROM hr.regions;


SELECT 
    *
FROM
    orders,
    employees;
SELECT e.first_name,concat_ws("-",e.city,e.country_region),
o.shipped_date,o.order_date
from
orders o left join employees e
on o.employee_id=e.id
order by e.first_name;

