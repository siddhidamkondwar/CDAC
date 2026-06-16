use hr;
create table dept_using_sn_fk_ex(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_using_sn_fk_ex(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int,
    foreign key (department_id) references dept_using_sn_fk_ex(dept_id)
    on delete set null
);

INSERT INTO dept_using_sn_fk_ex (dept_name, emp_id, project_id) 
VALUES 
('Human Resources', 101, 'PROJ-A'),
('Information Technology', 102, 'PROJ-B'),
('Finance', 103, 'PROJ-C');

INSERT INTO emp_using_sn_fk_ex (emp_name, p_id, department_id) 
VALUES 
('Alice Smith', 'P1001', 1),
('Bob Johnson', 'P1002', 2),
('Charlie Brown', 'P1003', 1),
('Diana Prince', 'P1004', 3),
('Edward Nigma', 'P1005', NULL);

select * from dept_using_sn_fk_ex;
select * from emp_using_sn_fk_ex;

create table dept_using_r_fk_ex(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_using_r_fk_ex(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int,
    foreign key (department_id) references dept_using_r_fk_ex(dept_id)
    on delete set null
);

insert into dept_using_r_fk_ex(dept_name, emp_id, project_id) values 
('IT', 103, 'P-01'),
('Admin', 104, 'P-02'),
('HR', 105, 'P-011');

insert into emp_using_r_fk_ex(emp_name, p_id,department_id) values
('Alice Smith', 'P-01', 1),
('Bob Johnson', 'P-02', 2),
('Charlie Brown', 'P-011', 3);

SELECT * FROM dept_using_r_fk_ex;
SELECT * FROM emp_using_r_fk_ex;

DELETE FROM dept_using_r_fk_ex 
WHERE dept_id = 1;

# ------------- DROP TABLE -----------
drop table dept_using_r_fk_ex;
/*
Error Code: 3730. Cannot drop table 'dept_using_r_fk_ex' 
referenced by a foreign key constraint 
'emp_using_r_fk_ex_ibfk_1' on table 'emp_using_r_fk_ex'.
*/

truncate table dept_using_r_fk_ex;
/*Error Code: 1701. Cannot truncate a table referenced in a foreign key constraint 
(`feb26`.`emp_using_r_fk_ex`, CONSTRAINT `emp_using_r_fk_ex_ibfk_1`)
*/

-- ALTER colum 
select * from regions;

alter table regions add column country_id varchar(40); -- add new column

select  * from employees;
alter table employees add column bonus int default 2000;  -- add default value

alter table employees add column present enum('present','not-present') default 'present', add column avl enum('active','non-active') default 'active';

alter table employees add column seriel_nu int default 1 first; -- first: at first column

alter table employees add column job_desc varchar(50) default 'To be Discussed' after job_id;

alter table employees add column yr_join int generated always as (year(hire_date)) virtual after hire_date;
alter table employees add column exp int generated always as (year('2026-03-15')-year(hire_date)) virtual after hire_date;

create table sample1 (id int primary key, name varchar(30));
create table ch_sample(c_id int primary key, c_name varchar(50),s_id int);

alter table ch_sample add constraint fk_id foreign key(s_id) references sample1(id);
desc ch_sample;
-- alter table ch_sample add constraint fk_id foreign key(s_id) references sample1(id) on delete cascade;

alter table employees add constraint chk_salary2 check (SALARY >= 500);
alter table employees drop column chk_salary, drop column chk_salary1;

alter table ch_sample drop constraint fk_id;
show indexes from ch_sample;

create table smaple_emp select * from employees;
select * from smaple_emp;
alter table smaple_emp modify column phone_number int;
desc smaple_emp;
truncate table smaple_emp;

alter table employees change column hire_date join_date date;
# Error Code: 3108. Column 'HIRE_DATE' has a generated column dependency.

alter table employees rename column HIRE_DATE to join_date;

alter table smaple_emp change column phone_number phone_number int check(length(phone_number)=10);
desc emp_1;

 alter table smaple_emp add constraint pk_emp_id primary key(employee_id);
 alter table smaple_emp drop primary key, add constraint pk_email primary key(email);
 
 alter table smaple_emp rename to emp_1;
show tables;

create table check_pk(
	id int primary key default 10,
    s_name varchar(30)
);

insert into check_pk(s_name) values ('AB');
insert into check_pk(s_name) values ('ABC');
# Error Code: 1062. Duplicate entry '10' for key 'check_pk.PRIMARY'.

# 2 auto increment in same table is not allowed, auto_increment is linked with primary key.
create table to_check_auto(
	id int auto_increment primary key,
    e_name varchar(20),
    email varchar(20),
    ph_no int
);

insert into to_check_auto(e_name,email,ph_no) values ('A', 'a@gmail.com', 1345), ('B', 'b@gmail.com', 54321);

alter table to_check_auto drop primary key,
add primary key(ph_no);
/*
Error Code: 1075. Incorrect table definition; 
there can be only one auto column and it must be defined as a key
*/
# SOLUTION
alter table to_check_auto modify column id int;
alter table to_check_auto drop primary key;
alter table to_check_auto add primary key(ph_no);

# ------------------------ DML ---------------------------
select * from employees;
update employees set email='stevenking@gmail.com' where employee_id=100;
update employees set email='neena@gmail.com',hire_date=curdate()  where employee_id=101;
update employees set salary=salary+2500;
SET SQL_SAFE_UPDATES = 0; # update and delete is allowed.

update employees set salary=salary+(salary*.15)
where timestampdiff(year,hire_date,curdate()) > 10;

update employees set job_desc='working in IT', hire_date=curdate() where department_id in (90,100,40,70);

update employees set avl='non-active' where commission_pct=0.00 and avl='active'; # not working
select * from employees where commission_pct=0.00 and avl='active';
desc employees;
select * from employees;
-- handle null values in dataset
create table emp_update select * from employees;
truncate emp_update;
desc emp_update;
alter table emp_update modify email varchar(50) null, modify phone_number int null;
alter table emp_update add primary key(employee_id);

insert into emp_update(employee_id,phone_number,last_name,email,hire_date, job_id) values
(101,123,'a','a@', '1987-09-11','ag'),
(102,12,'a',null,'1987-09-18','hh');
select * from emp_update;
update emp_update set email=concat(employee_id,last_name,'@gmail.com')
where email is null or email=' ';

# create two table and build connection with pk, fk and try for alter and update those values if error then solutions to prevent.
create table temp1(
	id int auto_increment primary key,
    s_name varchar(30),
    l_name varchar(30)
);

create table temp2(
	id int auto_increment primary key,
    child_name varchar(20),
    child_lname varchar(20),
    p_id int,
    foreign key (p_id) references temp1(id)
);

# load northwind dataset