use feb26;

create table employee_num(
	emp_id int,
    emp_name varchar(10),
    salary float,
    bonus decimal
);

insert into employee_num value( 1,'Omkar', 5000, 2000.0);

select * from employee_num;

select length(salary), length(bonus) from employee_num;

create table employee_num1(
	emp_id int,
    emp_name varchar(10),
    salary float(5,2),
    bonus decimal(4,1)
);

insert into employee_num1 value( -101,'Omkar', -200, 200.0);

select * from employee_num1;

select salary , salary/0 from employee_num1; # salary/0 set value as null.

#-------- Date and Time ----------------
create table emp_date(
	emp_id int,
    emp_name varchar(30),
    dob date,
    d_o_joining datetime,
    login_time timestamp,
    logout_time timestamp, 
    exp_year year
);

insert into emp_date value(	01, 'someone', '2003-02-18', '2026-07-09', now(), now(), 3);

select * from emp_date;
select now();
select curdate();
select curtime();
select utc_timestamp();
select year(dob), month(dob), date(dob), day(dob), dayname(dob) from emp_date;
select hour(d_o_joining), minute(d_o_joining), second(d_o_joining) from emp_date;
select datediff(curdate(),dob) age from emp_date;
select timestampdiff(day,dob,now()) age from emp_date;
select timestampdiff(month,dob,now()) age from emp_date;
select timestampdiff(year,dob,now()) age from emp_date;

#----------virtual----------

create table check_virtual (
	f_name varchar(30),
    l_name varchar(30),
    dob date,
    doj date,
    full_name varchar(100) generated always as(concat(f_name, ' ', l_name)) virtual,
    age int generated always as (datediff(doj,dob)) virtual
);

insert into check_virtual(f_name,l_name,dob,doj) value( 'Omkar', 'Gangamwar', '2003-09-17', '2026-04-20');

select * from check_virtual;

create table check_virtual1 (
	f_name varchar(30),
    l_name varchar(30),
    dob date,
    doj date,
    full_name varchar(100) generated always as (concat(f_name, ' ', l_name)) virtual,
    age int generated always as (timestampdiff(year,dob,doj)) virtual
);

insert into check_virtual1(f_name,l_name,dob,doj) values('Omkar', 'Gangamwar', '2000-09-23', '2026-02,03');

select * from check_virtual1;

create table to_check_virtual(
	f_name varchar(30),
    l_name varchar(30),
    dob date,
    doj date,
		full_name varchar(100) generated always as (concat(f_name,' ',l_name)) virtual,
        age int generated always as (datediff(doj,dob)/365) virtual,
	salary int,
    bonus int,
    increment decimal(4,2),
    new_salary int generated always as (salary+((salary+bonus)*increment)) virtual
);

insert into to_check_virtual(f_name,l_name,dob,doj,salary,bonus,increment) values(
	'Omkar', 'Ganagamwar', '2002-09-30', '2026-10-21', 30000, 3000, .10
);

select * from to_check_virtual;

create table to_check_virtual2(
	f_name varchar(30),
    l_name varchar(30),
    dob date,
    doj date,
		full_name varchar(100) generated always as (concat(f_name,' ',l_name)) virtual,
        age int generated always as (datediff(doj,dob)/365) virtual,
	salary int,
    bonus int,
    increment decimal(4,2),
    new_salary int generated always as (salary+((salary+bonus)*increment)) virtual,
    skill_set json
);

insert into to_check_virtual2(f_name,l_name,skill_set) values(
	'Omkar', 'Ganagamwar',
    '{
		"skill": ["Python","SQL"], 
        "certification": ["Python for Beginner","PostgreSQL"], 
        "edu": ["CDAC","B.Tech"]
	}'
);

select * from to_check_virtual2;
select full_name,
	skill_set ->> '$.skill[0]' as Skill,
    skill_set ->> '$.edu' as education from to_check_virtual2;
    
insert into to_check_virtual2(f_name,l_name,skill_set) values(
	'Piyush', 'Shinde',
    '{
		"skill": ["Python","SQL","Java"], 
        "certification": ["Python for Beginner"], 
        "edu": ["CDAC","M.Tech","B.Tech"]
	}'
);

create table labour_json3(
	f_name varchar(30),
    l_name varchar(30),
		full_name varchar(100) generated always as (concat(f_name,' ',l_name)) virtual,
	salary int,
    bonus int,
		new_salary int generated always as (salary+bonus) virtual,
    skill_set json
);

insert into labour_json3(f_name,l_name,salary,bonus,skill_set) values(
	'Piyush', 'Shinde', 30000, 5000,
    '{
		"skill": ["crafting","furniture"], 
        "edu": "B.Tech"
	}'
);

select * from labour_json3;
select full_name,
	skill_set ->> '$.skill[0][0]' as Skill,
    skill_set ->> '$.edu' as Education from labour_json3;

# ---------Constrains---------------
create table const_ex (
	s_id int primary key,
    s_name varchar(30) not null
);

insert into const_ex values(1,'abd');
insert into const_ex(s_id) values(1);

create table const_ex1 (
	s_id int primary key,
    s_name varchar(30) not null,
    c_name varchar(50) default 'PGCG-BDA'
);

insert into const_ex1(s_name) values ('abd');
select * from const_ex1;

create table const_ex2 (
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    c_name varchar(50) default 'PGCG-BDA',
    c_start_date date default '2026-03-25',
    login_time timestamp default current_timestamp,
    mark int default 0
);

insert into const_ex2(s_name) values
('Omkar');
select * from const_ex2;

create table const_ex3 (
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    c_name varchar(50) default 'PGCG-BDA',
    c_start_date date default '2026-03-25',
    login_time timestamp default current_timestamp,
    mark int default 0,
    m_num int unique
);

insert into const_ex3(s_name,m_num) value ('Omkar',12345);
insert into const_ex3(s_name,m_num) value ('Omkar',12345);

create table const_ex4 (
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    c_name varchar(50) default 'PGCG-BDA',
    c_start_date date default '2026-03-25',
    login_time timestamp default current_timestamp,
    mark int default 0,
    m_num int,
    email varchar(100),
    unique(m_num, email)
);

create table const_ex10(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    age int not null check(age>=21)
);

insert into const_ex10(s_name,age) value ('Omkar',23);
insert into const_ex10(s_name,age) value ('Omkar',10);

select * from const_ex10;

create table const_ex11(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    age int not null check(age>=21),
    gender char(10) check (gender in('male', 'female', 'other'))
);

insert into const_ex11(s_name,gender,age) value ('Omkar','male',23);
insert into const_ex11(s_name,gender,age) value ('Omkar','NP',24);

select * from const_ex11;
drop table const_ex12;
create table const_ex12(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    age int not null,
    gender char(10) check (gender in('male', 'female', 'other')),
    check(char_length(s_name) > 1 and age > 21)
);

insert into const_ex12(s_name,gender,age) value ('Omkar','male',23);
insert into const_ex12(s_name,gender,age) value ('O','male',23);
select * from const_ex12;

create table const_ex13(
	s_id int auto_increment primary key,
    s_name varchar(30) not null,
    age int not null,
    m_num int,
    gender char(10) check (gender in('male', 'female', 'other')),
    check(char_length(s_name) > 1 and age > 21),
    check(m_num regexp '^[0-9]{10}$')
);

insert into const_ex13(s_name,gender,age,m_num) value ('Omkar','male',23,1234567890);

select * from const_ex13;

# --------------- Primary Key ------------
create table const_ex14(
	zip_code int,
    s_name varchar(10) not null,
    address varchar(100),
    primary key(zip_code,address)
);

create table const_ex15(
	zip_code int not null unique,
    s_name varchar(10) not null,
    address varchar(100) not null unique
);

insert into const_ex13(s_name,gender,age,m_num) value ('Omkar','male',23,1234567890);
insert into const_ex13(s_name,gender,age,m_num) value ('Omkar','male',23,1234567890);
